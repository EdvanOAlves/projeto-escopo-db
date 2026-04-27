USE db_escopo;

INSERT INTO nivel_acesso(nome) VALUES
    ('Gerente de Projeto'),
    ('Analista de Requisitos'),
    ('Desenvolvedor'),
    ('Cliente');

INSERT INTO convite_status(nome) VALUES
    ('pendente'),
    ('recusado'),
    ('expirado'),
    ('não-lido'),
    ('lido');

INSERT INTO plano(nome, descricao, preco)
    VALUES
    ('Free', 'Uso Acadêmico', 0.0),
    ('Standard', 'Uso Comercial', 50.0),
    ('Premium', 'Uso Comercial', 75.0);

INSERT INTO assinatura_status(nome)
    VALUES
    ('ativo'),
    ('expirado'),
    ('cancelado');

INSERT INTO beneficio(nome, descricao)
    VALUES
    ('colaboradores', 'Quantidade de colaboradores em um projeto'),
    ('clientes', 'Quantidade de clientes em um projeto'),
    ('transcricao', 'acesso a transcricao de reunioes');


INSERT INTO plano_beneficio(plano_id, beneficio_id, val_numerico,val_boolean)
    VALUES
    -- Plano Free
    (1, 1, 3, NULL),
    (1, 2, 2, NULL),
    (1, 3, NULL, FALSE),

    -- Plano Standard
    (2, 1, 4, NULL),
    (2, 2, 4, NULL),
    (2, 3, NULL, TRUE),

    -- Plano Premium
    (3, 1, 999, NULL),
    (3, 2, 999, NULL),
    (3, 3, NULL, TRUE);

INSERT INTO tipo_link(nome)
    VALUES
    ('reuniao'),
    ('link_adicional');

INSERT INTO comentario_tipo(nome)
    VALUES
    ('comentario')
    ('resposta'),
    ('sugestao');
    