#SET FOREIGN_KEY_CHECKS= 0;

INSERT INTO Profile(Date, CovidCases, CovidDeaths)
   VALUES ('2021-10-12', 44323838, 714014);
 
INSERT INTO NationalProfile(ProfileId, Name)
  VALUES (1, 'United States');

# adding 51 states from 10/12/2021 into Profile
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/Datasets/states-MASTER.csv' INTO TABLE Profile
  # Fields are not quoted.
  FIELDS TERMINATED BY ','
  # Windows platforms may need '\r\n'
  LINES TERMINATED BY '\r\n'
  IGNORE 1 LINES
   (@date, @row1, @state, @state_code, @fips, @tot_cases, @tot_death, @PopStayingatHome, @PopNotStayingatHome, @NumberTrips, @Series_Complete_Pop_Pct, @Series_Complete_Yes)
   SET Date=@date, CovidCases=@tot_cases, CovidDeaths=@tot_death;

   
# 3142 counties from 10/12/2021 into Profile
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/Datasets/counties-MASTER.csv' INTO TABLE Profile
  # Fields are not quoted.
  FIELDS TERMINATED BY ','
  # Windows platforms may need '\r\n'
  LINES TERMINATED BY '\n'
  IGNORE 1 LINES
   (@date, @stateprofileid, @profileId, @maskuseid, @StateFIPS, @StatePostalCode, @CountyFIPS ,@CountyName, @vaccinationId, @cases, @deaths)
   SET Date=@date, CovidCases=NULLIF(@cases, 0.0), CovidDeaths=NULLIF(@deaths, 0.0); 
   
   #TODOL update profile table: CovidCases, deaths 0.0 -> null
   

# 51 state rows into State Profile
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/Datasets/states-MASTER.csv' INTO TABLE StateProfile
  # Fields are not quoted.
  FIELDS TERMINATED BY ','
  # Windows platforms may need '\r\n'
  LINES TERMINATED BY '\r\n'
  IGNORE 1 LINES
  (@date, @row1, @state, @state_code, @fips, @tot_cases, @tot_death, @PopStayingatHome, @PopNotStayingatHome, @NumberTrips)
   SET ProfileId=@row1, StateCode=@state_code, StateFIPS=@fips, StateName=@state, NationalProfileId=1;

# 3142 rows into MaskUse
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/Datasets/mask-use-by-county.csv' INTO TABLE MaskUse
  # Fields are not quoted.
  FIELDS TERMINATED BY ','

  # Windows platforms may need '\r\n'
  LINES TERMINATED BY '\n'
  IGNORE 1 LINES
(CountyFIPS, NEVER, RARELY, SOMETIMES, FREQUENTLY, ALWAYS);


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/Datasets/vaccination_data_by_county.csv' INTO TABLE Vaccination
FIELDS TERMINATED BY ','
  # Windows platforms may need '\r\n'
  LINES TERMINATED BY '\r\n'
  IGNORE 1 LINES
  (@Date, @FIPS, @Recip_County, @Recip_State, @Series_Complete_Pop_Pct, @Series_Complete_Yes, @Completeness_pct)
   SET Date=@Date, CountyFIPS=@FIPS, CountyName=@Recip_County, StateCode=@Recip_State, VaccinationSeriesCompletePct=@Series_Complete_Pop_Pct,
   VaccinationSeriesCompletePop=@Series_Complete_Yes, CompletenessPct=@Completeness_pct; 


# 3142 counties into County Profile
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/Datasets/counties-MASTER.csv' INTO TABLE CountyProfile
  # Fields are not quoted.
  FIELDS TERMINATED BY ','
  # Windows platforms may need '\r\n'
  LINES TERMINATED BY '\r\n'
  IGNORE 1 LINES
   (@date, @stateprofileid, @profileId, @maskuseid, @StateFIPS, @StatePostalCode, @CountyFIPS ,@CountyName, @vaccinationId, @cases, @deaths)
   SET ProfileId=@profileId, CountyName=@CountyName, CountyFIPS=@CountyFIPS, StateProfileId=@stateprofileid, VaccinationId=@vaccinationId, MaskUseId=@maskuseId, NationalProfileId=1;

