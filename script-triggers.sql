DELIMITER $$

CREATE TRIGGER trg_convite_aceito
    AFTER UPDATE ON convite
    FOR EACH ROW
    BEGIN
		-- Caso um convite pendente seja aceito
        IF OLD.convite_status_id = 1 AND NEW.convite_status_id = 6 THEN 
            
            -- Enviando "Convite" aviso de que o usuário aceitou o convite
            -- INSERT INTO convite(projeto_id, destinatario_id, remetente_id, convite_status_id)
            -- VALUES(NEW.projeto_id, NEW.remetente_id, NEW.destinatario_id, 4);
				-- Retrabalhar como vai funcionar isso
            
            -- Adicionando usuario ao projeto
            INSERT INTO usuario_projeto(usuario_id, projeto_id, nivel_acesso_id)
            VALUES(NEW.destinatario_id, NEW.projeto_id, NEW.nivel_acesso_id);
        END IF;
    END$$

CREATE TRIGGER trg_projeto_criado
    AFTER INSERT ON projeto
    FOR EACH ROW
    BEGIN
        INSERT INTO usuario_projeto(usuario_id, projeto_id, nivel_acesso_id)
        VALUES (NEW.criador_id, NEW.id, 1);
    END$$
    
CREATE TRIGGER trg_comentario_notificacao
AFTER INSERT ON comentario
FOR EACH ROW
BEGIN
    INSERT INTO notificacao (descricao, comentario_id, usuario_id)
    SELECT DISTINCT
        CONCAT(
            usuario.nome,
            ' comentou no documento "',
            documento.titulo,
            '"'
        ) AS descricao,
        NEW.id,
        documento_versao.criador_id
    FROM documento_versao
    JOIN documento ON documento.id = documento_versao.documento_id
    JOIN usuario usuario ON usuario.id = NEW.criador_id
    WHERE documento_versao.documento_id = NEW.documento_id
    AND documento_versao.criador_id != NEW.criador_id;
END$$

CREATE TRIGGER trg_usuario_soft_delete
AFTER UPDATE ON usuario
FOR EACH ROW
BEGIN
    IF NEW.status = 0 IS NOT NULL AND OLD.deletado_em IS NULL THEN
        UPDATE usuario
        SET deletado_em CURRENT_DATE
        WHERE id = NEW.id;
        -- Seria interesante deixar uma foto reutilizavel pra isso, já serviria de indicação visual para os usuarios
    END IF;
    DELETE FROM usuario_projeto WHERE usuario_id = NEW.id;
END;

CREATE TRIGGER trg_registro_update
AFTER UPDATE ON registro
FOR EACH ROW
BEGIN
	UPDATE registro
    SET atualizado_em CURRENT_DATE
    WHERE id = NEW.id
END;
DELIMITER ;
