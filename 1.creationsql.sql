DROP DATABASE IF EXISTS mabase;

CREATE database  mabase;

USE mabase;

/* crétion de la tablea client avec cli_num en primary key*/

CREATE table client (
                    cli_adresse varchar(50),
                    cli_nom varchar(50),
                    cli_prenom varchar(50),
                    cli_num  INT UNIQUE AUTO_INCREMENT NOT NULL,
                    PRIMARY KEY (cli_num)
                    );

CREATE INDEX indexcli ON client(cli_num);

CREATE table reservation (
                    res_numchambre  varchar(50) NOT NULL,
                    res_numclient  INT UNIQUE AUTO_INCREMENT NOT NULL,
                    res_datedebut  varchar(50),
                    res_datefin  varchar(50),
                    res_datederes  varchar(50) NOT NULL,
                    res_arrhes  FLOAT, 
                    res_total FLOAT, 
                    PRIMARY KEY (res_numchambre, res_datederes),
                    CONSTRAINT reserv FOREIGN KEY (res_numclient) REFERENCES client(cli_num)
                    );

CREATE table chambre (
                    ch_capacite INT NOT NULL,
                    ch_degre FLOAT, 
                    ch_expo varchar(50),
                    ch_type varchar(50),
                    ch_numch INT NOT NULL,
                    ch_numhotel INT UNIQUE NOT NULL,
                    PRIMARY KEY (ch_numch)
                    );

CREATE table stat (
                    stat_nom varchar(50),
                    stat_num INT UNIQUE AUTO_INCREMENT NOT NULL,
                    PRIMARY KEY (stat_num)
                    );

CREATE table hotel (
                    hotel_capacite INT NOT NULL,
                    hotel_categorie INT UNIQUE NOT NULL,
                    hotel_nom varchar(50),
                    hotel_adresse varchar(50),
                    hotel_num INT UNIQUE NOT NULL,
                    hotel_numstation INT UNIQUE NOT NULL,
                    PRIMARY KEY (hotel_num),
                    CONSTRAINT etrangerhotel FOREIGN KEY (hotel_numstation) REFERENCES stat(stat_num)
                    );

