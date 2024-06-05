-- MySQL Workbench Synchronization
-- Generated: 2024-06-03 19:25
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: augus

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE TABLE IF NOT EXISTS `spotify`.`albums` (
  `album_id` INT(11) NOT NULL AUTO_INCREMENT,
  `artist_id` INT(11) NOT NULL,
  `title` VARCHAR(255) NOT NULL,
  `release_year` INT(11) NOT NULL,
  `cover_image` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`album_id`),
  INDEX `artist_id` (`artist_id` ASC),
  CONSTRAINT `albums_ibfk_1`
    FOREIGN KEY (`artist_id`)
    REFERENCES `spotify`.`artists` (`artist_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `spotify`.`artists` (
  `artist_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `artist_image` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`artist_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `spotify`.`payments` (
  `payment_id` INT(11) NOT NULL AUTO_INCREMENT,
  `subscription_id` INT(11) NOT NULL,
  `payment_date` DATE NOT NULL,
  `order_number` VARCHAR(255) NOT NULL,
  `amount` DECIMAL(10,2) NOT NULL,
  `payment_method` VARCHAR(10) NOT NULL,
  `card_number` VARCHAR(16) NULL DEFAULT NULL,
  `expiry_month` INT(11) NULL DEFAULT NULL,
  `expiry_year` INT(11) NULL DEFAULT NULL,
  `security_code` VARCHAR(4) NULL DEFAULT NULL,
  `paypal_username` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  UNIQUE INDEX `order_number` (`order_number` ASC),
  INDEX `subscription_id` (`subscription_id` ASC),
  CONSTRAINT `payments_ibfk_1`
    FOREIGN KEY (`subscription_id`)
    REFERENCES `spotify`.`subscriptions` (`subscription_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `spotify`.`playlist_songs` (
  `playlist_id` INT(11) NOT NULL,
  `song_id` INT(11) NOT NULL,
  `added_by_user_id` INT(11) NOT NULL,
  `added_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
  PRIMARY KEY (`playlist_id`, `song_id`),
  INDEX `song_id` (`song_id` ASC),
  INDEX `added_by_user_id` (`added_by_user_id` ASC),
  CONSTRAINT `playlist_songs_ibfk_1`
    FOREIGN KEY (`playlist_id`)
    REFERENCES `spotify`.`playlists` (`playlist_id`),
  CONSTRAINT `playlist_songs_ibfk_2`
    FOREIGN KEY (`song_id`)
    REFERENCES `spotify`.`songs` (`song_id`),
  CONSTRAINT `playlist_songs_ibfk_3`
    FOREIGN KEY (`added_by_user_id`)
    REFERENCES `spotify`.`users` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `spotify`.`playlists` (
  `playlist_id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_id` INT(11) NOT NULL,
  `title` VARCHAR(255) NOT NULL,
  `song_count` INT(11) NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  `status` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`playlist_id`),
  INDEX `user_id` (`user_id` ASC),
  CONSTRAINT `playlists_ibfk_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `spotify`.`users` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `spotify`.`similar_artists` (
  `artist_id` INT(11) NOT NULL,
  `similar_artist_id` INT(11) NOT NULL,
  PRIMARY KEY (`artist_id`, `similar_artist_id`),
  INDEX `similar_artist_id` (`similar_artist_id` ASC),
  CONSTRAINT `similar_artists_ibfk_1`
    FOREIGN KEY (`artist_id`)
    REFERENCES `spotify`.`artists` (`artist_id`),
  CONSTRAINT `similar_artists_ibfk_2`
    FOREIGN KEY (`similar_artist_id`)
    REFERENCES `spotify`.`artists` (`artist_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `spotify`.`songs` (
  `song_id` INT(11) NOT NULL AUTO_INCREMENT,
  `album_id` INT(11) NOT NULL,
  `title` VARCHAR(255) NOT NULL,
  `duration` INT(11) NOT NULL,
  `play_count` INT(11) NOT NULL,
  PRIMARY KEY (`song_id`),
  INDEX `album_id` (`album_id` ASC),
  CONSTRAINT `songs_ibfk_1`
    FOREIGN KEY (`album_id`)
    REFERENCES `spotify`.`albums` (`album_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `spotify`.`subscriptions` (
  `subscription_id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_id` INT(11) NOT NULL,
  `start_date` DATE NOT NULL,
  `renewal_date` DATE NOT NULL,
  `payment_method` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`subscription_id`),
  INDEX `user_id` (`user_id` ASC),
  CONSTRAINT `subscriptions_ibfk_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `spotify`.`users` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `spotify`.`user_favorite_albums` (
  `user_id` INT(11) NOT NULL,
  `album_id` INT(11) NOT NULL,
  PRIMARY KEY (`user_id`, `album_id`),
  INDEX `album_id` (`album_id` ASC),
  CONSTRAINT `user_favorite_albums_ibfk_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `spotify`.`users` (`user_id`),
  CONSTRAINT `user_favorite_albums_ibfk_2`
    FOREIGN KEY (`album_id`)
    REFERENCES `spotify`.`albums` (`album_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `spotify`.`user_favorite_songs` (
  `user_id` INT(11) NOT NULL,
  `song_id` INT(11) NOT NULL,
  PRIMARY KEY (`user_id`, `song_id`),
  INDEX `song_id` (`song_id` ASC),
  CONSTRAINT `user_favorite_songs_ibfk_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `spotify`.`users` (`user_id`),
  CONSTRAINT `user_favorite_songs_ibfk_2`
    FOREIGN KEY (`song_id`)
    REFERENCES `spotify`.`songs` (`song_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `spotify`.`user_follows_artist` (
  `user_id` INT(11) NOT NULL,
  `artist_id` INT(11) NOT NULL,
  PRIMARY KEY (`user_id`, `artist_id`),
  INDEX `artist_id` (`artist_id` ASC),
  CONSTRAINT `user_follows_artist_ibfk_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `spotify`.`users` (`user_id`),
  CONSTRAINT `user_follows_artist_ibfk_2`
    FOREIGN KEY (`artist_id`)
    REFERENCES `spotify`.`artists` (`artist_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `spotify`.`users` (
  `user_id` INT(11) NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `username` VARCHAR(255) NOT NULL,
  `dob` DATE NOT NULL,
  `gender` VARCHAR(10) NOT NULL,
  `country` VARCHAR(255) NOT NULL,
  `postal_code` VARCHAR(20) NOT NULL,
  `user_type` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `email` (`email` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
