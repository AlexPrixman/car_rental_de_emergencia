-- Creating database
CREATE DATABASE car_rental_exoneracion;
-- Using the database
use car_rental_exoneracion;
-- Creating customer TABLE 
CREATE TABLE customer (
    ID_CLIENTE INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    CEDULA INT (11) UNSIGNED UNIQUE,  
    DESCRIPCION VARCHAR (40) NOT NULL,
    ESTADO CHAR NOT NULL
    FECHA_IN DATETIME NOT NULL CURRENT_TIMESTAMP   
    );
-- Testing that tables are there
SHOW TABLES;    