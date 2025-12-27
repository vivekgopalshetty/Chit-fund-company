-- Users table
CREATE TABLE user_master (
  id INT PRIMARY KEY AUTO_INCREMENT,
  username VARCHAR(50) UNIQUE,
  password VARCHAR(255),
  user_level INT,
  status INT
);

-- Agents table
CREATE TABLE agent_master (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100),
  contact VARCHAR(20),
  status INT
);

-- Subscribers table
CREATE TABLE subscriber_master (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100),
  group_id INT,
  status INT
);

-- Groups table (escaped with backticks)
CREATE TABLE `group_master` (
  id INT PRIMARY KEY AUTO_INCREMENT,
  group_name VARCHAR(100),
  status INT
);

-- Auctions table
CREATE TABLE auction_master (
  id INT PRIMARY KEY AUTO_INCREMENT,
  group_id INT,
  auction_amount DECIMAL(10,2),
  status INT
);

-- Cheques table
CREATE TABLE cheque_master (
  id INT PRIMARY KEY AUTO_INCREMENT,
  subscriber_id INT,
  cheque_amount DECIMAL(10,2),
  status INT
);

-- Transactions table
CREATE TABLE transaction_master (
  id INT PRIMARY KEY AUTO_INCREMENT,
  subscriber_id INT,
  amount DECIMAL(10,2),
  transaction_date DATE,
  status INT
);

-- Collectors table
CREATE TABLE collector_master (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100),
  contact VARCHAR(20),
  status INT
);

-- Staff table
CREATE TABLE staff_master (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100),
  position VARCHAR(50),
  status INT
);

INSERT INTO user_master (username, password, userlevel, status) 
VALUES ('admin', MD5('admin123'), 9, 1);

INSERT INTO user_master (username, password, userlevel, status) 
VALUES ('user', MD5('user123'), 1, 1);
