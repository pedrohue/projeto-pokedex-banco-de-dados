-- PROJETO POKEDEX
-- 01 - CRIACAO DO BANCO DE DADOS E DAS TABELAS

DROP DATABASE IF EXISTS pokedex;
CREATE DATABASE pokedex CHARACTER SET utf8mb4;
USE pokedex;

-- TABELAS

CREATE TABLE regioes (
    id_regiao INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45) NOT NULL UNIQUE
);

CREATE TABLE tipos (
    id_tipo INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45) NOT NULL UNIQUE
);

CREATE TABLE especies (
    id_especie INT AUTO_INCREMENT PRIMARY KEY,
    numero_pokedex INT NOT NULL UNIQUE,
    nome VARCHAR(45) NOT NULL,
    altura DECIMAL(4,2) NOT NULL, -- em metros
    peso DECIMAL(6,2) NOT NULL, -- em quilos
    fk_id_regiao INT NOT NULL,
    fk_id_evolui_de INT NULL, -- especie da qual esta evolui
    nivel_evolucao INT NULL, -- nivel em que a evolucao acontece
    FOREIGN KEY (fk_id_regiao) REFERENCES regioes(id_regiao),
    FOREIGN KEY (fk_id_evolui_de) REFERENCES especies(id_especie)
);

CREATE TABLE especie_tipo (
    fk_id_especie INT NOT NULL,
    fk_id_tipo INT NOT NULL,
    PRIMARY KEY (fk_id_especie, fk_id_tipo),
    FOREIGN KEY (fk_id_especie) REFERENCES especies(id_especie),
    FOREIGN KEY (fk_id_tipo) REFERENCES tipos(id_tipo)
);

CREATE TABLE treinadores (
    id_treinador INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(60) NOT NULL,
    data_nascimento DATE NOT NULL,
    fk_id_regiao_origem INT NOT NULL,
    FOREIGN KEY (fk_id_regiao_origem) REFERENCES regioes(id_regiao)
);

CREATE TABLE capturas (
    id_captura INT AUTO_INCREMENT PRIMARY KEY,
    fk_id_treinador INT NOT NULL,
    fk_id_especie INT NOT NULL,
    apelido VARCHAR(30) NULL,
    nivel INT NOT NULL DEFAULT 1,
    data_captura DATE NOT NULL,
    FOREIGN KEY (fk_id_treinador) REFERENCES treinadores(id_treinador),
    FOREIGN KEY (fk_id_especie) REFERENCES especies(id_especie)
);