# 51 rows for each state
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/Datasets/states-MASTER.csv' INTO TABLE USTravel
  # Fields are not quoted.
  FIELDS TERMINATED BY ','
  # Windows platforms may need '\r\n'
  LINES TERMINATED BY '\n'
  IGNORE 1 LINES
(@date, @row1, @state, @state_code, @fips, @tot_cases, @tot_death, @PopStayingatHome, @PopNotStayingatHome, @NumberTrips)
   SET ProfileId=@row1, StateFIPS=@fips, USPopStayingAtHome=NULLIF(@PopStayingatHome, 0.0),  USPopNotStayingAtHome=NULLIF(@PopNotStayingatHome, 0.0); 


# 1000 users
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/Datasets/MOCK_USERS.csv' INTO TABLE Users
  # Fields are not quoted.
  FIELDS TERMINATED BY ','

  # Windows platforms may need '\r\n'
  LINES TERMINATED BY '\n'
  IGNORE 1 LINES
(UserName, Email, Password);

#inserting wishlist data
insert INTO WishList(UserName, StateProfileID) values ('aastlattv', 36);
insert INTO WishList(UserName, StateProfileID) values ('ajestepf', 10);
insert INTO WishList(UserName, StateProfileID) values ('akingswoodqt', 20);
insert INTO WishList(UserName, StateProfileID) values ('apluckft', 8);
insert INTO WishList(UserName, StateProfileID) values ('arauom', 50);
insert INTO WishList(UserName, StateProfileID) values ('arauom', 8);
insert INTO WishList(UserName, StateProfileID) values ('akingswoodqt', 10);
insert INTO WishList(UserName, StateProfileID) values ('asibunn9', 50);
insert INTO WishList(UserName, StateProfileID) values ('atitchener54', 20);
insert INTO WishList(UserName, StateProfileID) values ('bjenik60', 30);
insert INTO WishList(UserName, StateProfileID) values ('akingswoodqt', 50);

# insering reviews data
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/Datasets/MOCK_DATA_REVIEWS.csv' INTO TABLE Reviews
  # Fields are not quoted.
  FIELDS TERMINATED BY ','
  # Windows platforms may need '\r\n'
  LINES TERMINATED BY '\n'
  IGNORE 1 LINES
  (ReviewId, UserName, Created, UserReview, Rating, ProfileId);


LOAD DATA INFILE '/ProgramData/MySQL/MySQL Server 5.7/Uploads/Datasets/us_cities.csv' INTO TABLE cityinformation
  # Fields are not quoted.
  FIELDS TERMINATED BY ','
  # Windows platforms may need '\r\n' 
  LINES TERMINATED BY '\n'
  IGNORE 1 LINES
  (@ID, @STATE_CODE, @STATE_NAME, @CITY, @COUNTY, @LATITUDE, @LONGITUDE, @COUNTYFIPS)
   SET ID=@ID, StateCode=@STATE_CODE, StateName=@STATE_NAME, CityName=@CITY, CountyName=@COUNTY, Latitude=@LATITUDE, Longitude=@LONGITUDE, CountyFIPS=@COUNTYFIPS;


#SET FOREIGN_KEY_CHECKS= 1;

# adding policy information into Policy Table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/Datasets/Policies.csv' INTO TABLE Policy
  # Fields are not quoted.
  FIELDS TERMINATED BY ','
  # Windows platforms may need '\r\n'
  LINES TERMINATED BY '\r\n'
  IGNORE 1 LINES
   (@state_id, @county, @fips_code, @policy_level, @date, @policy_type, @active_inactive, @comments, @source, @total_phases)
   SET StateCode=NULLIF(@state_id, NULL), County=NULLIF(@county, NULL),
   FipsCode=NULLIF(@fips_code, 0.0), Active=NULLIF(@active_inactive,NULL), TotalPhases=NULLIF(@total_phases, 0.0),
   Content=NULLIF(@comments,NULL), PolicyDate=NULLIF(@date,NULL), Resource=NULLIF(@source,NULL);


   
