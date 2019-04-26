/*  Final Project Views */
use HOSPITAL_TestDB;
/* View 1
-- Updatable View--

Go
Create View VI_AccountSummary
As
Select EncounterID, PatientID, ServiceType, DateOfService, EmployeeID
From AccountSummary;
Go

--Displaying Data--
 
Select * From AccountSummary;

-- Updating Date of Service
Go 
Update AccountSummary
Set DateOFService = '10-8-2018'
Where EncounterID = 183704;
Go

Select * From VI_AccountSummary; */

/* View 2

-- Creating view--

Go
Create View  VI_Patient
As
Select Patient.FirstName, Patient.LastName, insuranceID, InsranceHolder
From Insurance Join Patient ON patient.PatientID = Insurance.PatientID;
Go

--Displaying Data--

Select * From VI_Patient;*/

/* View 3

--Creating View--

Go
Create View VI_Employees
As
Select EmployeeID, FirstName + ' ' + Left(LastName,1) As EmployeeName, DateOfHire
From Employee;
Go
-- Displaying Dataase--

Select * From VI_Employees;*/

/* View 4

--Creating Database--

Go
Create View VI_Billing
AS
Select EncounterID, ClaimTotal, InsurancePayment, BalanceDue
From BillingStatement
Where BalanceDue > 1000;
Go

--Displaying Data--
Select * From VI_Billing;*/