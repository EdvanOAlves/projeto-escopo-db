USE db_escopo;

-- VIEW PARA LISTA DE PROJETOS (inclui fotos)
DROP VIEW IF EXISTS vw_projetos_com_usuarios;
CREATE VIEW vw_projetos_com_usuarios AS
SELECT
	projeto.id, projeto.titulo, projeto.descricao,
    (
        SELECT JSON_ARRAYAGG(foto_perfil)
        FROM (
            SELECT usuario.foto_perfil
            FROM usuario_projeto
            JOIN usuario
                ON usuario.id = usuario_projeto.usuario_id
            WHERE usuario_projeto.projeto_id = projeto.id
            ORDER BY usuario.foto_perfil IS NULL, usuario.id
            LIMIT 4
        ) fotos
    ) AS foto_usuarios
FROM projeto
JOIN usuario_projeto ON usuario_projeto.projeto_id = projeto.id
JOIN usuario ON usuario_projeto.usuario_id = usuario.id
WHERE projeto.deletado_em IS NULL
GROUP BY projeto.id, projeto.titulo, projeto.descricao;

	-- Exemplo de uso da view
    -- -- Substitua o 0 pelo id de usuario a consultar
	SELECT * FROM vw_projetos_com_usuarios
	WHERE id IN(
		SELECT projeto_id
		FROM usuario_projeto
		WHERE usuario_id = 0 -- valor a alterar
	);

-- ---

-- VIEW PARA CONVITES PENDENTES  E NÃO LIDOS
DROP VIEW IF EXISTS vw_convites_usuario;
CREATE VIEW  vw_convites_usuario AS
SELECT
  convite.id,
  usuario.nome AS nome_remetente,
  projeto.titulo AS projeto,
  convite.criado_em,
  convite.projeto_id,
  convite.destinatario_id,
  COALESCE((
    SELECT JSON_OBJECT(
      'id', convite_status.id,
      'nome', convite_status.nome
    ) FROM convite_status
    WHERE convite.convite_status_id = convite_status.id
  ), JSON_OBJECT()) AS status
FROM convite
JOIN projeto
  ON convite.projeto_id = projeto.id
JOIN usuario
  ON convite.remetente_id = usuario.id
WHERE convite_status_id IN (1, 4) AND projeto.deletado_em IS NULL
ORDER BY criado_em DESC;

	-- Exemplo de uso
	-- Substitua o 0 pelo id de usuario a consultar
    SELECT * FROM vw_convites_usuario
    WHERE destinatario_id = 0;

-- ---

-- VIEW PARA ACESSO RÁPIDO DE DOCUMENTOS RECENTEMENTE EDITADOS PELO USUARIO
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
WHERE documento.deletado_em IS NULL AND projeto.deletado_em IS NULL
ORDER BY ultima_edicao DESC;

	-- Exemplo de uso
	-- Substitua o 0 pelo id de usuario a consultar
    -- Substitua o 5 pela quantidade de documentos que você quer puxar
	SELECT
		id, projeto, categoria, documento, MAX(ultima_edicao) AS ultima_edicao
    FROM vw_documentos_recentes WHERE criador_id = 0
    GROUP BY id;

-- ---

-- View para detalhes dos projetos (Para aquele painel do topo)
DROP VIEW IF EXISTS vw_projetos_detalhes;
CREATE VIEW vw_projetos_detalhes AS
SELECT
	projeto.id,
    projeto.titulo,
    projeto.descricao,
    projeto.status,
    projeto.data_criacao,
    projeto.criador_id,
    usuario.nome AS nome_responsavel,
    MAX(documento_versao.criado_em) AS ultima_atualizacao

FROM projeto
-- Para puxar o nome de usuario
JOIN usuario ON usuario.id = projeto.criador_id

-- Para puxar a ultima alteração
JOIN categoria ON categoria.projeto_id = projeto.id
JOIN documento ON documento.categoria_id = categoria.id
JOIN documento_versao ON documento_versao.documento_id = documento.id
GROUP BY id;

	-- Exemplo de uso
	-- Substitua os 0s pelos ids de projeto e de usuario a consultar
	SELECT vw.id, vw.titulo, descricao, vw.status, vw.data_criacao, vw.criador_id, vw.nome_responsavel, vw.ultima_atualizacao, usuario_projeto.nivel_acesso_id
    FROM vw_projetos_detalhes AS vw
    JOIN usuario_projeto ON vw.id = usuario_projeto.projeto_id
	WHERE  projeto_id = 0 AND usuario_id = 0; -- valores a alterar;

