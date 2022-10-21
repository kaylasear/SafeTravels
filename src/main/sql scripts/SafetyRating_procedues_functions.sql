USE safetravelsapplication;

DROP FUNCTION IF EXISTS SafeTravelsApplication.getCovidCases;
DELIMITER //
CREATE FUNCTION getCovidCases(stateId INT)
RETURNS INT
BEGIN
	DECLARE cases INT;
	SET cases = (SELECT Profile.CovidCases
	FROM Profile INNER JOIN StateProfile
	ON Profile.ProfileId = StateProfile.ProfileId
	WHERE StateProfile.ProfileId = stateId);
    RETURN cases;
END //
DELIMITER ;



DROP FUNCTION IF EXISTS SafeTravelsApplication.getCovidDeaths;
DELIMITER //
CREATE FUNCTION getCovidDeaths(stateId INT)
RETURNS INT
BEGIN
	DECLARE deaths INT;
    
	SET deaths = (SELECT Profile.CovidDeaths
	FROM Profile INNER JOIN StateProfile
	ON Profile.ProfileId = StateProfile.ProfileId
	WHERE StateProfile.ProfileId = stateId);
    RETURN deaths;
END //
DELIMITER ;


DROP FUNCTION IF EXISTS SafeTravelsApplication.getVaccinationRates;
DELIMITER //
CREATE FUNCTION getVaccinationRates(state VARCHAR(2))
RETURNS INT
BEGIN
	DECLARE vaccinations INT;
    
	SET vaccinations = (SELECT SUM(VaccinationSeriesCompletePop) AS VAC_COUNT
	FROM Vaccination INNER JOIN CountyProfile
	ON Vaccination.VaccinationId = CountyProfile.VaccinationId
	WHERE StateCode = state);
    
    RETURN vaccinations;
END //
DELIMITER ;



DROP FUNCTION IF EXISTS SafeTravelsApplication.getTotalPopulation;
DELIMITER //
CREATE FUNCTION getTotalPopulation(stateID INT)
RETURNS INT
BEGIN
	DECLARE population INT;
    
	SET population = (SELECT (USPopStayingAtHome + USPopNotStayingAtHome) AS TotalPopulation
	FROM USTravel INNER JOIN StateProfile USING (ProfileId)
	WHERE stateId = ProfileId);
    RETURN population;
END //
DELIMITER ;

# Determines the safety level based on the weighted rates, returns an enum from 1-5
# 5 being the worst level, 1 is the safest
DROP FUNCTION IF EXISTS SafeTravelsApplication.getRating;
DELIMITER //
CREATE FUNCTION getRating(covidCases DECIMAL(10, 3), deathRates DECIMAL (10, 3), vaccinationRates DECIMAL(10, 3))
RETURNS ENUM('1', '2', '3', '4', '5')
BEGIN
	DECLARE safetyrating ENUM('1', '2', '3', '4', '5');
    DECLARE weightedRate DECIMAL (10, 3);
    
    SET weightedRate = (covidCases + deathRates + (1-vaccinationRates))/3;
    
		CASE
		WHEN (weightedRate < 0.170) THEN SET safetyrating = '1';
		WHEN ((0.170 <= weightedRate) AND (weightedRate < 0.220)) THEN SET safetyrating = '2';
		WHEN ((0.220 <= weightedRate) AND (weightedRate < 0.242)) THEN SET safetyrating = '3';
		WHEN ((0.242 <= weightedRate) AND (weightedRate < 0.246)) THEN SET safetyrating = '4';
		WHEN (weightedRate >= 0.246) THEN SET safetyrating = '5';
        END CASE;

    RETURN safetyrating;
END //
DELIMITER ;

# Calculate rates to determine the safety level
# calls on getRating function to determine the safety level based on weighted rates
DROP PROCEDURE IF EXISTS SafeTravelsApplication.safetyRatingCalculation;
DELIMITER //
CREATE PROCEDURE safetyRatingCalculation(stateId INT, stateCode VARCHAR(2))
BEGIN

	#declare variables
	DECLARE Covid_cases BIGINT;
	DECLARE Covid_Deaths BIGINT;
	DECLARE Total_Vaccination BIGINT;
	DECLARE Total_Population BIGINT;
    DECLARE case_rating DECIMAL(10, 3);
    DECLARE death_rating DECIMAL(10, 3);
	DECLARE vaccination_rating DECIMAL(10, 3);
	DECLARE safetyrating ENUM('1', '2', '3', '4', '5');
    DECLARE rating DECIMAL(10,3);

	# grab variables 
	SET Covid_cases = getCovidCases(stateId);
	SET Covid_deaths = getCovidDeaths(stateId);
	SET Total_Vaccination = getVaccinationRates(stateCode);
	SET Total_Population = getTotalPopulation(stateId);

	SET case_rating = Covid_cases / Total_Population;
	SET death_rating = Covid_deaths / Total_Population;
	SET vaccination_rating = Total_Vaccination / Total_Population;

	SET safetyrating = getRating(case_rating, death_rating, vaccination_rating); 
    SET rating = (case_rating + death_rating + (1-vaccination_rating))/3;
    
	SELECT case_rating, death_rating, vaccination_rating, safetyrating, rating;

	# update the States table and set the safety level for each state
	UPDATE StateProfile
	SET StateProfile.SafetyRating = safetyrating
	WHERE ProfileId = stateId;
END//
DELIMITER ;

# State Examples for each threshold
CALL safetyRatingCalculation(8, 'CT'); # level 1 -> 0.143
CALL safetyRatingCalculation(32, 'NH'); # level 2 -> 0.170
CALL safetyRatingCalculation(18, 'KS'); # level 3 -> 0.220
CALL safetyRatingCalculation(44, 'TN'); # level 4 -> 0.242
CALL safetyRatingCalculation(15, 'ID'); # level 5 -> 0.246



# Uses a while loop to iterate through each row in StateProfile table and call
# on safetyRatingCalculation to update the safety rating for each state
DROP PROCEDURE IF EXISTS SafeTravelsApplication.setSafetyRating;
DELIMITER //
CREATE PROCEDURE setSafetyRating()
BEGIN
	DECLARE count int;
	DECLARE NumRows int;
    DECLARE stateId int;
    DECLARE state VARCHAR(2);
    
    SET count = 1;
    SET stateId = 2;
	SET NumRows = (SELECT COUNT(*) FROM StateProfile);
    
	WHILE count <= NumRows DO
		SET state = (SELECT stateCode FROM stateProfile WHERE ProfileId = stateId);
		CALL safetyRatingCalculation(stateId, state);
		SET count = count + 1;
        SET stateId = stateId + 1;

	END WHILE;

END //
DELIMITER ;

# use the procedure to set the safety rating for each state in StateProfile table
CALL setSafetyRating();



