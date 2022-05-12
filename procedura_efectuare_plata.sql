CREATE DEFINER=`olteancristian`@`%` PROCEDURE `efectuarePlata`(in nume varchar(45), in metoda_plata varchar(45), in suma int(10), in locatie varchar(45))
BEGIN
DECLARE idC INT DEFAULT NULL;
DECLARE idL INT DEFAULT NULL;
DECLARE idE INT DEFAULT NULL;
DECLARE pm VARCHAR(45) DEFAULT NULL;

DECLARE d DATETIME DEFAULT NULL;

SELECT Location_ID INTO idL
FROM Locations
WHERE Location_Name = locatie;

SELECT Payment_Method_Code INTO pm
FROM Ref_Payment_Methods
WHERE Payment_Method_Name = metoda_plata;

SELECT current_timestamp() INTO d; 

IF idL IS NOT NULL AND pm IS NOT NULL THEN

	INSERT INTO `Customers`(`Customer_Name`) VALUES (nume);
	SELECT LAST_INSERT_ID() INTO idC;

	INSERT INTO `Events`(`Channel_Code`, `Customer_ID`, `Location_Origin_ID`, `Location_Destination_ID`, `Platform_CD`, `Service_CD`, `Staff_ID`, `Stard_Date_Time`, `End_Date_Time`) 
	VALUES ('CH2', idc, idL, idL, 'F2F', 'S1', 1, d, d);
	SELECT LAST_INSERT_ID() INTO idE;

	INSERT INTO `Payments`(`Event_Payment_ID`, `Payment_Method_Code`, `Payment_Date_Time`, `Payment_Amount`) 
	VALUES (idE, pm, d, suma);

ELSE
SELECT 'Locatia sau metoda de plata nu au fost introduse corect !';
END IF;

END