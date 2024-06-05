-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema YouTube
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema YouTube
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `YouTube` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema test_youtube
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema test_youtube
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `test_youtube` DEFAULT CHARACTER SET utf8mb4 ;
USE `YouTube` ;

-- -----------------------------------------------------
-- Table `YouTube`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `YouTube`.`user` (
  `user_id` INT(11) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `pasword` VARCHAR(255) NOT NULL,
  `username` VARCHAR(255) NOT NULL,
  `birthdate` DATE NOT NULL,
  `sex` ENUM('male', 'female', 'other') NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  `postal_code` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC))
ENGINE = InnoDB;

USE `test_youtube` ;

-- -----------------------------------------------------
-- Table `test_youtube`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `test_youtube`.`users` (
  `user_id` INT(11) NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `username` VARCHAR(255) NOT NULL,
  `birthdate` DATE NOT NULL,
  `sex` ENUM('male', 'female', 'other') NOT NULL,
  `country` VARCHAR(255) NOT NULL,
  `postal_code` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `email` (`email` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `test_youtube`.`channels`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `test_youtube`.`channels` (
  `channel_id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_id` INT(11) NULL DEFAULT NULL,
  `name` VARCHAR(255) NOT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `creation_date` DATE NOT NULL,
  PRIMARY KEY (`channel_id`),
  INDEX `user_id` (`user_id` ASC),
  CONSTRAINT `channels_ibfk_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `test_youtube`.`users` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `test_youtube`.`videos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `test_youtube`.`videos` (
  `video_id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_id` INT(11) NULL DEFAULT NULL,
  `title` VARCHAR(255) NOT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `size` INT(11) NOT NULL,
  `video_file` VARCHAR(255) NOT NULL,
  `length` TIME NOT NULL,
  `thumbnail` VARCHAR(255) NULL DEFAULT NULL,
  `reproductions` INT(11) NULL DEFAULT 0,
  `likes` INT(11) NULL DEFAULT 0,
  `dislikes` INT(11) NULL DEFAULT 0,
  `state` ENUM('public', 'hidden', 'private') NOT NULL,
  `publish_date` DATETIME NOT NULL,
  PRIMARY KEY (`video_id`),
  INDEX `user_id` (`user_id` ASC),
  CONSTRAINT `videos_ibfk_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `test_youtube`.`users` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `test_youtube`.`comments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `test_youtube`.`comments` (
  `comment_id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_id` INT(11) NULL DEFAULT NULL,
  `video_id` INT(11) NULL DEFAULT NULL,
  `text` TEXT NOT NULL,
  `comment_date` DATETIME NOT NULL,
  PRIMARY KEY (`comment_id`),
  INDEX `user_id` (`user_id` ASC),
  INDEX `video_id` (`video_id` ASC),
  CONSTRAINT `comments_ibfk_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `test_youtube`.`users` (`user_id`),
  CONSTRAINT `comments_ibfk_2`
    FOREIGN KEY (`video_id`)
    REFERENCES `test_youtube`.`videos` (`video_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `test_youtube`.`commentdislikes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `test_youtube`.`commentdislikes` (
  `user_id` INT(11) NOT NULL,
  `comment_id` INT(11) NOT NULL,
  `dislike_date` DATETIME NOT NULL,
  PRIMARY KEY (`user_id`, `comment_id`),
  INDEX `comment_id` (`comment_id` ASC),
  CONSTRAINT `commentdislikes_ibfk_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `test_youtube`.`users` (`user_id`),
  CONSTRAINT `commentdislikes_ibfk_2`
    FOREIGN KEY (`comment_id`)
    REFERENCES `test_youtube`.`comments` (`comment_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `test_youtube`.`commentlikes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `test_youtube`.`commentlikes` (
  `user_id` INT(11) NOT NULL,
  `comment_id` INT(11) NOT NULL,
  `like_date` DATETIME NOT NULL,
  PRIMARY KEY (`user_id`, `comment_id`),
  INDEX `comment_id` (`comment_id` ASC),
  CONSTRAINT `commentlikes_ibfk_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `test_youtube`.`users` (`user_id`),
  CONSTRAINT `commentlikes_ibfk_2`
    FOREIGN KEY (`comment_id`)
    REFERENCES `test_youtube`.`comments` (`comment_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `test_youtube`.`playlists`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `test_youtube`.`playlists` (
  `playlist_id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_id` INT(11) NULL DEFAULT NULL,
  `name` VARCHAR(255) NOT NULL,
  `creation_date` DATE NOT NULL,
  `status` ENUM('public', 'private') NOT NULL,
  PRIMARY KEY (`playlist_id`),
  INDEX `user_id` (`user_id` ASC),
  CONSTRAINT `playlists_ibfk_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `test_youtube`.`users` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `test_youtube`.`playlistvideos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `test_youtube`.`playlistvideos` (
  `playlist_id` INT(11) NOT NULL,
  `video_id` INT(11) NOT NULL,
  PRIMARY KEY (`playlist_id`, `video_id`),
  INDEX `video_id` (`video_id` ASC),
  CONSTRAINT `playlistvideos_ibfk_1`
    FOREIGN KEY (`playlist_id`)
    REFERENCES `test_youtube`.`playlists` (`playlist_id`),
  CONSTRAINT `playlistvideos_ibfk_2`
    FOREIGN KEY (`video_id`)
    REFERENCES `test_youtube`.`videos` (`video_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `test_youtube`.`subscriptions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `test_youtube`.`subscriptions` (
  `subscriber_id` INT(11) NOT NULL,
  `channel_id` INT(11) NOT NULL,
  PRIMARY KEY (`subscriber_id`, `channel_id`),
  INDEX `channel_id` (`channel_id` ASC),
  CONSTRAINT `subscriptions_ibfk_1`
    FOREIGN KEY (`subscriber_id`)
    REFERENCES `test_youtube`.`users` (`user_id`),
  CONSTRAINT `subscriptions_ibfk_2`
    FOREIGN KEY (`channel_id`)
    REFERENCES `test_youtube`.`channels` (`channel_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `test_youtube`.`tags`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `test_youtube`.`tags` (
  `tag_id` INT(11) NOT NULL AUTO_INCREMENT,
  `tag_name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`tag_id`),
  UNIQUE INDEX `tag_name` (`tag_name` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `test_youtube`.`videodislikes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `test_youtube`.`videodislikes` (
  `user_id` INT(11) NOT NULL,
  `video_id` INT(11) NOT NULL,
  `dislike_date` DATETIME NOT NULL,
  PRIMARY KEY (`user_id`, `video_id`),
  INDEX `video_id` (`video_id` ASC),
  CONSTRAINT `videodislikes_ibfk_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `test_youtube`.`users` (`user_id`),
  CONSTRAINT `videodislikes_ibfk_2`
    FOREIGN KEY (`video_id`)
    REFERENCES `test_youtube`.`videos` (`video_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `test_youtube`.`videolikes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `test_youtube`.`videolikes` (
  `user_id` INT(11) NOT NULL,
  `video_id` INT(11) NOT NULL,
  `like_date` DATETIME NOT NULL,
  PRIMARY KEY (`user_id`, `video_id`),
  INDEX `video_id` (`video_id` ASC),
  CONSTRAINT `videolikes_ibfk_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `test_youtube`.`users` (`user_id`),
  CONSTRAINT `videolikes_ibfk_2`
    FOREIGN KEY (`video_id`)
    REFERENCES `test_youtube`.`videos` (`video_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `test_youtube`.`videotags`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `test_youtube`.`videotags` (
  `video_id` INT(11) NOT NULL,
  `tag_id` INT(11) NOT NULL,
  PRIMARY KEY (`video_id`, `tag_id`),
  INDEX `tag_id` (`tag_id` ASC),
  CONSTRAINT `videotags_ibfk_1`
    FOREIGN KEY (`video_id`)
    REFERENCES `test_youtube`.`videos` (`video_id`),
  CONSTRAINT `videotags_ibfk_2`
    FOREIGN KEY (`tag_id`)
    REFERENCES `test_youtube`.`tags` (`tag_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
