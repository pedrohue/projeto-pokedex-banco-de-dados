-- PROJETO POKEDEX
-- 02 - TRIGGER E STORED PROCEDURE

USE pokedex;

-- TRIGGER: uma especie tem no maximo 2 tipos

DELIMITER $$

CREATE TRIGGER trg_max_dois_tipos
BEFORE INSERT ON especie_tipo
FOR EACH ROW
BEGIN
    DECLARE v_total INT;

    SELECT COUNT(*) INTO v_total
    FROM especie_tipo
    WHERE fk_id_especie = NEW.fk_id_especie;

    IF v_total >= 2 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Uma especie pode ter no maximo 2 tipos';
    END IF;
END$$

-- STORED PROCEDURE: evolui um pokemon capturado se o nivel permitir

CREATE PROCEDURE sp_evoluir_pokemon (IN p_id_captura INT)
BEGIN
    DECLARE v_proxima INT;

    -- procura a especie que evolui da especie atual da captura
    -- e cujo nivel de evolucao ja foi atingido
    SET v_proxima = (
        SELECT e.id_especie
        FROM capturas c
        JOIN especies e ON e.fk_id_evolui_de = c.fk_id_especie
        WHERE c.id_captura = p_id_captura
          AND e.nivel_evolucao <= c.nivel
        LIMIT 1
    );

    IF v_proxima IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Este pokemon nao pode evoluir agora';
    END IF;

    UPDATE capturas
    SET fk_id_especie = v_proxima
    WHERE id_captura = p_id_captura;

    SELECT c.id_captura, c.apelido, e.nome AS especie_atual, c.nivel
    FROM capturas c
    JOIN especies e ON c.fk_id_especie = e.id_especie
    WHERE c.id_captura = p_id_captura;
END$$

DELIMITER ;
