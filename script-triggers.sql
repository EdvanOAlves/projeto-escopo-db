DELIMITER $$

CREATE TRIGGER trg_convite_aceito
    AFTER UPDATE ON convite
    FOR EACH ROW
    BEGIN
        IF OLD.convite_status_id = 1 AND NEW.convite_status_id = 3 THEN --Caso um convite pendente seja aceito
            
            -- Enviando "Convite" aviso de que o usuário aceitou o convite
            INSERT INTO convite(projeto_id, destinatario_id, remetente_id, convite_status_id)
            VALUES(NEW.projeto_id, NEW.remetente_id, NEW.destinatario_id, 4);

            -- Adicionando usuario ao projeto
            INSERT INTO usuario_projeto(usuario_id, projeto_id, nivel_acesso_id)
            VALUES(NEW.destinatario_id, NEW.projeto_id, NEW.nivel_acesso_id);
        END IF;
    END$$

CREATE TRIGGER trg_projeto_criado
    AFTER INSERT ON projeto
    FOR EACH ROW
    BEGIN
        INSERT INTO usuario_projeto(usuario_id, projeto_id, nivel_acesso)
        VALUES (NEW.criador_id, NEW.id, 1);
    END$$
DELIMITER ;
