
-- View para lista de projetos
CREATE VIEW vw_projetos_com_usuarios AS
SELECT 
	projeto.id, projeto.titulo, projeto.descricao, 
	GROUP_CONCAT(usuario.foto_perfil) AS foto_usuarios
FROM projeto
JOIN usuario_projeto ON usuario_projeto.projeto_id = projeto.id
JOIN usuario ON usuario_projeto.usuario_id = usuario.id
GROUP BY projeto.id, projeto.titulo, projeto.descricao;

-- Como usar a view
SELECT * FROM vw_projetos_com_usuarios
WHERE id IN(
	SELECT projeto_id
    FROM usuario_projeto
    WHERE usuario_id = 2
);