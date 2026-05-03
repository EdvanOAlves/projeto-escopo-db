USE db_escopo;

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
('Amanda Costa', 'amanda@email.com', '123', 'foto_amanda'),
('André Roberto', 'andre@email.com', '123', 'url_foto_andré'),
('Edvan Alves', 'edvan@email.com', '123' ,'url_foto_edvan'),
('Nathan da Silva', 'nathan@email.com', '123', 'url_foto_nathan'),
('Samara Rolim', 'samara@email.com', '123', 'url_foto_samara'),
('Estagiário', 'estagiario@email.com', '123', 'url_foto_estagiario'),
('Professor', 'professor@email.com', '123', 'url_foto_professor')
;

-- PROJETOS
INSERT INTO projeto(titulo, descricao, criador_id, data_criacao) VALUES
('Sistema de Gestão', 'Plataforma web para gestão de requisitos', 1, @inicio_projeto_gestao),
('App Delivery', 'Aplicativo mobile de delivery', 5, @inicio_projeto_delivery),
('Hackaton 2026', 'Plataforma para resolver o desafio proposto pela banca', 6, @inicio_projeto_hackaton),
('Projeto Escopo', 'Plataforma colaborativa de documentos para auxiliar no levantamento de requisitos e desenvolvimento de projetos de software', 11, @inicio_projeto_escopo);

-- CONVITES
INSERT INTO convite(projeto_id, destinatario_id, nivel_acesso_id, remetente_id, criado_em) VALUES
(1, 2, 1, 1, '2025-01-01 01:15:00'),
(1, 3, 2, 1, '2025-01-01 03:48:00'),
(1, 4, 3, 1, '2025-01-01 07:21:00'),
(1, 5, 4, 1, '2025-01-02 11:43:00'),
(2, 1, 2, 5, '2025-02-13 14:15:00'),
(2, 3, 2, 5, '2025-02-15 16:50:00'),
(2, 6, 2, 5, '2025-02-17 19:25:00'),
(2, 4, 3, 5, '2025-02-20 21:36:00'),
(2, 7, 4, 5, '2025-02-25 10:58:00'),
(3, 8, 1, 6, '2025-04-01 11:05:00'),
(3, 7, 2, 6, '2025-04-01 11:20:00'),
(3, 5, 3, 6, '2025-04-01 11:53:00'),
(3, 3, 4, 6, '2025-04-01 13:18:00'),
-- Escopo:
(4, 10, 2, 11, '2026-02-27 10:31:00'),
(4, 12, 2, 11, '2026-02-27 10:32:00'),
(4, 13, 2, 11, '2026-02-27 10:33:00'),
(4, 15, 4, 11, '2026-02-27 10:43:00'),
(4, 14, 3, 11, '2026-03-19 10:43:00');

-- Aceitando alguns convites
UPDATE convite
SET convite_status_id = 6
WHERE id IN (1, 3, 4, 5, 7, 9, 10, 12);

-- Escopo
UPDATE convite
SET convite_status_id = 6
WHERE id IN (14, 15, 16);

-- CATEGORIAS (SETORES)
INSERT INTO categoria(titulo, projeto_id) VALUES
('Plataforma Web', 1),
('Aplicativo Mobile', 1),
('Documentos Gerais', 2),
('Aplicativo Usuarios', 2),
('Aplicativo Entregadores', 2),
('Banco de Dados', 3),
('Back-end',3),
('Front-end',  3),

-- Escopo
('Organização', 4),
('Banco de Dados', 4),
('Back-End', 4),
('Front-End', 4),
('Mobile', 4);


-- DOCUMENTOS
INSERT INTO documento(titulo, categoria_id, criado_em) VALUES
-- Plataforma Web (1)
('Documento de Requisitos', 1, '2025-01-03 00:00:00'),
('Manual do Usuário Web', 1, '2025-01-03 00:15:00'),

-- Aplicativo Mobile (2)
('Especificação Mobile', 2, '2025-01-08 00:22:00'),
('Checklist de Testes Mobile', 2, '2025-01-08 02:22:00'),

-- Documentos Gerais (3)
('Plano de Projeto', 3, '2025-02-12 12:17:00'),
('Cronograma', 3, '2025-02-13 15:17:00'),
('Relatório de Progresso', 3, '2025-02-27 15:17:00'),

-- Aplicativo Usuarios (4)
('Fluxo de Navegação do Usuário', 4, '2025-02-12 01:15:00'),
('Casos de Uso - Usuário', 4, '2025-02-12 14:30:00'),

-- Aplicativo Entregadores (5)
('Fluxo de Entregas', 5, '2025-02-12 17:45:00'),
('Casos de Uso - Entregador', 5, '2025-02-12 22:00:00'),

