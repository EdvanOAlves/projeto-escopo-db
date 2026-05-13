DELIMITER $$

-- Enviar Convite
DROP PROCEDURE IF EXISTS enviar_convite;
CREATE PROCEDURE enviar_convite(
	IN in_projeto_id INT,
	IN in_destinatario_id INT,
    IN in_nivel_acesso_id INT,
    IN in_remetente_id INT
)
BEGIN
    DECLARE projeto_existe INT;
    DECLARE destinatario_existe INT;
    DECLARE nivel_acesso_existe INT;
    DECLARE remetente_existe INT;
	DECLARE usuario_pertence_projeto INT;
    DECLARE nivel_acesso_remetente INT;
    DECLARE convite_existe INT;



    main: BEGIN
		-- Consultas para validações iniciais
        SELECT COUNT(id) FROM projeto WHERE projeto.id = in_projeto_id INTO projeto_existe;
		SELECT COUNT(id) FROM usuario WHERE usuario.id = in_destinatario_id INTO destinatario_existe;
		SELECT COUNT(id) FROM nivel_acesso WHERE nivel_acesso.id = in_nivel_acesso_id INTO nivel_acesso_existe;
		SELECT COUNT(id) FROM usuario WHERE usuario.id = in_remetente_id INTO remetente_existe;
		SELECT COUNT(usuario_id) FROM usuario_projeto WHERE usuario_id = in_destinatario_id AND projeto_id = in_projeto_id INTO usuario_pertence_projeto;

		-- 404, algum dos itens não existe no banco
		IF (projeto_existe = 0  OR destinatario_existe = 0 OR nivel_acesso_existe = 0 OR remetente_existe = 0) THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'ERRO 404: Um ou mais dos campos inseridos para o usuario não foram encontrado no banco';
            LEAVE main;
		END IF;

		SELECT nivel_acesso_id FROM usuario_projeto WHERE usuario_id = in_remetente_id AND projeto_id = in_projeto_id INTO nivel_acesso_remetente;
        -- 403, sem permissão
		IF nivel_acesso_remetente > 1 THEN
			LEAVE main;
        END IF;

        -- Usuário já participa do projeto
		IF usuario_pertence_projeto > 0 THEN
            LEAVE main;
		END IF;

        SELECT COUNT(id) FROM convite WHERE convite.projeto_id = in_projeto_id AND convite.destinatario_id = in_destinatario_id AND convite.convite_status_id =1
        INTO convite_existe;
		-- Usuário já tem um convite pendente do projeto
        IF convite_existe > 0 THEN
            SIGNAL SQLSTATE '45003'
            SET MESSAGE_TEXT = 'Um usuario já tem um convite pendente do projeto.';
            LEAVE main;
        END IF;

        -- 201 sucesso
		INSERT INTO convite(projeto_id, destinatario_id, nivel_acesso_id, remetente_id)
		VALUES (in_projeto_id, in_destinatario_id, in_nivel_acesso_id, in_remetente_id);
	END main;
END$$

-- Exemplo de uso
-- CALL enviar_convite(:projeto_id, :destinatario_id, :nivel_acesso_id, :remetente_id);

-- ATUALIZAR CONVITE (e enviar o convite aviso para o usuário que enviou)
DELIMITER $$

CREATE PROCEDURE atualizar_convite(
    IN p_convite_id INT,
    IN p_usuario_id INT,
    IN p_novo_status_id INT
)
BEGIN
    DECLARE v_status_atual INT;
    DECLARE v_destinatario_id INT;
    DECLARE v_remetente_id INT;
    DECLARE v_projeto_id INT;

    -- Busca informações do convite
    SELECT
        convite_status_id,
        destinatario_id,
        remetente_id,
        projeto_id
    INTO
        v_status_atual,
        v_destinatario_id,
        v_remetente_id,
        v_projeto_id
    FROM convite
    WHERE id = p_convite_id;

    -- Verifica se convite existe
    IF v_status_atual IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Convite não encontrado';
    END IF;

    -- Verifica se o usuário é o destinatário
    IF v_destinatario_id <> p_usuario_id THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Usuário não autorizado a atualizar este convite';
    END IF;


    -- =====================================================
    -- Validações
    -- =====================================================
    -- Convite pendente
    IF v_status_atual = 1 THEN
        -- Unicas opções para um convite pendente(1) é recusar(2) ou aceitar(6)
        IF p_novo_status_id NOT IN (2, 6) THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Status inválido para convite pendente';
        END IF;

    -- Convite não-lido
    ELSEIF v_status_atual = 4 THEN
        -- Só pode marcar como lido
        IF p_novo_status_id <> 5 THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Status inválido para convite-aviso';
        END IF;
        
    -- Qualquer outro status é bloqueado
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Este convite não pode mais ser atualizado';
    END IF;

    -- Atualiza o status
    UPDATE convite
    SET convite_status_id = p_novo_status_id
    WHERE id = p_convite_id;

    -- =====================================================
    -- Se aceitou o convite
    -- =====================================================
    IF p_novo_status_id = 6 THEN

        -- Cria notificação para o remetente
        INSERT INTO convite(
            projeto_id,
            destinatario_id,
            remetente_id,
            nivel_acesso_id,
            convite_status_id
        )
        VALUES(
            v_projeto_id,
            v_remetente_id,   -- quem recebe a notificação
            p_usuario_id,     -- quem aceitou
            NULL,
            4                 -- não-lido
        );

    END IF;
