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


CREATE USER 'util1'@'%' IDENTIFIED BY 'motdepasse';
GRANT ALL PRIVILEGES ON mabase.* TO "util1"@"%" IDENTIFIED BY 'mot_de_passe';
FLUSH PRIVILEGES;

CREATE USER 'util2'@'%' IDENTIFIED BY 'motdepasse2';
GRANT SELECT ON mabase.*  TO util2 IDENTIFIED BY "motdepasse2";

CREATE USER 'util3'@'%' IDENTIFIED BY 'motdepasse3';
GRANT SELECT ON mabase.*  TO "util3" IDENTIFIED BY "motdepasse2";


/*Créez trois utilisateurs util1, util2, util3 pour la base hotel
util1 doit pouvoir effectuer toutes les actions
util2 ne peut que sélectionner les informations dans la base
util3 n'a aucun droit sur la base de données, sauf d'afficher la table fournis
Une fois les utilisateurs créés, testez en vous connectant et en envoyant les requêtes adaptées.
GRANT SELECT, INSERT, UPDATE 
ON hotel.station
TO dave_loper
IDENTIFIED BY '1Ksable';
*/