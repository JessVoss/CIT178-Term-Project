use HOSPITAL_TestDB;

Go
Create index idx_patientZip on Patient(ZipCode);
Go
Create index idx_insuranceZip on Insurance(ZipCode);
Go
Create index idx_insurancePatientID on Insurance(PatientID);
Go
Create index idx_billingPatID on BillingStatement(PatientID);
Go
Create index idx_billingInsurance on BillingStatement(InsuranceID);
Go
Create index idx_ASemployeeID on AccountSummary(EmployeeID);
Go
/* Can I do an index on a multi PK and FK*/
Create index idx_ASPatientID on AccountSummary(PatientID);
Go

