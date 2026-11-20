-- PROJETO POKEDEX
-- 03 - INSERCAO DOS DADOS INICIAIS

USE pokedex;

-- REGIOES

INSERT INTO regioes (nome) VALUES
    ('Kanto'),   -- 1
    ('Johto'),   -- 2
    ('Hoenn');   -- 3

-- TIPOS

INSERT INTO tipos (nome) VALUES
    ('Normal'),   -- 1
    ('Fogo'),     -- 2
    ('Agua'),     -- 3
    ('Planta'),   -- 4
    ('Eletrico'), -- 5
    ('Voador'),   -- 6
    ('Veneno');   -- 7

-- ESPECIES QUE NAO EVOLUEM DE NINGUEM
-- Colunas: numero na pokedex, nome, altura, peso, id da regiao

INSERT INTO especies (numero_pokedex, nome, altura, peso, fk_id_regiao) VALUES
    (1,   'Bulbasaur',  0.70,  6.90, 1), -- 1
    (4,   'Charmander', 0.60,  8.50, 1), -- 2
    (7,   'Squirtle',   0.50,  9.00, 1), -- 3
    (25,  'Pikachu',    0.40,  6.00, 1), -- 4
    (16,  'Pidgey',     0.30,  1.80, 1); -- 5

-- ESPECIES QUE EVOLUEM
-- Colunas: numero na pokedex, nome, altura, peso, regiao,
-- id da especie anterior e nivel de evolucao

INSERT INTO especies
    (numero_pokedex, nome, altura, peso, fk_id_regiao, fk_id_evolui_de, nivel_evolucao)
VALUES
    (2,  'Ivysaur',    1.00, 13.00, 1, 1, 16),   -- 6: evolui de Bulbasaur
    (5,  'Charmeleon', 1.10, 19.00, 1, 2, 16),   -- 7: evolui de Charmander
    (8,  'Wartortle',  1.00, 22.50, 1, 3, 16),   -- 8: evolui de Squirtle
    (26, 'Raichu',     0.80, 30.00, 1, 4, NULL); -- 9: evolui de Pikachu (sem nivel)

INSERT INTO especies (numero_pokedex, nome, altura, peso, fk_id_regiao) VALUES
    (152, 'Chikorita', 0.90, 6.40, 2), -- 10
    (155, 'Cyndaquil', 0.50, 7.90, 2), -- 11
    (252, 'Treecko',   0.50, 5.00, 3); -- 12

-- RELACIONAMENTO ENTRE ESPECIES E TIPOS
-- Colunas: id da especie, id do tipo

INSERT INTO especie_tipo (fk_id_especie, fk_id_tipo) VALUES
    (1, 4), (1, 7), -- Bulbasaur: Planta e Veneno
    (2, 2),         -- Charmander: Fogo
    (3, 3),         -- Squirtle: Agua
    (4, 5),         -- Pikachu: Eletrico
    (5, 1), (5, 6), -- Pidgey: Normal e Voador
    (6, 4), (6, 7), -- Ivysaur: Planta e Veneno
    (7, 2),         -- Charmeleon: Fogo
    (8, 3),         -- Wartortle: Agua
    (9, 5),         -- Raichu: Eletrico
    (10, 4),        -- Chikorita: Planta
    (11, 2),        -- Cyndaquil: Fogo
    (12, 4);        -- Treecko: Planta

-- TREINADORES

INSERT INTO treinadores (nome, data_nascimento, fk_id_regiao_origem) VALUES
    ('Ash Ketchum',    '2006-05-22', 1), -- 1
    ('Misty Williams', '2005-07-14', 1), -- 2
    ('Brock Harrison', '2002-09-08', 1), -- 3
    ('Gary Oak',       '2006-04-11', 1), -- 4
    ('Lyra',           '2008-10-01', 2); -- 5 (ainda nao capturou nada)

-- CAPTURAS
-- Colunas: id do treinador, id da especie, apelido, nivel e data

INSERT INTO capturas
    (fk_id_treinador, fk_id_especie, apelido, nivel, data_captura)
VALUES
    (1, 4,  'Pika',  25, '2026-01-10'), -- 1
    (1, 2,  'Char',  14, '2026-01-12'), -- 2: nivel 14, ainda nao evolui
    (1, 5,  NULL,    8,  '2026-02-15'), -- 3
    (1, 5,  'Piu',   6,  '2026-02-20'), -- 4: segundo Pidgey do Ash
    (4, 3,  'Squirt',15, '2026-01-12'), -- 5
    (4, 8,  'Wart',  22, '2026-03-01'), -- 6
    (2, 8,  'Mist',  30, '2026-02-20'), -- 7
    (3, 1,  'Bulba', 12, '2026-01-14'), -- 8
    (4, 10, 'Chiko', 9,  '2026-03-10'); -- 9
