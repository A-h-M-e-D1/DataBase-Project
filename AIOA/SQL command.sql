-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema AIOA
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `AIOA` ;

-- -----------------------------------------------------
-- Schema AIOA
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `AIOA` DEFAULT CHARACTER SET utf8 ;
USE `AIOA` ;

-- -----------------------------------------------------
-- Table `AIOA`.`passenger`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AIOA`.`passenger` ;

CREATE TABLE IF NOT EXISTS `AIOA`.`passenger` (
  `F_name` VARCHAR(45) NOT NULL,
  `M_name` VARCHAR(45) NOT NULL,
  `L_name` VARCHAR(45) NOT NULL,
  `sex` CHAR(6) NULL,
  `address` VARCHAR(45) NULL,
  `phone` INT(11) NULL,
  `passenger_id` INT(11) NOT NULL,
  PRIMARY KEY (`passenger_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AIOA`.`train`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AIOA`.`train` ;

CREATE TABLE IF NOT EXISTS `AIOA`.`train` (
  `station_end` VARCHAR(45) NOT NULL,
  `class` VARCHAR(45) NULL,
  `dep_time` TIME NOT NULL,
  `arr_time` TIME NOT NULL,
  `station_start` VARCHAR(45) NOT NULL,
  `seat_no_avaiable` INT(4) NULL,
  `train_no` INT(4) NOT NULL,
  PRIMARY KEY (`train_no`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AIOA`.`ticket`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AIOA`.`ticket` ;

CREATE TABLE IF NOT EXISTS `AIOA`.`ticket` (
  `ticket_no` INT(4) NOT NULL,
  `price` FLOAT(6) NULL,
  `no_of_ticket` INT(4) NULL,
  `date` DATE NULL,
  `passenger_passenger_id` INT(11) NOT NULL,
  `total_price` FLOAT(9) NULL,
  `pay_method` VARCHAR(45) NULL,
  `train_train_no` INT(4) NOT NULL,
  PRIMARY KEY (`ticket_no`),
  CONSTRAINT `fk_ticket_passenger1`
    FOREIGN KEY (`passenger_passenger_id`)
    REFERENCES `AIOA`.`passenger` (`passenger_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ticket_train1`
    FOREIGN KEY (`train_train_no`)
    REFERENCES `AIOA`.`train` (`train_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AIOA`.`employee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AIOA`.`employee` ;

CREATE TABLE IF NOT EXISTS `AIOA`.`employee` (
  `ssn` INT(11) NOT NULL,
  `salary` FLOAT(7) NULL,
  `F_name` VARCHAR(45) NOT NULL,
  `M_name` VARCHAR(45) NOT NULL,
  `L_name` VARCHAR(45) NOT NULL,
  `phone` INT(11) NULL,
  `sex` CHAR(6) NULL,
  `address` VARCHAR(45) NULL,
  PRIMARY KEY (`ssn`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AIOA`.`station`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AIOA`.`station` ;

CREATE TABLE IF NOT EXISTS `AIOA`.`station` (
  `address` VARCHAR(45) NULL,
  `station_code` INT(9) NOT NULL,
  `station_name` VARCHAR(45) NULL,
  `mg_ssn` INT(11) NOT NULL,
  PRIMARY KEY (`station_code`),
  CONSTRAINT `fk_station_employee1`
    FOREIGN KEY (`mg_ssn`)
    REFERENCES `AIOA`.`employee` (`ssn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AIOA`.`book`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AIOA`.`book` ;

CREATE TABLE IF NOT EXISTS `AIOA`.`book` (
  `passenger_passenger_id` INT(11) NOT NULL,
  `ticket_ticket_no` INT(4) NOT NULL,
  PRIMARY KEY (`ticket_ticket_no`, `passenger_passenger_id`),
  CONSTRAINT `fk_passenger_has_ticket_passenger`
    FOREIGN KEY (`passenger_passenger_id`)
    REFERENCES `AIOA`.`passenger` (`passenger_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_passenger_has_ticket_ticket1`
    FOREIGN KEY (`ticket_ticket_no`)
    REFERENCES `AIOA`.`ticket` (`ticket_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AIOA`.`go`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AIOA`.`go` ;

CREATE TABLE IF NOT EXISTS `AIOA`.`go` (
  `station_station_code` INT(9) NOT NULL,
  `train_train_no` INT(4) NOT NULL,
  PRIMARY KEY (`train_train_no`),
  CONSTRAINT `fk_station_has_train_station1`
    FOREIGN KEY (`station_station_code`)
    REFERENCES `AIOA`.`station` (`station_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_station_has_train_train1`
    FOREIGN KEY (`train_train_no`)
    REFERENCES `AIOA`.`train` (`train_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Data for table `AIOA`.`passenger`
-- -----------------------------------------------------
START TRANSACTION;
USE `AIOA`;
INSERT INTO `AIOA`.`passenger` (`F_name`, `M_name`, `L_name`, `sex`, `address`, `phone`, `passenger_id`) VALUES ('ali', 'mohamed', 'Adel', 'male', '12street,ramsis', NULL, 1);
INSERT INTO `AIOA`.`passenger` (`F_name`, `M_name`, `L_name`, `sex`, `address`, `phone`, `passenger_id`) VALUES ('ahmed', 'Ashraf', 'moahmed', 'male', '12street, El marg,cairo', 01288428242, 20);
INSERT INTO `AIOA`.`passenger` (`F_name`, `M_name`, `L_name`, `sex`, `address`, `phone`, `passenger_id`) VALUES ('Ibrahim', 'Ahmed', 'Mohamed', 'male', '13street,Kom Ombo,Aswan', 01558842824, 3);
INSERT INTO `AIOA`.`passenger` (`F_name`, `M_name`, `L_name`, `sex`, `address`, `phone`, `passenger_id`) VALUES ('Lames', 'Mohamed', 'ahmed', 'female', '16street,New Asyut,Assuit', 0108842862, 9);
INSERT INTO `AIOA`.`passenger` (`F_name`, `M_name`, `L_name`, `sex`, `address`, `phone`, `passenger_id`) VALUES ('sarah', 'omar', 'Abdullah', 'female', '15 El Raml,Alexendra', 01188428254, 15);
INSERT INTO `AIOA`.`passenger` (`F_name`, `M_name`, `L_name`, `sex`, `address`, `phone`, `passenger_id`) VALUES ('omar', 'mohamed', 'osama', 'male', 'Zagazig,Sharqia', 0120014699, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `AIOA`.`train`
-- -----------------------------------------------------
START TRANSACTION;
USE `AIOA`;
INSERT INTO `AIOA`.`train` (`station_end`, `class`, `dep_time`, `arr_time`, `station_start`, `seat_no_avaiable`, `train_no`) VALUES ('Assiutsation', 'air conditioner', '15:20:00', '16:20:00', 'Masrstation', 150, 871);
INSERT INTO `AIOA`.`train` (`station_end`, `class`, `dep_time`, `arr_time`, `station_start`, `seat_no_avaiable`, `train_no`) VALUES ('Assiutsation', 'normal', '14:30:00', '15:20:00', 'Masrstation', 300, 2007);
INSERT INTO `AIOA`.`train` (`station_end`, `class`, `dep_time`, `arr_time`, `station_start`, `seat_no_avaiable`, `train_no`) VALUES ('Sidi GaberSation', 'normal', '20:10:00', '16:35:00', 'Zagazig', 150, 570);
INSERT INTO `AIOA`.`train` (`station_end`, `class`, `dep_time`, `arr_time`, `station_start`, `seat_no_avaiable`, `train_no`) VALUES ('AswanStation', 'air conditioner', '19:14:00', '22:10:00', 'Sidi GaberSation', 150, 2008);
INSERT INTO `AIOA`.`train` (`station_end`, `class`, `dep_time`, `arr_time`, `station_start`, `seat_no_avaiable`, `train_no`) VALUES ('AswanStation', 'normal', '17:14:00', '22:10:00', 'Sidi GaberSation', 300, 88);
INSERT INTO `AIOA`.`train` (`station_end`, `class`, `dep_time`, `arr_time`, `station_start`, `seat_no_avaiable`, `train_no`) VALUES ('Masrstation', 'conditioner', '17:42:00', '15:55:00', 'Zagazig', 150, 572);
INSERT INTO `AIOA`.`train` (`station_end`, `class`, `dep_time`, `arr_time`, `station_start`, `seat_no_avaiable`, `train_no`) VALUES ('Masrstation', 'normal', '15:20:00', '14:30:00', 'Assuit', 300, 2006);
INSERT INTO `AIOA`.`train` (`station_end`, `class`, `dep_time`, `arr_time`, `station_start`, `seat_no_avaiable`, `train_no`) VALUES ('Masrstation', 'air conditioner', '15:20:00', '14:30:00', 'Assuit', 150, 77);
INSERT INTO `AIOA`.`train` (`station_end`, `class`, `dep_time`, `arr_time`, `station_start`, `seat_no_avaiable`, `train_no`) VALUES ('Zagazig', 'normal', '22:10:00', '19:14:00', 'Aswan', 300, 99);
INSERT INTO `AIOA`.`train` (`station_end`, `class`, `dep_time`, `arr_time`, `station_start`, `seat_no_avaiable`, `train_no`) VALUES ('Assiutsation', 'air conditioner', '16:20:00', '15:20:00', 'Aswan', 150, 1056);

COMMIT;


-- -----------------------------------------------------
-- Data for table `AIOA`.`ticket`
-- -----------------------------------------------------
START TRANSACTION;
USE `AIOA`;
INSERT INTO `AIOA`.`ticket` (`ticket_no`, `price`, `no_of_ticket`, `date`, `passenger_passenger_id`, `total_price`, `pay_method`, `train_train_no`) VALUES (256, 150, 2, '2023-04-6', 1, 300, 'visa', 871);
INSERT INTO `AIOA`.`ticket` (`ticket_no`, `price`, `no_of_ticket`, `date`, `passenger_passenger_id`, `total_price`, `pay_method`, `train_train_no`) VALUES (102, 350, 1, '2023-4-16', 20, 350, 'fawry', 2007);
INSERT INTO `AIOA`.`ticket` (`ticket_no`, `price`, `no_of_ticket`, `date`, `passenger_passenger_id`, `total_price`, `pay_method`, `train_train_no`) VALUES (202, 150, 3, '2023-5-16', 1, 450, 'fawry', 871);
INSERT INTO `AIOA`.`ticket` (`ticket_no`, `price`, `no_of_ticket`, `date`, `passenger_passenger_id`, `total_price`, `pay_method`, `train_train_no`) VALUES (306, 75, 1, '2023-7-5', 2, 75, 'visa', 570);
INSERT INTO `AIOA`.`ticket` (`ticket_no`, `price`, `no_of_ticket`, `date`, `passenger_passenger_id`, `total_price`, `pay_method`, `train_train_no`) VALUES (122, 250, 1, '2023-3-20', 3, 250, 'visa', 99);
INSERT INTO `AIOA`.`ticket` (`ticket_no`, `price`, `no_of_ticket`, `date`, `passenger_passenger_id`, `total_price`, `pay_method`, `train_train_no`) VALUES (222, 130, 4, '2023-2-27', 9, 520, 'fawry', 2006);
INSERT INTO `AIOA`.`ticket` (`ticket_no`, `price`, `no_of_ticket`, `date`, `passenger_passenger_id`, `total_price`, `pay_method`, `train_train_no`) VALUES (1002, 350, 2, '2023-9-6', 15, 700, 'visa', 88);
INSERT INTO `AIOA`.`ticket` (`ticket_no`, `price`, `no_of_ticket`, `date`, `passenger_passenger_id`, `total_price`, `pay_method`, `train_train_no`) VALUES (201, 75, 6, '2023-9-4', 2, 450, 'fawry', 572);

COMMIT;


-- -----------------------------------------------------
-- Data for table `AIOA`.`employee`
-- -----------------------------------------------------
START TRANSACTION;
USE `AIOA`;
INSERT INTO `AIOA`.`employee` (`ssn`, `salary`, `F_name`, `M_name`, `L_name`, `phone`, `sex`, `address`) VALUES (256786, 10000, 'Hussein ', 'Shehata', 'Mohamed', 015577841, 'male', 'Al tharar,Cairo');
INSERT INTO `AIOA`.`employee` (`ssn`, `salary`, `F_name`, `M_name`, `L_name`, `phone`, `sex`, `address`) VALUES (769102, 20000, 'Ahmed', 'Muhanna', 'Ali', 012864214, 'male', 'Abou Quer,Alexandria');
INSERT INTO `AIOA`.`employee` (`ssn`, `salary`, `F_name`, `M_name`, `L_name`, `phone`, `sex`, `address`) VALUES (156201, 5000, 'ibrahim', 'Ali', 'moustafa', 011678815, 'male', 'Banha, Qalyubiyya');
INSERT INTO `AIOA`.`employee` (`ssn`, `salary`, `F_name`, `M_name`, `L_name`, `phone`, `sex`, `address`) VALUES (967207, 6000, 'omar', 'adel', 'zaid', 010554891, 'male', 'Nile Cornich,Asman');
INSERT INTO `AIOA`.`employee` (`ssn`, `salary`, `F_name`, `M_name`, `L_name`, `phone`, `sex`, `address`) VALUES (658741, 15000, 'Abdulrahman', 'nour', 'gamail', 012889476, 'male', 'El-Helaly,Assuit');

COMMIT;


-- -----------------------------------------------------
-- Data for table `AIOA`.`station`
-- -----------------------------------------------------
START TRANSACTION;
USE `AIOA`;
INSERT INTO `AIOA`.`station` (`address`, `station_code`, `station_name`, `mg_ssn`) VALUES (' Ramsis Square,Cairo', 4321102, 'Masr', 256786);
INSERT INTO `AIOA`.`station` (`address`, `station_code`, `station_name`, `mg_ssn`) VALUES ('Abou Quer,Alexandria', 5433011, 'Sidi Gaber', 769102);
INSERT INTO `AIOA`.`station` (`address`, `station_code`, `station_name`, `mg_ssn`) VALUES ('Orabi Square,Al-Sharqia ', 7123738, 'Zagazig', 156201);
INSERT INTO `AIOA`.`station` (`address`, `station_code`, `station_name`, `mg_ssn`) VALUES ('Nile Cornich,Aswan', 81511, 'Aswan', 967207);
INSERT INTO `AIOA`.`station` (`address`, `station_code`, `station_name`, `mg_ssn`) VALUES ('El-Helaly, Al Hamraa Ath Thaneyah, Assiut', 2073066, 'Assiut', 658741);

COMMIT;


-- -----------------------------------------------------
-- Data for table `AIOA`.`book`
-- -----------------------------------------------------
START TRANSACTION;
USE `AIOA`;
INSERT INTO `AIOA`.`book` (`passenger_passenger_id`, `ticket_ticket_no`) VALUES (1, 256);
INSERT INTO `AIOA`.`book` (`passenger_passenger_id`, `ticket_ticket_no`) VALUES (20, 102);
INSERT INTO `AIOA`.`book` (`passenger_passenger_id`, `ticket_ticket_no`) VALUES (1, 202);
INSERT INTO `AIOA`.`book` (`passenger_passenger_id`, `ticket_ticket_no`) VALUES (2, 306);
INSERT INTO `AIOA`.`book` (`passenger_passenger_id`, `ticket_ticket_no`) VALUES (3, 122);
INSERT INTO `AIOA`.`book` (`passenger_passenger_id`, `ticket_ticket_no`) VALUES (9, 222);
INSERT INTO `AIOA`.`book` (`passenger_passenger_id`, `ticket_ticket_no`) VALUES (15, 1002);
INSERT INTO `AIOA`.`book` (`passenger_passenger_id`, `ticket_ticket_no`) VALUES (2, 201);

COMMIT;


-- -----------------------------------------------------
-- Data for table `AIOA`.`go`
-- -----------------------------------------------------
START TRANSACTION;
USE `AIOA`;
INSERT INTO `AIOA`.`go` (`station_station_code`, `train_train_no`) VALUES (4321102, 871);
INSERT INTO `AIOA`.`go` (`station_station_code`, `train_train_no`) VALUES (4321102, 2007);
INSERT INTO `AIOA`.`go` (`station_station_code`, `train_train_no`) VALUES (7123738, 570);
INSERT INTO `AIOA`.`go` (`station_station_code`, `train_train_no`) VALUES (7123738, 572);
INSERT INTO `AIOA`.`go` (`station_station_code`, `train_train_no`) VALUES (5433011, 2008);
INSERT INTO `AIOA`.`go` (`station_station_code`, `train_train_no`) VALUES (5433011, 88);
INSERT INTO `AIOA`.`go` (`station_station_code`, `train_train_no`) VALUES (81511, 99);
INSERT INTO `AIOA`.`go` (`station_station_code`, `train_train_no`) VALUES (81511, 1056);
INSERT INTO `AIOA`.`go` (`station_station_code`, `train_train_no`) VALUES (2073066, 2006);
INSERT INTO `AIOA`.`go` (`station_station_code`, `train_train_no`) VALUES (2073066, 77);

COMMIT;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