-- Banco de Dados (6)
('Modelo Entidade-Relacionamento', 6, '2025-04-01 12:15:00'),
('Dicionário de Dados', 6, '2025-04-01 13:00:00'),

-- Back-end (7)
('Documentação da API', 7, '2025-04-01 15:15:00'),
('Arquitetura do Sistema', 7, '2025-04-01 19:10:00'),

-- Front-end (8)
('Guia de Componentes UI', 8, '2025-04-01 13:06:00'),
('Padrões de Estilo', 8, '2025-04-01 15:19:00'),

-- ESCOPO
-- Organização (9)
('TAP - Termo de Abertura de Projeto', 9, '2026-03-03 08:10:00'),
('Lista de demandas', 9, '2026-03-04 06:10:00'),
('Requisitos Funcionais', 11, '2026-03-05 03:40:00'),
('Requisitos não Funcionais', 11, '2026-03-07 01:10:00'),
-- Banco de Dados (10)
('Modelo Conceitual', 10, '2026-03-10 08:30:00'),
('Modelo Lógico', 10, '2026-03-15 03:10:00'),
('Scripts Criação de tabelas', 10, '2026-03-19 01:10:00'),
('Scripts Recursos (Triggers, Procedures, Views)', 10, '2026-03-30 00:32:00'),
('Scripts Inserts', 10, '2026-04-04 20:54:00'),

-- Back-End (11)
('Swagger API', 11, '2026-03-10 09:00:00'),
('Roteiro de Testes (Back-End)', 11, '2026-03-11 05:45:00'),

-- Front-End (12)
('Protótipos', 12, '2026-03-06 21:15:00'),
('Roteiro de Testes (Front-End)', 12, '2026-03-21 18:30:00'),

-- Mobile (13)
('Roteiro de Testes (Mobile)', 13, '2026-03-24 09:45:00');

