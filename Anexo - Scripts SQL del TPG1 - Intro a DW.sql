
# Primero se crean los schemas de base de datos, si todavía no están creados:

CREATE SCHEMA staging;
CREATE SCHEMA dw;
CREATE SCHEMA admin;
CREATE SCHEMA dim;
CREATE SCHEMA dqm;



#---------------------------------------------------------------------

#/////////////////////////////////////////////////////////////////////////////////

# TABLAS DE ADMINISTRACION

/* Las siguientes son tablas de administracion para monitoreo de procesos */

# Tablas que registran y sirven para crear las distintas ejecuciones de procesos:

DROP TABLE IF EXISTS admin.ejecuciones;

CREATE TABLE admin.ejecuciones (
  `Ejec_id` INT NOT NULL AUTO_INCREMENT,
  `Procedimiento_Nombre` varchar(100) DEFAULT NULL,
  `Descripcion_Ejec` varchar(100) DEFAULT NULL,
  `Param1_Val` varchar(50) DEFAULT NULL,
  `Param2_Val` varchar(50) DEFAULT NULL,
  `Param3_Val` varchar(50) DEFAULT NULL,
  `Fech_Ejec` datetime NOT NULL,
  PRIMARY KEY (`Ejec_id`)
); 


# Tabla donde se pueden ir guardando los subpasos de procesos:


DROP TABLE IF EXISTS admin.ejecuciones_pasos;

CREATE TABLE admin.ejecuciones_pasos (
  `Ejec_id` INT NOT NULL AUTO_INCREMENT,
  `Nro_Mark` SMALLINT NOT NULL,
  `Descripcion_Mark` varchar(100) DEFAULT NULL,
  `Activity_Count` INT DEFAULT NULL,
  `Fech_Ejec_Mark` datetime NOT NULL,
  PRIMARY KEY (`Ejec_id`,`Nro_Mark`)
); 

# Tabla donde se van registrando las cargas de tablas y sus load_id (también sirve para generar los load_id):

DROP TABLE IF EXISTS admin.cargas;

CREATE TABLE admin.cargas (
  `Load_id` INT NOT NULL AUTO_INCREMENT,
  `Tabla_Carga` VARCHAR(255) DEFAULT NULL,
  `Descripcion_Carga` VARCHAR(255) DEFAULT NULL,
  `Fecha_Carga` DATETIME DEFAULT NULL,
  PRIMARY KEY (`Load_id`)
); 

##################################################################################


# CITY_EQUIVALENCES

DROP TABLE IF EXISTS admin.city_equivalences;
 
  CREATE TABLE admin.city_equivalences (
  city_ing VARCHAR(100),
  city_equi VARCHAR(100),
  PRIMARY KEY (city_ing)
) 
CHARACTER SET utf8mb4
COLLATE utf8mb4_bin;
  
#-------
  
  
INSERT INTO admin.city_equivalences (city_ing, city_equi) VALUES
-- Originales sin duplicados
('Århus', 'Århus'),
('Warszawa', 'Warszawa'),
('Walla Walla', 'Walla Walla'),
('Versailles', 'Versailles'),
('Vancouver', 'Vancouver'),
('Tsawassen', 'Tsawassen'),
('Toulouse', 'Toulouse'),
('Torino', 'Torino'),
('Stuttgart', 'Stuttgart'),
('Strasbourg', 'Strasbourg'),
('Stavern', 'Stavern'),
('Sevilla', 'Sevilla'),
('Seattle', 'Seattle'),
('Tacoma', 'Tacoma'),
('Redmond', 'Redmond'),
('São Paulo', 'São Paulo'),
('Sao Paulo', 'São Paulo'),
('San Francisco', 'San Francisco'),
('San Cristóbal', 'San Cristóbal'),
('Salzburg', 'Salzburg'),
('Río de Janeiro', 'Río de Janeiro'),
('Rio de Janeiro', 'Río de Janeiro'),
('12Rio de Janeiro', 'Río de Janeiro'),
('Resende', 'Resende'),
('Reims', 'Reims'),
('Reggio Emilia', 'Reggio Emilia'),
('Portland', 'Portland'),
('París', 'París'),
('Paris', 'París'),
('Oulu', 'Oulu'),
('Nantes', 'Nantes'),
('Münster', 'Münster'),
('Múnich', 'Múnich'),
('München', 'Múnich'),
('Ciudad de México', 'Ciudad de México'),
('México D.F.', 'Ciudad de México'),
('Montreal', 'Montreal'),
('Montréal', 'Montreal'),
('Monterrey', 'Monterrey'),
('Marsella', 'Marsella'),
('Marseille', 'Marsella'),
('Mannheim', 'Mannheim'),
('Madrid', 'Madrid'),
('Lyon', 'Lyon'),
('Luleå', 'Luleå'),
('Londres', 'Londres'),
('London', 'Londres'),
('Lisboa', 'Lisboa'),
('Lille', 'Lille'),
('Leipzig', 'Leipzig'),
('Lander', 'Lander'),
('Colonia', 'Colonia'),
('Köln', 'Colonia'),
('Copenhague', 'Copenhague'),
('Kobenhavn', 'Copenhague'),
('Kirkland', 'Kirkland'),
('Isla de Margarita', 'Isla de Margarita'),
('I. de Margarita', 'Isla de Margarita'),
('Helsinki', 'Helsinki'),
('Graz', 'Graz'),
('Ginebra', 'Ginebra'),
('Genève', 'Ginebra'),
('Frankfurt', 'Frankfurt'),
('Frankfurt a.M.', 'Frankfurt'),
('Eugene', 'Eugene'),
('Elgin', 'Elgin'),
('Cunewalde', 'Cunewalde'),
('Cowes', 'Cowes'),
('Cork', 'Cork'),
('Charleroi', 'Charleroi'),
('Caracas', 'Caracas'),
('Campinas', 'Campinas'),
('Butte', 'Butte'),
('Buenos Aires', 'Buenos Aires'),
('Bs. As.', 'Buenos Aires'),
('Bs As', 'Buenos Aires'),
('Ciudad de Buenos Aires', 'Buenos Aires'),
('Bräcke', 'Bräcke'),
('Bruselas', 'Bruselas'),
('Bruxelles', 'Bruselas'),
('Brandenburg', 'Brandenburg'),
('Boise', 'Boise'),
('Berna', 'Berna'),
('Bern', 'Berna'),
('Berlín', 'Berlín'),
('Berlin', 'Berlín'),
('Bérgamo', 'Bérgamo'),
('Bergamo', 'Bérgamo'),
('Barquisimeto', 'Barquisimeto'),
('Barcelona', 'Barcelona'),
('Anchorage', 'Anchorage'),
('Albuquerque', 'Albuquerque'),
('Aachen', 'Aachen'),
('Colchester','Colchester'),

-- NUEVAS CIUDADES INTERNACIONALES (y variantes útiles)
('Montevideo', 'Montevideo'),
('Ciudad de Montevideo', 'Montevideo'),
('Córdoba', 'Córdoba'),
('Ciudad de Córdoba', 'Córdoba'),
('Rosario', 'Rosario'),
('Mendoza', 'Mendoza'),
('Santa Fe', 'Santa Fe'),
('La Plata', 'La Plata'),
('Valparaíso', 'Valparaíso'),
('Viña del Mar', 'Viña del Mar'),
('Santiago', 'Santiago'),
('Santiago de Chile', 'Santiago'),
('Asunción', 'Asunción'),
('Bogotá', 'Bogotá'),
('Bogota', 'Bogotá'),
('Medellín', 'Medellín'),
('Medellin', 'Medellín'),
('Cartagena', 'Cartagena'),
('Quito', 'Quito'),
('Guayaquil', 'Guayaquil'),
('Lima', 'Lima'),
('Arequipa', 'Arequipa'),
('La Paz', 'La Paz'),
('Santa Cruz', 'Santa Cruz'),
('Maracaibo', 'Maracaibo'),
('San Juan', 'San Juan'),
('San José', 'San José'),
('San Jose', 'San José'),
('Panamá', 'Panamá'),
('Panama City', 'Panamá'),
('Ciudad de Panamá', 'Panamá'),
('Nueva York', 'Nueva York'),
('New York', 'Nueva York'),
('Los Ángeles', 'Los Ángeles'),
('Los Angeles', 'Los Ángeles'),
('Miami', 'Miami'),
('Chicago', 'Chicago'),
('Houston', 'Houston'),
('San Diego', 'San Diego'),
('San Antonio', 'San Antonio'),
('Dallas', 'Dallas'),
('Filadelfia', 'Filadelfia'),
('Philadelphia', 'Filadelfia'),
('Washington D.C.', 'Washington D.C.'),
('Washington', 'Washington D.C.'),
('Boston', 'Boston'),
('Atlanta', 'Atlanta'),
('Orlando', 'Orlando'),
('Toronto', 'Toronto'),
('Ottawa', 'Ottawa'),
('Calgary', 'Calgary'),
('Edmonton', 'Edmonton'),
('Roma', 'Roma'),
('Rome', 'Roma'),
('Milán', 'Milán'),
('Milan', 'Milán'),
('Florencia', 'Florencia'),
('Firenze', 'Florencia'),
('Venecia', 'Venecia'),
('Venezia', 'Venecia'),
('Nápoles', 'Nápoles'),
('Napoli', 'Nápoles'),
('Atenas', 'Atenas'),
('Athens', 'Atenas'),
('Estocolmo', 'Estocolmo'),
('Stockholm', 'Estocolmo'),
('Oslo', 'Oslo'),
('Ámsterdam', 'Ámsterdam'),
('Amsterdam', 'Ámsterdam'),
('Praga', 'Praga'),
('Varsovia', 'Varsovia'),
('Moscú', 'Moscú'),
('Moscow', 'Moscú'),
('Pekín', 'Pekín'),
('Beijing', 'Pekín'),
('Shanghái', 'Shanghái'),
('Shanghai', 'Shanghái'),
('Hong Kong', 'Hong Kong'),
('Tokio', 'Tokio'),
('Tokyo', 'Tokio'),
('Osaka', 'Osaka'),
('Seúl', 'Seúl'),
('Seoul', 'Seúl'),
('Bangkok', 'Bangkok'),
('Singapur', 'Singapur'),
('Sydney', 'Sydney'),
('Melbourne', 'Melbourne'),
('Brisbane', 'Brisbane'),
('Auckland', 'Auckland'),
('Wellington', 'Wellington');

############################################################################################################

# WORLD_DATA

DROP TABLE IF EXISTS staging.ing_world_data;

