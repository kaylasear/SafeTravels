CREATE SCHEMA IF NOT EXISTS SafeTravelsApplication;
Use SafeTravelsApplication;

DROP TABLE IF EXISTS SafestStates;
DROP TABLE IF EXISTS CityInformation;
DROP TABLE IF EXISTS USTravel;
DROP TABLE IF EXISTS Reviews;
DROP TABLE IF EXISTS WishList;
DROP TABLE IF EXISTS CountyProfile;
DROP TABLE IF EXISTS StateProfile;
DROP TABLE IF EXISTS NationalProfile;
DROP TABLE IF EXISTS Profile;
DROP TABLE IF EXISTS Policy;
DROP TABLE IF EXISTS MaskUse;
DROP TABLE IF EXISTS Vaccination;
DROP TABLE IF EXISTS Users;

CREATE TABLE Users (
    UserName VARCHAR(255),
    Email VARCHAR(255),
    Password VARCHAR(255),
    CONSTRAINT pk_Users_UserName PRIMARY KEY (UserName)
);

CREATE TABLE Vaccination(
	VaccinationID INT AUTO_INCREMENT,
    Date date,
    CountyFIPS INT,
    CountyName VARCHAR(255),
    StateCode VARCHAR(2),
    VaccinationSeriesCompletePct DECIMAL(3,1),
    VaccinationSeriesCompletePop bigint,
    CompletenessPct DECIMAL(3,1),
    CONSTRAINT pk_Vaccination_VaccinationID PRIMARY KEY (VaccinationID)
);

CREATE TABLE MaskUse (
    MaskUseID INTEGER AUTO_INCREMENT,
    CountyFIPS INTEGER,
    NEVER DECIMAL(4 , 3 ) NOT NULL,
    RARELY DECIMAL(4 , 3 ) NOT NULL,
    SOMETIMES DECIMAL(4 , 3 ) NOT NULL,
    FREQUENTLY DECIMAL(4 , 3 ) NOT NULL,
    ALWAYS DECIMAL(4 , 3 ) NOT NULL,
    CONSTRAINT MaskUse_MaskUseID PRIMARY KEY (MaskUseID)
);
	
CREATE TABLE Policy (
    PolicyID INTEGER AUTO_INCREMENT,
    StateCode VARCHAR(255)  NOT NULL,
    County VARCHAR(255) NOT NULL,
    FipsCode INTEGER DEFAULT NULL,
    Active VARCHAR(255),
    TotalPhases INTEGER,
    Content TEXT,
    PolicyDate date,
    Resource VARCHAR(500),
    CONSTRAINT Policy_PolicyID PRIMARY KEY (PolicyID)
);


CREATE TABLE Profile (
    ProfileId INT AUTO_INCREMENT,
    Date DATE,
    CovidCases BIGINT,
    CovidDeaths BIGINT,
    CONSTRAINT pk_Profile_ProfileId PRIMARY KEY (ProfileId)
);

