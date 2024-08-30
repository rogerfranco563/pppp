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
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`personas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`personas` (
  `idpersonas` INT NOT NULL AUTO_INCREMENT,
  `nombres` VARCHAR(100) NOT NULL,
  `apellidos` VARCHAR(100) NOT NULL,
  `cedula` INT NOT NULL,
  `cargo` VARCHAR(100) NOT NULL,
  `horario` VARCHAR(20) NOT NULL,
  `sueldo` INT NOT NULL,
  `fecha de ingreso` VARCHAR(45) NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  `telefono` INT NOT NULL,
  `tipo_empleado` INT NOT NULL,
  PRIMARY KEY (`idpersonas`),
  UNIQUE INDEX `cedula_UNIQUE` (`cedula` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`pago`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`pago` (
  `idpedido` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATE NULL,
  `monto` DECIMAL NULL,
  `metodo_pago` VARCHAR(100) NULL,
  PRIMARY KEY (`idpedido`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`asistencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`asistencia` (
  `idasistencia` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATE NULL,
  `hora_entrada` TIME NULL,
  `hora_salida` TIME NULL,
  `horas_trabajadas` TIME NULL,
  `personas_idpersonas` INT NOT NULL,
  PRIMARY KEY (`idasistencia`),
  INDEX `fk_asistencia_personas1_idx` (`personas_idpersonas` ASC) ,
  CONSTRAINT `fk_asistencia_personas1`
    FOREIGN KEY (`personas_idpersonas`)
    REFERENCES `mydb`.`personas` (`idpersonas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tipo_bonificacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tipo_bonificacion` (
  `idtipo_bonificacion` INT NOT NULL,
  `nombre_boni` VARCHAR(45) NULL,
  `monto_boni` DECIMAL NULL,
  `descripcion_boni` VARCHAR(45) NULL,
  PRIMARY KEY (`idtipo_bonificacion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`bonificación`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`bonificación` (
  `idbonificación` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(200) NULL,
  `monto` DECIMAL NOT NULL,
  `pago_idpago` INT NOT NULL,
  `tipo_bonificacion_idtipo_bonificacion` INT NOT NULL,
  PRIMARY KEY (`idbonificación`),
  INDEX `fk_bonificación_pago1_idx` (`pago_idpago` ASC) ,
  INDEX `fk_bonificación_tipo_bonificacion1_idx` (`tipo_bonificacion_idtipo_bonificacion` ASC) ,
  CONSTRAINT `fk_bonificación_pago1`
    FOREIGN KEY (`pago_idpago`)
    REFERENCES `mydb`.`pago` (`idpago`)
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_bonificación_tipo_bonificacion1`
    FOREIGN KEY (`tipo_bonificacion_idtipo_bonificacion`)
    REFERENCES `mydb`.`tipo_bonificacion` (`idtipo_bonificacion`)

    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`deducción`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`deducción` (
  `iddeducción` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(200) NULL,
  `monto` DECIMAL NOT NULL,
  `pago_idpago` INT NOT NULL,
  PRIMARY KEY (`iddeducción`),
  INDEX `fk_deducción_pago1_idx` (`pago_idpago` ASC) ,
  CONSTRAINT `fk_deducción_pago1`
    FOREIGN KEY (`pago_idpago`)
    REFERENCES `mydb`.`pago` (`idpago`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`proveedor` (
  `idproveedor` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `direccion` VARCHAR(100) NOT NULL,
  `telefono` INT NOT NULL,
  `correo` VARCHAR(70) NOT NULL,
  PRIMARY KEY (`idproveedor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`producto` (
  `idProducto` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NULL,
  `descripcion` VARCHAR(100) NULL,
  `precio` DECIMAL NULL,
  PRIMARY KEY (`idProducto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`pago`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`pago` (
  `idpedido` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATE NULL,
  `monto` DECIMAL NULL,
  `metodo_pago` VARCHAR(100) NULL,
  PRIMARY KEY (`idpedido`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`pedido` (
  `idpedido` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATE NULL,
  `total` DECIMAL NULL,
  `proveedor_idproveedor` INT NOT NULL,
  `pago_idpedido` INT NOT NULL,
  `pago_idpago` INT NOT NULL,
  `monto` INT NOT NULL,
  PRIMARY KEY (`idpedido`),
  INDEX `fk_pedido_proveedor1_idx` (`proveedor_idproveedor` ASC) ,
  INDEX `fk_pedido_pago1_idx` (`pago_idpedido` ASC) ,
  INDEX `fk_pedido_pago2_idx` (`pago_idpago` ASC) ,
  CONSTRAINT `fk_pedido_proveedor1`
    FOREIGN KEY (`proveedor_idproveedor`)
    REFERENCES `mydb`.`proveedor` (`idproveedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedido_pago1`
    FOREIGN KEY (`pago_idpedido`)
    REFERENCES `mydb`.`pago` (`idpedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedido_pago2`
    FOREIGN KEY (`pago_idpago`)
    REFERENCES `mydb`.`pago` (`idpago`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`servicio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`servicio` (
  `idservicio` INT NOT NULL AUTO_INCREMENT,
  `nombre_servicio` VARCHAR(45) NULL,
  `descripcion` VARCHAR(120) NULL,
  `costo` DECIMAL NULL,
  PRIMARY KEY (`idservicio`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`producto_por_proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`producto_por_proveedor` (
  `id_producto_por_proveedorcol` INT NOT NULL AUTO_INCREMENT,
  `producto_idProducto` INT NOT NULL,
  `proveedor_idproveedor` INT NOT NULL,
  PRIMARY KEY (`id_producto_por_proveedorcol`),
  INDEX `fk_producto_has_proveedor_proveedor1_idx` (`proveedor_idproveedor` ASC) ,
  INDEX `fk_producto_has_proveedor_producto1_idx` (`producto_idProducto` ASC) ,
  CONSTRAINT `fk_producto_has_proveedor_producto1`
    FOREIGN KEY (`producto_idProducto`)
    REFERENCES `mydb`.`producto` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_producto_has_proveedor_proveedor1`
    FOREIGN KEY (`proveedor_idproveedor`)
    REFERENCES `mydb`.`proveedor` (`idproveedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`empleados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`empleados` (
  `id_empleados` INT NOT NULL,
  `tipo_empleado` INT NOT NULL,
  `personas_idpersonas` INT NOT NULL,
  PRIMARY KEY (`id_empleados`),
  INDEX `fk_empleados_personas1_idx` (`personas_idpersonas` ASC) ,
  CONSTRAINT `fk_empleados_personas1`
    FOREIGN KEY (`personas_idpersonas`)
    REFERENCES `mydb`.`personas` (`idpersonas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`servicio_por_pago`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`servicio_por_pago` (
  `idservicio_por_pagocol` INT NOT NULL AUTO_INCREMENT,
  `servicio_idservicio` INT NOT NULL,
  `pago_idpago` INT NOT NULL,
  `fecha_servicio` DATE NOT NULL,
  `cantidad_servicios` INT NOT NULL,
  `abono` INT NOT NULL,
  `restante_por_pagar` INT NOT NULL,
  PRIMARY KEY (`idservicio_por_pagocol`),
  INDEX `fk_servicio_has_pago_pago1_idx` (`pago_idpago` ASC) ,
  INDEX `fk_servicio_has_pago_servicio1_idx` (`servicio_idservicio` ASC) ,
  CONSTRAINT `fk_servicio_has_pago_servicio1`
    FOREIGN KEY (`servicio_idservicio`)
    REFERENCES `mydb`.`servicio` (`idservicio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_servicio_has_pago_pago1`
    FOREIGN KEY (`pago_idpago`)
    REFERENCES `mydb`.`pago` (`idpago`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`pedido_has_producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`pedido_has_producto` (
  `idpedido_has_productocol` INT NOT NULL AUTO_INCREMENT,
  `pedido_idpedido` INT NOT NULL,
  `pedido_pago_idpago` INT NOT NULL,
  `producto_idProducto` INT NOT NULL,
  `cantidad_producto` INT NOT NULL,
  PRIMARY KEY (`idpedido_has_productocol`),
  INDEX `fk_pedido_has_producto_producto1_idx` (`producto_idProducto` ASC) ,
  INDEX `fk_pedido_has_producto_pedido1_idx` (`pedido_idpedido` ASC, `pedido_pago_idpago` ASC) ,
  CONSTRAINT `fk_pedido_has_producto_pedido1`
    FOREIGN KEY (`pedido_idpedido` , `pedido_pago_idpago`)
    REFERENCES `mydb`.`pedido` (`idpedido` , `pago_idpago`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedido_has_producto_producto1`
    FOREIGN KEY (`producto_idProducto`)
    REFERENCES `mydb`.`producto` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
