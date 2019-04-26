Use HOSPITAL_TestDB;

/* Adding Foreign Key to Patient Table */

Alter Table Patient With Check
ADD Constraint FK_ZipCode Foreign Key(ZipCode) References Zipcode(ZipCode)
On Update Cascade
Go

/* Adding Foreing Key to AccountSummary */
Alter Table AccountSummary With Check
ADD Constraint FK_E1 Foreign Key(EmployeeID) References Employee(EmployeeID)
On Update Cascade 
Go

Alter Table AccountSummary With Check
ADD constraint FK_Patient Foreign Key(PatientID) References Patient(PatientID)
On Update Cascade
Go


/* Adding Foreing Keys to Insurance Table */

Alter Table Insurance With Check
ADD Constraint FK_Zip Foreign Key(ZipCode) References ZipCode(ZipCode)
On Update No Action
Go 


Alter Table Insurance With Check
ADD Constraint FK_PatientID Foreign Key(PatientID) References Patient(PatientID)
On Update Cascade
Go 

/* Adding Foreign Key to BillingStatement Table */

Alter Table BillingStatement With Check 
ADD Constraint FK_PatID Foreign Key(PatientID) References Patient(PatientID)
On Update NO Action
Go

 /*Does Encounter ID lose its Primary Key status when it has another primary key for that table*/
Alter Table BillingStatement With Check 
ADD Constraint FK_EncounterID Foreign Key(EncounterID) References AccountSummary(EncounterID)
On Update Cascade
Go

Alter Table BillingStatement With Check 
ADD Constraint FK_InsuranceID Foreign Key(InsuranceID) References Insurance(InsuranceID)
On Update Cascade
Go
/* Assumption being you cannot delete people or encounters*/