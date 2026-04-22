CREATE DATABASE db_escopo;
USE db_escopo;

-- ======================
-- USUARIO
-- ======================

-- Usuario
CREATE TABLE usuario (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    status BOOLEAN DEFAULT TRUE,
    deletado_em TIMESTAMP NULL,
    foto_perfil VARCHAR(512) NULL
);
-- ----------------------

-- ======================
-- PROJETO
-- ======================

-- Projeto
CREATE TABLE projeto (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(100) NOT NULL,
    descricao TEXT NULL,
    status BOOLEAN DEFAULT TRUE,
    criador_id INT NOT NULL,
    data_criacao TIMESTAMP NOT NULL,
    
    CONSTRAINT fk_projeto_usuario_criador
    FOREIGN KEY (criador_id) REFERENCES usuario(id)
);

-- ======================
-- CONVITE
-- ======================

-- Referências:
CREATE TABLE nivel_acesso (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL
);

CREATE TABLE convite_status (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(12) NOT NULL
);

-- Convite
CREATE TABLE convite (
    id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(150) NOT NULL,
    criado_em TIMESTAMP NOT NULL,
    projeto_id INT NOT NULL,
    usuario_id INT NOT NULL, -- destino
    nivel_acesso_id INT NOT NULL,
    convidado_por_id INT NOT NULL, -- remetente
    convite_status_id INT NOT NULL,
    
    -- Relacionamentos
	CONSTRAINT fk_convite_projeto
    FOREIGN KEY (projeto_id) REFERENCES projeto(id),
    CONSTRAINT convite_usuario_destino
    FOREIGN KEY (usuario_id) REFERENCES usuario(id),
    CONSTRAINT convite_usuario_remetente
    FOREIGN KEY (convidado_por_id) REFERENCES usuario(id),
    
    -- Referencias
    CONSTRAINT fk_convite_nivel_acesso
    FOREIGN KEY (nivel_acesso_id) REFERENCES nivel_acesso(id),
    CONSTRAINT fk_convite_status_convite
    FOREIGN KEY (convite_status_id) REFERENCES convite_status(id)
);

-- ----------------------


-- Relacionamentos
CREATE TABLE usuario_projeto (
    id INT PRIMARY KEY AUTO_INCREMENT,
    usuario_id INT NOT NULL,
    projeto_id INT NOT NULL,
    nivel_acesso_id INT NOT NULL,

	CONSTRAINT FK
    FOREIGN KEY (usuario_id) REFERENCES usuario(id),
    FOREIGN KEY (projeto_id) REFERENCES projeto(id),
    FOREIGN KEY (nivel_acesso_id) REFERENCES nivel_acesso(id)
);
-- ----------------------


-- ======================
-- ASSINATURA
-- ======================

-- Referencias
CREATE TABLE plano (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    descricao VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL
);

CREATE TABLE assinatura_status (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL
);

CREATE TABLE beneficio (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    descricao VARCHAR(100) NOT NULL
);

--

-- Assinatura
CREATE TABLE assinatura (
    id INT PRIMARY KEY AUTO_INCREMENT,
    data_inicio TIMESTAMP NOT NULL,
    data_fim TIMESTAMP NULL,
    usuario_id INT NOT NULL,
    plano_id INT NOT NULL,
    assinatura_status_id INT NOT NULL,
    
    -- Relacionamentos
    CONSTRAINT fk_assinatura_usuario
    FOREIGN KEY (usuario_id) REFERENCES usuario(id),
    CONSTRAINT fk_assinatura_plano
    FOREIGN KEY (plano_id) REFERENCES plano(id),
    CONSTRAINT fk_assinatura_status_assinatura
    FOREIGN KEY (assinatura_status_id) REFERENCES assinatura_status(id)
);

-- Relacionamentos
CREATE TABLE plano_beneficio (
    id INT PRIMARY KEY AUTO_INCREMENT,
    plano_id INT NOT NULL,
    beneficio_id INT NOT NULL,
    val_numerico INT NULL,
    val_boolean BOOLEAN NULL,

	CONSTRAINT fk_plano_beneficio_plano
    FOREIGN KEY (plano_id) REFERENCES plano(id),
    CONSTRAINT fk_plano_beneficio_beneficio
    FOREIGN KEY (beneficio_id) REFERENCES beneficio(id)
);

-- ----------------------

-- ======================
-- REUNIÃO
-- ======================

CREATE TABLE reuniao (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(150) NOT NULL,
    transcricao TEXT NULL,
    criado_em TIMESTAMP NOT NULL,
    projeto_id INT NOT NULL,

    FOREIGN KEY (projeto_id) REFERENCES projeto(id)
);

CREATE TABLE reuniao_usuario (
    id INT PRIMARY KEY AUTO_INCREMENT,
    usuario_id INT NOT NULL,
    reuniao_id INT NOT NULL,

    FOREIGN KEY (usuario_id) REFERENCES usuario(id),
    FOREIGN KEY (reuniao_id) REFERENCES reuniao(id)
);