CREATE TABLE NationalProfile (
    ProfileId INT,
    Name VARCHAR(255),
    CONSTRAINT pk_NationalProfile_ProfileId PRIMARY KEY (ProfileId),
    CONSTRAINT fk_NationalProfile_ProfileId FOREIGN KEY (ProfileId)
        REFERENCES Profile (ProfileId)
        ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE StateProfile (
    ProfileId INT,
    StateFIPS INT,
    StateName VARCHAR(255),
    StateCode VARCHAR(2),
    NumCounties INT,
    NationalProfileId INT,
	SafetyRating ENUM('1', '2', '3', '4', '5'),
    
    CONSTRAINT pk_StateProfile_ProfileId PRIMARY KEY (ProfileId),
    CONSTRAINT fk_StateProfile_ProfileId FOREIGN KEY (ProfileId)
        REFERENCES Profile (ProfileId)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_StateProfile_NationalProfileId FOREIGN KEY (NationalProfileId)
        REFERENCES NationalProfile (ProfileId)
        ON UPDATE CASCADE ON DELETE SET NULL
);


CREATE TABLE CountyProfile (
    ProfileId INT,
    CountyName VARCHAR(255),
    CountyFIPS INT,
    GeoLocation GEOMETRY,
    MaskUseId INT, 
    StateProfileId INT,
    NationalProfileId INT,
    VaccinationID INT,
    PolicyId INT,
     
    CONSTRAINT pk_CountyProfile_ProfileId PRIMARY KEY (ProfileId),
    
    CONSTRAINT fk_CountyProfile_ProfileId
		FOREIGN KEY (ProfileId)
		REFERENCES Profile (ProfileId)
        ON UPDATE CASCADE ON DELETE CASCADE,
        
    CONSTRAINT fk_CountyProfile_MaskUseId
		FOREIGN KEY (MaskUseId)
		REFERENCES MaskUse (MaskUseId)
		ON UPDATE CASCADE ON DELETE SET NULL,
	
    CONSTRAINT fk_CountyProfile_StateProfileId
	FOREIGN KEY (StateProfileId)
		REFERENCES StateProfile (ProfileId)
        ON UPDATE CASCADE ON DELETE SET NULL,
        
	CONSTRAINT fk_CountyProfile_NationalProfileId
        FOREIGN KEY (NationalProfileId)
        REFERENCES NationalProfile (ProfileId)
        ON UPDATE CASCADE ON DELETE SET NULL,

        CONSTRAINT fk_CountyProfile_PolicyId
        FOREIGN KEY (PolicyId)
        REFERENCES Policy(PolicyId)
        ON UPDATE CASCADE ON DELETE SET NULL,
        
        CONSTRAINT fk_CountyProfile_VaccinationID
        FOREIGN KEY(VaccinationID)
        REFERENCES Vaccination(VaccinationID)
        ON UPDATE CASCADE ON DELETE SET NULL

);


CREATE TABLE WishList (
  WishId INT AUTO_INCREMENT,
  UserName VARCHAR(255),
  CityProfileId INT,
  StateProfileId INT,
  CountyProfileId INT,
  CONSTRAINT pk_WishList_WishId PRIMARY KEY (WishId),
  CONSTRAINT fk_WishList_UserName FOREIGN KEY (UserName)
    REFERENCES Users (UserName)
    ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT fk_WishList_StateProfileId FOREIGN KEY (StateProfileId)
    REFERENCES StateProfile (ProfileId)
    ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT fk_WishList_CountyProfileId FOREIGN KEY (CountyProfileId)
    REFERENCES CountyProfile (ProfileId)
    ON UPDATE CASCADE ON DELETE SET NULL
);


CREATE TABLE Reviews (
  ReviewId INT AUTO_INCREMENT,
  UserName VARCHAR(255),
  Created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  UserReview VARCHAR(255),
  Rating DECIMAL(2, 1),
  ProfileId INT,
  CONSTRAINT pk_Reviews_ReviewId PRIMARY KEY (ReviewId),
  CONSTRAINT fk_Reviews_UserName FOREIGN KEY (UserName)
    REFERENCES Users (UserName)
    ON UPDATE CASCADE ON DELETE SET NULL,
    
   CONSTRAINT fk_Reviews_ProfileId
		FOREIGN KEY (ProfileId)
		REFERENCES StateProfile (ProfileId)
		ON UPDATE CASCADE ON DELETE SET NULL
);


 CREATE TABLE USTravel (
 	TravelID INT AUTO_INCREMENT,
	StateFIPS INT, 
	ProfileId INT,
	USPopStayingAtHome BIGINT,
    USPopNotStayingAtHome BIGINT,
    PercentTakingTrips DECIMAL (2,2) NOT NULL,

	CONSTRAINT pk_USTravel_TravelID_ PRIMARY KEY (TRAVELID),
	 CONSTRAINT fk_USTravel_ProfileId
 		FOREIGN KEY (ProfileId)
 		REFERENCES StateProfile (ProfileId)
 		ON UPDATE CASCADE ON DELETE SET NULL
);
 
 CREATE TABLE CityInformation (
	ID INT AUTO_INCREMENT,
    StateCode VARCHAR(255),
    StateName VARCHAR(255),
    CityName VARCHAR(255),
    CountyName VARCHAR(255),
    Latitude DECIMAL(10,7),
    Longitude DECIMAL(10,7),
    CountyFIPS INT,
    CONSTRAINT pk_CityInformation_ID PRIMARY KEY (ID)
);




   