-- View para buscar a lista de participantes de um projeto
-- o objetivo é usar essa como uma subview, ter uma view maior que vai puxar essa como um array
DROP VIEW IF EXISTS vw_participantes_projetos;
CREATE VIEW vw_participantes_projetos AS
SELECT
	usuario.id AS usuario_id,
    usuario.nome,
    usuario.email,
	usuario.foto_perfil,

    usuario_projeto.id AS usuario_projeto_id,
    usuario_projeto.projeto_id AS projeto_id,

    usuario_projeto.nivel_acesso_id,
    nivel_acesso.nome AS nivel_acesso
FROM usuario_projeto
JOIN usuario ON usuario_projeto.usuario_id = usuario.id
JOIN nivel_acesso ON usuario_projeto.nivel_acesso_id = nivel_acesso.id
WHERE usuario.status = 1
ORDER BY nivel_acesso_id;

	-- Exemplo de uso da view
    -- -- Substitua o 0 pelo id de projeto a consultar
	SELECT * FROM vw_participantes_projetos
	WHERE projeto_id = 0; -- valor a alterar

-- View para buscar a lista de convidados pendentes de um projeto
-- o objetivo é usar essa como uma subview, ter uma view maior que vai puxar essa como um array
DROP VIEW IF EXISTS vw_convites_pendentes_projetos;
CREATE VIEW vw_convites_pendentes_projetos AS
SELECT
    usuario.id AS usuario_id,
    usuario.nome,
    usuario.email,
    usuario.foto_perfil,
	convite.id AS convite_id,
    convite.projeto_id AS projeto_id,
    convite.nivel_acesso_id,
    nivel_acesso.nome AS nivel_acesso,
    convite.criado_em AS convidado_em
FROM convite
JOIN usuario ON convite.destinatario_id = usuario.id
JOIN nivel_acesso ON convite.nivel_acesso_id = nivel_acesso.id
JOIN projeto ON convite.projeto_id = projeto.id
WHERE convite_status_id = 1 AND projeto.deletado_em IS NULL
ORDER BY convite.nivel_acesso_id;

	-- Exemplo de uso da view
    -- -- Substitua o 0 pelo id de projeto a consultar
	SELECT * FROM vw_convites_pendentes_projetos
	WHERE projeto_id = 0; -- valor a alterar

-- View para buscar participantes e convites pendentes, une as duas sub-views acima
DROP VIEW IF EXISTS vw_usuarios_projetos;
CREATE VIEW vw_usuarios_projetos AS
SELECT projeto.id AS projeto_id,
	COALESCE((
		SELECT JSON_ARRAYAGG(
			JSON_OBJECT(
					'usuario_id',usuario_id,
					'nome', nome,
					'email', email,
					'foto_perfil', foto_perfil,
					'usuario_projeto_id', usuario_projeto_id,
					'projeto_id', projeto_id,
					'nivel_acesso_id', nivel_acesso_id,
					'nivel_acesso', nivel_acesso
			)
		)
		FROM vw_participantes_projetos
		WHERE vw_participantes_projetos.projeto_id = projeto.id
    ), JSON_ARRAY()) AS participantes,
    COALESCE((
		SELECT JSON_ARRAYAGG(
			JSON_OBJECT(
					'usuario_id',usuario_id,
					'nome', nome,
					'email', email,
					'foto_perfil', foto_perfil,
					'projeto_id', projeto_id,
					'nivel_acesso_id', nivel_acesso_id,
					'nivel_acesso', nivel_acesso,
                    'convidado_em', convidado_em
			)
		)
		FROM vw_convites_pendentes_projetos
		WHERE vw_convites_pendentes_projetos.projeto_id = projeto.id
    ), JSON_ARRAY()) AS pendentes
