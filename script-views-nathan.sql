-- VIEW DA TELA DE DOCUMENTOS DO PROJETO, que retorna um array de categorias e dentro de cada uma tem um array de documentos
DROP VIEW IF EXISTS vw_categorias_com_documentos;
CREATE VIEW vw_categorias_com_documentos AS
SELECT
	c.id,
	c.titulo AS nome,
    c.projeto_id,
    (
		SELECT JSON_ARRAYAGG(
		  JSON_OBJECT(
			'id', d.id,
			'titulo', d.titulo,
            'quantidade_versoes', (SELECT count(id) FROM documento_versao dv WHERE dv.documento_id = d.id),
            'ultima_alteracao', (SELECT dv.criado_em FROM documento_versao dv WHERE dv.documento_id = d.id ORDER BY criado_em DESC LIMIT 1)
		  )
		) FROM documento d
        WHERE d.categoria_id = c.id
	) AS documentos
FROM categoria c;

-- Exemplo de utilização:
SELECT id, nome, documentos FROM vw_categorias_com_documentos WHERE projeto_id = 1;