CREATE TABLE convidado_reuniao (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(100) NULL,
    reuniao_id INT NOT NULL,

    FOREIGN KEY (reuniao_id) REFERENCES reuniao(id)
);

	-- ======================
	-- LINKS
	-- ======================

-- Referencia
CREATE TABLE tipo_link (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL
);

-- Link
CREATE TABLE link (
    id INT PRIMARY KEY AUTO_INCREMENT,
    url VARCHAR(500) NOT NULL,
    nome VARCHAR(50) NULL,
    tipo_link_id INT NOT NULL,
    reuniao_id INT NOT NULL,

	CONSTRAINT fk_link_tipo_link
    FOREIGN KEY (tipo_link_id) REFERENCES tipo_link(id),
    CONSTRAINT fk_link_reuniao
    FOREIGN KEY (reuniao_id) REFERENCES reuniao(id)
);

-- ----------------------

-- ======================
-- REGISTROS
-- ======================

CREATE TABLE registro (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(150) NOT NULL,
    criado_em TIMESTAMP NOT NULL,
    conteudo TEXT NOT NULL,
    criador_id INT NOT NULL,
    projeto_id INT NOT NULL,

	CONSTRAINT fk_registro_usuario_criador
    FOREIGN KEY (criador_id) REFERENCES usuario(id),
    CONSTRAINT fk_registro_projeto
    FOREIGN KEY (projeto_id) REFERENCES projeto(id)
);
-- ----------------------

-- ======================
-- DOCUMENTOS
-- ======================

-- Categoria
CREATE TABLE categoria (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(100) NOT NULL,
    projeto_id INT NOT NULL,

	CONSTRAINT fk_categoria_projeto
    FOREIGN KEY (projeto_id) REFERENCES projeto(id)
);

-- Documento
CREATE TABLE documento (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(150) NOT NULL,
    criado_em TIMESTAMP NOT NULL,
    categoria_id INT NOT NULL,
    deletado_em TIMESTAMP NULL,

	-- Relacionamento
	CONSTRAINT fk_documento_categoria
    FOREIGN KEY (categoria_id) REFERENCES categoria(id)
);

-- Versionamento  de documento
CREATE TABLE documento_versao (
    id INT PRIMARY KEY AUTO_INCREMENT,
    conteudo TEXT NOT NULL,
    criado_em TIMESTAMP NOT NULL,
    criador_id INT NOT NULL,
    documento_id INT NOT NULL,

	-- Relacionamentos
    CONSTRAINT fk_documento_versao_usuario_criador
    FOREIGN KEY (criador_id) REFERENCES usuario(id),
    CONSTRAINT fk_documento_versao_documento
    FOREIGN KEY (documento_id) REFERENCES documento(id)
);

	-- ======================
	-- COMENTÁRIOS
	-- ======================
    
-- Referencia
CREATE TABLE comentario_tipo (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL
);

-- Comentario
CREATE TABLE comentario (
    id INT PRIMARY KEY AUTO_INCREMENT,
    conteudo TEXT NOT NULL,
    criado_em TIMESTAMP NOT NULL,
    parent_id INT NULL,
    registro_referencia_id INT NULL,
    criador_id INT NOT NULL,
    documento_id INT NOT NULL,
    comentario_tipo_id INT NOT NULL,

	-- Referencias
	CONSTRAINT fk_comentario_tipo_comentario
	FOREIGN KEY (comentario_tipo_id) REFERENCES comentario_tipo(id),
    
	-- Relacionamentos
    CONSTRAINT fk_comentario_parent_id
    FOREIGN KEY (parent_id) REFERENCES comentario(id),
    CONSTRAINT fk_comentario_registro_referencia
    FOREIGN KEY (registro_referencia_id) REFERENCES registro(id),
    CONSTRAINT fk_comentario_usuario_criador
    FOREIGN KEY (criador_id) REFERENCES usuario(id),
    CONSTRAINT fk_comentario_documento
    FOREIGN KEY (documento_id) REFERENCES documento(id)
);
	-- ======================
	-- APROVAÇÕES
	-- ======================
 CREATE TABLE aprovacao(
	id INT PRIMARY KEY AUTO_INCREMENT,
    data TIMESTAMP NOT NULL,
    documento_id INTEGER NOT NULL,
    usuario_id INTEGER NOT NULL,
    
    CONSTRAINT fk_aprovacao_documento
    FOREIGN KEY (documento_id) REFERENCES documento(id),
    CONSTRAINT fk_aprovacao_usuario
    FOREIGN KEY (usuario_id) REFERENCES usuario(id)
 );
 

-- ----------------------
-- ======================
-- NOTIFICAÇÕES
-- ======================

CREATE TABLE notificacao (
    id INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(300) NOT NULL,
    data TIMESTAMP NOT NULL,
    aberto BOOLEAN DEFAULT FALSE,
    comentario_id INT NOT NULL,
    usuario_id INT NOT NULL, -- Destinatario

	CONSTRAINT fk_notificacao_comentario
    FOREIGN KEY (comentario_id) REFERENCES comentario(id),
    CONSTRAINT fk_notificacao_usuario
    FOREIGN KEY (usuario_id) REFERENCES usuario(id)
);

-- ----------------------


