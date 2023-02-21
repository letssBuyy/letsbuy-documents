CREATE DATABASE IF NOT EXISTS letsBuy;

USE letsBuy;

CREATE TABLE user(
idUser INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(45),
email VARCHAR(45) UNIQUE,
password VARCHAR(45),
cpf CHAR(11) UNIQUE,
rg CHAR(9) UNIQUE,
birthDate DATE,
phoneNumber VARCHAR(45),
address VARCHAR(45),
addressNumber INT,
cep VARCHAR(45),
isAdvertising TINYINT
);

CREATE TABLE ad(
idAd INT PRIMARY KEY AUTO_INCREMENT,
title VARCHAR(45),
description VARCHAR(500),
price DECIMAL(12,2),
image BLOB,
postDate DATETIME,
lastUpdateDate DATETIME,
saleDate DATETIME,
category VARCHAR(45),
quality VARCHAR(45),
isHighlighted TINYINT,
isSold TINYINT,
fkUser INT,
FOREIGN KEY (fkUser)
REFERENCES user (idUser)
);

CREATE TABLE purchaseSaleOperation(
idOperation INT PRIMARY KEY AUTO_INCREMENT,
fkAd INT,
fkUser INT,
operationDateTime DATETIME,
paymentFormat VARCHAR(45),
FOREIGN KEY (fkAd)
REFERENCES ad (idAd),
FOREIGN KEY (fkUser)
REFERENCES user (idUser)
);

CREATE TABLE chat(
idChat INT PRIMARY KEY AUTO_INCREMENT,
fkAd INT,
fkUser INT,
FOREIGN KEY (fkAd)
REFERENCES ad (idAd),
FOREIGN KEY (fkUser)
REFERENCES user (idUser)
);

CREATE TABLE message(
idMessage INT PRIMARY KEY AUTO_INCREMENT,
messageContent VARCHAR(500),
fkChat INT,
isFromAdvertiser TINYINT,
messageDateTime DATETIME,
FOREIGN KEY (fkChat)
REFERENCES chat (idChat)
);

CREATE TABLE proposal(
idProposal INT PRIMARY KEY AUTO_INCREMENT,
fkChat INT,
proposalValue DECIMAL(12,2),
proposalAccepted TINYINT,
FOREIGN KEY (fkChat)
REFERENCES chat (idChat)
);

CREATE TABLE userList(
idUserList INT PRIMARY KEY AUTO_INCREMENT,
qtfProducts INT,
lastUpdate DATETIME,
fkUser INT NOT NULL,
FOREIGN KEY (fkUser)
REFERENCES user (idUser)
);

CREATE TABLE userProductList(
idUserProductList INT PRIMARY KEY AUTO_INCREMENT,
fkAd INT,
fkUserList INT,
FOREIGN KEY (fkAd)
REFERENCES ad (idAd),
FOREIGN KEY (fkUserList)
REFERENCES userList (idUserList)
);
