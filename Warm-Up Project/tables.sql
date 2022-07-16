CREATE TABLE region (
    rID INT UNSIGNED NOT NULL PRIMARY KEY,
    rName VARCHAR(90) NOT NULL
);

CREATE TABLE country (
    cID INT UNSIGNED AUTO_INCREMENT,
    rID INT UNSIGNED,
    orgID INT UNSIGNED,
        orgID INT UNSIGNED,
    FOREIGN KEY (orgID)
        REFERENCES organizations (orgID),
    FOREIGN KEY (rID) REFERENCES region(rID),
    PRIMARY KEY(cID,rID),
    cName VARCHAR(90) NOT NULL,
    Population INT UNSIGNED NOT NULL
);

CREATE TABLE covid_19stat (
    statID INT UNSIGNED AUTO_INCREMENT,
    cID INT UNSIGNED,
    FOREIGN KEY (cID) REFERENCES country(cID),
    rDate DATE NOT NULL,
    PRIMARY KEY(statID, cID),
    numInfections INT UNSIGNED DEFAULT 0 NOT NULL,
    numDeaths INT UNSIGNED DEFAULT 0 NOT NULL
);

CREATE TABLE vaccines(
    vID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR (90) NOT NULL  
);

CREATE TABLE vaccineStat (
    vID INT UNSIGNED,
    FOREIGN KEY (vID) REFERENCES vaccines (vID),
    statID INT UNSIGNED,
    FOREIGN KEY (statID) REFERENCES covid_19stat (statID),
    PRIMARY KEY(vID,statID),
    numVaccinations INT UNSIGNED DEFAULT 0 NOT NULL,
    numVacDeath INT UNSIGNED DEFAULT 0 NOT NULL,
    numVacInfections INT UNSIGNED DEFAULT 0 NOT NULL
);

CREATE TABLE organizations (
    orgID INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    oName VARCHAR(60),
    otype ENUM('Government','Research Center','Company')
   
);

CREATE TABLE users (
    uID INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    orgID INT UNSIGNED, 
    cID INT UNSIGNED,
    FOREIGN KEY (cID)
        REFERENCES country (cID),
    fName VARCHAR(60) DEFAULT 'N/A',
    lName VARCHAR(60) DEFAULT 'N/A',
    phone INT UNSIGNED,
    email VARCHAR(100) DEFAULT 'empty',
    privilege ENUM('Administrator', 'Researcher', 'Organization Delegate', 'Regular'),
    dob DATE
);
CREATE TABLE article (
    aID INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    uID INT UNSIGNED,
    FOREIGN KEY (uID)
        REFERENCES users (uID),
    Author VARCHAR(90) NOT NULL,
    majorTopic VARCHAR(90) DEFAULT 'N/A',
    minorTopic VARCHAR(90) DEFAULT 'N/A',
    summary CHAR(100) DEFAULT 'empty',
    content BLOB,
    pubDate DATE NOT NULL
);





show tables
DROP TABLE country, covid_19stat,region,vaccines,vaccineStat, organizations, users, article

SELECT *
From users

desc country
