DROP PROCEDURE IF EXISTS criar_usuario;

DELIMITER $$

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
