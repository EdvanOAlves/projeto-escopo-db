USE db_escopo;
-- VIEW PARA LISTA DE PROJETOS (inclui fotos)
CREATE VIEW vw_projetos_com_usuarios AS
SELECT 
	projeto.id, projeto.titulo, projeto.descricao, 
	GROUP_CONCAT(usuario.foto_perfil) AS foto_usuarios
FROM projeto
JOIN usuario_projeto ON usuario_projeto.projeto_id = projeto.id
JOIN usuario ON usuario_projeto.usuario_id = usuario.id
GROUP BY projeto.id, projeto.titulo, projeto.descricao;

	-- Exemplo de uso da view
	SELECT * FROM vw_projetos_com_usuarios
	WHERE id IN(
		SELECT projeto_id
		FROM usuario_projeto
		WHERE usuario_id = 1 -- valor a alterar
	);

-- VIEW PARA CONVITES PENDENTES  E NÃO LIDOS
CREATE VIEW vw_convites_ativos AS
SELECT * FROM convite
WHERE convite_status_id = 1 OR convite_status_id = 4
ORDER BY criado_em DESC;

	-- Exemplo de uso
	-- Substitua o 0 pelo id de usuario a consultar
	SELECT * FROM vw_convites_ativos
	WHERE  destinatario_id = 0; -- valor a alterar

-- View para acesso rápido de documentos recentemente editados pelo usuário
DROP VIEW IF EXISTS vw_documentos_recentes;
CREATE VIEW vw_documentos_recentes AS
SELECT 
	documento.id, 
    projeto.titulo AS projeto,
    categoria.titulo AS categoria,
	documento.titulo AS documento,
    documento_versao.criado_em AS ultima_edicao,
    documento_versao.criador_id
FROM documento
JOIN documento_versao ON documento_versao.documento_id = documento.id
JOIN categoria ON categoria.id = documento.categoria_id
JOIN projeto ON categoria.projeto_id = projeto.id
ORDER BY ultima_edicao DESC;

	-- Exemplo de uso
	-- Substitua o 0 pelo id de usuario a consultar
    -- Substitua o 5 pela quantidade de documentos que você quer puxar
	SELECT 
		id, projeto, categoria, documento, MAX(ultima_edicao) AS ultima_edicao 
    FROM vw_documentos_recentes
	WHERE criador_id = 0
	GROUP BY id
    LIMIT 5;

-- View para detalhes dos projetos (Para aquele painel do topo)
DROP VIEW IF EXISTS vw_projetos_detalhes;
CREATE VIEW vw_projetos_detalhes AS
SELECT 
	projeto.id, 
    projeto.titulo,
    projeto.descricao,
    projeto.data_criacao,
    projeto.status,
    projeto.criador_id,
    usuario.nome,
    MAX(documento_versao.criado_em) AS ultima_altecarao
    
FROM projeto
-- Para puxar o nome de usuario
JOIN usuario ON usuario.id = projeto.criador_id 

-- Para puxar a ultima alteração
JOIN categoria ON categoria.projeto_id = projeto.id
JOIN documento ON documento.categoria_id = categoria.id
JOIN documento_versao ON documento_versao.documento_id = documento.id
GROUP BY id;

	-- Exemplo de uso
	-- Substitua o 0 pelo id de projeto a consultar
	SELECT * FROM vw_projetos_detalhes
	WHERE  destinatario_id = 0; -- valor a alterar;