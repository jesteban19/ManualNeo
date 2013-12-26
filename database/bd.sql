SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `manual` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `manual` ;

-- -----------------------------------------------------
-- Table `manual`.`roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `manual`.`roles` (
  `idroles` INT NOT NULL,
  `name` VARCHAR(100) NULL,
  PRIMARY KEY (`idroles`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `manual`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `manual`.`users` (
  `idusers` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NULL,
  `password` VARCHAR(300) NULL,
  `created` TIMESTAMP NULL,
  `last_activity` TIMESTAMP NULL,
  `state` BIT NULL,
  `idroles` INT NOT NULL,
  PRIMARY KEY (`idusers`),
  INDEX `fk_users_roles1_idx` (`idroles` ASC),
  CONSTRAINT `fk_users_roles1`
    FOREIGN KEY (`idroles`)
    REFERENCES `manual`.`roles` (`idroles`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `manual`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `manual`.`category` (
  `idcategory` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`idcategory`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `manual`.`post`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `manual`.`post` (
  `idpost` INT NOT NULL,
  `titulo` VARCHAR(300) NULL,
  `sub_title` VARCHAR(300) NULL,
  `content` TEXT NULL,
  `plug` VARCHAR(500) NULL,
  `created` TIMESTAMP NULL,
  `like` INT NULL,
  `dislike` INT NULL,
  `views` INT NULL,
  `state` INT NULL,
  `last_editing` TIMESTAMP NULL,
  `tags` TEXT NULL,
  `idusers` INT NOT NULL,
  `doc` TEXT NULL,
  `idcategory` INT NOT NULL,  
  PRIMARY KEY (`idpost`, `idcategory`),
  INDEX `fk_post_users_idx` (`idusers` ASC),
  INDEX `fk_post_category1_idx` (`idcategory` ASC),
  CONSTRAINT `fk_post_users`
    FOREIGN KEY (`idusers`)
    REFERENCES `manual`.`users` (`idusers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_post_category1`
    FOREIGN KEY (`idcategory`)
    REFERENCES `manual`.`category` (`idcategory`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `manual`.`comments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `manual`.`comments` (
  `idcomments` INT NOT NULL,
  `autor` VARCHAR(45) NULL,
  `content` TEXT NULL,
  `created` TIMESTAMP NULL,
  `state` INT NULL,
  `idpost` INT NOT NULL,
  PRIMARY KEY (`idcomments`),
  INDEX `fk_comments_post1_idx` (`idpost` ASC),
  CONSTRAINT `fk_comments_post1`
    FOREIGN KEY (`idpost`)
    REFERENCES `manual`.`post` (`idpost`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
