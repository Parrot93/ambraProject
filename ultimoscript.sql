-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8mb3 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`acquirente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`acquirente` (
  `username` VARCHAR(20) NOT NULL,
  `password` VARCHAR(45) NULL DEFAULT NULL,
  `nome` VARCHAR(20) NULL DEFAULT NULL,
  `cognome` VARCHAR(20) NULL DEFAULT NULL,
  `data_nascita` DATE NULL DEFAULT NULL,
  `citta_nascita` VARCHAR(20) NULL DEFAULT NULL,
  `CF` VARCHAR(16) NULL DEFAULT NULL,
  PRIMARY KEY (`username`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`admin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`admin` (
  `username` VARCHAR(20) NOT NULL,
  `pwd` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`username`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`categoria` (
  `nome_categoria` VARCHAR(45) NOT NULL,
  `categoria_nome_categoria` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`nome_categoria`),
  INDEX `fk_categoria_categoria1_idx` (`categoria_nome_categoria` ASC) VISIBLE,
  CONSTRAINT `fk_categoria_categoria1`
    FOREIGN KEY (`categoria_nome_categoria`)
    REFERENCES `mydb`.`categoria` (`nome_categoria`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`oggetto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`oggetto` (
  `codice` VARCHAR(45) NOT NULL,
  `condizione` ENUM('NUOVO', 'USATO') NULL DEFAULT NULL,
  `descrizione` VARCHAR(100) NULL DEFAULT NULL,
  `prezzo_base` FLOAT NULL DEFAULT NULL,
  `admin_username` VARCHAR(20) NULL DEFAULT NULL,
  `categoria_nome_categoria` VARCHAR(45) NULL DEFAULT NULL,
  `stato` ENUM('VENDUTO', 'IN_VENDITA') NULL DEFAULT NULL,
  `acquirente` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`codice`),
  INDEX `fk_oggetto_admin1_idx` (`admin_username` ASC) VISIBLE,
  INDEX `fk_oggetto_categoria1_idx` (`categoria_nome_categoria` ASC) VISIBLE,
  CONSTRAINT `fk_oggetto_admin1`
    FOREIGN KEY (`admin_username`)
    REFERENCES `mydb`.`admin` (`username`),
  CONSTRAINT `fk_oggetto_categoria1`
    FOREIGN KEY (`categoria_nome_categoria`)
    REFERENCES `mydb`.`categoria` (`nome_categoria`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`asta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`asta` (
  `id_asta` VARCHAR(36) NOT NULL,
  `data_inizio` TIMESTAMP NULL DEFAULT NULL,
  `data_fine` TIMESTAMP NULL DEFAULT NULL,
  `oggetto_codice` VARCHAR(36) NOT NULL,
  PRIMARY KEY (`id_asta`, `oggetto_codice`),
  INDEX `fk_asta_oggetto1_idx` (`oggetto_codice` ASC) VISIBLE,
  CONSTRAINT `fk_asta_oggetto1`
    FOREIGN KEY (`oggetto_codice`)
    REFERENCES `mydb`.`oggetto` (`codice`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`carta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`carta` (
  `numero` BIGINT NOT NULL,
  `intestatario` VARCHAR(45) NULL DEFAULT NULL,
  `CVV` INT NULL DEFAULT NULL,
  `data_scadenza` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`numero`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`indirizzo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`indirizzo` (
  `via` VARCHAR(45) NOT NULL,
  `civico` INT NOT NULL,
  `CAP` INT NULL DEFAULT NULL,
  `citta` VARCHAR(45) NOT NULL,
  `acquirente_username` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`via`, `civico`, `citta`),
  INDEX `fk_indirizzo_acquirente_idx` (`acquirente_username` ASC) VISIBLE,
  CONSTRAINT `fk_indirizzo_acquirente`
    FOREIGN KEY (`acquirente_username`)
    REFERENCES `mydb`.`acquirente` (`username`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`offerta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`offerta` (
  `valore` FLOAT NULL DEFAULT NULL,
  `orario` TIMESTAMP NOT NULL,
  `acquirente_username` VARCHAR(20) NOT NULL,
  `oggetto_codice` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`acquirente_username`, `oggetto_codice`, `orario`),
  INDEX `fk_offerta_acquirente1_idx` (`acquirente_username` ASC) VISIBLE,
  INDEX `fk_offerta_oggetto1_idx` (`oggetto_codice` ASC) VISIBLE,
  CONSTRAINT `fk_offerta_acquirente1`
    FOREIGN KEY (`acquirente_username`)
    REFERENCES `mydb`.`acquirente` (`username`),
  CONSTRAINT `fk_offerta_oggetto1`
    FOREIGN KEY (`oggetto_codice`)
    REFERENCES `mydb`.`oggetto` (`codice`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`utilizzo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`utilizzo` (
  `acquirente_username` VARCHAR(20) NOT NULL,
  `carta_numero` BIGINT NOT NULL,
  PRIMARY KEY (`acquirente_username`, `carta_numero`),
  INDEX `fk_utilizzo_acquirente1_idx` (`acquirente_username` ASC) VISIBLE,
  INDEX `fk_utilizzo_carta1_idx` (`carta_numero` ASC) VISIBLE,
  CONSTRAINT `fk_utilizzo_acquirente1`
    FOREIGN KEY (`acquirente_username`)
    REFERENCES `mydb`.`acquirente` (`username`),
  CONSTRAINT `fk_utilizzo_numero1`
    FOREIGN KEY (`carta_numero`)
    REFERENCES `mydb`.`carta` (`numero`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

USE `mydb` ;

-- -----------------------------------------------------
-- procedure aggiungi_carta
-- -----------------------------------------------------

DELIMITER $$
USE `mydb`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `aggiungi_carta`(IN var_num bigint, IN var_intestatario varchar(45), IN var_CVV int, IN var_data_scadenza date)
BEGIN
INSERT INTO carta (numero, intestatario, CVV, data_scadenza)
VALUES (var_num, var_intestatario, var_CVV, var_data_scadenza);
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure aggiungi_indirizzo
-- -----------------------------------------------------

DELIMITER $$
USE `mydb`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `aggiungi_indirizzo`(IN var_us varchar(20), IN var_via varchar(45), IN var_civ INT, IN var_CAP INT, var_citta varchar(45))
BEGIN
IF EXISTS ( SELECT 1 FROM acquirente WHERE username = var_us)
THEN
INSERT INTO indirizzo(acquirente_username, via, civico, CAP, citta)
VALUES (var_us, var_via, var_civ, var_CAP, var_citta);
END IF;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure associa_carta
-- -----------------------------------------------------

DELIMITER $$
USE `mydb`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `associa_carta`(IN var_us varchar(20), IN var_num bigint)
BEGIN
IF EXISTS ( SELECT 1 FROM acquirente WHERE username = var_us)
AND 
EXISTS( SELECT 1 FROM carta WHERE numero = var_num)
THEN
INSERT INTO utilizzo (acquirente_username, carta_numero)
VALUES ( var_us, var_num);
END IF;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure chiudi_asta
-- -----------------------------------------------------

DELIMITER $$
USE `mydb`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `chiudi_asta`(IN var_id varchar(36))
BEGIN
IF ( SELECT data_fine FROM asta WHERE id_asta = var_id) < timestamp
THEN
UPDATE oggetto
SET stato = 'VENDUTO'
WHERE codice = var_id;
END IF;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure crea_asta
-- -----------------------------------------------------

DELIMITER $$
USE `mydb`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `crea_asta`( IN durata INT, IN var_cond ENUM('NUOVO','USATO'), IN var_descr VARCHAR(100),IN var_admin varchar(20), IN var_prezzo FLOAT, IN var_cat varchar(45))
BEGIN
DECLARE var_id varchar(45);
declare data_in timestamp;
set var_id = UUID();
set data_in = current_timestamp();
IF EXISTS (SELECT username FROM admin WHERE username = var_admin)
THEN
INSERT INTO oggetto(codice, condizione, descrizione, prezzo_base, admin_username, categoria_nome_categoria,stato)
VALUES (var_id, var_cond, var_descr, var_prezzo, var_admin, var_cat, 'IN_VENDITA');
END IF;
INSERT INTO asta (id_asta, data_inizio, data_fine, oggetto_codice)
VALUES (var_id, data_in, timestampadd(DAY, durata, data_in), var_id);
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure fai_offerta
-- -----------------------------------------------------

DELIMITER $$
USE `mydb`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `fai_offerta`(IN var_us varchar(20), IN var_cod varchar(10), IN var_val FLOAT)
BEGIN
IF var_val > (SELECT MAX(valore) FROM offerta JOIN oggetto 
ON oggetto_codice = codice
WHERE oggetto_codice = var_cod
AND stato = 'IN_VENDITA')
THEN
INSERT INTO offerta(acquirente_username, oggetto_codice, valore, orario)
VALUES (var_us, var_cod, var_val, current_timestamp());
END IF;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure inserisci_acquirente
-- -----------------------------------------------------

DELIMITER $$
USE `mydb`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `inserisci_acquirente`(IN v_us varchar(20),IN v_pass varchar(45))
BEGIN
INSERT INTO acquirente(username,password) VALUES (v_us, v_pass);
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure iscrivi_acquirente
-- -----------------------------------------------------

DELIMITER $$
USE `mydb`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `iscrivi_acquirente`(v_us varchar(20), v_pass varchar(45), v_nome varchar(20), v_cogn varchar(20), v_data date, v_citta varchar(20), v_CF varchar(16))
BEGIN
IF NOT EXISTS ( SELECT 1 FROM acquirente WHERE username = v_us)
AND
NOT EXISTS (SELECT 1 FROM admin WHERE username = v_us)
THEN
INSERT INTO acquirente (username, password, nome, cognome, data_nascita, citta_nascita, CF)
VALUES (v_us, v_pass, v_nome, v_cogn, v_data, v_citta, v_CF);
END IF;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure mostra_le_tue_aste
-- -----------------------------------------------------

DELIMITER $$
USE `mydb`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `mostra_le_tue_aste`(IN var_acq varchar(20))
BEGIN
SELECT DISTINCT id_asta FROM asta 
JOIN offerta ON asta.oggetto_codice = offerta.oggetto_codice
WHERE acquirente_username = var_acq;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure mostra_le_tue_offerte
-- -----------------------------------------------------

DELIMITER $$
USE `mydb`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `mostra_le_tue_offerte`(IN var_acq varchar(20))
BEGIN
SELECT oggetto_codice, valore 
FROM offerta
WHERE acquirente_username = var_acq; 
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure mostra_miglior_offerente
-- -----------------------------------------------------

DELIMITER $$
USE `mydb`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `mostra_miglior_offerente`(IN var_cod varchar(10))
BEGIN
SELECT acquirente_username FROM offerta
WHERE valore = (SELECT MAX(valore) FROM offerta
WHERE oggetto_codice = var_cod);
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure mostra_oggetti_aggiudicati
-- -----------------------------------------------------

DELIMITER $$
USE `mydb`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `mostra_oggetti_aggiudicati`(IN v_acq varchar(20))
BEGIN
SELECT codice FROM oggetto
WHERE stato = 'VENDUTO' AND acquirente = v_acq;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure vincitore_asta
-- -----------------------------------------------------

DELIMITER $$
USE `mydb`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `vincitore_asta`(IN v_id varchar(45))
BEGIN
SELECT acquirente_username FROM offerta
JOIN oggetto ON oggetto_codice = codice
JOIN asta ON codice = asta.oggetto_codice
WHERE id_asta = v_id
AND valore = ( SELECT max(valore) 
FROM offerta
JOIN asta ON offerta.oggetto_codice = asta.oggetto_codice
WHERE id_asta = v_id)
AND stato = 'VENDUTO';
UPDATE oggetto
SET acquirente = acquirente_usarname;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure visualizza_aste_aperte
-- -----------------------------------------------------

DELIMITER $$
USE `mydb`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `visualizza_aste_aperte`()
BEGIN
SELECT * FROM asta WHERE data_fine > current_timestamp(); 
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure visualizza_aste_chiuse
-- -----------------------------------------------------

DELIMITER $$
USE `mydb`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `visualizza_aste_chiuse`()
BEGIN
SELECT * FROM asta WHERE data_fine < current_timestamp();
END$$

DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
