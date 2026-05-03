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
            SIGNAL SQLSTATE '45001'
            SET MESSAGE_TEXT = 'ERRO 403: Nível de acesso negado.';
			LEAVE main;
        END IF;

        -- Usuário já participa do projeto
		IF usuario_pertence_projeto > 0 THEN
            SIGNAL SQLSTATE '45002'
            SET MESSAGE_TEXT = 'Um usuario já participa do projeto.';
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

DELIMITER ;
