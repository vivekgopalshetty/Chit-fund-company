-- Chit Fund Company Database Schema

-- User Master Table
CREATE TABLE `user_master` (
  `user_id` VARCHAR(50) PRIMARY KEY,
  `user_password` VARCHAR(255) NOT NULL,
  `user_level` INT NOT NULL,
  `status` INT DEFAULT 1
);

-- Staff Master Table
CREATE TABLE `staff_master` (
  `user_id` VARCHAR(50) PRIMARY KEY,
  `staff_name` VARCHAR(100),
  `date_of_birth` DATE,
  `sex` VARCHAR(10),
  `dept` VARCHAR(50),
  `staff_active` INT DEFAULT 1,
  FOREIGN KEY (`user_id`) REFERENCES `user_master`(`user_id`)
);

-- Group Master Table
CREATE TABLE `group_master` (
  `grp_id` INT PRIMARY KEY AUTO_INCREMENT,
  `grp_name` VARCHAR(100),
  `prize_value` DECIMAL(10,2),
  `no_of_members` INT,
  `monthly_contribution` DECIMAL(10,2),
  `service_charges` DECIMAL(10,2),
  `grp_active` INT DEFAULT 1
);

-- Subscriber Master Table
CREATE TABLE `subscriber_master` (
  `sub_id` INT PRIMARY KEY AUTO_INCREMENT,
  `sub_name` VARCHAR(100),
  `agent_id` INT,
  `phone_no` VARCHAR(20),
  `address` TEXT,
  `date_of_birth` DATE,
  `sex` VARCHAR(10),
  `sub_active` INT DEFAULT 1
);

-- Subscriber Group Table
CREATE TABLE `subscriber_group` (
  `sub_id` INT,
  `grp_id` INT,
  PRIMARY KEY (`sub_id`, `grp_id`),
  FOREIGN KEY (`sub_id`) REFERENCES `subscriber_master`(`sub_id`),
  FOREIGN KEY (`grp_id`) REFERENCES `group_master`(`grp_id`)
);

-- Agent Master Table
CREATE TABLE `agent_master` (
  `agent_id` INT PRIMARY KEY AUTO_INCREMENT,
  `agent_name` VARCHAR(100),
  `phone_no` VARCHAR(20),
  `address` TEXT,
  `date_of_birth` DATE,
  `sex` VARCHAR(10),
  `agent_active` INT DEFAULT 1
);

-- Collector Master Table
CREATE TABLE `collector_master` (
  `coll_id` INT PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(100),
  `address` TEXT,
  `sex` VARCHAR(10),
  `date_of_birth` DATE,
  `coll_active` INT DEFAULT 1
);

-- Collector Group Table
CREATE TABLE `collector_group` (
  `coll_id` INT,
  `grp_id` INT,
  PRIMARY KEY (`coll_id`, `grp_id`),
  FOREIGN KEY (`coll_id`) REFERENCES `collector_master`(`coll_id`),
  FOREIGN KEY (`grp_id`) REFERENCES `group_master`(`grp_id`)
);

-- Account Master Table
CREATE TABLE `account_master` (
  `acc_id` INT PRIMARY KEY AUTO_INCREMENT,
  `acc_name` VARCHAR(100),
  `acc_type` VARCHAR(50),
  `balance` DECIMAL(10,2),
  `acc_active` INT DEFAULT 1
);

-- Account Ledger Table
CREATE TABLE `account_ledger` (
  `ledger_id` INT PRIMARY KEY AUTO_INCREMENT,
  `acc_id` INT,
  `trans_date` DATE,
  `trans_type` VARCHAR(50),
  `amount` DECIMAL(10,2),
  FOREIGN KEY (`acc_id`) REFERENCES `account_master`(`acc_id`)
);

-- Cheque Master Table
CREATE TABLE `cheque_master` (
  `chq_id` INT PRIMARY KEY AUTO_INCREMENT,
  `chq_no` VARCHAR(20),
  `sub_id` INT,
  `trans_date` DATE,
  `lodged_date` DATE,
  `amount` DECIMAL(10,2),
  `payment_status` INT,
  FOREIGN KEY (`sub_id`) REFERENCES `subscriber_master`(`sub_id`)
);

-- Receipt Payments Table
CREATE TABLE `receipt_payments` (
  `trans_id` INT PRIMARY KEY AUTO_INCREMENT,
  `sub_id` INT,
  `coll_id` INT,
  `agent_id` INT,
  `chq_no` VARCHAR(20),
  `trans_date` DATE,
  `amount` DECIMAL(10,2),
  `rec_cash_cheque` VARCHAR(10),
  `grp_id` INT,
  FOREIGN KEY (`sub_id`) REFERENCES `subscriber_master`(`sub_id`),
  FOREIGN KEY (`coll_id`) REFERENCES `collector_master`(`coll_id`),
  FOREIGN KEY (`agent_id`) REFERENCES `agent_master`(`agent_id`),
  FOREIGN KEY (`grp_id`) REFERENCES `group_master`(`grp_id`)
);

-- Subscriber Ledger Table
CREATE TABLE `subscriber_ledger` (
  `ledger_id` INT PRIMARY KEY AUTO_INCREMENT,
  `trans_id` INT,
  `sub_id` INT,
  `trans_date` DATE,
  `amount` DECIMAL(10,2),
  FOREIGN KEY (`trans_id`) REFERENCES `receipt_payments`(`trans_id`),
  FOREIGN KEY (`sub_id`) REFERENCES `subscriber_master`(`sub_id`)
);

-- Auction Master Table
CREATE TABLE `auction_master` (
  `auc_id` INT PRIMARY KEY AUTO_INCREMENT,
  `grp_id` INT,
  `auc_date` DATE,
  `winner_sub_id` INT,
  `prize_amount` DECIMAL(10,2),
  `auc_active` INT DEFAULT 1,
  FOREIGN KEY (`grp_id`) REFERENCES `group_master`(`grp_id`),
  FOREIGN KEY (`winner_sub_id`) REFERENCES `subscriber_master`(`sub_id`)
);

-- Insert default admin user
INSERT INTO `user_master` (`user_id`, `user_password`, `user_level`, `status`) 
VALUES ('admin', MD5('admin123'), 9, 1);

-- Insert default user
INSERT INTO `user_master` (`user_id`, `user_password`, `user_level`, `status`) 
VALUES ('user', MD5('user123'), 1, 1);