-- DOCUMENTO_VERSAO
-- Documento 1
INSERT INTO documento_versao (conteudo, criador_id, documento_id, criado_em) VALUES
('v1 - Levantamento inicial de requisitos.', 1, 1, '2025-01-03 01:00:00'),
('v2 - Ajustes após reunião com cliente.', 2, 1, '2025-01-03 01:30:00'),
('v3 - Redefinindo ordem.', 3, 1, '2025-01-03 02:00:00'),
('v4 - Versão final aprovada', 1, 1, '2025-01-03 02:30:00'),
-- Documento 2
('v1 - Estrutura inicial do app mobile.', 1, 2, '2025-01-03 01:15:00'),
('v2 - Inclusão de novas funcionalidades.', 2, 2, '2025-01-03 01:45:00'),
-- Documento 3
('v1 - Protótipo inicial das telas web.', 2, 3, '2025-01-08 01:22:00'),
-- Documento 4
('v1 - Manual básico do usuário.', 3, 4, '2025-01-08 03:22:00'),
('v2 - Manual revisado com melhorias.', 1, 4, '2025-01-08 03:52:00'),
-- Documento 5
('v1 - Guia de instalação mobile.', 1, 5, '2025-02-12 13:17:00'),
-- Documento 6
('v1 - Relatório de testes iniciais.', 2, 6, '2025-02-13 16:17:00'),
('v2 - Correções após testes.', 3, 6, '2025-02-13 16:47:00'),
-- Documento 7
('v1 - Planejamento do projeto.', 1, 7, '2025-02-27 16:17:00'),
-- Documento 8
('v1 - Cronograma inicial.', 2, 8, '2025-02-12 02:15:00'),
('v2 - Cronograma atualizado.', 3, 8, '2025-02-12 02:45:00'),
-- Documento 9
('v1 - Relatório de progresso semanal.', 3, 9, '2025-02-12 15:30:00'),
-- Documento 10
('v1 - Fluxo de navegação do usuário.', 1, 10, '2025-02-12 18:45:00'),
-- Documento 11
('v1 - Casos de uso do usuário.', 2, 1, '2025-02-12 23:00:00'),
-- Documento 12
('v1 - Fluxo de entregas.', 3, 12, '2025-04-01 13:15:00'),
-- Documento 13
('v1 - Casos de uso do entregador.', 1, 13, '2025-04-01 14:00:00'),
-- Documento 14
('v1 - Modelo ER inicial.', 2, 14, '2025-04-01 16:15:00'),
-- Documento 15
('v1 - Dicionário de dados.', 3, 15, '2025-04-01 20:10:00'),
-- Documento 16
('v1 - Documentação da API.', 1, 16, '2025-04-01 14:06:00'),
('v2 - Inclusão de novos endpoints.', 2, 16, '2025-04-01 14:36:00'),
-- Documento 17
('v1 - Arquitetura backend.', 2, 17, '2025-04-01 16:19:00'),
-- ESCOPO
-- Documento 18
('v1 - TAP - Escopo[...]', 10, 18, '2026-03-03 09:10:00'),
('v2 - TAP - Escopo[...] Cronograma[...]', 2, 18, '2026-03-03 09:40:00'),
('v3 - TAP - Escopo[...] Cronograma[...] Participantes[...] Orçamento[...]', 2, 18, '2026-03-03 10:10:00'),
('v4 - Inclusão de riscos e stakeholders', 11, 18, '2026-03-03 10:40:00'),
('v5 - Ajustes finais aprovados pelo professor', 15, 18, '2026-03-03 11:10:00'),
-- Documento 19 (Lista de demandas)
('v1 - Levantamento inicial de demandas', 11, 19, '2026-03-04 07:10:00'),
('v2 - Priorização inicial', 10, 19, '2026-03-04 07:40:00'),
('v3 - Refinamento com equipe', 12, 19, '2026-03-04 08:10:00'),
-- Documento 20 (Requisitos Funcionais)
('v1 - Levantamento inicial', 11, 20, '2026-03-05 04:40:00'),
('v2 - Validação com stakeholders', 13, 20, '2026-03-05 05:10:00'),
('v3 - Ajustes pós reunião', 10, 20, '2026-03-05 05:40:00'),
-- Documento 21 (Requisitos Não Funcionais)
('v1 - Definição de performance', 12, 21, '2026-03-07 02:10:00'),
('v2 - Inclusão de segurança', 13, 21, '2026-03-07 02:40:00'),
-- Documento 22 (Modelo Conceitual)
('v1 - Estrutura inicial', 10, 22, '2026-03-10 09:30:00'),
('v2 - Ajustes nas entidades', 11, 22, '2026-03-10 10:00:00'),
-- Documento 23 (Modelo Lógico)
('v1 - Conversão do modelo', 10, 23, '2026-03-15 04:10:00'),
('v2 - Normalização aplicada', 12, 23, '2026-03-15 04:40:00'),
-- Documento 24 (Scripts Tabelas)
('v1 - Criação inicial', 11, 24, '2026-03-19 02:10:00'),
('v2 - Ajustes de constraints', 10, 24, '2026-03-19 02:40:00'),
-- Documento 25 (Scripts Recursos)
('v1 - Triggers iniciais', 12, 25, '2026-03-30 01:32:00'),
('v2 - Procedures adicionadas', 11, 25, '2026-03-30 02:02:00'),
-- Documento 26 (Scripts Inserts)
('v1 - Inserts iniciais', 10, 26, '2026-04-04 21:54:00'),
('v2 - Ajustes nos dados', 12, 26, '2026-04-04 22:24:00'),
-- Documento 27 (Swagger API)
('v1 - Documentação inicial', 11, 27, '2026-03-10 10:00:00'),
('v2 - Inclusão de endpoints', 12, 27, '2026-03-10 10:30:00'),
-- Documento 28 (Testes Back-End)
('v1 - Testes unitários', 10, 28, '2026-03-11 06:45:00'),
('v2 - Testes de integração', 11, 28, '2026-03-11 07:15:00'),
-- Documento 29 (Protótipos)
('v1 - Wireframes', 13, 29, '2026-03-06 22:15:00'),
('v2 - Protótipos navegáveis', 12, 29, '2026-03-06 22:45:00'),
-- Documento 30 (Testes Front-End)
('v1 - Testes de usabilidade', 13, 30, '2026-03-21 19:30:00'),
('v2 - Ajustes pós testes', 12, 30, '2026-03-21 20:00:00'),
-- Documento 31 (Testes Mobile)
('v1 - Testes iniciais mobile', 13, 31, '2026-03-24 10:45:00'),
('v2 - Correções pós testes', 12, 31,  '2026-03-24 11:15:00');

-- Registros
INSERT INTO registro(titulo, conteudo, criador_id, projeto_id, criado_em) VALUES
('Levantamento inicial', 'Requisitos coletados com cliente', 2, 1, '2025-01-02 00:00:00'),
('Definição de escopo', 'Escopo inicial do sistema', 3, 1, '2025-01-01 03:00:00'),
('Modelagem inicial', 'Definição das entidades principais', 4, 1, '2025-01-01 06:00:00'),
('Validação com cliente', 'Ajustes após reunião', 1, 1, '2025-01-01 10:00:00'),
('Versão preliminar', 'Documento inicial consolidado', 2, 1, '2025-01-01 15:00:00'),

('Kickoff do app', 'Definição inicial do produto', 5, 2, '2025-02-12 13:00:00'),
('Definição de funcionalidades', 'Features principais do app', 3, 2, '2025-02-11 16:00:00'),
('Fluxo do usuário', 'Mapeamento da jornada', 1, 2, '2025-02-11 19:00:00'),
('Integração backend', 'Planejamento da API', 6, 2, '2025-02-11 23:00:00'),
('Revisão geral', 'Ajustes finais antes do dev', 5, 2, '2025-02-12 04:00:00'),

