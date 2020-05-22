-- Creating DB
CREATE DATABASE countryBulgaria;


-- Table Management
CREATE TABLE management
(
    managerID INT NOT NULL auto_increment,
    ManagerFirstName  VARCHAR(40) NOT NULL,
    ManagerLastName VARCHAR(40) NOT NULL,
    manager INT ,
    PRIMARY KEY(managerID)
);

ALTER TABLE management
ADD FOREIGN KEY(manager)
REFERENCES management(managerID)
ON DELETE SET NULL;

-- Table Engineers
CREATE TABLE engineers(
    engineerID INT NOT NULL auto_increment,
    engineerFirstName VARCHAR(40) ,
    engineerLastName VARCHAR(40),
    Fieldmanager INT ,
    sex VARCHAR(1) ,
    birthday DATE,
    locationAddress VARCHAR(150) ,
    englishSpeaking VARCHAR(50) ,
    hasVehicle VARCHAR(30),
    hasElectronics VARCHAR(30) ,
    HasSpecialWorkingClothes VARCHAR(100),
    availableForNightShift VARCHAR(20) ,
    PRIMARY KEY(engineerID)
);

ALTER TABLE engineers
ADD FOREIGN KEY(Fieldmanager)
REFERENCES management(managerID)
ON DELETE SET NULL;


-- Table Access 
CREATE TABLE access(
    accessID INT auto_increment,
    engineer INT ,
    validPassport VARCHAR(50) NOT null,
    nationality VARCHAR(50)NOT null,
    copyOfWorkingPermit VARCHAR(50)NOT null,
    copyOfSkills VARCHAR(50)NOT null,
    documentationOnElectronics VARCHAR(50)NOT null,
    PRIMARY KEY (accessID)
);

ALTER TABLE access
ADD FOREIGN KEY(engineer)
REFERENCES engineers(engineerID)
ON DELETE SET NULL;



-- Table customers
CREATE TABLE customers(
      companyID INT auto_increment,
      companyName VARCHAR(100) NOT NULL,
      phoneNumber VARCHAR(70) NOT NULL,
      email VARCHAR(100) NOT NULL,
      neededEngineers INT,
      `location` VARCHAR(150) NOT null,
      accessPermission VARCHAR(100) NOT NULL,
      PRIMARY KEY (companyID)
);


-- Table Preferred engineers
CREATE TABLE preferredEngineers(
    preferredEngineersID INT auto_increment,
    engineer INT,
    customer INT,
    PRIMARY KEY(preferredEngineersID)
);


ALTER TABLE preferredEngineers
ADD FOREIGN KEY(engineer)
REFERENCES engineers(engineerID)
ON DELETE SET NULL;

ALTER TABLE preferredEngineers
ADD FOREIGN KEY(customer)
REFERENCES customers(companyID)
ON DELETE SET NULL;


-- Table Restricted engineers
CREATE TABLE restrictedEngineers(
    restrictedEngineersID INT auto_increment,
    engineer INT,
    customer INT,
    PRIMARY KEY(restrictedEngineersID)
);


ALTER TABLE restrictedEngineers
ADD FOREIGN KEY(engineer)
REFERENCES engineers(engineerID)
ON DELETE SET NULL;

ALTER TABLE restrictedEngineers
ADD FOREIGN KEY(customer)
REFERENCES customers(companyID)
ON DELETE SET NULL;


-- Table Problem log filled by engineer
CREATE TABLE problemLog(
    logID INT auto_increment,
    engineerName INT,
    companyName INT,
    dateWhenTheProblemWasLogged DATE,
    dateWhenTheProblemWasResolved DATE,
    dateWhenTheEngineerAttended DATE,
    timeofEngineerArrival TIME,
    summaryByEngineer VARCHAR(350),
    PRIMARY KEY(logID)
);

ALTER TABLE problemLog
ADD FOREIGN KEY(engineerName)
REFERENCES engineers(engineerID)
ON DELETE SET NULL;

ALTER TABLE problemLog
ADD FOREIGN KEY(companyName)
REFERENCES customers(companyID)
ON DELETE SET NULL;




-- Table information



-- inserting in management table
INSERT INTO management (ManagerFirstName,ManagerLastName)
VALUES('John','Doe');
INSERT INTO management(ManagerFirstName,ManagerLastName,manager)
VALUES('Martin',"Djick",1);
INSERT INTO management (ManagerFirstName,ManagerLastName,manager)
VALUES('Kera','Nilson',1);



-- inserting engineers in engineer table
INSERT INTO engineers(engineerFirstName,engineerLastName,Fieldmanager,sex,birthday,locationAddress,englishSpeaking,
hasVehicle,hasElectronics,HasSpecialWorkingClothes,availableForNightShift)
VALUES('Mike','Dohn',3,'M','1987-01-11','Red avenue N33','yes','no','yes-laptop','no','no');