FROM projeto;
	-- Exemplo de uso da view
    -- -- Substitua o 0 pelo id de projeto a consultar
	SELECT * FROM vw_usuarios_projetos
	WHERE projeto_id = 0; -- valor a alterar



-- Para a lista de reuniões
DROP VIEW IF EXISTS vw_reunioes_com_usuarios;
CREATE VIEW vw_reunioes_com_usuarios AS
	SELECT reuniao.id, reuniao.titulo, reuniao.criado_em, reuniao.projeto_id,
    (
        SELECT JSON_ARRAYAGG(fotos.foto_perfil)
        FROM (
            SELECT usuario.foto_perfil
            FROM reuniao_usuario
            JOIN usuario
                ON reuniao_usuario.usuario_id = usuario.id
            WHERE reuniao_usuario.reuniao_id = reuniao.id
            ORDER BY usuario.foto_perfil IS NULL, usuario.id
            LIMIT 4
        ) fotos
    ) AS foto_usuarios
FROM reuniao
JOIN reuniao_usuario ON reuniao_usuario.reuniao_id = reuniao.id
JOIN usuario ON reuniao_usuario.usuario_id = usuario_id
GROUP BY reuniao_id;

	-- Exemplo de uso da view
    -- -- Substitua o 0 pelo id de projeto a consultar
	SELECT * FROM vw_reunioes_com_usuarios
	WHERE projeto_id = 0; -- valor a alterar

-- ---

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
        WHERE d.categoria_id = c.id AND d.deletado_em IS NULL
	), JSON_ARRAY()) AS documentos
FROM categoria c
WHERE c.deletado_em IS NULL;

-- Exemplo de utilização:
SELECT id, nome, documentos FROM vw_categorias_com_documentos WHERE projeto_id = 1;

-- ---
-- View de Comentários
DROP VIEW IF EXISTS vw_comentarios;
CREATE VIEW vw_comentarios AS
SELECT comentario.id,
	comentario.criador_id AS autor_id, usuario.nome AS autor_nome,
    comentario.conteudo AS conteudo, comentario.documento_id, comentario.criado_em,
    COALESCE(
		(SELECT JSON_OBJECT(
			'parent_id', comentario_respondido.id,
			'parent_autor_id', comentario_respondido.criador_id,
			'parent_autor_nome', usuario_parent.nome,
			'parent_autor_nivel_acesso_id', usuario_projeto_parent.nivel_acesso_id,
            'parent_autor_nivel_acesso', nivel_acesso_parent.nome
		)
        FROM comentario AS comentario_respondido
		JOIN usuario AS usuario_parent ON comentario_respondido.criador_id = usuario_parent.id
		JOIN usuario_projeto AS usuario_projeto_parent ON comentario_respondido.criador_id = usuario_projeto_parent.usuario_id
        JOIN nivel_acesso AS nivel_acesso_parent ON usuario_projeto_parent.nivel_acesso_id = nivel_acesso_parent.id
		WHERE comentario_respondido.id = comentario.parent_id AND usuario_projeto_parent.projeto_id = projeto.id), JSON_OBJECT()
	)AS parent,
    COALESCE(
		(SELECT JSON_OBJECT(
			'registro_id', registro.id,
			'registro_titulo', registro.titulo
		)
        FROM registro
		WHERE comentario.registro_referencia_id = registro.id ), JSON_OBJECT()
	)AS registro
FROM comentario
JOIN usuario ON comentario.criador_id = usuario.id
JOIN documento ON comentario.documento_id = documento.id
JOIN categoria ON documento.categoria_id = categoria.id
JOIN projeto ON categoria.projeto_id = projeto.id
ORDER BY criado_em DESC
;
	-- Exemplo de uso da view
    -- -- Substitua o 0 pelo id de documento a consultar
	SELECT * FROM vw_comentarios
	WHERE documento_id = 0; -- valor a alterar


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
WHERE dv.id = (
    SELECT id
    FROM documento_versao dv2
    WHERE dv2.documento_id = d.id
    ORDER BY dv2.criado_em DESC, dv2.id DESC
    LIMIT 1
);

-- Exemplo de utilização:
SELECT * FROM vw_documento_detalhes WHERE id = 1;