('Kickoff Escopo', 'Apresentação do projeto', 11, 4, '2026-02-28 11:30:00'),
('Levantamento de requisitos', 'Discussão com stakeholders', 12, 4, '2026-02-27 14:30:00'),
('Definição de arquitetura', 'Estrutura inicial do sistema', 10, 4, '2026-02-27 17:30:00'),
('Planejamento de entregas', 'Divisão por sprints', 13, 4, '2026-02-27 21:30:00'),
('Revisão geral', 'Ajustes estratégicos', 11, 4, '2026-02-28 02:30:00'),

('Formação do time', 'Definição dos participantes', 6, 3, '2025-04-01 12:10:00'),
('Ideação', 'Discussão das ideias iniciais', 7, 3, '2025-04-01 12:30:00'),
('Escolha da solução', 'Definição do projeto final', 5, 3, '2025-04-01 13:00:00'),
('Divisão de tarefas', 'Responsabilidades distribuídas', 3, 3, '2025-04-01 13:40:00'),
('Início desenvolvimento', 'Primeiros commits', 8, 3, '2025-04-01 14:30:00'),

('Kickoff Escopo', 'Apresentação do projeto', 11, 4, '2026-02-28 11:30:00'),
('Levantamento de requisitos', 'Discussão com stakeholders', 12, 4, '2026-02-27 14:30:00'),
('Definição de arquitetura', 'Estrutura inicial do sistema', 10, 4, '2026-02-27 17:30:00'),
('Planejamento de entregas', 'Divisão por sprints', 13, 4, '2026-02-27 21:30:00'),
('Revisão geral', 'Ajustes estratégicos', 11, 4, '2026-02-28 02:30:00');

-- REUNIAO
INSERT INTO reuniao(titulo, transcricao, projeto_id, criado_em) VALUES
('Reunião Kickoff', 'Discussão inicial do projeto...', 1, '2025-01-02 00:00:00'),
('Reunião de Requisitos', 'Detalhamento das funcionalidades...', 1, '2025-01-01 03:00:00'),
('Reunião de Validação', 'Aprovação com cliente...', 1, '2025-01-01 06:00:00'),

('Kickoff do App', 'Alinhamento inicial...', 2, '2025-02-12 13:00:00'),
('Reunião de Funcionalidades', 'Discussão das features...', 2, '2025-02-11 16:00:00'),
('Revisão de Progresso', 'Acompanhamento do desenvolvimento...', 2, '2025-02-11 19:00:00'),

('Formação do Time', 'Organização inicial...', 3, '2025-04-01 12:10:00'),
('Discussão de Ideias', 'Brainstorming...', 3, '2025-04-01 12:30:00'),
('Definição Final', 'Escolha da solução...', 3, '2025-04-01 13:00:00'),

('Kickoff Escopo', 'Apresentação do projeto...', 4, '2026-02-28 11:30:00'),
('Levantamento de Requisitos', 'Discussão com stakeholders...', 4, '2026-02-27 14:30:00'),
('Planejamento de Entregas', 'Definição das sprints...', 4, '2026-02-27 17:30:00');

-- REUNIAO_USUARIO
INSERT INTO reuniao_usuario(usuario_id, reuniao_id, cargo) VALUES
(1, 1, 'Gerente de Projeto'),
(2, 1, 'Desenvolvedor Sênior'),
(2, 2, 'Desenvolvedor Sênior'),
(4, 2, 'Gerente de Operações');

-- CONVIDADO_REUNIAO
INSERT INTO convidado_reuniao(nome, cargo, reuniao_id) VALUES
('Mozart', 'Compositor Musical', 1),
('Adalberto Lima', 'Cliente Profissional', 2);

-- LINKS
INSERT INTO link(url, nome, tipo_link_id, reuniao_id) VALUES
('https://meet.google.com/abc', 'Meet', 1, 1),
('https://docs.com/doc1', 'Documento extra', 2, 2);

-- COMENTARIOS
INSERT INTO comentario(conteudo, criador_id, documento_id, comentario_tipo_id, criado_em) VALUES
('Precisamos melhorar esse requisito', 3, 1, 1, '2025-01-01 00:00:00'),
('Sugiro adicionar login social', 4, 2, 3, '2025-01-01 00:00:00');

-- RESPOSTA (comentario filho)
INSERT INTO comentario(conteudo, parent_id, criador_id, documento_id, comentario_tipo_id, criado_em) VALUES
('Boa ideia!', 1, 2, 1, 2, '2025-01-01 00:05:00');

-- APROVACAO
INSERT INTO aprovacao(documento_id, usuario_id, data) VALUES
(1, 1, '2025-01-01 00:00:00'),
(2, 2, '2025-01-01 00:00:00');
