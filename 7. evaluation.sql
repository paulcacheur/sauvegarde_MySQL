DROP DATABASE IF EXISTS dbevaluation;

CREATE DATABASE dbevaluation;

USE dbevaluation;


CREATE TABLE client
                (
                cli_num int, 
                cli_nom varchar(50) DEFAULT NULL,
                cli_adresse varchar(50),
                cli_tel VARCHAR(30),
                PRIMARY KEY (cli_num)
                );


CREATE TABLE commande
                (
                com_num int, 
                cli_num int,
                com_date datetime,
                com_obs VARCHAR(50),
                PRIMARY KEY (com_num),
                CONSTRAINT FK3 FOREIGN KEY (cli_num) REFERENCES client (cli_num)
                );

CREATE TABLE produit
                (
                pro_num int,
                pro_libelle VARCHAR(50),
                pro_description VARCHAR(50),
                PRIMARY KEY (pro_num)
                );

CREATE TABLE est_compose
                (
                com_num int, 
                pro_num int,
                est_qte datetime,
                CONSTRAINT FK2 FOREIGN KEY (com_num) REFERENCES commande (com_num),
                CONSTRAINT FK1 FOREIGN KEY (pro_num) REFERENCES produit (pro_num)
                );



CREATE UNIQUE INDEX id_cli_nom ON client (cli_nom); 
