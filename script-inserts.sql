-- USUARIOS
INSERT INTO usuario(nome, email, senha) VALUES
('João Silva', 'joao@email.com', '123'),
('Maria Souza', 'maria@email.com', '123'),
('Carlos Lima', 'carlos@email.com', '123'),
('Marcos Ferreira', 'marcos@email.com', '123'),
('Ana Costa', 'ana@email.com', '123');

-- PROJETOS
INSERT INTO projeto(titulo, descricao, criador_id) VALUES
('Sistema de Gestão', 'Plataforma web para gestão de requisitos', 1),
('App Delivery', 'Aplicativo mobile de delivery', 2);

-- USUARIO_PROJETO
INSERT INTO usuario_projeto(usuario_id, projeto_id, nivel_acesso_id) VALUES
(2, 1, 2), -- Maria analista
(3, 1, 3), -- Carlos dev
(4, 2, 3); -- Ana dev

-- CONVITES
INSERT INTO convite(projeto_id, destinatario_id, nivel_acesso_id, remetente_id, convite_status_id) VALUES
(1, 4, 3, 1, 1), -- Ana convidada
(2, 3, 2, 2, 6); -- Carlos aceitou

-- CATEGORIAS (SETORES)
INSERT INTO categoria(titulo, projeto_id) VALUES
('Plataforma Web', 1),
('Aplicativo Mobile', 2);

-- DOCUMENTOS
INSERT INTO documento(titulo, categoria_id) VALUES
('Documento de Requisitos', 1),
('Especificação Mobile', 2);

-- DOCUMENTO_VERSAO
INSERT INTO documento_versao(conteudo, criador_id, documento_id) VALUES
('Versão inicial dos requisitos...', 2, 1),
('Primeira versão do app...', 4, 2);

-- REGISTROS
INSERT INTO registro(titulo, conteudo, criador_id, projeto_id) VALUES
('Levantamento inicial', 'Requisitos coletados com cliente', 2, 1),
('Definição de escopo', 'Escopo inicial do app', 2, 2);

-- REUNIAO
INSERT INTO reuniao(titulo, transcricao, projeto_id) VALUES
('Reunião Kickoff', 'Discussão inicial do projeto...', 1),
('Reunião App', 'Definição de funcionalidades...', 2);

-- REUNIAO_USUARIO
INSERT INTO reuniao_usuario(usuario_id, reuniao_id) VALUES
(1, 1),
(2, 1),
(2, 2),
(4, 2);

-- CONVIDADO_REUNIAO
INSERT INTO convidado_reuniao(nome, cargo, reuniao_id) VALUES
('Cliente XPTO', 'Stakeholder', 1),
('Cliente Mobile', 'Cliente', 2);

-- LINKS
INSERT INTO link(url, nome, tipo_link_id, reuniao_id) VALUES
('https://meet.google.com/abc', 'Meet', 1, 1),
('https://docs.com/doc1', 'Documento extra', 2, 2);

-- COMENTARIOS
INSERT INTO comentario(conteudo, criador_id, documento_id, comentario_tipo_id) VALUES
('Precisamos melhorar esse requisito', 3, 1, 1),
('Sugiro adicionar login social', 4, 2, 3);

-- RESPOSTA (comentario filho)
INSERT INTO comentario(conteudo, parent_id, criador_id, documento_id, comentario_tipo_id) VALUES
('Boa ideia!', 1, 2, 1, 2);

-- APROVACAO
INSERT INTO aprovacao(documento_id, usuario_id) VALUES
(1, 1),
(2, 2);

-- NOTIFICACAO
INSERT INTO notificacao(descricao, comentario_id, usuario_id) VALUES
('Novo comentário no documento', 1, 1),
('Seu comentário recebeu resposta', 3, 3);