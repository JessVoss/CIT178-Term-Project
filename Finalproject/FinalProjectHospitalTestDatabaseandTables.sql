CREATE DATABASE HOSPITAL_TestDB

use HOSPITAL_TestDB;

/* Creating ZipCode Table*/
CREATE Table ZipCode(
ZipCode Varchar(10) Not Null,
City Varchar(30),
State Varchar(30)
Primary Key(ZipCode)
);

/* Creating Employee Table*/
CREATE Table Employee(
EmployeeID int Not Null,
FirstName Varchar(25) Not Null,
LastName VarChar(25) Not Null,
MiddleInitial VarChar(1),
DateOfHire date
Primary Key(EmployeeID)
);

/*Creating Patient Table*/
CREATE Table Patient(
PatientID int Not Null,
FirstName VarChar(25) Not Null,
LastName Varchar(25) Not Null,
DateOfBirth Date Not Null,
SocialSecurityNumber int,
ZipCode VarChar(10)
Primary Key(PatientID)
);

/* Creating Account Summary */
CREATE Table AccountSummary(
EncounterID int Not Null,
PatientID int Not Null,
ServiceType Varchar(2) Not Null,
DateOFService date Not Null,
EmployeeID int Not Null,
Primary Key(EncounterID, PatientID)
);

/* Creating Insurance Table */
CREATE Table Insurance(
InsuranceID int Not Null,
PatientID int Not Null,
InsranceHolder Varchar(50),
Zipcode VarChar(10)
Primary Key(InsuranceID)
);

/* Creating BillingStatement Table */ 
/* Not sure if BillingID should be VarChar*/
CREATE Table BillingStatement(
BillingID VarChar(4) Not Null,
PatientID int Not Null,
EncounterID int Not Null,
InsuranceID int Not Null,
ClaimTotal Money,
InsurancePayment Money,
BalanceDue Money
Primary Key(BillingID)
);

Alter Table Insurance
Drop Column ZipCode;

Alter Table Insurance
Add ZipCode VarChar(10);

