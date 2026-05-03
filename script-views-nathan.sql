-- VIEW DA TELA DE DOCUMENTOS DO PROJETO, que retorna um array de categorias e dentro de cada uma tem um array de documentos
DROP VIEW IF EXISTS vw_categorias_com_documentos;
CREATE VIEW vw_categorias_com_documentos AS
SELECT
	c.id,
	c.titulo AS nome,
    c.projeto_id,
    COALESCE((
		SELECT JSON_ARRAYAGG(
		  JSON_OBJECT(
			'id', d.id,
			'titulo', d.titulo,
            'quantidade_versoes', (SELECT count(id) FROM documento_versao dv WHERE dv.documento_id = d.id),
            'ultima_alteracao', (SELECT dv.criado_em FROM documento_versao dv WHERE dv.documento_id = d.id ORDER BY criado_em DESC LIMIT 1)
		  )
		) FROM documento d
        WHERE d.categoria_id = c.id
	), JSON_ARRAY()) AS documentos
FROM categoria c;

-- Exemplo de utilização:
SELECT id, nome, documentos FROM vw_categorias_com_documentos WHERE projeto_id = 1;

-- ---

-- VIEW DE DETALHES DE REUNIOES
DROP VIEW IF EXISTS vw_reuniao_detalhes;
CREATE VIEW vw_reuniao_detalhes AS
SELECT
	r.id,
	r.titulo,
	r.criado_em,
	r.projeto_id,
    COALESCE((
		SELECT JSON_ARRAYAGG(
		  JSON_OBJECT(
			'id', l.id,
			'url', l.url,
            'nome', l.nome,
            'tipo_link', (SELECT tl.nome FROM tipo_link tl WHERE tl.id = l.tipo_link_id)
		  )
		) FROM link l
        WHERE l.reuniao_id = r.id
	), JSON_ARRAY()) AS links,
    COALESCE((
		SELECT JSON_ARRAYAGG(
		  JSON_OBJECT(
			'id', cr.id,
			'cargo', cr.cargo,
            'nome', cr.nome
		  )
		) FROM convidado_reuniao cr
        WHERE cr.reuniao_id = r.id
	), JSON_ARRAY()) AS convidados,
    COALESCE((
		SELECT JSON_ARRAYAGG(
		  JSON_OBJECT(
			'id', u.id,
			'cargo', ru.cargo,
            'nome', u.nome,
            'foto_perfil', u.foto_perfil
		  )
		) FROM reuniao_usuario ru
        JOIN usuario u ON u.id = ru.usuario_id
        JOIN nivel_acesso na ON na.id = ru.cargo
        WHERE ru.reuniao_id = r.id
	), JSON_ARRAY()) AS usuarios
FROM reuniao r;

-- Exemplo de utilização:
SELECT * FROM vw_reuniao_detalhes WHERE id = 1 AND projeto_id = 1;

-- ---

-- VIEW DE DETALHES DE DOCUMENTO
DROP VIEW IF EXISTS vw_documento_detalhes;
CREATE VIEW vw_documento_detalhes AS
SELECT
	d.id,
	d.titulo,
	c.titulo AS categoria,
    p.titulo AS projeto,
    dv.conteudo,
    dv.criado_em AS ultima_alteracao
FROM documento d
JOIN categoria c ON d.categoria_id = c.id
JOIN projeto p ON p.id = c.projeto_id
JOIN documento_versao dv ON dv.documento_id = d.id
WHERE dv.criado_em = (
    SELECT MAX(dv2.criado_em)
    FROM documento_versao dv2
    WHERE dv2.documento_id = d.id
);

-- Exemplo de utilização:
SELECT * FROM vw_documento_detalhes WHERE id = 1;