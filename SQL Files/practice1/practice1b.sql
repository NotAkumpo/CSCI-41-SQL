CREATE DATABASE pubs212380;

USE pubs212380;

CREATE TABLE publisher(
    pub_id INT NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    city VARCHAR(255) DEFAULT 'Quezon City',
    state VARCHAR(255) DEFAULT 'NCR',
    country VARCHAR(255) DEFAULT 'Philippines',
    pr_info TEXT
);


CREATE TABLE book(
    title_id INT NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author_name VARCHAR(255) NOT NULL,
    author_address VARCHAR(255),
    author_contract VARCHAR(255),
    price FLOAT(2) NOT NULL,
    advance FLOAT(2),
    royalty FLOAT(2),
    notes TEXT,
    pubdate DATE NOT NULL,
    pub_id INT NOT NULL,
    FOREIGN KEY(pub_id) REFERENCES publisher(pub_id) ON DELETE RESTRICT
);

CREATE TABLE author(
    author_id INT NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255),
    contract VARCHAR(255)
);