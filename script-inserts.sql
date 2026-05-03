-- USUARIOS
INSERT INTO usuario(nome, email, senha, foto_perfil) VALUES
('Ana Livia', 'ana@email.com', '123', 'foto_ana'),
('Larissa Lemos', 'larissa@email.com', '123', 'foto_larissa'),
('Marcos Santos', 'marcos@email.com', '123', 'foto_marcos'),
('Carlos Ribeiro', 'carlos@email.com', '123', 'foto_carlos'),
('João Silva', 'joao@email.com', '123', 'foto_joao'),
('Maria Souza', 'maria@email.com', '123', 'foto_maria'),
('Bernardo Pereira', 'bernardo@email.com', '123', 'foto_bernardo'),
('Manuela Ferreira', 'manuela@email.com', '123', 'foto_manuela'),
('Amanda Costa', 'amanda@email.com', '123', 'foto_amanda');

-- PROJETOS
INSERT INTO projeto(titulo, descricao, criador_id) VALUES
('Sistema de Gestão', 'Plataforma web para gestão de requisitos', 1),
('App Delivery', 'Aplicativo mobile de delivery', 5),
('Hackaton 2026', 'Plataforma para resolver o desafio proposto pela banca', 6);

-- CONVITES
INSERT INTO convite(projeto_id, destinatario_id, nivel_acesso_id, remetente_id) VALUES
(1, 2, 1, 1),
(1, 3, 2, 1),
(1, 4, 3, 1),
(1, 5, 4, 1),
(2, 1, 2, 5),
(2, 3, 2, 5),
(2, 6, 2, 5),
(2, 4, 3, 5),
(2, 7, 4, 5),
(3, 8, 1, 6),
(3, 7, 2, 6),
(3, 5, 3, 6),
(3, 3, 4, 6);

SELECT * from convite;
-- Aceitando alguns convites
UPDATE convite
SET convite_status_id = 6
WHERE id IN (1, 3, 4, 5, 7, 9, 10, 12);
SELECT * from convite;

-- CATEGORIAS (SETORES)
INSERT INTO categoria(titulo, projeto_id) VALUES
('Plataforma Web', 1),
('Aplicativo Mobile', 1),
('Documentos Gerais', 2),
('Aplicativo Usuarios', 2),
('Aplicativo Entregadores', 2),
('Banco de Dados', 3),
('Back-end',3),
('Front-end',  3);

SELECT * from documento;
-- DOCUMENTOS
INSERT INTO documento(titulo, categoria_id) VALUES
-- Plataforma Web (1)
('Documento de Requisitos', 1),
('Manual do Usuário Web', 1),

-- Aplicativo Mobile (2)
('Especificação Mobile', 2),
('Checklist de Testes Mobile', 2),

-- Documentos Gerais (3)
('Plano de Projeto', 3),
('Cronograma', 3),
('Relatório de Progresso', 3),

-- Aplicativo Usuarios (4)
('Fluxo de Navegação do Usuário', 4),
('Casos de Uso - Usuário', 4),

-- Aplicativo Entregadores (5)
('Fluxo de Entregas', 5),
('Casos de Uso - Entregador', 5),

-- Banco de Dados (6)
('Modelo Entidade-Relacionamento', 6),
('Dicionário de Dados', 6),

-- Back-end (7)
('Documentação da API', 7),
('Arquitetura do Sistema', 7),

-- Front-end (8)
('Guia de Componentes UI', 8),
('Padrões de Estilo', 8);

-- DOCUMENTO_VERSAO
-- TODO: Seria interessante passar o timestamp manual para os inserts de testes,
-- do jeito que tá ele cria tudo no momento que você roda o script
INSERT INTO documento_versao (conteudo, criador_id, documento_id) VALUES
-- Documento 1
('v1 - Levantamento inicial de requisitos.', 1, 1),
('v2 - Ajustes após reunião com cliente.', 2, 1),
('v3 - Redefinindo ordem.', 3, 1),
('v4 - Versão final aprovada', 1, 1),

-- Documento 2
('v1 - Estrutura inicial do app mobile.', 1, 2),
('v2 - Inclusão de novas funcionalidades.', 2, 2),

-- Documento 3
('v1 - Protótipo inicial das telas web.', 2, 3),

-- Documento 4
('v1 - Manual básico do usuário.', 3, 4),
('v2 - Manual revisado com melhorias.', 1, 4),

-- Documento 5
('v1 - Guia de instalação mobile.', 1, 5),

-- Documento 6
('v1 - Relatório de testes iniciais.', 2, 6),
('v2 - Correções após testes.', 3, 6),

-- Documento 7
('v1 - Planejamento do projeto.', 1, 7),

-- Documento 8
('v1 - Cronograma inicial.', 2, 8),
('v2 - Cronograma atualizado.', 3, 8),

-- Documento 9
('v1 - Relatório de progresso semanal.', 3, 9),

-- Documento 10
('v1 - Fluxo de navegação do usuário.', 1, 10),

-- Documento 11
('v1 - Casos de uso do usuário.', 2, 11),

-- Documento 12
('v1 - Fluxo de entregas.', 3, 12),

-- Documento 13
('v1 - Casos de uso do entregador.', 1, 13),

-- Documento 14
('v1 - Modelo ER inicial.', 2, 14),

-- Documento 15
('v1 - Dicionário de dados.', 3, 15),

-- Documento 16
('v1 - Documentação da API.', 1, 16),
('v2 - Inclusão de novos endpoints.', 2, 16),

-- Documento 17
('v1 - Arquitetura backend.', 2, 17);


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