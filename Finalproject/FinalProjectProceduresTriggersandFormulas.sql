/* Final Project Procedures

--stored procedure that retrieves and displays data
USE HOSPITAL_TestDB;
GO
CREATE PROC spEmployee
AS
Select * From Employee
Order by LastName;
GO
EXEC spEmployee;

--takes 1 or more input parameter
USE HOSPITAL_TestDB;
GO
CREATE PROC spFindInsuranceHolder
	@Holder varchar(50) = '%'
AS
BEGIN
	Select InsranceHolder, patientID
	From Insurance
	Where InsranceHolder Like @Holder
END
Go
EXEC spFindInsuranceHolder 'ELMER%';

--Takes 1 parameter and returns 2
USE HOSPITAL_TestDB;
GO
CREATE PROC spPatientsContact
	@PatientID int,
	@FirstName varchar(25) OUTPUT,
	@LastName varchar (25) OUTPUT
AS
BEGIN TRY
SELECT @FirstName = FirstName, @LastName = LastName
From Patient
Where PatientID = @PatientID;
END TRY
BEGIN CATCH
	PRINT'AN ERROR HAS OCCURRED'
	PRINT 'MESSAGE;' + CONVERT(VARCHAR, ERROR_MESSAGE());
END CATCH	
GO

DECLARE @FirstName varchar(25);
DECLARE @LastName varchar (25);
EXEC spPatientsContact 1024, @FirstName Output, @LastName Output;
Select @FirstName AS 'First Name', @LastName AS 'Last Name';

use HOSPITAL_TestDB;
GO 
CREATE PROC spPatientCount
AS
Declare @patientCount int;
Select @patientCount = Count(*)
From Patient
Return @patientCount;
Go

Declare @patientCount int;
Exec @patientCount = spPatientCount;
PRINT 'There are' + Convert(Varchar,@patientCount) ='patients in your database';
Go
 
  IF OBJECT_ID('spPatientCount') is not null
 Drop Proc spPatientCount;
 Go

 use HOSPITAL_TestDB;
GO 
CREATE PROC spPatientCount
AS
Declare @patientCount int;
Select @patientCount = Count(*)
From Patient
Return @patientCount;
Go

Declare @patientCount int;
Exec @patientCount = spPatientCount;
PRINT 'There are' + '' + Convert(Varchar,@patientCount) + '' +'patients in your database';
Go */

/* Final Project User Defined Functions 

--Scaler function

Use HOSPITAL_TestDB;
GO
Create Function fnEmployeeID
	(@EmployeeLastName varchar(25))
	Returns int
BEGIN
	Return(Select employeeID from Employee Where LastName = @EmployeeLastName);
END;

Select FirstName, MiddleInitial
From Employee
Where EmployeeID = dbo.fnEmployeeID('Duck');

USE HOSPITAL_TestDB;
GO
CREATE FUNCTION fnAccountSummary
	(@EncounterID int)
	Returns table
Return
	(Select * From AccountSummary Where @EncounterID= AccountSummary.EncounterID);

Select * From dbo.fnAccountSummary(183265);
Select * From dbo.fnAccountSummary(183077);
Select * From dbo.fnAccountSummary(183774);*/

/* Final Project Triggers 

use HOSPITAL_TestDB;
GO
Select * INTO PatientArchive
From Patient
Where 1 = 0;

--updating table
Alter Table PatientArchive
Add Activity varchar(50)
Go

--insert trigger
CREATE TRIGGER PatientArchive_INSERT on Patient
	AFTER INSERT
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @PatientID int
	DECLARE @FirstName varchar(25)
	DECLARE @LastName varchar(25)
	DECLARE @DateOfBirth date
	DECLARE @socialSecurityNumber int
	DECLARE @ZipCode varchar(25)

Select @PatientID = inserted.PatientID, @FirstName = inserted.FirstName, @LastName =inserted.LastName,
	   @DateOfBirth = inserted.dateofbirth, @socialSecurityNumber = inserted.socialsecuritynumber,
	   @ZipCode = inserted.zipcode
From inserted

INSERT INTO PatientArchive Values(@PatientID,@FirstName,@LastName,@DateOfBirth,@socialSecurityNumber,@ZipCode,'Inserted')
End

--checking to see if it works
Insert Into Patient Values(185675,'Buggs','Bunny', '1905-03-03', 385060024 , '56821');
Go

--viewing data
Select * From PatientArchive;

--Delete trigger
CREATE TRIGGER PatientArchive_Delete on Patient
	AFTER DELETE
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @PatientID int
	DECLARE @FirstName varchar(25)
	DECLARE @LastName varchar(25)
	DECLARE @DateOfBirth date
	DECLARE @socialSecurityNumber int
	DECLARE @ZipCode varchar(25)

Select @PatientID = deleted.PatientID, @FirstName = deleted.FirstName, @LastName =deleted.LastName,
	   @DateOfBirth = deleted.dateofbirth, @socialSecurityNumber = deleted.socialsecuritynumber,
	   @ZipCode = deleted.zipcode
From Deleted

INSERT INTO PatientArchive Values(@PatientID,@FirstName,@LastName,@DateOfBirth,@socialSecurityNumber,@ZipCode,'Deleted')
End
Go

--deleting row from patients
Delete from Patient Where PatientID = 185675;
Go

--viewing data
Select * From PatientArchive;


--update trigger
CREATE TRIGGER PatientArchive_Update on Patient
	AFTER UPDATE
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @PatientID int
	DECLARE @FirstName varchar(25)
	DECLARE @LastName varchar(25)
	DECLARE @DateOfBirth date
	DECLARE @socialSecurityNumber int
	DECLARE @ZipCode varchar(25)

Select @PatientID = inserted.PatientID, @FirstName = inserted.FirstName, @LastName =inserted.LastName,
	   @DateOfBirth = inserted.dateofbirth, @socialSecurityNumber = inserted.socialsecuritynumber,
	   @ZipCode = inserted.zipcode
From inserted

INSERT INTO PatientArchive Values(@PatientID,@FirstName,@LastName,@DateOfBirth,@socialSecurityNumber,@ZipCode,'Updated')
End

UPDATE Patient
Set Firstname = 'Honey'
Where PatientID = 185675;
Go
Select * From PatientArchive;*/