INSERT INTO engineers(engineerFirstName,engineerLastName,Fieldmanager,sex,birthday,locationAddress,englishSpeaking,
hasVehicle,hasElectronics,HasSpecialWorkingClothes,availableForNightShift)
VALUES('Simona','Brice',3,'F','1981-11-15','Blue avenue N33','yes','yes','yes','yes','yes');

INSERT INTO engineers(engineerFirstName,engineerLastName,Fieldmanager,sex,birthday,locationAddress,englishSpeaking,
hasVehicle,hasElectronics,HasSpecialWorkingClothes,availableForNightShift)
VALUES('Onnan','Blak',2,'M','1977-05-3','Green avenue N33','no','yes','usb,ssd,remote cd','yes','no');

INSERT INTO engineers(engineerFirstName,engineerLastName,Fieldmanager,sex,birthday,locationAddress,englishSpeaking,
hasVehicle,hasElectronics,HasSpecialWorkingClothes,availableForNightShift)
VALUES('Ashley','Rohner',2,'F','1990-08-20','Velvet avenue N33','yes','yes','no','yes','yes');

INSERT INTO engineers(engineerFirstName,engineerLastName,Fieldmanager,sex,birthday,locationAddress,englishSpeaking,
hasVehicle,hasElectronics,HasSpecialWorkingClothes,availableForNightShift)
VALUES('Bolton','Moor',3,'M','1981-02-25','Orange avenue N23','yes','yes','yes-laptop','no','yes');

INSERT INTO engineers(engineerFirstName,engineerLastName,Fieldmanager,sex,birthday,locationAddress,englishSpeaking,
hasVehicle,hasElectronics,HasSpecialWorkingClothes,availableForNightShift)
VALUES('Michael','Plenson',2,'M','1967-06-21','Yellow avenue N3','yes','yes','laptop and ssd','no','yes');


-- inserting access for the engineers in access table

INSERT INTO access(engineer,validPassport,nationality,copyOfWorkingPermit,copyOfSkills,documentationOnElectronics)
VALUES(1,'yes','USA','yes','yes','yes');

INSERT INTO access(engineer,validPassport,nationality,copyOfWorkingPermit,copyOfSkills,documentationOnElectronics)
VALUES(2,'yes','USA','yes','yes','no');

INSERT INTO access(engineer,validPassport,nationality,copyOfWorkingPermit,copyOfSkills,documentationOnElectronics)
VALUES(3,'yes','Peru','yes','yes','yes');

INSERT INTO access(engineer,validPassport,nationality,copyOfWorkingPermit,copyOfSkills,documentationOnElectronics)
VALUES(4,'yes','Bulgaria','yes','yes','yes');

INSERT INTO access(engineer,validPassport,nationality,copyOfWorkingPermit,copyOfSkills,documentationOnElectronics)
VALUES(5,'yes','Mexico','yes','yes','yes');

INSERT INTO access(engineer,validPassport,nationality,copyOfWorkingPermit,copyOfSkills,documentationOnElectronics)
VALUES(6,'yes','Spain','yes','yes','yes');

-- Insert customers in customers table 

INSERT INTO customers(companyName,phoneNumber,email,neededEngineers,location,accessPermission)
VALUES('Company1',45352321123,'emample@email.com',2,'Blue tower number 33','no');

INSERT INTO customers(companyName,phoneNumber,email,neededEngineers,location,accessPermission)
VALUES('Company2',45342721123,'emample@email.com',1,'Blue tower number 33','no');

INSERT INTO customers(companyName,phoneNumber,email,neededEngineers,location,accessPermission)
VALUES('Company3',45235621123,'emample@email.com',2,'Blue tower number 33','no');

-- Insert in Preferred engineers 

INSERT INTO preferredEngineers(engineer, customer)
VALUES(1,2);
INSERT INTO preferredEngineers(engineer, customer)
VALUES(1,1);
INSERT INTO preferredEngineers(engineer, customer)
VALUES(3,3);
INSERT INTO preferredEngineers(engineer, customer)
VALUES(2,1);

-- Insert in Restricted engineers 

INSERT INTO restrictedEngineers(engineer, customer)
VALUES(6,3);
INSERT INTO restrictedEngineers(engineer, customer)
VALUES(1,3);

-- Insert in Problem log 

INSERT INTO problemLog(engineerName,companyName,dateWhenTheProblemWasLogged,dateWhenTheProblemWasResolved,
dateWhenTheEngineerAttended,timeofEngineerArrival,summaryByEngineer)
VALUES(1,2,'2020-01-10','2020-01-15','2020-01-11','10:30','Lorem Ipsum is simply dummy 
text of the printing and typesetting industry.');

INSERT INTO problemLog(engineerName,companyName,dateWhenTheProblemWasLogged,dateWhenTheProblemWasResolved,
dateWhenTheEngineerAttended,timeofEngineerArrival,summaryByEngineer)
VALUES(3,3,'2019-12-10','2020-01-02','2019-12-10','13:10','Lorem Ipsum is simply dummy 
text of the printing and typesetting industry.');
