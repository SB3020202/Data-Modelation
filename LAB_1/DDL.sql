-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema smartagriculture_db
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `smartagriculture_db` ;

-- -----------------------------------------------------
-- Schema smartagriculture_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `smartagriculture_db` DEFAULT CHARACTER SET utf8 ;
USE `smartagriculture_db` ;

-- -----------------------------------------------------
-- Table `Produtor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Produtor` (
  `NIF` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Address` VARCHAR(45) NULL,
  `PhoneNum` VARCHAR(45) NULL,
  `AreaCultivada` VARCHAR(45) NULL,
  PRIMARY KEY (`NIF`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cultivo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cultivo` (
  `ID` INT NOT NULL,
  `Produtor_NIF_Cultivo` INT NOT NULL,
  `Tipo` VARCHAR(45) NULL,
  `DataPlantado` DATE NULL,
  `DataColhido` DATE NULL,
  `Rendimento` FLOAT NULL,
  `TipoPratica` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Cultivo_Produtor_idx` (`Produtor_NIF_Cultivo` ASC),
  CONSTRAINT `fk_Cultivo_Produtor`
    FOREIGN KEY (`Produtor_NIF_Cultivo`)
    REFERENCES `Produtor` (`NIF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tratamentos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Tratamentos` (
  `Nome` VARCHAR(45) NOT NULL,
  `Fornecedor` VARCHAR(45) NULL,
  `QuantidadeUsada` INT NULL,
  `DataAplicacao` DATE NULL,
  `QuantidadeEstoqueTotal` INT NULL,
  PRIMARY KEY (`Nome`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Distribuidores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Distribuidores` (
  `ID` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Localização` VARCHAR(45) NULL,
  `CapacidadeArmazenamento` INT NULL,
  `HistoricoCompras` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RegistosProducao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RegistosProducao` (
  `LoteID` INT NOT NULL,
  `Cultivo_ID_Registos_Producao` INT NULL,
  `Quantidade` INT NULL,
  `DataColhida` DATE NULL,
  `Qualidade` INT NULL,
  `Destino` VARCHAR(45) NULL,
  PRIMARY KEY (`LoteID`),
  INDEX `Cultivo_ID_idx` (`Cultivo_ID_Registos_Producao` ASC),
  CONSTRAINT `Cultivo_ID_Registos_Producao`
    FOREIGN KEY (`Cultivo_ID_Registos_Producao`)
    REFERENCES `Cultivo` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Comercializacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Comercializacao` (
  `ID` INT NOT NULL,
  `LoteID_RegistosProducao` INT NULL,
  `Precokg` INT NULL,
  `CustosLogistica` INT NULL,
  `ProcuraMercado` INT NULL,
  `DataVenda` DATE NULL,
  `QuantidadeVendida` INT NULL,
  PRIMARY KEY (`ID`),
  INDEX `ID_Produto_idx` (`LoteID_RegistosProducao` ASC),
  CONSTRAINT `ID_Produto_RegistosProducao`
    FOREIGN KEY (`LoteID_RegistosProducao`)
    REFERENCES `RegistosProducao` (`LoteID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sensores_IoT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sensores_IoT` (
  `ID` INT NOT NULL,
  `Cultivo_ID_Sensores` INT NULL,
  `Temperatura` FLOAT NULL,
  ` humidadeSolo` FLOAT NULL,
  `QualidadeAr` FLOAT NULL,
  `NivelIrrigacao` FLOAT NULL,
  PRIMARY KEY (`ID`),
  INDEX `Cultivo_ID_idx` (`Cultivo_ID_Sensores` ASC),
  CONSTRAINT `Cultivo_ID_Sensores`
    FOREIGN KEY (`Cultivo_ID_Sensores`)
    REFERENCES `Cultivo` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Alertas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Alertas` (
  `ID` INT NOT NULL,
  `Sensor_ID_Alertas` INT NULL,
  `Cultivo_ID_Alertas` INT NULL,
  `DataAlerta` DATETIME NULL,
  `AlertaHumidade` INT NULL,
  `AlertaTemperatura` INT NULL,
  `AlertaIrrigacao` INT NULL,
  `AlertaQualidade` INT NULL,
  PRIMARY KEY (`ID`),
  INDEX `Sensor_ID_idx` (`Sensor_ID_Alertas` ASC),
  INDEX `Cultivo_ID_idx` (`Cultivo_ID_Alertas` ASC),
  CONSTRAINT `Sensor_ID_Alertas`
    FOREIGN KEY (`Sensor_ID_Alertas`)
    REFERENCES `Sensores_IoT` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Cultivo_ID_Alertas`
    FOREIGN KEY (`Cultivo_ID_Alertas`)
    REFERENCES `Cultivo` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Faturacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Faturacao` (
  `Nfatura` INT NOT NULL,
  `Distribuidores_ID` INT NULL,
  `Data` DATE NULL,
  `Volume` FLOAT NULL,
  `Estado` BINARY NULL,
  `Faturacaocol` VARCHAR(45) NULL,
  PRIMARY KEY (`Nfatura`),
  INDEX `Distribuidores_ID_idx` (`Distribuidores_ID` ASC),
  CONSTRAINT `Distribuidores_ID`
    FOREIGN KEY (`Distribuidores_ID`)
    REFERENCES `Distribuidores` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Gestao_Recursos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Gestao_Recursos` (
  `ID` INT NOT NULL,
  `Sensor_ID_GestaoRecursos` INT NULL,
  `NIF_Produtor` INT NULL,
  `Data` DATE NULL,
  `Tipo_Recurso` VARCHAR(45) NULL,
  `Quantidade` FLOAT NULL,
  `Custo` FLOAT NULL,
  `Descricao` VARCHAR(255) NULL,
  PRIMARY KEY (`ID`),
  INDEX `Sensor_ID_idx` (`Sensor_ID_GestaoRecursos` ASC),
  INDEX `NIF_Produtor_idx` (`NIF_Produtor` ASC),
  CONSTRAINT `Sensor_ID_GestaoRecursos`
    FOREIGN KEY (`Sensor_ID_GestaoRecursos`)
    REFERENCES `Sensores_IoT` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `NIF_Produtor`
    FOREIGN KEY (`NIF_Produtor`)
    REFERENCES `Produtor` (`NIF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tratamentos_has_Produtor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Tratamentos_has_Produtor` (
  `Tratamentos_Nome` VARCHAR(45) NOT NULL,
  `Produtor_NIF` INT NOT NULL,
  PRIMARY KEY (`Tratamentos_Nome`, `Produtor_NIF`),
  INDEX `fk_Tratamentos_has_Produtor_Produtor1_idx` (`Produtor_NIF` ASC),
  INDEX `fk_Tratamentos_has_Produtor_Tratamentos1_idx` (`Tratamentos_Nome` ASC),
  CONSTRAINT `fk_Tratamentos_has_Produtor_Tratamentos1`
    FOREIGN KEY (`Tratamentos_Nome`)
    REFERENCES `Tratamentos` (`Nome`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tratamentos_has_Produtor_Produtor1`
    FOREIGN KEY (`Produtor_NIF`)
    REFERENCES `Produtor` (`NIF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Produtor_has_Distribuidores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Produtor_has_Distribuidores` (
  `Produtor_NIF` INT NOT NULL,
  `Distribuidores_ID` INT NOT NULL,
  PRIMARY KEY (`Produtor_NIF`, `Distribuidores_ID`),
  INDEX `fk_Produtor_has_Distribuidores_Distribuidores1_idx` (`Distribuidores_ID` ASC),
  INDEX `fk_Produtor_has_Distribuidores_Produtor1_idx` (`Produtor_NIF` ASC),
  CONSTRAINT `fk_Produtor_has_Distribuidores_Produtor1`
    FOREIGN KEY (`Produtor_NIF`)
    REFERENCES `Produtor` (`NIF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Produtor_has_Distribuidores_Distribuidores1`
    FOREIGN KEY (`Distribuidores_ID`)
    REFERENCES `Distribuidores` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cultivo_has_Tratamentos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cultivo_has_Tratamentos` (
  `ID` INT NOT NULL,
  `Cultivo_ID_has_Tratamento` INT NULL,
  `Tratamentos_Nome` VARCHAR(45) NULL,
  INDEX `fk_Cultivo_has_Tratamentos_Tratamentos1_idx` (`Tratamentos_Nome` ASC),
  INDEX `fk_Cultivo_has_Tratamentos_Cultivo1_idx` (`Cultivo_ID_has_Tratamento` ASC),
  PRIMARY KEY (`ID`),
  CONSTRAINT `fk_Cultivo_has_Tratamentos_Cultivo1`
    FOREIGN KEY (`Cultivo_ID_has_Tratamento`)
    REFERENCES `Cultivo` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cultivo_has_Tratamentos_Tratamentos1`
    FOREIGN KEY (`Tratamentos_Nome`)
    REFERENCES `Tratamentos` (`Nome`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tratamentos_has_GestaoRecursos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Tratamentos_has_GestaoRecursos` (
  `ID` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `GestaoRecursos_ID` INT NULL,
  PRIMARY KEY (`ID`),
  INDEX `GestaoRecursos_ID_idx` (`GestaoRecursos_ID` ASC),
  INDEX `Name_idx` (`Name` ASC),
  CONSTRAINT `GestaoRecursos_ID`
    FOREIGN KEY (`GestaoRecursos_ID`)
    REFERENCES `Gestao_Recursos` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Name`
    FOREIGN KEY (`Name`)
    REFERENCES `Tratamentos` (`Nome`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Distribuidores_has_RegistosProducao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Distribuidores_has_RegistosProducao` (
  `ID` INT NOT NULL,
  `Distribuidor_ID` INT NULL,
  `Lote_ID` INT NULL,
  PRIMARY KEY (`ID`),
  INDEX `Distribuidor_ID_idx` (`Distribuidor_ID` ASC),
  INDEX `Lote_ID_idx` (`Lote_ID` ASC),
  CONSTRAINT `Distribuidor_ID`
    FOREIGN KEY (`Distribuidor_ID`)
    REFERENCES `Distribuidores` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Lote_ID`
    FOREIGN KEY (`Lote_ID`)
    REFERENCES `RegistosProducao` (`LoteID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
