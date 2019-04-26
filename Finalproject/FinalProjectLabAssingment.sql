/* Create 4 Aggregates using Hospital_TestDB*/

/* A1
Use HOSPITAL_TestDB;
Select Min(BalanceDue) As [Minimum Due],
       Max(BalanceDue) As [Maximum Due],
       Avg (BalanceDue) As [Average Due]
From BillingStatement;*/

/* A2
Select ZipCode.City, Count(Patient.PatientID) As [Number of Patient]
From Patient Join ZipCode On ZipCode.ZipCode = patient.ZipCode
Group By ZipCode.City
Order By ZipCode.City;*/

/* A3 
Select Count(PatientID) As [Number of Patients],
		AVG(ClaimTotal) As [Average Claim Total]
From BillingStatement;*/

/* A4 
Select Count(patientID) As [Number of Patient],
		Sum(InsurancePayment) As [Total Insurance Payout]
From BillingStatement;*/

/*Just for fun
Use HOSPITAL_TestDB;
Select Min(ClaimTotal) As [Minimum Claim Total],Min(InsurancePayment) As [Minimum Insurance Covered],Min(BalanceDue) As [Minimum Due],
       Max(ClaimTotal) As [Maximum Claim Total],Max(InsurancePayment) As [Maximum Insurance Covered],Max(BalanceDue) As [Maximum Due],
       Avg(ClaimTotal) As [Maximum Claim Total],Avg(InsurancePayment) As [Average Insurance Covered],Avg (BalanceDue) As [Average Due],
	   Count(patient.PatientID) As [Number of Patients]
From BillingStatement Join Patient on Patient.PatientID = BillingStatement.PatientID
Group By Patient.PatientID
Order By Patient.PatientID;*/