END$$
-- Exemplo de uso
-- CALL atualizar_convite(:convite_id, :usuario_id, :nivel_acesso_id);



-- CRIAR USUARIO
DROP PROCEDURE IF EXISTS criar_usuario$$
CREATE PROCEDURE criar_usuario(
    IN u_nome VARCHAR(100),
    IN u_email VARCHAR(150),
    IN u_senha VARCHAR(255)
)
BEGIN
    DECLARE email_existe INT;

    -- verifica se já existe um usuário com o e-mail
    SELECT COUNT(*) INTO email_existe
    FROM usuario
    WHERE email = u_email;

    -- se existir, lança erro
    IF email_existe > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Email já cadastrado';
    ELSE
        -- se não existir, insere
        INSERT INTO usuario(nome, email, senha)
        VALUES (u_nome, u_email, u_senha);

        SELECT last_insert_id() as id;
    END IF;
END $$

CREATE PROCEDURE criar_comentario (
    IN p_conteudo TEXT,
    IN p_parent_id INT,
    IN p_registro_referencia_id INT,
    IN p_criador_id INT,
    IN p_documento_id INT,
    IN p_tipo_comentario_id INT
)
BEGIN
    DECLARE v_projeto_id INT;
    DECLARE v_parent_projeto_id INT;
    DECLARE v_registro_projeto_id INT;

    -- Busca o projeto do documento
    SELECT p.id
      INTO v_projeto_id
    FROM documento d
    JOIN categoria c
      ON c.id = d.categoria_id
    JOIN projeto p
      ON p.id = c.projeto_id
    WHERE d.id = p_documento_id
    LIMIT 1;

    -- Documento não existe
    IF v_projeto_id IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Documento com o ID informado não encontrado';
    END IF;

    
    -- Se existir referencia para um registro, valida ele
    IF p_registro_referencia_id IS NOT NULL THEN
		-- Verifica se o registro pertence ao mesmo projeto
		SELECT r.projeto_id
		  INTO v_registro_projeto_id
		FROM registro r
		WHERE r.id = p_registro_referencia_id
		LIMIT 1;
        
        -- Registro não existe
		IF (v_registro_projeto_id IS NULL OR v_registro_projeto_id <> v_projeto_id) THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Registro de referência com o ID informado não encontrado';
		END IF;
    END IF;

    -- Se existir comentário pai, valida projeto
    IF p_parent_id IS NOT NULL THEN

        SELECT p2.id
          INTO v_parent_projeto_id
        FROM comentario cmt
        JOIN documento d2
          ON d2.id = cmt.documento_id
        JOIN categoria cat2
          ON cat2.id = d2.categoria_id
        JOIN projeto p2
          ON p2.id = cat2.projeto_id
        WHERE cmt.id = p_parent_id
        LIMIT 1;

        -- Comentário pai não existe
        IF (v_parent_projeto_id IS NULL OR v_parent_projeto_id <> v_projeto_id) THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'ID de referência para outro comentário (parent_id) não encontrado';
        END IF;

    END IF;

    -- Insert final
    INSERT INTO comentario (
        conteudo,
        parent_id,
        registro_referencia_id,
        criador_id,
        documento_id,
        comentario_tipo_id
    )
    VALUES (
        p_conteudo,
        p_parent_id,
        p_registro_referencia_id,
        p_criador_id,
        p_documento_id,
        p_tipo_comentario_id
    );

END$$

DELIMITER ;