CREATE TABLE staging.ing_world_data (
  Country TEXT,
  Density TEXT,
  Abbreviation TEXT,
  Agricultural_Land_Porc TEXT,
  Land_Area_Km2 TEXT,
  Armed_Forces_size TEXT,
  Birth_Rate TEXT,
  Calling_Code TEXT,
  Capital_Major_City TEXT,
  Co2_Emissions TEXT,
  CPI TEXT,
  CPI_Change_Porc TEXT,
  Currency_Code TEXT,
  Fertility_Rate TEXT,
  Forested_Area_Porc TEXT,
  Gasoline_Price TEXT,
  GDP TEXT,
  Gross_primary_educ_enroll_Porc TEXT,
  Gross_tertiary_educ__enroll_Porc TEXT,
  Infant_mortality TEXT,
  Largest_city TEXT,
  Life_expectancy TEXT,
  Maternal_mortality_ratio TEXT,
  Minimum_wage TEXT,
  Official_language TEXT,
  Out_of_pock_health_exp TEXT,
  Physicians_per_thousand TEXT,
  Population TEXT,
  Population_Labor_force_partic_porc TEXT,
  Tax_revenue_porc TEXT,
  Total_tax_rate TEXT,
  Unemployment_rate TEXT,
  Urban_population TEXT,
  Latitude TEXT,
  Longitude TEXT,
  fecha_carga datetime DEFAULT CURRENT_TIMESTAMP,
  load_id int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



#-----
LOAD DATA INFILE 'C:/Intro_DW/world-data-2023.csv'
INTO TABLE staging.ing_world_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 2 LINES
(
  Country, Density, Abbreviation, Agricultural_Land_Porc, Land_Area_Km2, Armed_Forces_size,
  Birth_Rate, Calling_Code, Capital_Major_City, Co2_Emissions, CPI, CPI_Change_Porc, Currency_Code,
  Fertility_Rate, Forested_Area_Porc, Gasoline_Price, GDP, Gross_primary_educ_enroll_Porc,
  Gross_tertiary_educ__enroll_Porc, Infant_mortality, Largest_city, Life_expectancy,
  Maternal_mortality_ratio, Minimum_wage, Official_language, Out_of_pock_health_exp,
  Physicians_per_thousand, Population, Population_Labor_force_partic_porc, Tax_revenue_porc,
  Total_tax_rate, Unemployment_rate, Urban_population, Latitude, Longitude
);

#-----------------

DROP PROCEDURE IF EXISTS staging.load_id_ing_world_data;


DELIMITER $$
CREATE PROCEDURE staging.load_id_ing_world_data()
BEGIN
    -- Manejador para rollback si ocurre un error
    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN
        ROLLBACK;
        SELECT 'Ocurrió un error. Transacción cancelada.' AS mensaje;
    END;

    START TRANSACTION;

    SET SQL_SAFE_UPDATES = 0;

    -- Insertar un registro de carga en admin.cargas
    INSERT INTO admin.cargas (`Tabla_Carga`, `Descripcion_Carga`, `Fecha_Carga`)
    VALUES ('ing_world_data', 'Carga el load_id en la tabla de ingesta de world_data', NOW());

    -- Capturar el último ID insertado
    SET @ULT_id := LAST_INSERT_ID();

    -- Actualizar el campo load_id solo si es NULL
    UPDATE staging.ing_world_data
    SET load_id = @ULT_id
    WHERE load_id IS NULL;

    SET SQL_SAFE_UPDATES = 1;

    COMMIT;
    SELECT 'Transacción exitosa' AS mensaje;
END $$

DELIMITER ;

#---

CALL staging.load_id_ing_world_data;

#---------------------------

DROP TABLE IF EXISTS staging.world_data;

CREATE TABLE staging.world_data (
  Country VARCHAR(100),
  load_id INT DEFAULT NULL,
  ejec_id INT DEFAULT NULL,
  PRIMARY KEY (Country)  
);

DROP TABLE IF EXISTS staging.error_world_data;

CREATE TABLE staging.error_world_data (
  Country text,
  load_id INT DEFAULT NULL,
  ejec_id INT DEFAULT NULL,
  fecha_carga DATETIME,
  error_message TEXT,
  error_ts DATETIME DEFAULT CURRENT_TIMESTAMP
) ;

#---
DROP PROCEDURE IF EXISTS staging.load_world_data;

DELIMITER $$
CREATE PROCEDURE staging.load_world_data()
BEGIN
  DECLARE v_ejec_id INT;

  DECLARE EXIT HANDLER FOR SQLEXCEPTION 
  BEGIN
    ROLLBACK;
    SELECT 'Ocurrió un error. Transacción cancelada.' AS mensaje;
  END;

  START TRANSACTION;

  -- Registrar la ejecución
  INSERT INTO admin.ejecuciones (Procedimiento_Nombre, Descripcion_Ejec, Fech_Ejec)
  VALUES ('load_world_data', 'Carga staging.world_data desde staging.ing_world_data', NOW());
  SET v_ejec_id = LAST_INSERT_ID();

  -- Insertar países válidos que no estén ya
  INSERT INTO staging.world_data (Country, load_id, ejec_id)
  SELECT DISTINCT TRIM(Country), load_id, v_ejec_id
  FROM staging.ing_world_data
  WHERE 
    TRIM(Country) NOT IN (SELECT Country FROM staging.world_data)
    AND TRIM(Country) REGEXP '^[A-Za-zÀ-ÿÑñ \'\-]+$';

  -- Insertar países inválidos
  INSERT INTO staging.error_world_data (Country, load_id, ejec_id, fecha_carga, error_message)
  SELECT DISTINCT TRIM(Country), load_id, v_ejec_id, NOW(), 'Nombre de país con caracteres inválidos'
  FROM staging.ing_world_data
  WHERE 
    NOT TRIM(Country) REGEXP '^[A-Za-zÀ-ÿÑñ \'\-]+$';

  COMMIT;
  SELECT 'Transacción exitosa' AS mensaje;
END $$
DELIMITER ;

#------------------------

CALL staging.load_world_data();


############################################################################################################

# COUNTRY_EQUIVALENCES

DROP TABLE IF EXISTS admin.country_equivalences;

CREATE TABLE admin.country_equivalences (
  country_ing VARCHAR(100) COLLATE utf8mb4_bin NOT NULL,
  country_equi VARCHAR(100) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (country_ing)
);


DROP PROCEDURE IF EXISTS admin.construct_country_equivalence;

DELIMITER $$
CREATE PROCEDURE admin.construct_country_equivalence()
BEGIN
  DECLARE EXIT HANDLER FOR SQLEXCEPTION 
  BEGIN
    ROLLBACK;
    SELECT 'Ocurrió un error. Transacción cancelada.' AS mensaje;
  END;

  START TRANSACTION;

  -- Insertar countries directamente desde world_data si no están en equivalencias
  INSERT INTO admin.country_equivalences (country_ing, country_equi)
  SELECT DISTINCT Country, Country
  FROM staging.world_data wd
  WHERE NOT EXISTS (
    SELECT 1
    FROM admin.country_equivalences ce
    WHERE ce.country_ing = wd.Country COLLATE utf8mb4_bin
  );

  -- Insertar equivalencias manuales específicas
  INSERT INTO admin.country_equivalences (country_ing, country_equi) VALUES
  ('USA', 'United States'),
  ('UK', 'United Kingdom');

  -- Inserciones sugeridas por IA: formas comunes o en español
  INSERT INTO admin.country_equivalences (country_ing, country_equi) VALUES
  ('EEUU', 'United States'),
  ('Estados Unidos', 'United States'),
  ('Inglaterra', 'United Kingdom'),
  ('Escocia', 'United Kingdom'),
  ('Gran Bretaña', 'United Kingdom'),
  ('Corea del Sur', 'South Korea'),
  ('Corea del Norte', 'North Korea'),
  ('Emiratos Árabes', 'United Arab Emirates'),
  ('Emiratos Árabes Unidos', 'United Arab Emirates'),
  ('Rusia', 'Russia'),
  ('Egipto', 'Egypt'),
  ('Arabia Saudita', 'Saudi Arabia'),
  ('República Checa', 'Czech Republic'),
  ('Irlanda del Norte', 'United Kingdom'),
  ('Irlanda', 'Republic of Ireland'),
  ('Congo', 'Republic of the Congo'),
  ('RD Congo', 'Democratic Republic of the Congo'),
  ('Bolivia (Estado Plurinacional de)', 'Bolivia'),
  ('Vaticano', 'Vatican City'),
  ('Costa de Marfil', 'Ivory Coast'),
  ('Islas Salomón', 'Solomon Islands'),
  ('Siria', 'Syria'),
  ('Suiza', 'Switzerland'),
  ('Alemania', 'Germany'),
  ('Grecia', 'Greece'),
  ('Turquía', 'Turkey'),
  ('Filipinas', 'Philippines'),
  ('Países Bajos', 'Netherlands'),
  ('Nueva Zelanda', 'New Zealand'),
  ('Birmania', 'Myanmar'),
  ('Sudán del Sur', 'South Sudan'),
  ('Sudán', 'Sudan'),
  ('Islas Marshall', 'Marshall Islands'),
  ('Micronesia', 'Federated States of Micronesia'),
  ('Guinea Ecuatorial', 'Equatorial Guinea'),
  ('Guinea-Bisáu', 'Guinea-Bissau'),
  ('Guayana', 'Guyana'),
  ('Islas Fiyi', 'Fiji'),
  ('San Cristóbal y Nieves', 'Saint Kitts and Nevis'),
  ('Santa Lucía', 'Saint Lucia'),
  ('San Vicente y las Granadinas', 'Saint Vincent and the Grenadines'),
  ('Antigua y Barbuda','Antigua and Barbuda'),
  ('España', 'Spain'),
  ('Japón','Japan');

  COMMIT;

  SELECT 'Transacción completada exitosamente' AS mensaje;
END $$

DELIMITER ;

#-------
TRUNCATE admin.country_equivalences;

CALL admin.construct_country_equivalence();



#-----------------------------------------------------------------------------------------------------------
##########################################################################



# EMPLOYEES:
#----------



# Creación tabla de ingesta de employees en staging

DROP TABLE IF EXISTS staging.ing_employees;

CREATE TABLE staging.ing_employees (
  employeeID text,
  lastName text,
  firstName text,
  title text,
  titleOfCourtesy text,
  birthDate text,
  hireDate text,
  address text,
  city text,
  region text,
  postalCode text,
  country text,
  homePhone text,
  extension text,
  photo text,
  notes text,
  reportsTo text,
  photoPath text,  
  fecha_carga datetime DEFAULT CURRENT_TIMESTAMP,
  load_id int DEFAULT NULL
) ;

# Vacía y carga la tabla de ingesta staging.ing_employees:

TRUNCATE TABLE staging.ing_employees;

LOAD DATA INFILE 'C:/Intro_DW/employees.csv'
INTO TABLE staging.ing_employees
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(employeeID,lastName,firstName,title,titleOfCourtesy,birthDate,hireDate,address,city,region,postalCode,
  country,homePhone,extension,photo,notes,reportsTo,photoPath) ;
  

#------------------------------------------------------------------
  
DROP PROCEDURE IF EXISTS staging.load_id_ing_employees;


DELIMITER $$
CREATE PROCEDURE staging.load_id_ing_employees()

# Este procedimiento agrega un load_id en la tabla de ingesta ing_employees.
# La tabla ing_employees se tiene que cargar antes.

BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN
        ROLLBACK;
        SELECT 'Ocurrió un error. Transacción cancelada.' AS mensaje;
    END;

    START TRANSACTION;
    
    SET SQL_SAFE_UPDATES = 0;

    INSERT INTO admin.cargas (`Tabla_Carga`, `Descripcion_Carga`, `Fecha_Carga`)
    VALUES ('ing_employees', 'Carga la tabla de ingesta de employees', NOW());

    SET @ULT_id := LAST_INSERT_ID();

    UPDATE staging.ing_employees
    SET load_id = @ULT_id
    WHERE load_id IS NULL;

    SET SQL_SAFE_UPDATES = 1;

    COMMIT;
    SELECT 'Transacción exitosa' AS mensaje;
END $$

DELIMITER ;

#---------------

# Ejecuta el SP (primero hay que cargar la tabla de ingesta de employees):

CALL staging.load_id_ing_employees();

#/////////////////////////////////////////////////////////////////////////////////////////////

DROP TABLE IF EXISTS staging.employees;

CREATE TABLE staging.employees (
  employeeID INT,
  lastName VARCHAR(50),
  firstName VARCHAR(50),
  title VARCHAR(100),
  titleOfCourtesy VARCHAR(10),
  birthDate DATE,
  hireDate DATE,
  address VARCHAR(200),
  city VARCHAR(100),
  region VARCHAR(100),
  postalCode VARCHAR(30),
  country VARCHAR(100),
  homePhone VARCHAR(30),
  extension INT,
  notes TEXT,
  reportsTo INT,
  load_id INT DEFAULT NULL,
  ejec_id INT DEFAULT NULL
) ;


#///////////////////////////////////////////////////////////////////////////////////////////

DROP TABLE IF EXISTS staging.error_employees;

-- Crear tabla de errores si no existe

CREATE TABLE staging.error_employees (
  employeeID text,
  lastName text,
  firstName text,
  title text,
  titleOfCourtesy text,
  birthDate text,
  hireDate text,
  address text,
  city text,
  region text,
  postalCode text,
  country text,
  homePhone text,
  extension text,
  photo text,
  notes text,
  reportsTo text,
  photoPath text,  
  load_id INT DEFAULT NULL,
  ejec_id INT DEFAULT NULL,
  fecha_carga DATETIME,
  error_message TEXT,
  error_ts DATETIME DEFAULT CURRENT_TIMESTAMP
) ;


DROP TABLE IF EXISTS staging.warnings_employees;

CREATE TABLE staging.warnings_employees (
  employeeID TEXT,
  warning_message TEXT,
  load_id INT,
  fecha_carga DATETIME,
  ejec_id INT DEFAULT NULL,
  error_ts DATETIME
) ;


#/////////////////////////////////////////////////////////////////////////////////

DROP PROCEDURE IF EXISTS staging.load_employees;

DELIMITER $$
CREATE PROCEDURE staging.load_employees()
BEGIN
  DECLARE done INT DEFAULT 0;
  DECLARE v_id TEXT;
  DECLARE v_last TEXT;
  DECLARE v_first TEXT;
  DECLARE v_title TEXT;
  DECLARE v_titlecourtesy TEXT;
  DECLARE v_birth TEXT;
  DECLARE v_hire TEXT;
  DECLARE v_address TEXT;
  DECLARE v_city TEXT;
  DECLARE v_region TEXT;
  DECLARE v_postal TEXT;
  DECLARE v_country TEXT;
  DECLARE v_phone TEXT;
  DECLARE v_ext TEXT;
  DECLARE v_photo TEXT;
  DECLARE v_notes TEXT;
  DECLARE v_reports TEXT;
  DECLARE v_photoPath TEXT;
  DECLARE v_fecha DATETIME;
  DECLARE v_err TEXT;
  DECLARE v_warn TEXT;
  DECLARE v_ejec_id INT DEFAULT NULL;
  DECLARE v_load_id INT DEFAULT NULL;

  DECLARE cur CURSOR FOR
    SELECT employeeID, lastName, firstName, title, titleOfCourtesy, birthDate,
           hireDate, address, city, region, postalCode, country,
           homePhone, extension, photo, notes, reportsTo, photoPath, fecha_carga, load_id
    FROM staging.ing_employees;

  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

  -- Log de ejecución
  START TRANSACTION;
    INSERT INTO admin.ejecuciones
      (Procedimiento_Nombre, Descripcion_Ejec, Param1_Val, Param2_Val, Param3_Val, Fech_Ejec)
    VALUES
      ('LOAD_employees', 'Carga desde ing_employees', NULL, NULL, NULL, NOW());
    SET v_ejec_id = LAST_INSERT_ID();

    INSERT INTO admin.ejecuciones_pasos
      (Ejec_id, Nro_Mark, Descripcion_Mark, Activity_Count, Fech_Ejec_Mark)
    VALUES
      (v_ejec_id, 0, 'Inicio de SP', NULL, NOW());
  COMMIT;

  OPEN cur;

  read_loop: LOOP
    FETCH cur INTO v_id, v_last, v_first, v_title, v_titlecourtesy, v_birth, v_hire,
                  v_address, v_city, v_region, v_postal, v_country,
                  v_phone, v_ext, v_photo, v_notes, v_reports, v_photoPath,
                  v_fecha, v_load_id;
    IF done THEN
      LEAVE read_loop;
    END IF;

    SET v_err = '';

    -- Validaciones
    IF v_id IS NULL OR v_id = '' OR v_id NOT REGEXP '^[0-9]+$' THEN
      SET v_err = CONCAT(v_err, 'employeeID not numeric or null; ');
    END IF;

    IF v_ext IS NOT NULL AND v_ext != '' AND v_ext NOT REGEXP '^[0-9]+$' THEN
      SET v_err = CONCAT(v_err, 'extension not numeric; ');
    END IF;

    IF v_reports IS NOT NULL AND v_reports != '' AND v_reports NOT REGEXP '^[0-9]+$' THEN
      SET v_err = CONCAT(v_err, 'reportsTo not numeric; ');
    END IF;

    IF v_birth IS NOT NULL AND STR_TO_DATE(LEFT(v_birth, 19), '%Y-%m-%d %H:%i:%s') IS NULL THEN
      SET v_err = CONCAT(v_err, 'birthDate invalid; ');
    END IF;

    IF v_hire IS NOT NULL AND STR_TO_DATE(LEFT(v_hire, 19), '%Y-%m-%d %H:%i:%s') IS NULL THEN
      SET v_err = CONCAT(v_err, 'hireDate invalid; ');
    END IF;

    IF v_err != '' THEN
      INSERT INTO staging.error_employees (
        employeeID, lastName, firstName, title, titleOfCourtesy, birthDate, hireDate,
        address, city, region, postalCode, country, homePhone, extension, photo,
        notes, reportsTo, photoPath, load_id, ejec_id, fecha_carga, error_message, error_ts)
      VALUES (
        v_id, v_last, v_first, v_title, v_titlecourtesy, v_birth, v_hire,
        v_address, v_city, v_region, v_postal, v_country, v_phone, v_ext, v_photo,
        v_notes, v_reports, v_photoPath, v_load_id, v_ejec_id, v_fecha, v_err, NOW());
    ELSE
      -- Insert sin photo ni photoPath
      INSERT INTO staging.employees (
        employeeID, lastName, firstName, title, titleOfCourtesy,
        birthDate, hireDate, address, city, region, postalCode,
        country, homePhone, extension, notes, reportsTo,
        load_id, ejec_id
      )
      VALUES (
        CAST(v_id AS UNSIGNED),
        v_last, v_first, v_title, v_titlecourtesy,
        STR_TO_DATE(LEFT(v_birth, 19), '%Y-%m-%d %H:%i:%s'),
        STR_TO_DATE(LEFT(v_hire, 19), '%Y-%m-%d %H:%i:%s'),
        v_address, v_city, v_region, v_postal, v_country,
        v_phone,
        CASE WHEN v_ext IS NULL OR v_ext = '' THEN NULL ELSE CAST(v_ext AS UNSIGNED) END,
        v_notes,
        CASE WHEN v_reports IS NULL OR v_reports = '' THEN NULL ELSE CAST(v_reports AS UNSIGNED) END,
        v_load_id, v_ejec_id
      );

      -- Warnings si se quiere implementar más adelante
    END IF;
  END LOOP;

  CLOSE cur;
END$$
DELIMITER ;


#-----------------------

CALL staging.load_employees();


##################################################################

# PRODUCTS
# Creación tabla de ingesta de products en staging

DROP TABLE IF EXISTS staging.ing_products;

CREATE TABLE staging.ing_products (
productID text,
productName text,
supplierID text,
categoryID text,
quantityPerUnit text,
unitPrice text,
unitsInStock text,
unitsOnOrder text,
reorderLevel text,
discontinued text,
fecha_carga datetime DEFAULT CURRENT_TIMESTAMP,
load_id int DEFAULT NULL
);



TRUNCATE TABLE staging.ing_products;

LOAD DATA INFILE 'C:/Intro_DW/products.csv'
INTO TABLE staging.ing_products
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(productID,productName,supplierID,categoryID,quantityPerUnit,unitPrice,unitsInStock,
unitsOnOrder,reorderLevel,discontinued) ;


#------------------------------------------------------------------
DROP PROCEDURE IF EXISTS staging.load_id_ing_products;

#-----
DELIMITER $$
CREATE PROCEDURE staging.load_id_ing_products()

# Este procedimiento agrega un load_id en la tabla de ingesta ing_products.
# La tabla ing_products se tiene que cargar antes.

BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN
        ROLLBACK;
        SELECT 'Ocurrió un error. Transacción cancelada.' AS mensaje;
    END;

    START TRANSACTION;
    
    SET SQL_SAFE_UPDATES = 0;

    INSERT INTO admin.cargas (`Tabla_Carga`, `Descripcion_Carga`, `Fecha_Carga`)
    VALUES ('ing_products', 'Carga la tabla de ingesta de products', NOW());

    SET @ULT_id := LAST_INSERT_ID();

    UPDATE staging.ing_products
    SET load_id = @ULT_id
    WHERE load_id IS NULL;

    SET SQL_SAFE_UPDATES = 1;

    COMMIT;
    SELECT 'Transacción exitosa' AS mensaje;
END $$

DELIMITER ;

#--------------

CALL staging.load_id_ing_products();

#--------------------------

DROP TABLE IF EXISTS staging.products;

CREATE TABLE staging.products (
productID INT,
productName VARCHAR(200),
supplierID INT,
categoryID INT,
quantityPerUnit VARCHAR(100),
unitPrice DECIMAL(18,2),
unitsInStock SMALLINT,
unitsOnOrder SMALLINT,
reorderLevel SMALLINT,
discontinued BOOLEAN,
load_id INT DEFAULT NULL,
ejec_id INT DEFAULT NULL
) ;


#---------------------------------------------------------------


DROP TABLE IF EXISTS staging.error_products;

-- Crear tabla de errores si no existe

CREATE TABLE staging.error_products (
  productID text,
  productName text,
  supplierID text,
  categoryID text,
  quantityPerUnit text,
  unitPrice text,
  unitsInStock text,
  unitsOnOrder text,
  reorderLevel text,
  discontinued text, 
  load_id INT DEFAULT NULL,
  ejec_id INT DEFAULT NULL,
  fecha_carga DATETIME,
  error_message TEXT,
  error_ts DATETIME DEFAULT CURRENT_TIMESTAMP
) ;

DROP TABLE IF EXISTS staging.warnings_products;

CREATE TABLE staging.warnings_products (
  productID TEXT,
  warning_message TEXT,
  load_id INT,
  fecha_carga DATETIME,
  ejec_id INT DEFAULT NULL,
  error_ts DATETIME
) ;



#/////////////////////////////////////////////////////////////////////////////////

DROP PROCEDURE IF EXISTS staging.load_products;

#-------------------------

DELIMITER $$
CREATE PROCEDURE staging.load_products()
BEGIN
  DECLARE done INT DEFAULT 0;
  DECLARE v_productID TEXT;
  DECLARE v_productName TEXT;
  DECLARE v_supplierID TEXT;
  DECLARE v_categoryID TEXT;
  DECLARE v_quantityPerUnit TEXT;
  DECLARE v_unitPrice TEXT;
  DECLARE v_unitsInStock TEXT;
  DECLARE v_unitsOnOrder TEXT;
  DECLARE v_reorderLevel TEXT;
  DECLARE v_discontinued TEXT;
  DECLARE v_fecha DATETIME;
  DECLARE v_load_id INT;
  DECLARE v_ejec_id INT DEFAULT NULL;
  DECLARE v_err TEXT;
  DECLARE v_warn TEXT;

  DECLARE cur CURSOR FOR
    SELECT productID, productName, supplierID, categoryID, quantityPerUnit,
           unitPrice, unitsInStock, unitsOnOrder, reorderLevel, discontinued,
           fecha_carga, load_id
    FROM staging.ing_products;

  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

  -- Log de ejecución
  START TRANSACTION;
    INSERT INTO admin.ejecuciones
      (Procedimiento_Nombre, Descripcion_Ejec, Param1_Val, Param2_Val, Param3_Val, Fech_Ejec)
    VALUES
      ('LOAD_products', 'Carga desde ing_products', NULL, NULL, NULL, NOW());
    SET v_ejec_id = LAST_INSERT_ID();

    INSERT INTO admin.ejecuciones_pasos
      (Ejec_id, Nro_Mark, Descripcion_Mark, Activity_Count, Fech_Ejec_Mark)
    VALUES
      (v_ejec_id, 0, 'Inicio de SP', NULL, NOW());
  COMMIT;

  OPEN cur;

  read_loop: LOOP
    FETCH cur INTO v_productID, v_productName, v_supplierID, v_categoryID, v_quantityPerUnit,
                  v_unitPrice, v_unitsInStock, v_unitsOnOrder, v_reorderLevel, v_discontinued,
                  v_fecha, v_load_id;
    IF done THEN
      LEAVE read_loop;
    END IF;

    SET v_err = '';
    SET v_warn = '';

    -- Validaciones
    IF v_productID IS NULL OR v_productID = '' OR v_productID NOT REGEXP '^[0-9]+$' THEN
      SET v_err = CONCAT(v_err, 'productID inválido; ');
    END IF;

    IF v_productName IS NOT NULL AND CHAR_LENGTH(v_productName) > 200 THEN
      SET v_err = CONCAT(v_err, 'productName > 200; ');
    END IF;

    IF v_quantityPerUnit IS NOT NULL AND CHAR_LENGTH(v_quantityPerUnit) > 100 THEN
      SET v_err = CONCAT(v_err, 'quantityPerUnit > 100; ');
    END IF;

    IF v_supplierID IS NOT NULL AND v_supplierID != '' AND v_supplierID NOT REGEXP '^[0-9]+$' THEN
      SET v_err = CONCAT(v_err, 'supplierID inválido; ');
    END IF;

    IF v_categoryID IS NOT NULL AND v_categoryID != '' AND v_categoryID NOT REGEXP '^[0-9]+$' THEN
      SET v_err = CONCAT(v_err, 'categoryID inválido; ');
    END IF;

    IF v_unitPrice IS NOT NULL AND v_unitPrice != '' AND v_unitPrice NOT REGEXP '^[0-9]+(\\.[0-9]{1,2})?$' THEN
      SET v_err = CONCAT(v_err, 'unitPrice inválido; ');
    END IF;

    IF v_unitsInStock IS NOT NULL AND v_unitsInStock != '' AND v_unitsInStock NOT REGEXP '^[0-9]+$' THEN
      SET v_err = CONCAT(v_err, 'unitsInStock inválido; ');
    END IF;

    IF v_unitsOnOrder IS NOT NULL AND v_unitsOnOrder != '' AND v_unitsOnOrder NOT REGEXP '^[0-9]+$' THEN
      SET v_err = CONCAT(v_err, 'unitsOnOrder inválido; ');
    END IF;

    IF v_reorderLevel IS NOT NULL AND v_reorderLevel != '' AND v_reorderLevel NOT REGEXP '^[0-9]+$' THEN
      SET v_err = CONCAT(v_err, 'reorderLevel inválido; ');
    END IF;

    IF v_discontinued IS NOT NULL AND v_discontinued NOT IN ('0', '1') THEN
      SET v_err = CONCAT(v_err, 'discontinued inválido; ');
    END IF;

    IF v_err != '' THEN
      INSERT INTO staging.error_products (
        productID, productName, supplierID, categoryID, quantityPerUnit,
        unitPrice, unitsInStock, unitsOnOrder, reorderLevel, discontinued,
        load_id, ejec_id, fecha_carga, error_message, error_ts)
      VALUES (
        v_productID, v_productName, v_supplierID, v_categoryID, v_quantityPerUnit,
        v_unitPrice, v_unitsInStock, v_unitsOnOrder, v_reorderLevel, v_discontinued,
        v_load_id, v_ejec_id, v_fecha, v_err, NOW());
    ELSE
      INSERT INTO staging.products (
        productID, productName, supplierID, categoryID, quantityPerUnit,
        unitPrice, unitsInStock, unitsOnOrder, reorderLevel, discontinued,
        load_id, ejec_id)
      VALUES (
        v_productID,
        v_productName,
        v_supplierID,
        v_categoryID,
        v_quantityPerUnit,
        v_unitPrice,
        v_unitsInStock,
        v_unitsOnOrder,
        v_reorderLevel,
        v_discontinued,
        v_load_id, v_ejec_id);

      -- Warnings por campos nulos o vacíos
      IF v_productName IS NULL OR TRIM(v_productName) = '' THEN
        SET v_warn = CONCAT(v_warn, 'productName vacío; ');
      END IF;
      IF v_supplierID IS NULL OR TRIM(v_supplierID) = '' THEN
        SET v_warn = CONCAT(v_warn, 'supplierID vacío; ');
      END IF;
      IF v_categoryID IS NULL OR TRIM(v_categoryID) = '' THEN
        SET v_warn = CONCAT(v_warn, 'categoryID vacío; ');
      END IF;
      IF v_quantityPerUnit IS NULL OR TRIM(v_quantityPerUnit) = '' THEN
        SET v_warn = CONCAT(v_warn, 'quantityPerUnit vacío; ');
      END IF;
      IF v_unitPrice IS NULL OR TRIM(v_unitPrice) = '' THEN
        SET v_warn = CONCAT(v_warn, 'unitPrice vacío; ');
      END IF;
      IF v_unitsInStock IS NULL OR TRIM(v_unitsInStock) = '' THEN
        SET v_warn = CONCAT(v_warn, 'unitsInStock vacío; ');
      END IF;
      IF v_unitsOnOrder IS NULL OR TRIM(v_unitsOnOrder) = '' THEN
        SET v_warn = CONCAT(v_warn, 'unitsOnOrder vacío; ');
      END IF;
      IF v_reorderLevel IS NULL OR TRIM(v_reorderLevel) = '' THEN
        SET v_warn = CONCAT(v_warn, 'reorderLevel vacío; ');
      END IF;
      IF v_discontinued IS NULL OR TRIM(v_discontinued) = '' THEN
        SET v_warn = CONCAT(v_warn, 'discontinued vacío; ');
      END IF;

      IF v_warn != '' THEN
        INSERT INTO staging.warnings_products (
          productID, warning_message, load_id, fecha_carga, ejec_id, error_ts)
        VALUES (
          v_productID, v_warn, v_load_id, v_fecha, v_ejec_id, NOW());
      END IF;
    END IF;
  END LOOP;

  CLOSE cur;
END$$
DELIMITER ;

#---------------------------

CALL staging.load_products();


########################################################################


# ORDERS 
#orderID,customerID,employeeID,orderDate,requiredDate,shippedDate,shipVia,freight,shipName,shipAddress,shipCity,shipRegion,shipPostalCode,shipCountry

DROP TABLE IF EXISTS staging.ing_orders;

CREATE TABLE staging.ing_orders (
orderID text,
customerID text,
employeeID text,
orderDate text,
requiredDate text,
shippedDate text,
shipVia text,
freight text,
shipName text,
shipAddress text,
shipCity text,
shipRegion text,
shipPostalCode text,
shipCountry text,
fecha_carga datetime DEFAULT CURRENT_TIMESTAMP,
load_id int DEFAULT NULL
);

TRUNCATE TABLE staging.ing_orders;

LOAD DATA INFILE 'C:/Intro_DW/orders.csv'
INTO TABLE staging.ing_orders
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(orderID,customerID,employeeID,orderDate,requiredDate,shippedDate,shipVia,freight,
shipName,shipAddress,shipCity,shipRegion,shipPostalCode,shipCountry) ;

#------------------------------------------------------------------

DROP PROCEDURE IF EXISTS staging.load_id_ing_orders;


DELIMITER $$
CREATE PROCEDURE staging.load_id_ing_orders()

# Este procedimiento agrega un load_id en la tabla de ingesta ing_orders.
# La tabla ing_orders se tiene que cargar antes.

BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN
        ROLLBACK;
        SELECT 'Ocurrió un error. Transacción cancelada.' AS mensaje;
    END;

    START TRANSACTION;
    
    SET SQL_SAFE_UPDATES = 0;

    INSERT INTO admin.cargas (`Tabla_Carga`, `Descripcion_Carga`, `Fecha_Carga`)
    VALUES ('ing_orders', 'Actualiza el load_id en la tabla de ingesta de orders', NOW());

    SET @ULT_id := LAST_INSERT_ID();

    UPDATE staging.ing_orders
    SET load_id = @ULT_id
    WHERE load_id IS NULL;

    SET SQL_SAFE_UPDATES = 1;

    COMMIT;
    SELECT 'Transacción exitosa' AS mensaje;
END $$

DELIMITER ;

#--------

CALL staging.load_id_ing_orders();

#------------------------------------------------------------------------------


DROP TABLE IF EXISTS staging.orders;

CREATE TABLE staging.orders (
orderID int,
customerID varchar(10),
employeeID int,
orderDate date,
requiredDate date,
shippedDate date,
shipVia smallint,
freight decimal(18,2),
shipName varchar(200),
shipAddress varchar(200),
shipCity varchar(100),
shipRegion varchar(100),
shipPostalCode varchar(30),
shipCountry varchar(100),
load_id INT DEFAULT NULL,
ejec_id INT DEFAULT NULL
);


DROP TABLE IF EXISTS staging.error_orders;

-- Crear tabla de errores si no existe

CREATE TABLE staging.error_orders (
orderID text,
customerID text,
employeeID text,
orderDate text,
requiredDate text,
shippedDate text,
shipVia text,
freight text,
shipName text,
shipAddress text,
shipCity text,
shipRegion text,
shipPostalCode text,
shipCountry text, 
load_id INT DEFAULT NULL,
ejec_id INT DEFAULT NULL,
fecha_carga DATETIME,
error_message TEXT,
error_ts DATETIME DEFAULT CURRENT_TIMESTAMP
) ;

DROP TABLE IF EXISTS staging.warnings_orders;

CREATE TABLE staging.warnings_orders (
  orderID TEXT,
  warning_message TEXT,
  load_id INT,
  fecha_carga DATETIME,
  ejec_id INT DEFAULT NULL,
  error_ts DATETIME
) ;

#-----------------------------------------


DELIMITER $$
CREATE PROCEDURE staging.load_orders()
BEGIN
  DECLARE done INT DEFAULT 0;
  DECLARE v_orderID TEXT;
  DECLARE v_customerID TEXT;
  DECLARE v_employeeID TEXT;
  DECLARE v_orderDate TEXT;
  DECLARE v_requiredDate TEXT;
  DECLARE v_shippedDate TEXT;
  DECLARE v_shipVia TEXT;
  DECLARE v_freight TEXT;
  DECLARE v_shipName TEXT;
  DECLARE v_shipAddress TEXT;
  DECLARE v_shipCity TEXT;
  DECLARE v_shipRegion TEXT;
  DECLARE v_shipPostalCode TEXT;
  DECLARE v_shipCountry TEXT;
  DECLARE v_fecha DATETIME;
  DECLARE v_load_id INT;
  DECLARE v_ejec_id INT DEFAULT NULL;
  DECLARE v_err TEXT;
  DECLARE v_warn TEXT;

  DECLARE cur CURSOR FOR
    SELECT orderID, customerID, employeeID, orderDate, requiredDate, shippedDate, shipVia, freight,
           shipName, shipAddress, shipCity, shipRegion, shipPostalCode, shipCountry, fecha_carga, load_id
    FROM staging.ing_orders;

  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

  -- Log de ejecución
  START TRANSACTION;
    INSERT INTO admin.ejecuciones
      (Procedimiento_Nombre, Descripcion_Ejec, Param1_Val, Param2_Val, Param3_Val, Fech_Ejec)
    VALUES
      ('LOAD_orders', 'Carga desde ing_orders', NULL, NULL, NULL, NOW());
    SET v_ejec_id = LAST_INSERT_ID();

    INSERT INTO admin.ejecuciones_pasos
      (Ejec_id, Nro_Mark, Descripcion_Mark, Activity_Count, Fech_Ejec_Mark)
    VALUES
      (v_ejec_id, 0, 'Inicio de SP', NULL, NOW());
  COMMIT;

  OPEN cur;

  read_loop: LOOP
    FETCH cur INTO v_orderID, v_customerID, v_employeeID, v_orderDate, v_requiredDate, v_shippedDate,
                  v_shipVia, v_freight, v_shipName, v_shipAddress, v_shipCity, v_shipRegion, 
                  v_shipPostalCode, v_shipCountry, v_fecha, v_load_id;
    IF done THEN
      LEAVE read_loop;
    END IF;

    SET v_err = '';
    SET v_warn = '';

    -- Validaciones
    IF v_orderID IS NULL OR v_orderID = '' OR v_orderID NOT REGEXP '^[0-9]+$' THEN
      SET v_err = CONCAT(v_err, 'orderID not numeric or null; ');
    END IF;

    IF v_customerID IS NULL OR LENGTH(TRIM(v_customerID)) = 0 THEN
      SET v_warn = CONCAT(v_warn, 'customerID is null or empty; ');
    END IF;

    IF v_employeeID IS NOT NULL AND v_employeeID != '' AND v_employeeID NOT REGEXP '^[0-9]+$' THEN
      SET v_err = CONCAT(v_err, 'employeeID not numeric; ');
    END IF;

    IF v_orderDate IS NOT NULL AND STR_TO_DATE(LEFT(v_orderDate, 19), '%Y-%m-%d %H:%i:%s') IS NULL THEN
      SET v_err = CONCAT(v_err, 'orderDate invalid; ');
    END IF;

    IF v_requiredDate IS NOT NULL AND STR_TO_DATE(LEFT(v_requiredDate, 19), '%Y-%m-%d %H:%i:%s') IS NULL THEN
      SET v_err = CONCAT(v_err, 'requiredDate invalid; ');
    END IF;

    IF v_shippedDate IS NOT NULL AND STR_TO_DATE(LEFT(v_shippedDate, 19), '%Y-%m-%d %H:%i:%s') IS NULL THEN
      SET v_err = CONCAT(v_err, 'shippedDate invalid; ');
    END IF;

    IF v_shipVia IS NOT NULL AND v_shipVia != '' AND v_shipVia NOT REGEXP '^[0-9]+$' THEN
      SET v_err = CONCAT(v_err, 'shipVia not numeric; ');
    END IF;

    -- Geográficos vacíos => warning
    IF v_shipName IS NULL OR LENGTH(TRIM(v_shipName)) = 0 THEN
      SET v_warn = CONCAT(v_warn, 'shipName is null or empty; ');
    END IF;
    IF v_shipAddress IS NULL OR LENGTH(TRIM(v_shipAddress)) = 0 THEN
      SET v_warn = CONCAT(v_warn, 'shipAddress is null or empty; ');
    END IF;
    IF v_shipCity IS NULL OR LENGTH(TRIM(v_shipCity)) = 0 THEN
      SET v_warn = CONCAT(v_warn, 'shipCity is null or empty; ');
    END IF;
    IF v_shipRegion IS NULL OR LENGTH(TRIM(v_shipRegion)) = 0 THEN
      SET v_warn = CONCAT(v_warn, 'shipRegion is null or empty; ');
    END IF;
    IF v_shipPostalCode IS NULL OR LENGTH(TRIM(v_shipPostalCode)) = 0 THEN
      SET v_warn = CONCAT(v_warn, 'shipPostalCode is null or empty; ');
    END IF;
    IF v_shipCountry IS NULL OR LENGTH(TRIM(v_shipCountry)) = 0 THEN
      SET v_warn = CONCAT(v_warn, 'shipCountry is null or empty; ');
    END IF;

    IF v_err != '' THEN
      INSERT INTO staging.error_orders (
        orderID, customerID, employeeID, orderDate, requiredDate, shippedDate, shipVia, freight,
        shipName, shipAddress, shipCity, shipRegion, shipPostalCode, shipCountry,
        load_id, ejec_id, fecha_carga, error_message, error_ts)
      VALUES (
        v_orderID, v_customerID, v_employeeID, v_orderDate, v_requiredDate, v_shippedDate, v_shipVia, v_freight,
        v_shipName, v_shipAddress, v_shipCity, v_shipRegion, v_shipPostalCode, v_shipCountry,
        v_load_id, v_ejec_id, v_fecha, v_err, NOW());

    ELSE
      INSERT INTO staging.orders (
        orderID, customerID, employeeID, orderDate, requiredDate, shippedDate, shipVia, freight,
        shipName, shipAddress, shipCity, shipRegion, shipPostalCode, shipCountry,
        load_id, ejec_id)
      VALUES (
        CAST(v_orderID AS UNSIGNED), v_customerID,
        CASE WHEN v_employeeID IS NULL OR v_employeeID = '' THEN NULL ELSE CAST(v_employeeID AS UNSIGNED) END,
        STR_TO_DATE(LEFT(v_orderDate, 19), '%Y-%m-%d %H:%i:%s'),
        STR_TO_DATE(LEFT(v_requiredDate, 19), '%Y-%m-%d %H:%i:%s'),
        STR_TO_DATE(LEFT(v_shippedDate, 19), '%Y-%m-%d %H:%i:%s'),
        CASE WHEN v_shipVia IS NULL OR v_shipVia = '' THEN NULL ELSE CAST(v_shipVia AS UNSIGNED) END,
        CAST(v_freight AS DECIMAL(18,2)),
        v_shipName, v_shipAddress, v_shipCity, v_shipRegion, v_shipPostalCode, v_shipCountry,
        v_load_id, v_ejec_id);

      IF v_warn != '' THEN
        INSERT INTO staging.warnings_orders (
          orderID, warning_message, load_id, fecha_carga, ejec_id, error_ts)
        VALUES (
          v_orderID, v_warn, v_load_id, v_fecha, v_ejec_id, NOW());
      END IF;
    END IF;
  END LOOP;

  CLOSE cur;
END$$
DELIMITER ;

#-------------------------
CALL staging.load_orders();

###################################################################################

# ORDER DETAILS

# orderID,productID,unitPrice,quantity,discount

DROP TABLE IF EXISTS staging.ing_order_details;

CREATE TABLE staging.ing_order_details (
orderID text,
productID text,
unitPrice text,
quantity text,
discount text,
fecha_carga datetime DEFAULT CURRENT_TIMESTAMP,
load_id int DEFAULT NULL
);

TRUNCATE TABLE staging.ing_order_details;

LOAD DATA INFILE 'C:/Intro_DW/order_details.csv'
INTO TABLE staging.ing_order_details
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(orderID,productID,unitPrice,quantity,discount) ;


#------------------------------------------------------------------

DROP PROCEDURE IF EXISTS staging.load_id_ing_order_details;

DELIMITER $$
CREATE PROCEDURE staging.load_id_ing_order_details()

# Este procedimiento agrega un load_id en la tabla de ingesta ing_order_details.
# La tabla ing_order_details se tiene que cargar antes.

BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN
        ROLLBACK;
        SELECT 'Ocurrió un error. Transacción cancelada.' AS mensaje;
    END;

    START TRANSACTION;
    
    SET SQL_SAFE_UPDATES = 0;

    INSERT INTO admin.cargas (`Tabla_Carga`, `Descripcion_Carga`, `Fecha_Carga`)
    VALUES ('ing_order_details', 'Actualiza el load_id en la tabla de ingesta de order_details', NOW());

    SET @ULT_id := LAST_INSERT_ID();

    UPDATE staging.ing_order_details
    SET load_id = @ULT_id
    WHERE load_id IS NULL;

    SET SQL_SAFE_UPDATES = 1;

    COMMIT;
    SELECT 'Transacción exitosa' AS mensaje;
END $$

DELIMITER ;

#--------

CALL staging.load_id_ing_order_details();

#------------------------------------------------------------------------------


DROP TABLE IF EXISTS staging.order_details;

CREATE TABLE staging.order_details (
orderID int,
productID int,
unitPrice decimal(18,2),
quantity smallint,
discount decimal(18,2),
load_id INT DEFAULT NULL,
ejec_id INT DEFAULT NULL
);


DROP TABLE IF EXISTS staging.error_order_details;

-- Crear tabla de errores si no existe

CREATE TABLE staging.error_order_details (
orderID text,
productID text,
unitPrice text,
quantity text,
discount text,
load_id INT DEFAULT NULL,
ejec_id INT DEFAULT NULL,
fecha_carga DATETIME,
error_message TEXT,
error_ts DATETIME DEFAULT CURRENT_TIMESTAMP
) ;

DROP TABLE IF EXISTS staging.warnings_order_details;

CREATE TABLE staging.warnings_order_details (
  orderID TEXT,
  warning_message TEXT,
  load_id INT,
  fecha_carga DATETIME,
  ejec_id INT DEFAULT NULL,
  error_ts DATETIME
) ;




#-----------------------------------------------------

DROP PROCEDURE IF EXISTS staging.load_order_details;

DELIMITER $$
CREATE PROCEDURE staging.load_order_details()
BEGIN
  DECLARE done INT DEFAULT 0;
  DECLARE v_orderID TEXT;
  DECLARE v_productID TEXT;
  DECLARE v_unitPrice TEXT;
  DECLARE v_quantity TEXT;
  DECLARE v_discount TEXT;
  DECLARE v_fecha DATETIME;
  DECLARE v_load_id INT;
  DECLARE v_ejec_id INT DEFAULT NULL;
  DECLARE v_err TEXT;
  DECLARE v_warn TEXT;

  DECLARE cur CURSOR FOR
    SELECT orderID, productID, unitPrice, quantity, discount, fecha_carga, load_id
    FROM staging.ing_order_details;

  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

  -- Log de ejecución
  START TRANSACTION;
    INSERT INTO admin.ejecuciones
      (Procedimiento_Nombre, Descripcion_Ejec, Param1_Val, Param2_Val, Param3_Val, Fech_Ejec)
    VALUES
      ('LOAD_order_details', 'Carga desde ing_order_details', NULL, NULL, NULL, NOW());
    SET v_ejec_id = LAST_INSERT_ID();

    INSERT INTO admin.ejecuciones_pasos
      (Ejec_id, Nro_Mark, Descripcion_Mark, Activity_Count, Fech_Ejec_Mark)
    VALUES
      (v_ejec_id, 0, 'Inicio de SP', NULL, NOW());
  COMMIT;

  OPEN cur;

  read_loop: LOOP
    FETCH cur INTO v_orderID, v_productID, v_unitPrice, v_quantity, v_discount, v_fecha, v_load_id;
    IF done THEN
      LEAVE read_loop;
    END IF;

    SET v_err = '';
    SET v_warn = '';

    -- Validaciones de error
    IF v_orderID IS NULL OR v_orderID = '' OR v_orderID NOT REGEXP '^[0-9]+$' THEN
      SET v_err = CONCAT(v_err, 'orderID not numeric or null; ');
    END IF;

    IF v_productID IS NULL OR v_productID = '' OR v_productID NOT REGEXP '^[0-9]+$' THEN
      SET v_err = CONCAT(v_err, 'productID not numeric or null; ');
    END IF;

    IF v_unitPrice IS NOT NULL AND v_unitPrice != '' AND v_unitPrice NOT REGEXP '^-?[0-9]+(\\.[0-9]{1,2})?$' THEN
      SET v_err = CONCAT(v_err, 'unitPrice invalid format; ');
    END IF;

    IF v_quantity IS NOT NULL AND v_quantity != '' AND v_quantity NOT REGEXP '^[0-9]+$' THEN
      SET v_err = CONCAT(v_err, 'quantity not valid smallint; ');
    END IF;

    IF v_discount IS NOT NULL AND v_discount != '' AND v_discount NOT REGEXP '^-?[0-9]+(\\.[0-9]{1,2})?$' THEN
      SET v_err = CONCAT(v_err, 'discount invalid format; ');
    END IF;

    -- Warnings si vacíos
    IF v_unitPrice IS NULL OR LENGTH(TRIM(v_unitPrice)) = 0 THEN
      SET v_warn = CONCAT(v_warn, 'unitPrice is null or empty; ');
    END IF;
    IF v_quantity IS NULL OR LENGTH(TRIM(v_quantity)) = 0 THEN
      SET v_warn = CONCAT(v_warn, 'quantity is null or empty; ');
    END IF;
    IF v_discount IS NULL OR LENGTH(TRIM(v_discount)) = 0 THEN
      SET v_warn = CONCAT(v_warn, 'discount is null or empty; ');
    END IF;

    IF v_err != '' THEN
      INSERT INTO staging.error_order_details (
        orderID, productID, unitPrice, quantity, discount,
        load_id, ejec_id, fecha_carga, error_message, error_ts)
      VALUES (
        v_orderID, v_productID, v_unitPrice, v_quantity, v_discount,
        v_load_id, v_ejec_id, v_fecha, v_err, NOW());

    ELSE
      INSERT INTO staging.order_details (
        orderID, productID, unitPrice, quantity, discount,
        load_id, ejec_id)
      VALUES (
        CAST(v_orderID AS UNSIGNED),
        CAST(v_productID AS UNSIGNED),
        CASE WHEN v_unitPrice IS NULL OR v_unitPrice = '' THEN NULL ELSE CAST(v_unitPrice AS DECIMAL(18,2)) END,
        CASE WHEN v_quantity IS NULL OR v_quantity = '' THEN NULL ELSE CAST(v_quantity AS UNSIGNED) END,
        CASE WHEN v_discount IS NULL OR v_discount = '' THEN NULL ELSE CAST(v_discount AS DECIMAL(18,2)) END,
        v_load_id, v_ejec_id);

      IF v_warn != '' THEN
        INSERT INTO staging.warnings_order_details (
          orderID, warning_message, load_id, fecha_carga, ejec_id, error_ts)
        VALUES (
          v_orderID, v_warn, v_load_id, v_fecha, v_ejec_id, NOW());
      END IF;
    END IF;
  END LOOP;

  CLOSE cur;
END$$
DELIMITER ;


#------

CALL staging.load_order_details();

############################################################################################################

# PROCESO PARA CUSTOMER

### PARTE 1 #########


USE staging;

DROP TABLE IF EXISTS staging.ing_customers;

# Tabla de ingesta inicial de customers:

CREATE TABLE staging.ing_customers (
   customerID TEXT,
   companyName TEXT,
   contactName TEXT,
   contactTitle TEXT,
   address TEXT,
   city TEXT,
   region TEXT,
   postalCode TEXT,
   country TEXT,
   phone TEXT,
   fax TEXT,
   fecha_carga DATETIME DEFAULT CURRENT_TIMESTAMP,
   load_id INT DEFAULT NULL
) ;


#----------------------------------------------------

# Vacía y carga la tabla de ingesta staging.ing_customers:

TRUNCATE TABLE staging.ing_customers;

LOAD DATA INFILE 'C:/Intro_DW/customers.csv'
INTO TABLE staging.ing_customers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(customerID,companyName,contactName,contactTitle,address,city,region,postalCode,country,phone,fax) ;

#------------------------------------------------------


DROP PROCEDURE IF EXISTS staging.load_id_ing_customers;

#-------------

DELIMITER $$
CREATE PROCEDURE staging.load_id_ing_customers()

# Este procedimiento agrega un load_id en la tabla de ingesta ing_customers.
# La tabla ing_customers se tiene que cargar antes.

BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN
        ROLLBACK;
        SELECT 'Ocurrió un error. Transacción cancelada.' AS mensaje;
    END;

    START TRANSACTION;
    
    SET SQL_SAFE_UPDATES = 0;

    INSERT INTO admin.cargas (`Tabla_Carga`, `Descripcion_Carga`, `Fecha_Carga`)
    VALUES ('ing_customers', 'Carga la tabla de ingesta de customers', NOW());

    SET @ULT_id := LAST_INSERT_ID();

    UPDATE staging.ing_customers
    SET load_id = @ULT_id
    WHERE load_id IS NULL;

    SET SQL_SAFE_UPDATES = 1;

    COMMIT;
    SELECT 'Transacción exitosa' AS mensaje;
END $$

DELIMITER ;

#////////////////////////////////////////////////////////////////////////////////////////////

# Ejecuta el SP (primero hay que cargar la tabla de ingesta de customers):

CALL load_id_ing_customers();


#/////////////////////////////////////////////////////////////////////////////////////////////

############################################################################################################

# DIM_LOCATION

DROP TABLE IF EXISTS dim.dim_location;

CREATE TABLE dim.dim_location (
  `locationID` int NOT NULL AUTO_INCREMENT, 
  `city` varchar(100) DEFAULT NULL,
  `region` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,  
  `load_id` int DEFAULT NULL,
  `ejec_id` int DEFAULT NULL,
  PRIMARY KEY (locationID)
) ;

#----------------------------------------------------------

TRUNCATE dim.dim_location;

#---

DROP PROCEDURE IF EXISTS dim.update_dim_location_from_cust_empl_orders;

# Crea Stored Procedure que actualiza la dimension dim_location:

DELIMITER $$
CREATE PROCEDURE dim.update_dim_location_from_cust_empl_orders()
BEGIN
  DECLARE v_ejec_id INT DEFAULT NULL;

  -- Log de ejecución
  START TRANSACTION;
    INSERT INTO admin.ejecuciones
      (Procedimiento_Nombre, Descripcion_Ejec, Param1_Val, Param2_Val, Param3_Val, Fech_Ejec)
    VALUES
      ('update_dim_location_from_cust_empl_orders', 'Carga y actualización desde customers, employees y orders con city y country equivalences', NULL, NULL, NULL, NOW());
    SET v_ejec_id = LAST_INSERT_ID();

    INSERT INTO admin.ejecuciones_pasos
      (Ejec_id, Nro_Mark, Descripcion_Mark, Activity_Count, Fech_Ejec_Mark)
    VALUES
      (v_ejec_id, 0, 'Inicio de SP', NULL, NOW());
  COMMIT;

  -- ====================
  -- Desde CUSTOMERS
  -- ====================

  -- INSERT nuevos
  INSERT INTO dim.dim_location (city, region, country, load_id, ejec_id)
  SELECT DISTINCT
      COALESCE(e.city_equi, TRIM(c.city)) AS city,
      c.region,
      COALESCE(ce.country_equi, c.country) AS country,
      c.load_id,
      v_ejec_id
  FROM staging.ing_customers c   /* Antes iba a staging.customers */
  LEFT JOIN admin.city_equivalences e ON TRIM(c.city) = e.city_ing COLLATE utf8mb4_bin
  LEFT JOIN admin.country_equivalences ce ON c.country = ce.country_ing COLLATE utf8mb4_bin
  LEFT JOIN dim.dim_location d ON d.city = COALESCE(e.city_equi, TRIM(c.city)) AND d.country = COALESCE(ce.country_equi, c.country)
  WHERE d.city IS NULL;

  -- UPDATE existentes
  SET SQL_SAFE_UPDATES = 0;
  UPDATE dim.dim_location d
  JOIN (
    SELECT DISTINCT
      COALESCE(e.city_equi, TRIM(c.city)) AS city,
      c.region,
      COALESCE(ce.country_equi, c.country) AS country,
      c.load_id
    FROM staging.ing_customers c /* Antes iba a staging.customers */
    LEFT JOIN admin.city_equivalences e ON TRIM(c.city) = e.city_ing COLLATE utf8mb4_bin
    LEFT JOIN admin.country_equivalences ce ON c.country = ce.country_ing COLLATE utf8mb4_bin
  ) AS src ON d.city = src.city AND d.country = src.country
  SET
    d.region = src.region,
    d.load_id = src.load_id,
    d.ejec_id = v_ejec_id;
  SET SQL_SAFE_UPDATES = 1;

  -- ====================
  -- Desde EMPLOYEES
  -- ====================

  -- INSERT nuevos
  INSERT INTO dim.dim_location (city, region, country, load_id, ejec_id)
  SELECT DISTINCT
      COALESCE(e.city_equi, TRIM(emp.city)) AS city,
      emp.region,
      COALESCE(ce.country_equi, emp.country) AS country,
      emp.load_id,
      v_ejec_id
  FROM staging.employees emp
  LEFT JOIN admin.city_equivalences e ON TRIM(emp.city) = e.city_ing COLLATE utf8mb4_bin
  LEFT JOIN admin.country_equivalences ce ON emp.country = ce.country_ing COLLATE utf8mb4_bin
  LEFT JOIN dim.dim_location d ON d.city = COALESCE(e.city_equi, TRIM(emp.city)) AND d.country = COALESCE(ce.country_equi, emp.country)
  WHERE d.city IS NULL;

  -- UPDATE existentes
  SET SQL_SAFE_UPDATES = 0;
  UPDATE dim.dim_location d
  JOIN (
    SELECT DISTINCT
      COALESCE(e.city_equi, TRIM(emp.city)) AS city,
      emp.region,
      COALESCE(ce.country_equi, emp.country) AS country,
      emp.load_id
    FROM staging.employees emp
    LEFT JOIN admin.city_equivalences e ON TRIM(emp.city) = e.city_ing COLLATE utf8mb4_bin
    LEFT JOIN admin.country_equivalences ce ON emp.country = ce.country_ing COLLATE utf8mb4_bin
  ) AS src ON d.city = src.city AND d.country = src.country
  SET
    d.region = src.region,
    d.load_id = src.load_id,
    d.ejec_id = v_ejec_id;
  SET SQL_SAFE_UPDATES = 1;

  -- ====================
  -- Desde ORDERS
  -- ====================

  -- INSERT nuevos
  INSERT INTO dim.dim_location (city, region, country, load_id, ejec_id)
  SELECT DISTINCT
      COALESCE(e.city_equi, TRIM(o.shipCity)) AS city,
      o.shipRegion,
      COALESCE(ce.country_equi, o.shipCountry) AS country,
      o.load_id,
      v_ejec_id
  FROM staging.orders o
  LEFT JOIN admin.city_equivalences e ON TRIM(o.shipCity) = e.city_ing COLLATE utf8mb4_bin
  LEFT JOIN admin.country_equivalences ce ON o.shipCountry = ce.country_ing COLLATE utf8mb4_bin
  LEFT JOIN dim.dim_location d ON d.city = COALESCE(e.city_equi, TRIM(o.shipCity)) AND d.country = COALESCE(ce.country_equi, o.shipCountry)
  WHERE d.city IS NULL;

  -- UPDATE existentes
  SET SQL_SAFE_UPDATES = 0;
  UPDATE dim.dim_location d
  JOIN (
    SELECT DISTINCT
      COALESCE(e.city_equi, TRIM(o.shipCity)) AS city,
      o.shipRegion,
      COALESCE(ce.country_equi, o.shipCountry) AS country,
      o.load_id
    FROM staging.orders o
    LEFT JOIN admin.city_equivalences e ON TRIM(o.shipCity) = e.city_ing COLLATE utf8mb4_bin
    LEFT JOIN admin.country_equivalences ce ON o.shipCountry = ce.country_ing COLLATE utf8mb4_bin
  ) AS src ON d.city = src.city AND d.country = src.country
  SET
    d.region = src.shipRegion,
    d.load_id = src.load_id,
    d.ejec_id = v_ejec_id;
  SET SQL_SAFE_UPDATES = 1;

END$$
DELIMITER ;


#------------------

CALL dim.update_dim_location_from_cust_empl_orders();




#################################################################################################
# PARTE 2 (CUSTOMERS)

DROP TABLE IF EXISTS staging.customers;

CREATE TABLE staging.customers (
   customerID VARCHAR(10),
   companyName VARCHAR(200),
   contactName VARCHAR(200),
   contactTitle VARCHAR(100),
   address VARCHAR(200),
   city_orig VARCHAR(100),
   region_orig VARCHAR(100),
   postalCode VARCHAR(30),
   country_orig VARCHAR(100),
   phone VARCHAR(30),
   fax VARCHAR(30),
   id_location INT,
   load_id INT DEFAULT NULL,
   ejec_id INT DEFAULT NULL
) ;

#----------------------------------------

-- Crear tabla de errores si no existe

DROP TABLE IF EXISTS staging.error_customers;

CREATE TABLE staging.error_customers (
  customerID TEXT,
   companyName TEXT,
   contactName TEXT,
   contactTitle TEXT,
   address TEXT,
   city TEXT,
   region TEXT,
   postalCode TEXT,
   country TEXT,
   phone TEXT,
   fax TEXT,
  load_id INT,
  ejec_id INT DEFAULT NULL,
  fecha_carga DATETIME,
  error_message TEXT,
  error_ts DATETIME DEFAULT CURRENT_TIMESTAMP
) ;

#--------------------------------------

DROP TABLE IF EXISTS staging.warnings_customers;

CREATE TABLE staging.warnings_customers (
  customerID TEXT,
  warning_message TEXT,
  load_id INT,
  fecha_carga DATETIME,
  ejec_id INT DEFAULT NULL,
  error_ts DATETIME
) ;

#------------------------------------

DROP PROCEDURE IF EXISTS staging.load_customers;

DELIMITER $$
CREATE PROCEDURE staging.load_customers()
BEGIN
  DECLARE done INT DEFAULT 0;
  DECLARE v_id TEXT;
  DECLARE v_company TEXT;
  DECLARE v_contact TEXT;
  DECLARE v_title TEXT;
  DECLARE v_address TEXT;
  DECLARE v_city TEXT;
  DECLARE v_region TEXT;
  DECLARE v_postal TEXT;
  DECLARE v_country TEXT;
  DECLARE v_phone TEXT;
  DECLARE v_fax TEXT;
  DECLARE v_fecha DATETIME;
  DECLARE v_load_id INT;
  DECLARE v_err TEXT;
  DECLARE v_warn TEXT;
  DECLARE v_ejec_id INT DEFAULT NULL;
  DECLARE v_ult_ejec_id INT;
  DECLARE v_city_equi TEXT;
  DECLARE v_country_equi TEXT;
  DECLARE v_location_id INT;

  DECLARE cur CURSOR FOR
    SELECT customerID, companyName, contactName, contactTitle,
           address, city, region, postalCode, country,
           phone, fax, fecha_carga, load_id
    FROM staging.ing_customers;

  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

  START TRANSACTION;
    INSERT INTO admin.ejecuciones
      (Procedimiento_Nombre, Descripcion_Ejec, Param1_Val, Param2_Val, Param3_Val, Fech_Ejec)
    VALUES
      ('LOAD_customers', 'Carga desde ing_customers', NULL, NULL, NULL, NOW());
    SET v_ult_ejec_id = LAST_INSERT_ID();

    INSERT INTO admin.ejecuciones_pasos
      (Ejec_id, Nro_Mark, Descripcion_Mark, Activity_Count, Fech_Ejec_Mark)
    VALUES
      (v_ult_ejec_id, 0, 'Inicio de SP', NULL, NOW());
  COMMIT;

  OPEN cur;

  read_loop: LOOP
    FETCH cur INTO v_id, v_company, v_contact, v_title,
                  v_address, v_city, v_region, v_postal, v_country,
                  v_phone, v_fax, v_fecha, v_load_id;
    IF done THEN
      LEAVE read_loop;
    END IF;

    SET v_err = '';
    SET v_warn = '';
    SET v_city_equi = NULL;
    SET v_country_equi = NULL;
    SET v_location_id = NULL;

    IF v_id IS NULL OR v_id = '' THEN
      SET v_err = 'customerID is NULL or empty';
    ELSEIF CHAR_LENGTH(v_id) != 5 THEN
      SET v_err = 'customerID must have exactly 5 characters';
    END IF;

    -- Buscar city equivalente
    SELECT city_equi INTO v_city_equi
    FROM admin.city_equivalences
    WHERE TRIM(v_city) = city_ing COLLATE utf8mb4_bin
    LIMIT 1;

    IF v_city_equi IS NULL THEN
      SET v_city_equi = TRIM(v_city);
    END IF;

    -- Buscar country equivalente
    SELECT country_equi INTO v_country_equi
    FROM admin.country_equivalences
    WHERE TRIM(v_country) = country_ing COLLATE utf8mb4_bin
    LIMIT 1;

    IF v_country_equi IS NULL THEN
      SET v_country_equi = TRIM(v_country);
    END IF;

    -- Buscar locationID con equivalencias
    SELECT locationID INTO v_location_id
    FROM dim.dim_location
    WHERE city = v_city_equi AND country = v_country_equi
    LIMIT 1;

    IF v_err != '' THEN
      INSERT INTO staging.error_customers
        (customerID, companyName, contactName, contactTitle, address, city_orig,
         region_orig, postalCode, country_orig, phone, fax, fecha_carga, load_id, ejec_id, error_message, error_ts)
      VALUES
        (v_id, v_company, v_contact, v_title, v_address, v_city,
         v_region, v_postal, v_country, v_phone, v_fax, v_fecha, v_load_id, v_ult_ejec_id, v_err, NOW());
    ELSE
      INSERT INTO staging.customers
        (customerID, companyName, contactName, contactTitle, address, city_orig,
         region_orig, postalCode, country_orig, phone, fax, load_id, ejec_id, id_location)
      VALUES
        (v_id, v_company, v_contact, v_title, v_address, v_city,
         v_region, v_postal, v_country, v_phone, v_fax, v_load_id, v_ult_ejec_id, v_location_id);

      -- Advertencias
      IF v_company IS NULL OR v_company = '' THEN
        SET v_warn = CONCAT(v_warn, 'companyName is null or empty; ');
      END IF;
      IF v_contact IS NULL OR v_contact = '' THEN
        SET v_warn = CONCAT(v_warn, 'contactName is null or empty; ');
      END IF;
      IF v_address IS NULL OR v_address = '' THEN
        SET v_warn = CONCAT(v_warn, 'address is null or empty; ');
      END IF;
      IF v_city IS NULL OR v_city = '' THEN
        SET v_warn = CONCAT(v_warn, 'city_orig is null or empty; ');
      END IF;
      IF v_country IS NULL OR v_country = '' THEN
        SET v_warn = CONCAT(v_warn, 'country_orig is null or empty; ');
      END IF;
      IF v_phone IS NULL OR v_phone = '' THEN
        SET v_warn = CONCAT(v_warn, 'phone is null or empty; ');
      END IF;

      IF v_warn != '' THEN
        INSERT INTO staging.warnings_customers
          (customerID, warning_message, fecha_carga, load_id, ejec_id, error_ts)
        VALUES
          (v_id, v_warn, v_fecha, v_load_id, v_ult_ejec_id, NOW());
      END IF;
    END IF;
  END LOOP;

  CLOSE cur;
END$$
DELIMITER ;

#-----------------------------------------------

# Ejecuta el SP:

CALL staging.load_customers();


#------------------------------


DROP TABLE IF EXISTS dw.customers;

# Crea la tabla de customers de DW

CREATE TABLE dw.customers (
   customerID VARCHAR(10),
   companyName VARCHAR(200),
   contactName VARCHAR(200),
   contactTitle VARCHAR(100),
   address VARCHAR(200),
   city_orig VARCHAR(100),
   region_orig VARCHAR(100),
   postalCode VARCHAR(30),
   country_orig VARCHAR(100),
   phone VARCHAR(30),
   fax VARCHAR(30),
   id_location INT,
   start_date DATETIME,
   end_date DATETIME,
   vigente_flg TINYINT,
   load_id INT DEFAULT NULL,
   ejec_id INT DEFAULT NULL,
   PRIMARY KEY (customerID, start_date)
) ;



DROP TABLE IF EXISTS dw.error_customers;

CREATE TABLE IF NOT EXISTS dw.error_customers (
  customerID TEXT,
   companyName TEXT,
   contactName TEXT,
   contactTitle TEXT,
   address TEXT,
   city_orig TEXT,
   region_orig TEXT,
   postalCode TEXT,
   country_orig TEXT,
   phone TEXT,
   fax TEXT,
   id_location INT,
  load_id INT,
  ejec_id INT DEFAULT NULL,
  fecha_carga DATETIME,
  error_message TEXT,
  error_ts DATETIME DEFAULT CURRENT_TIMESTAMP
) ;


#///////////----------------------------------------------

DROP PROCEDURE IF EXISTS dw.insert_customers_from_staging;

#--------------

DELIMITER $$
CREATE PROCEDURE dw.insert_customers_from_staging()
BEGIN
  DECLARE done INT DEFAULT 0;
  DECLARE v_id VARCHAR(10);
  DECLARE v_company VARCHAR(200);
  DECLARE v_contact VARCHAR(200);
  DECLARE v_title VARCHAR(100);
  DECLARE v_address VARCHAR(200);
  DECLARE v_city_orig VARCHAR(100);
  DECLARE v_region_orig VARCHAR(100);
  DECLARE v_postal VARCHAR(30);
  DECLARE v_country_orig VARCHAR(100);
  DECLARE v_phone VARCHAR(30);
  DECLARE v_fax VARCHAR(30);
  DECLARE v_id_location INT;
  DECLARE v_load_id INT;
  DECLARE v_ejec_id INT;
  DECLARE v_ult_ejec_id INT;
  DECLARE v_fecha_carga DATETIME;
  DECLARE v_error TEXT;
  DECLARE v_count INT;
  DECLARE v_old_company VARCHAR(200);
  DECLARE v_old_contact VARCHAR(200);
  DECLARE v_old_address VARCHAR(200);

  DECLARE cur CURSOR FOR
    SELECT customerID, companyName, contactName, contactTitle,
           address, city_orig, region_orig, postalCode, country_orig,
           phone, fax, id_location, load_id, ejec_id, NOW()
    FROM staging.customers;

  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

  -- Registrar ejecución en admin.ejecuciones
  START TRANSACTION;
    INSERT INTO admin.ejecuciones
      (Procedimiento_Nombre, Descripcion_Ejec, Param1_Val, Param2_Val, Param3_Val, Fech_Ejec)
    VALUES
      ('insert_customers_from_staging', 'Carga a dw desde staging de tabla customers', NULL, NULL, NULL, NOW());
    SET v_ult_ejec_id = LAST_INSERT_ID();

    INSERT INTO admin.ejecuciones_pasos
      (Ejec_id, Nro_Mark, Descripcion_Mark, Activity_Count, Fech_Ejec_Mark)
    VALUES
      (v_ult_ejec_id, 0, 'Inicio de SP', NULL, NOW());
  COMMIT;

  OPEN cur;

  read_loop: LOOP
    FETCH cur INTO v_id, v_company, v_contact, v_title,
                  v_address, v_city_orig, v_region_orig, v_postal,
                  v_country_orig, v_phone, v_fax, v_id_location,
                  v_load_id, v_ejec_id, v_fecha_carga;
    IF done THEN
      LEAVE read_loop;
    END IF;

    -- Verificar si el customer_id está duplicado en staging
    SELECT COUNT(*) INTO v_count
    FROM staging.customers
    WHERE customerID = v_id;

    IF v_count > 1 THEN
      SET v_error = 'Duplicate customerID in staging';
      INSERT INTO dw.error_customers (
        customerID, companyName, contactName, contactTitle, address, city_orig,
        region_orig, postalCode, country_orig, phone, fax, id_location,
        load_id, ejec_id, fecha_carga, error_message, error_ts)
      VALUES (
        v_id, v_company, v_contact, v_title, v_address, v_city_orig,
        v_region_orig, v_postal, v_country_orig, v_phone, v_fax, v_id_location,
        v_load_id, v_ult_ejec_id, v_fecha_carga, v_error, NOW());
    ELSE
      -- Verificar si existe una versión vigente del customer
      IF EXISTS (SELECT 1 FROM dw.customers WHERE customerID = v_id AND vigente_flg = 1) THEN

        SELECT companyName, contactName, address
        INTO v_old_company, v_old_contact, v_old_address
        FROM dw.customers
        WHERE customerID = v_id AND vigente_flg = 1;

        IF v_company != v_old_company OR v_contact != v_old_contact OR v_address != v_old_address THEN
          -- Cerrar la versión actual
          UPDATE dw.customers
          SET vigente_flg = 0, end_date = NOW()
          WHERE customerID = v_id AND vigente_flg = 1;

          -- Insertar nueva versión con cambios en campos SCD2
          INSERT INTO dw.customers (
            customerID, companyName, contactName, contactTitle, address, city_orig, region_orig,
            postalCode, country_orig, phone, fax, id_location, start_date, end_date, vigente_flg, load_id, ejec_id)
          VALUES (
            v_id, v_company, v_contact, v_title, v_address, v_city_orig, v_region_orig,
            v_postal, v_country_orig, v_phone, v_fax, v_id_location, NOW(), NULL, 1, v_load_id, v_ult_ejec_id);
        ELSE
          -- Actualizar campos SCD1 en la versión vigente
          UPDATE dw.customers
          SET contactTitle = v_title,
              city_orig = v_city_orig,
              region_orig = v_region_orig,
              postalCode = v_postal,
              country_orig = v_country_orig,
              phone = v_phone,
              fax = v_fax,
              id_location = v_id_location,
              load_id = v_load_id,
              ejec_id = v_ult_ejec_id
          WHERE customerID = v_id AND vigente_flg = 1;
        END IF;
      ELSE
        -- Primera inserción del customer
        INSERT INTO dw.customers (
          customerID, companyName, contactName, contactTitle, address, city_orig, region_orig,
          postalCode, country_orig, phone, fax, id_location, start_date, end_date, vigente_flg, load_id, ejec_id)
        VALUES (
          v_id, v_company, v_contact, v_title, v_address, v_city_orig, v_region_orig,
          v_postal, v_country_orig, v_phone, v_fax, v_id_location, NOW(), NULL, 1, v_load_id, v_ult_ejec_id);
      END IF;
    END IF;
  END LOOP;

  CLOSE cur;
END$$
DELIMITER ;

#--------------------------------------------------------

CALL dw.insert_customers_from_staging();

#------------------------------------------------------------


#####################################################################
#
# DIM_CUSTOMERS
#

DROP TABLE IF EXISTS dim.dim_customers;

CREATE TABLE dim.dim_customers (
  `customerID` varchar(10) NOT NULL,
  `companyName` varchar(200) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `postalCode` varchar(30) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `id_location` int DEFAULT NULL,
  `ejec_id` int DEFAULT NULL,
  PRIMARY KEY (`customerID`)
) ;


#----------------------------

DROP PROCEDURE IF EXISTS dim.construct_dim_customer;

# El siguiente stored procedure construye la dimension dim_customers entera (desde cero) desde dw.customers:

DELIMITER $$
CREATE PROCEDURE dim.construct_dim_customer()
BEGIN
  DECLARE v_ejec_id INT;

  -- Iniciar transacción
  START TRANSACTION;
  
  SET SQL_SAFE_UPDATES = 0;

  -- Log de ejecución
  INSERT INTO admin.ejecuciones (
    Procedimiento_Nombre,
    Descripcion_Ejec,
    Param1_Val,
    Param2_Val,
    Param3_Val,
    Fech_Ejec
  )
  VALUES (
    'construct_dim_customer',
    'Reconstrucción total de la dimensión dim_customers desde dw.customers',
    NULL, NULL, NULL, NOW());

  SET v_ejec_id = LAST_INSERT_ID();

  INSERT INTO admin.ejecuciones_pasos (
    Ejec_id,
    Nro_Mark,
    Descripcion_Mark,
    Activity_Count,
    Fech_Ejec_Mark
  )
  VALUES (
    v_ejec_id,
    0,
    'Inicio de construcción de dimensión customer',
    NULL,
    NOW()
  );

  -- Borrar todos los registros existentes
  DELETE FROM dim.dim_customers;

  -- Insertar nueva "foto" desde dw.customers donde vigente_flg = 1
  INSERT INTO dim.dim_customers (
    customerID,
    companyName,
    address,
    postalCode,
    phone,
    id_location,
    ejec_id
  )
  SELECT
    customerID,
    companyName,
    address,
    postalCode,
    phone,
    id_location,
    v_ejec_id
  FROM dw.customers
  WHERE vigente_flg = 1;
  
  SET SQL_SAFE_UPDATES = 1;

  -- Confirmar todo
  COMMIT;
END$$
DELIMITER ;

#-------------------------

CALL dim.construct_dim_customer();

######################################################################

# DIM_PRODUCTS

DROP TABLE IF EXISTS dim.dim_products;
  
CREATE TABLE dim.dim_products (
  `productID` int NOT NULL,
  `productName` varchar(200) DEFAULT NULL,
  `supplierID` int DEFAULT NULL,
  `categoryID` int DEFAULT NULL,
  `quantityPerUnit` varchar(100) DEFAULT NULL,
  `unitPrice` decimal(18,2) DEFAULT NULL,
  `discontinued` tinyint(1) DEFAULT NULL,
  `load_id` int DEFAULT NULL,
  `ejec_id` int DEFAULT NULL,
  PRIMARY KEY (productID)
);

DROP TABLE IF EXISTS dim.error_dim_products;

CREATE TABLE dim.error_dim_products (
  `productID` int,
  `productName` varchar(200) DEFAULT NULL,
  `supplierID` int DEFAULT NULL,
  `categoryID` int DEFAULT NULL,
  `quantityPerUnit` varchar(100) DEFAULT NULL,
  `unitPrice` decimal(18,2) DEFAULT NULL,
  `discontinued` tinyint(1) DEFAULT NULL,
  `load_id` int DEFAULT NULL,
  `ejec_id` int DEFAULT NULL,
  `error_message` text,
  `error_ts` datetime DEFAULT CURRENT_TIMESTAMP
);


#------

DROP PROCEDURE IF EXISTS dim.actualice_dim_products;

DELIMITER $$
CREATE PROCEDURE dim.actualice_dim_products()
BEGIN
  DECLARE v_ejec_id INT DEFAULT NULL;

  -- Log de ejecución
  START TRANSACTION;
    INSERT INTO admin.ejecuciones
      (Procedimiento_Nombre, Descripcion_Ejec, Param1_Val, Param2_Val, Param3_Val, Fech_Ejec)
    VALUES
      ('actualice_dim_products', 'Inserta o actualiza registros en dim_products desde staging.products', NULL, NULL, NULL, NOW());
    SET v_ejec_id = LAST_INSERT_ID();

    INSERT INTO admin.ejecuciones_pasos
      (Ejec_id, Nro_Mark, Descripcion_Mark, Activity_Count, Fech_Ejec_Mark)
    VALUES
      (v_ejec_id, 0, 'Inicio de SP', NULL, NOW());
  COMMIT;

  -- Insertar en tabla de errores los registros con productID nulo o duplicado
  INSERT INTO dim.error_dim_products (
    productID, productName, supplierID, categoryID,
    quantityPerUnit, unitPrice, discontinued,
    load_id, ejec_id, error_message, error_ts
  )
  SELECT 
    p.productID, p.productName, p.supplierID, p.categoryID,
    p.quantityPerUnit, p.unitPrice, p.discontinued,
    p.load_id, v_ejec_id,
    CASE 
      WHEN p.productID IS NULL OR TRIM(p.productID) = '' THEN 'id del producto vacío'
      ELSE 'id del producto duplicado'
    END,
    NOW()
  FROM staging.products p
  LEFT JOIN (
    SELECT productID
    FROM staging.products
    WHERE productID IS NOT NULL AND TRIM(productID) != ''
    GROUP BY productID
    HAVING COUNT(*) = 1
  ) valid_ids ON p.productID = valid_ids.productID
  WHERE valid_ids.productID IS NULL OR p.productID IS NULL OR TRIM(p.productID) = '';

  -- INSERT nuevos productos válidos
  INSERT INTO dim.dim_products (
    productID, productName, supplierID, categoryID,
    quantityPerUnit, unitPrice, discontinued,
    load_id, ejec_id
  )
  SELECT 
    p.productID, p.productName, p.supplierID, p.categoryID,
    p.quantityPerUnit, p.unitPrice, p.discontinued,
    p.load_id, v_ejec_id
  FROM staging.products p
  LEFT JOIN dim.dim_products d ON p.productID = d.productID
  LEFT JOIN (
    SELECT productID
    FROM staging.products
    WHERE productID IS NOT NULL AND TRIM(productID) != ''
    GROUP BY productID
    HAVING COUNT(*) = 1
  ) valid_ids ON p.productID = valid_ids.productID
  WHERE d.productID IS NULL AND valid_ids.productID IS NOT NULL;

  -- UPDATE productos existentes válidos
  SET SQL_SAFE_UPDATES = 0;
  UPDATE dim.dim_products d
  JOIN staging.products p ON d.productID = p.productID
  JOIN (
    SELECT productID
    FROM staging.products
    WHERE productID IS NOT NULL AND TRIM(productID) != ''
    GROUP BY productID
    HAVING COUNT(*) = 1
  ) valid_ids ON p.productID = valid_ids.productID
  SET 
    d.productName = p.productName,
    d.supplierID = p.supplierID,
    d.categoryID = p.categoryID,
    d.quantityPerUnit = p.quantityPerUnit,
    d.unitPrice = p.unitPrice,
    d.discontinued = p.discontinued,
    d.load_id = p.load_id,
    d.ejec_id = v_ejec_id;
  SET SQL_SAFE_UPDATES = 1;

END$$
DELIMITER ;


#------

CALL dim.actualice_dim_products();


###############################################################################

# DIM_EMPLOYEES

DROP TABLE IF EXISTS dim.dim_employees;

CREATE TABLE dim.dim_employees (
  `employeeID` int NOT NULL,
  `lastName` varchar(50) DEFAULT NULL,
  `firstName` varchar(50) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `titleOfCourtesy` varchar(10) DEFAULT NULL,
  `birthDate` date DEFAULT NULL,
  `hireDate` date DEFAULT NULL,
   locationID INT,
  `load_id` int DEFAULT NULL,
  `ejec_id` int DEFAULT NULL,
  PRIMARY KEY (employeeID)
); 

DROP TABLE IF EXISTS dim.error_dim_employees;

CREATE TABLE dim.error_dim_employees (
  `employeeID` int NOT NULL,
  `lastName` varchar(50) DEFAULT NULL,
  `firstName` varchar(50) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `titleOfCourtesy` varchar(10) DEFAULT NULL,
  `birthDate` date DEFAULT NULL,
  `hireDate` date DEFAULT NULL,
   locationID INT,
  `load_id` int DEFAULT NULL,
  `ejec_id` int DEFAULT NULL,
  `error_message` text,
  `error_ts` datetime DEFAULT CURRENT_TIMESTAMP
); 

#-------------------

DROP PROCEDURE IF EXISTS dim.actualice_dim_employees;

DELIMITER $$
CREATE PROCEDURE dim.actualice_dim_employees()
BEGIN
  DECLARE v_ejec_id INT DEFAULT NULL;

  -- Log de ejecución
  START TRANSACTION;
    INSERT INTO admin.ejecuciones
      (Procedimiento_Nombre, Descripcion_Ejec, Param1_Val, Param2_Val, Param3_Val, Fech_Ejec)
    VALUES
      ('actualice_dim_employees', 'Inserta o actualiza registros en dim_employees desde staging.employees', NULL, NULL, NULL, NOW());
    SET v_ejec_id = LAST_INSERT_ID();

    INSERT INTO admin.ejecuciones_pasos
      (Ejec_id, Nro_Mark, Descripcion_Mark, Activity_Count, Fech_Ejec_Mark)
    VALUES
      (v_ejec_id, 0, 'Inicio de SP', NULL, NOW());
  COMMIT;

  -- Insertar errores: IDs nulos o duplicados
  INSERT INTO dim.error_dim_employees (
    employeeID, lastName, firstName, title, titleOfCourtesy, birthDate, hireDate,
    locationID, load_id, ejec_id, error_message, error_ts
  )
  SELECT 
    e.employeeID, e.lastName, e.firstName, e.title, e.titleOfCourtesy, e.birthDate, e.hireDate,
    NULL, e.load_id, v_ejec_id,
    CASE 
      WHEN e.employeeID IS NULL THEN 'id del empleado vacío'
      WHEN dup.cnt > 1 THEN 'id del empleado duplicado'
      ELSE 'otro error'
    END,
    NOW()
  FROM staging.employees e
  LEFT JOIN (
    SELECT employeeID, COUNT(*) as cnt
    FROM staging.employees
    GROUP BY employeeID
  ) dup ON e.employeeID = dup.employeeID
  WHERE e.employeeID IS NULL OR dup.cnt > 1;

  -- Insertar empleados válidos
  INSERT INTO dim.dim_employees (
    employeeID, lastName, firstName, title, titleOfCourtesy, birthDate, hireDate,
    locationID, load_id, ejec_id
  )
  SELECT 
    e.employeeID, e.lastName, e.firstName, e.title, e.titleOfCourtesy, e.birthDate, e.hireDate,
    l.locationID, e.load_id, v_ejec_id
  FROM staging.employees e
  LEFT JOIN (
    SELECT employeeID
    FROM staging.employees
    WHERE employeeID IS NOT NULL
    GROUP BY employeeID
    HAVING COUNT(*) = 1
  ) valid ON e.employeeID = valid.employeeID
  LEFT JOIN admin.city_equivalences ce ON TRIM(e.city) COLLATE utf8mb4_bin = ce.city_ing
  LEFT JOIN admin.country_equivalences co ON TRIM(e.country) COLLATE utf8mb4_bin = co.country_ing
  LEFT JOIN dim.dim_location l 
    ON l.city = COALESCE(ce.city_equi, TRIM(e.city))
   AND l.country = COALESCE(co.country_equi, TRIM(e.country))
  LEFT JOIN dim.dim_employees d ON d.employeeID = e.employeeID
  WHERE d.employeeID IS NULL AND valid.employeeID IS NOT NULL;

  -- Actualizar empleados existentes
  SET SQL_SAFE_UPDATES = 0;
  UPDATE dim.dim_employees d
  JOIN staging.employees e ON d.employeeID = e.employeeID
  JOIN (
    SELECT employeeID
    FROM staging.employees
    WHERE employeeID IS NOT NULL
    GROUP BY employeeID
    HAVING COUNT(*) = 1
  ) valid ON e.employeeID = valid.employeeID
  LEFT JOIN admin.city_equivalences ce ON TRIM(e.city) COLLATE utf8mb4_bin = ce.city_ing
  LEFT JOIN admin.country_equivalences co ON TRIM(e.country) COLLATE utf8mb4_bin = co.country_ing
  LEFT JOIN dim.dim_location l 
    ON l.city = COALESCE(ce.city_equi, TRIM(e.city))
   AND l.country = COALESCE(co.country_equi, TRIM(e.country))
  SET 
    d.lastName = e.lastName,
    d.firstName = e.firstName,
    d.title = e.title,
    d.titleOfCourtesy = e.titleOfCourtesy,
    d.birthDate = e.birthDate,
    d.hireDate = e.hireDate,
    d.locationID = l.locationID,
    d.load_id = e.load_id,
    d.ejec_id = v_ejec_id;
  SET SQL_SAFE_UPDATES = 1;

END$$
DELIMITER ;
#----

CALL dim.actualice_dim_employees();

##########################################################

# FACT_ORDERS

DROP TABLE IF EXISTS dim.fact_orders;

CREATE TABLE dim.fact_orders (
  id_fact_orders INT NOT NULL AUTO_INCREMENT,
  orderID INT,
  productID INT,
  customerID VARCHAR(10),
  employeeID INT,
  orderDate DATE,
  requiredDate DATE,
  shippedDate DATE,
  ship_locationID INT,
  unitPrice DECIMAL(18,2),
  quantity SMALLINT,
  discount DECIMAL(18,2),
  total_price DECIMAL(18,2),
  load_id INT DEFAULT NULL,
  ejec_id INT DEFAULT NULL,
  PRIMARY KEY (id_fact_orders)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS dim.error_fact_orders;

CREATE TABLE dim.error_fact_orders (
  orderID INT,
  productID INT,
  customerID VARCHAR(10),
  employeeID INT,
  orderDate DATE,
  requiredDate DATE,
  shippedDate DATE,
  shipCity varchar(100) DEFAULT NULL,
  shipRegion varchar(100) DEFAULT NULL,
  shipCountry varchar(100) DEFAULT NULL,
  unitPrice DECIMAL(18,2),
  quantity SMALLINT,
  discount DECIMAL(18,2),
  `load_id` int DEFAULT NULL,
  `ejec_id` int DEFAULT NULL,
  `error_message` text,
  `error_ts` datetime DEFAULT CURRENT_TIMESTAMP
); 



#----------------

DROP PROCEDURE IF EXISTS dim.load_fact_orders;

DELIMITER $$
CREATE PROCEDURE dim.load_fact_orders()
BEGIN
  DECLARE v_ejec_id INT;
  DECLARE done INT DEFAULT 0;

  DECLARE v_orderID INT;
  DECLARE v_productID INT;
  DECLARE v_customerID VARCHAR(10);
  DECLARE v_employeeID INT;
  DECLARE v_orderDate DATE;
  DECLARE v_requiredDate DATE;
  DECLARE v_shippedDate DATE;
  DECLARE v_shipCity VARCHAR(100);
  DECLARE v_shipRegion VARCHAR(100);
  DECLARE v_shipCountry VARCHAR(100);
  DECLARE v_unitPrice DECIMAL(18,2);
  DECLARE v_quantity SMALLINT;
  DECLARE v_discount DECIMAL(18,2);
  DECLARE v_load_id INT;
  DECLARE v_locationID INT;
  DECLARE v_city_equi VARCHAR(100);
  DECLARE v_country_equi VARCHAR(100);
  DECLARE v_error_message TEXT;

  DECLARE cur CURSOR FOR
    SELECT o.orderID, od.productID, o.customerID, o.employeeID, o.orderDate,
           o.requiredDate, o.shippedDate, o.shipCity, o.shipRegion, o.shipCountry,
           od.unitPrice, od.quantity, od.discount, od.load_id
    FROM staging.order_details od
    JOIN staging.orders o ON od.orderID = o.orderID;

  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

  START TRANSACTION;
    INSERT INTO admin.ejecuciones
      (Procedimiento_Nombre, Descripcion_Ejec, Param1_Val, Param2_Val, Param3_Val, Fech_Ejec)
    VALUES
      ('load_fact_orders', 'Carga de datos en fact_orders desde staging', NULL, NULL, NULL, NOW());
    SET v_ejec_id = LAST_INSERT_ID();

    INSERT INTO admin.ejecuciones_pasos
      (Ejec_id, Nro_Mark, Descripcion_Mark, Activity_Count, Fech_Ejec_Mark)
    VALUES
      (v_ejec_id, 0, 'Inicio de SP', NULL, NOW());
  COMMIT;

  OPEN cur;
  read_loop: LOOP
    FETCH cur INTO v_orderID, v_productID, v_customerID, v_employeeID, v_orderDate,
                    v_requiredDate, v_shippedDate, v_shipCity, v_shipRegion, v_shipCountry,
                    v_unitPrice, v_quantity, v_discount, v_load_id;

    IF done THEN
      LEAVE read_loop;
    END IF;

    SET v_error_message = NULL;
    SET v_city_equi = NULL;
    SET v_country_equi = NULL;
    SET v_locationID = NULL;

    -- Validar existencia en dimensiones
    IF NOT EXISTS (SELECT 1 FROM dim.dim_customers WHERE customerID = v_customerID) THEN
      SET v_error_message = CONCAT_WS('; ', v_error_message, 'El customer id no existe en la tabla dimensional');
    END IF;

    IF NOT EXISTS (SELECT 1 FROM dim.dim_employees WHERE employeeID = v_employeeID) THEN
      SET v_error_message = CONCAT_WS('; ', v_error_message, 'El employee id no existe en la tabla dimensional');
    END IF;

   # -- Validar duplicados
   # IF EXISTS (SELECT 1 FROM dim.fact_orders WHERE orderID = v_orderID AND productID = v_productID) THEN
   #   SET v_error_message = CONCAT_WS('; ', v_error_message, 'El order id ya existía en la fact_orders');
   # END IF;

    -- Obtener equivalencias (seguro)
    SELECT COALESCE((
      SELECT city_equi
      FROM admin.city_equivalences
      WHERE TRIM(v_shipCity) COLLATE utf8mb4_bin = city_ing COLLATE utf8mb4_bin
      LIMIT 1
    ), TRIM(v_shipCity)) INTO v_city_equi;

    SELECT COALESCE((
      SELECT country_equi
      FROM admin.country_equivalences
      WHERE TRIM(v_shipCountry) COLLATE utf8mb4_bin = country_ing COLLATE utf8mb4_bin
      LIMIT 1
    ), TRIM(v_shipCountry)) INTO v_country_equi;

    -- Obtener locationID
    SELECT locationID INTO v_locationID
    FROM dim.dim_location
    WHERE city = v_city_equi AND country = v_country_equi
    LIMIT 1;

    IF v_locationID IS NULL THEN
      SET v_error_message = CONCAT_WS('; ', v_error_message, 'No se encontró ubicación en dim_location');
    END IF;

    -- Insertar en fact_orders o error_fact_orders
    IF v_error_message IS NULL THEN
      INSERT INTO dim.fact_orders (
        orderID, productID, customerID, employeeID, orderDate,
        requiredDate, shippedDate, ship_locationID,
        unitPrice, quantity, discount, total_price, load_id, ejec_id
      ) VALUES (
        v_orderID, v_productID, v_customerID, v_employeeID, v_orderDate,
        v_requiredDate, v_shippedDate, v_locationID,
        v_unitPrice, v_quantity, v_discount,
        v_unitPrice * v_quantity * (1 - v_discount),
        v_load_id, v_ejec_id
      );
    ELSE
      INSERT INTO dim.error_fact_orders (
        orderID, productID, customerID, employeeID, orderDate,
        requiredDate, shippedDate, shipCity, shipRegion, shipCountry,
        unitPrice, quantity, discount, load_id, ejec_id,
        error_message, error_ts
      ) VALUES (
        v_orderID, v_productID, v_customerID, v_employeeID, v_orderDate,
        v_requiredDate, v_shippedDate, v_shipCity, v_shipRegion, v_shipCountry,
        v_unitPrice, v_quantity, v_discount, v_load_id, v_ejec_id,
        v_error_message, NOW()
      );
    END IF;

  END LOOP;
  CLOSE cur;

  -- Errores por order_details sin orders
  INSERT INTO dim.error_fact_orders (
    orderID, productID, customerID, employeeID, orderDate,
    requiredDate, shippedDate, shipCity, shipRegion, shipCountry,
    unitPrice, quantity, discount, load_id, ejec_id,
    error_message, error_ts
  )
  SELECT od.orderID, od.productID, NULL, NULL, NULL, NULL, NULL,
         NULL, NULL, NULL, od.unitPrice, od.quantity, od.discount,
         od.load_id, v_ejec_id, 'El order_id no existe en la tabla staging.orders', NOW()
  FROM staging.order_details od
  LEFT JOIN staging.orders o ON od.orderID = o.orderID
  WHERE o.orderID IS NULL;

  -- Errores por orders sin order_details
  INSERT INTO dim.error_fact_orders (
    orderID, productID, customerID, employeeID, orderDate,
    requiredDate, shippedDate, shipCity, shipRegion, shipCountry,
    unitPrice, quantity, discount, load_id, ejec_id,
    error_message, error_ts
  )
  SELECT o.orderID, NULL, o.customerID, o.employeeID, o.orderDate,
         o.requiredDate, o.shippedDate, o.shipCity, o.shipRegion, o.shipCountry,
         NULL, NULL, NULL, o.load_id, v_ejec_id,
         'El order_id no tiene detalle en staging.order_details', NOW()
  FROM staging.orders o
  LEFT JOIN staging.order_details od ON o.orderID = od.orderID
  WHERE od.orderID IS NULL;

END$$
DELIMITER ;


#---
CALL dim.load_fact_orders();


############################################################


# METADATA



DROP TABLE IF EXISTS dqm.metadata;

CREATE TABLE dqm.metadata (
  metadata_id int NOT NULL AUTO_INCREMENT,
  nombre_objeto varchar(100) NOT NULL,
  nombre_schema varchar(20) NOT NULL,
  tipo_objeto varchar(50) NOT NULL,
  descripcion text,
  fecha_actualiz_metadata datetime DEFAULT CURRENT_TIMESTAMP,  
  PRIMARY KEY (metadata_id)
);

#---

-- ADMIN
INSERT INTO dqm.metadata (nombre_objeto, nombre_schema, tipo_objeto, descripcion) VALUES
('cargas', 'admin', 'tabla', 'Registro de lotes de carga.'),
('city_equivalences', 'admin', 'tabla', 'Equivalencias de nombres de ciudades.'),
('country_equivalences', 'admin', 'tabla', 'Equivalencias de nombres de países.'),
('ejecuciones', 'admin', 'tabla', 'Registro de ejecuciones de procedimientos.'),
('ejecuciones_pasos', 'admin', 'tabla', 'Registro de pasos individuales dentro de ejecuciones.'),
('construct_country_equivalence', 'admin', 'procedimiento', 'Construye equivalencias de países usando datos de world_data.');

-- DIM
INSERT INTO dqm.metadata (nombre_objeto, nombre_schema, tipo_objeto, descripcion) VALUES
('dim_customers', 'dim', 'tabla', 'Dimensión de clientes con control de versiones.'),
('dim_employees', 'dim', 'tabla', 'Dimensión de empleados con datos y ubicación.'),
('dim_location', 'dim', 'tabla', 'Dimensión de localización con ciudad, región y país.'),
('dim_products', 'dim', 'tabla', 'Dimensión de productos con control de versiones.'),
('error_dim_employees', 'dim', 'tabla', 'Tabla de errores para carga de empleados en dimensión.'),
('error_dim_products', 'dim', 'tabla', 'Tabla de errores para carga de productos en dimensión.'),
('error_fact_orders', 'dim', 'tabla', 'Errores en la carga de la tabla de hechos de órdenes.'),
('fact_orders', 'dim', 'tabla', 'Tabla de hechos combinando órdenes y detalles.');

-- DW
INSERT INTO dqm.metadata (nombre_objeto, nombre_schema, tipo_objeto, descripcion) VALUES
('customers', 'dw', 'tabla', 'Tabla de clientes con control SCD1 y SCD2.'),
('error_customers', 'dw', 'tabla', 'Errores en la carga de la tabla de clientes.'),
('insert_customers_from_staging', 'dw', 'procedimiento', 'Carga y mantenimiento de clientes desde staging a DW aplicando control SCD.');

-- STAGING (tablas)
INSERT INTO dqm.metadata (nombre_objeto, nombre_schema, tipo_objeto, descripcion) VALUES
('customers', 'staging', 'tabla', 'Datos de clientes ya tipados, listos para cargar.'),
('employees', 'staging', 'tabla', 'Datos de empleados ya tipados.'),
('error_customers', 'staging', 'tabla', 'Errores detectados en los datos de clientes.'),
('error_employees', 'staging', 'tabla', 'Errores detectados en los datos de empleados.'),
('error_order_details', 'staging', 'tabla', 'Errores en detalles de órdenes.'),
('error_orders', 'staging', 'tabla', 'Errores en cabeceras de órdenes.'),
('error_products', 'staging', 'tabla', 'Errores en los productos.'),
('error_world_data', 'staging', 'tabla', 'Errores al cargar datos globales (world_data).'),
('ing_customers', 'staging', 'tabla', 'Datos crudos de clientes (solo texto).'),
('ing_employees', 'staging', 'tabla', 'Datos crudos de empleados.'),
('ing_order_details', 'staging', 'tabla', 'Datos crudos de detalle de órdenes.'),
('ing_orders', 'staging', 'tabla', 'Datos crudos de cabecera de órdenes.'),
('ing_products', 'staging', 'tabla', 'Datos crudos de productos.'),
('ing_world_data', 'staging', 'tabla', 'Datos crudos de información mundial.'),
('order_details', 'staging', 'tabla', 'Detalle de órdenes con tipos correctos.'),
('orders', 'staging', 'tabla', 'Cabecera de órdenes.'),
('products', 'staging', 'tabla', 'Productos con campos validados.'),
('warnings_customers', 'staging', 'tabla', 'Advertencias en carga de clientes.'),
('warnings_employees', 'staging', 'tabla', 'Advertencias en empleados.'),
('warnings_order_details', 'staging', 'tabla', 'Advertencias en detalles de órdenes.'),
('warnings_orders', 'staging', 'tabla', 'Advertencias en órdenes.'),
('warnings_products', 'staging', 'tabla', 'Advertencias en productos.'),
('world_data', 'staging', 'tabla', 'Datos de países, usados para equivalencias.');

-- STAGING (procedimientos de carga)
INSERT INTO dqm.metadata (nombre_objeto, nombre_schema, tipo_objeto, descripcion) VALUES
('load_customers', 'staging', 'procedimiento', 'Carga datos crudos de clientes en staging.'),
('load_employees', 'staging', 'procedimiento', 'Carga datos crudos de empleados en staging.'),
('load_id_ing_customers', 'staging', 'procedimiento', 'Genera load_id para datos crudos de clientes.'),
('load_id_ing_employees', 'staging', 'procedimiento', 'Genera load_id para empleados crudos.'),
('load_id_ing_order_details', 'staging', 'procedimiento', 'Genera load_id para detalle de órdenes crudas.'),
('load_id_ing_orders', 'staging', 'procedimiento', 'Genera load_id para órdenes crudas.'),
('load_id_ing_products', 'staging', 'procedimiento', 'Genera load_id para productos crudos.'),
('load_id_ing_territories', 'staging', 'procedimiento', 'Genera load_id para territorios crudos.'),
('load_id_ing_world_data', 'staging', 'procedimiento', 'Genera load_id para datos globales crudos.'),
('load_order_details', 'staging', 'procedimiento', 'Carga detalle de órdenes desde archivo.'),
('load_orders', 'staging', 'procedimiento', 'Carga cabecera de órdenes.'),
('load_products', 'staging', 'procedimiento', 'Carga productos validados.'),
('load_territories', 'staging', 'procedimiento', 'Carga territorios.'),
('load_world_data', 'staging', 'procedimiento', 'Carga datos globales de países.');

INSERT INTO dqm.metadata (nombre_objeto, nombre_schema, tipo_objeto, descripcion) VALUES
('actualice_dim_employees', 'dim', 'procedimiento', 'Actualiza e inserta registros en la dimensión de empleados usando equivalencias de ciudad y país.'),
('actualice_dim_products', 'dim', 'procedimiento', 'Actualiza e inserta productos en la dimensión con control de duplicados y errores.'),
('construct_dim_customer', 'dim', 'procedimiento', 'Construye la dimensión de clientes a partir de datos de staging con control SCD.'),
('load_fact_orders', 'dim', 'procedimiento', 'Carga la tabla de hechos combinando órdenes y detalles, con control de claves y errores.'),
('update_dim_location_from_cust_empl_orders', 'dim', 'procedimiento', 'Actualiza la dimensión de localización desde customers, employees y orders, aplicando equivalencias de ciudad y país.'),

('metadata', 'dqm', 'tabla', 'Información descriptiva de objetos del Data Warehouse.'),
('tables_growth', 'dqm', 'tabla', 'Lleva estadísticas de cantidad de registros de tablas que se encuentren en metadata.');



#####################################################################################

# TABLES_GROWTH

DROP TABLE IF EXISTS dqm.tables_growth;

CREATE TABLE dqm.tables_growth (
  tables_growth_id int NOT NULL AUTO_INCREMENT,
  nombre_tabla varchar(100) NOT NULL,
  nombre_schema varchar(20) NOT NULL,
  max_ejec_id INT,
  cant_regs INT,
  fecha_actualiz datetime,  
  max_ejec_id_ant INT,
  cant_regs_ant INT,
  fecha_actualiz_ant datetime,
  PRIMARY KEY (tables_growth_id)
);


#-----------


DROP PROCEDURE IF EXISTS dqm.actualiz_table_growth;

DELIMITER $$
CREATE PROCEDURE dqm.actualiz_table_growth()
BEGIN
  DECLARE v_ejec_id INT;
  DECLARE done INT DEFAULT 0;
  DECLARE v_schema VARCHAR(20);
  DECLARE v_table VARCHAR(100);
  DECLARE v_full_table_name VARCHAR(150);
  DECLARE v_max_ejec_id INT;
  DECLARE v_cant_regs INT;
  DECLARE v_has_ejec_id_column BOOLEAN;

  DECLARE cur CURSOR FOR
    SELECT nombre_schema, nombre_objeto
    FROM dqm.metadata
    WHERE tipo_objeto = 'tabla';

  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
  
  START TRANSACTION;
    INSERT INTO admin.ejecuciones
      (Procedimiento_Nombre, Descripcion_Ejec, Param1_Val, Param2_Val, Param3_Val, Fech_Ejec)
    VALUES
      ('actualiz_table_growth', 'Estadisticas de cantidad de registros (table growth)', NULL, NULL, NULL, NOW());
    SET v_ejec_id = LAST_INSERT_ID();

    INSERT INTO admin.ejecuciones_pasos
      (Ejec_id, Nro_Mark, Descripcion_Mark, Activity_Count, Fech_Ejec_Mark)
    VALUES
      (v_ejec_id, 0, 'Inicio de SP', NULL, NOW());
  COMMIT;


  OPEN cur;

  read_loop: LOOP
    FETCH cur INTO v_schema, v_table;
    IF done THEN
      LEAVE read_loop;
    END IF;

    SET v_full_table_name = CONCAT('`', v_schema, '`.`', v_table, '`');

    -- Verificamos si tiene columna ejec_id
    SELECT COUNT(*)
    INTO v_has_ejec_id_column
    FROM information_schema.columns
    WHERE table_schema = v_schema
      AND table_name = v_table
      AND column_name = 'ejec_id';

    -- Si tiene ejec_id, obtenemos el MAX
    IF v_has_ejec_id_column > 0 THEN
      SET @sql1_result = NULL;
      SET @sql1 = CONCAT('SELECT MAX(ejec_id) INTO @sql1_result FROM ', v_full_table_name);
      PREPARE stmt1 FROM @sql1;
      EXECUTE stmt1;
      DEALLOCATE PREPARE stmt1;
      SELECT @sql1_result INTO v_max_ejec_id;
    ELSE
      SET v_max_ejec_id = NULL;
    END IF;

    -- COUNT(*) se ejecuta siempre
    SET @sql2_result = NULL;
    SET @sql2 = CONCAT('SELECT COUNT(*) INTO @sql2_result FROM ', v_full_table_name);
    PREPARE stmt2 FROM @sql2;
    EXECUTE stmt2;
    DEALLOCATE PREPARE stmt2;
    SELECT @sql2_result INTO v_cant_regs;

    -- Verificar si ya existe en tables_growth
    IF EXISTS (
      SELECT 1 FROM dqm.tables_growth
      WHERE nombre_tabla = v_table AND nombre_schema = v_schema
    ) THEN
      -- UPDATE: pasar actuales a _ant y actualizar valores nuevos
      SET SQL_SAFE_UPDATES = 0;
      UPDATE dqm.tables_growth
      SET 
        max_ejec_id_ant = max_ejec_id,
        cant_regs_ant = cant_regs,
        fecha_actualiz_ant = fecha_actualiz,
        max_ejec_id = v_max_ejec_id,
        cant_regs = v_cant_regs,
        fecha_actualiz = NOW()
      WHERE nombre_tabla = v_table AND nombre_schema = v_schema;
      SET SQL_SAFE_UPDATES = 1;
    ELSE
      -- INSERT nuevo
      INSERT INTO dqm.tables_growth (
        nombre_tabla, nombre_schema, max_ejec_id, cant_regs, fecha_actualiz
      ) VALUES (
        v_table, v_schema, v_max_ejec_id, v_cant_regs, NOW()
      );
    END IF;

  END LOOP;

  CLOSE cur;

END$$

DELIMITER ;

#------------

CALL dqm.actualiz_table_growth();

#----------------------------------------------------------------------------------------
#----------------------------------///////--------------------------------------------------
############################################################################################

###### INGESTA 2 ##########

#########################################################################

# INGESTA 2 de CUSTOMERS y DIM_CUSTOMERS

# Cargaré la ingesta 2 de customers:

# Vacía y carga la tabla de ingesta staging.ing_customers:

TRUNCATE TABLE staging.ing_customers;

LOAD DATA INFILE 'C:/Intro_DW/customers_novedades.csv'
INTO TABLE staging.ing_customers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(customerID,companyName,contactName,contactTitle,address,city,region,postalCode,country,phone,fax) ;

#///////////////////////////////////////////////////////////////////////////

# Ejecuta el SP (primero hay que cargar la tabla de ingesta de customers):

USE STAGING;

CALL load_id_ing_customers();

# Vacía la tabla de customers de staging

TRUNCATE TABLE staging.customers;

# Ejecuta el stored procedure que pasa datos de ing_customer a customer de staging:

CALL staging.load_customers();

# Ejecuto el stored procedure que actualiza dw.customers desde staging (staging.customers)

CALL dw.insert_customers_from_staging();

# Ejecuto el procedimiento que arma la dimension dim_customer desde cero a partir de dw.customers

CALL dim.construct_dim_customer();

#/////////////////////////////////////////////////////////////////////////////////////////////////////
#-----------------------------------------------------------------------------------------------------



### INGESTA 2 de ORDERS

TRUNCATE TABLE staging.ing_orders;

LOAD DATA INFILE 'C:/Intro_DW/orders_novedades.csv'
INTO TABLE staging.ing_orders
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(orderID,customerID,employeeID,orderDate,requiredDate,shippedDate,shipVia,freight,
shipName,shipAddress,shipCity,shipRegion,shipPostalCode,shipCountry) ;

CALL staging.load_id_ing_orders();

TRUNCATE TABLE staging.orders;

CALL staging.load_orders();


### INGESTA 2 de ORDER_DETAILS


TRUNCATE TABLE staging.ing_order_details;

LOAD DATA INFILE 'C:/Intro_DW/order_details_novedades.csv'
INTO TABLE staging.ing_order_details
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(orderID,productID,unitPrice,quantity,discount) ;


CALL staging.load_id_ing_order_details();

TRUNCATE TABLE staging.order_details;

CALL staging.load_order_details();


## INGESTA 2 de FACT_ORDERS

CALL dim.load_fact_orders();

#------------------------------------FIN----------------------------------#

