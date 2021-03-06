USE [master]
GO
/****** Object:  Database [HOSPITAL_TestDB]    Script Date: 4/25/2019 9:14:58 PM ******/
CREATE DATABASE [HOSPITAL_TestDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HOSPITAL_TestDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\HOSPITAL_TestDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HOSPITAL_TestDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\HOSPITAL_TestDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [HOSPITAL_TestDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HOSPITAL_TestDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HOSPITAL_TestDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HOSPITAL_TestDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HOSPITAL_TestDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HOSPITAL_TestDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HOSPITAL_TestDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [HOSPITAL_TestDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HOSPITAL_TestDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HOSPITAL_TestDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HOSPITAL_TestDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HOSPITAL_TestDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HOSPITAL_TestDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HOSPITAL_TestDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HOSPITAL_TestDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HOSPITAL_TestDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HOSPITAL_TestDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [HOSPITAL_TestDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HOSPITAL_TestDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HOSPITAL_TestDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HOSPITAL_TestDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HOSPITAL_TestDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HOSPITAL_TestDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HOSPITAL_TestDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HOSPITAL_TestDB] SET RECOVERY FULL 
GO
ALTER DATABASE [HOSPITAL_TestDB] SET  MULTI_USER 
GO
ALTER DATABASE [HOSPITAL_TestDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HOSPITAL_TestDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HOSPITAL_TestDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HOSPITAL_TestDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HOSPITAL_TestDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'HOSPITAL_TestDB', N'ON'
GO
ALTER DATABASE [HOSPITAL_TestDB] SET QUERY_STORE = OFF
GO
USE [HOSPITAL_TestDB]
GO
/****** Object:  UserDefinedFunction [dbo].[fnEmployeeID]    Script Date: 4/25/2019 9:14:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Function [dbo].[fnEmployeeID]
	(@EmployeeLastName varchar(25))
	Returns int
BEGIN
	Return(Select employeeID from Employee Where LastName = @EmployeeLastName);
END;
GO
/****** Object:  Table [dbo].[AccountSummary]    Script Date: 4/25/2019 9:14:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountSummary](
	[EncounterID] [int] NOT NULL,
	[PatientID] [int] NOT NULL,
	[ServiceType] [varchar](2) NOT NULL,
	[DateOFService] [date] NOT NULL,
	[EmployeeID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EncounterID] ASC,
	[PatientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[fnAccountSummary]    Script Date: 4/25/2019 9:14:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnAccountSummary]
	(@EncounterID int)
	Returns table
Return
	(Select * From AccountSummary Where @EncounterID= AccountSummary.EncounterID);
GO
/****** Object:  View [dbo].[VI_AccountSummary]    Script Date: 4/25/2019 9:14:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create View [dbo].[VI_AccountSummary]
As
Select EncounterID, PatientID, ServiceType, DateOfService, EmployeeID
From AccountSummary;
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 4/25/2019 9:14:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient](
	[PatientID] [int] NOT NULL,
	[FirstName] [varchar](25) NOT NULL,
	[LastName] [varchar](25) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[SocialSecurityNumber] [int] NULL,
	[ZipCode] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[PatientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Insurance]    Script Date: 4/25/2019 9:14:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Insurance](
	[InsuranceID] [int] NOT NULL,
	[PatientID] [int] NOT NULL,
	[InsranceHolder] [varchar](50) NULL,
	[ZipCode] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[InsuranceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VI_Patient]    Script Date: 4/25/2019 9:14:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create View  [dbo].[VI_Patient]
As
Select Patient.FirstName, Patient.LastName, insuranceID, InsranceHolder
From Insurance Join Patient ON patient.PatientID = Insurance.PatientID;
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 4/25/2019 9:14:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeID] [int] NOT NULL,
	[FirstName] [varchar](25) NOT NULL,
	[LastName] [varchar](25) NOT NULL,
	[MiddleInitial] [varchar](1) NULL,
	[DateOfHire] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VI_Employees]    Script Date: 4/25/2019 9:14:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create View [dbo].[VI_Employees]
As
Select EmployeeID, FirstName + ' ' + Left(LastName,1) As EmployeeName, DateOfHire
From Employee;
GO
/****** Object:  Table [dbo].[BillingStatement]    Script Date: 4/25/2019 9:14:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillingStatement](
	[BillingID] [varchar](4) NOT NULL,
	[PatientID] [int] NOT NULL,
	[EncounterID] [int] NOT NULL,
	[InsuranceID] [int] NOT NULL,
	[ClaimTotal] [money] NULL,
	[InsurancePayment] [money] NULL,
	[BalanceDue] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[BillingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VI_Billing]    Script Date: 4/25/2019 9:14:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create View [dbo].[VI_Billing]
AS
Select EncounterID, ClaimTotal, InsurancePayment, BalanceDue
From BillingStatement
Where BalanceDue > 1000;
GO
/****** Object:  Table [dbo].[PatientArchive]    Script Date: 4/25/2019 9:14:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientArchive](
	[PatientID] [int] NOT NULL,
	[FirstName] [varchar](25) NOT NULL,
	[LastName] [varchar](25) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[SocialSecurityNumber] [int] NULL,
	[ZipCode] [varchar](10) NULL,
	[Activity] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ZipCode]    Script Date: 4/25/2019 9:14:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ZipCode](
	[ZipCode] [varchar](10) NOT NULL,
	[City] [varchar](30) NULL,
	[State] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[ZipCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [idx_ASemployeeID]    Script Date: 4/25/2019 9:14:59 PM ******/
CREATE NONCLUSTERED INDEX [idx_ASemployeeID] ON [dbo].[AccountSummary]
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_ASPatientID]    Script Date: 4/25/2019 9:14:59 PM ******/
CREATE NONCLUSTERED INDEX [idx_ASPatientID] ON [dbo].[AccountSummary]
(
	[PatientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_billingInsurance]    Script Date: 4/25/2019 9:14:59 PM ******/
CREATE NONCLUSTERED INDEX [idx_billingInsurance] ON [dbo].[BillingStatement]
(
	[InsuranceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_billingPatID]    Script Date: 4/25/2019 9:14:59 PM ******/
CREATE NONCLUSTERED INDEX [idx_billingPatID] ON [dbo].[BillingStatement]
(
	[PatientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_insurancePatientID]    Script Date: 4/25/2019 9:14:59 PM ******/
CREATE NONCLUSTERED INDEX [idx_insurancePatientID] ON [dbo].[Insurance]
(
	[PatientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_insuranceZip]    Script Date: 4/25/2019 9:14:59 PM ******/
CREATE NONCLUSTERED INDEX [idx_insuranceZip] ON [dbo].[Insurance]
(
	[ZipCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_patientZip]    Script Date: 4/25/2019 9:14:59 PM ******/
CREATE NONCLUSTERED INDEX [idx_patientZip] ON [dbo].[Patient]
(
	[ZipCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AccountSummary]  WITH CHECK ADD  CONSTRAINT [FK_E1] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[AccountSummary] CHECK CONSTRAINT [FK_E1]
GO
ALTER TABLE [dbo].[AccountSummary]  WITH CHECK ADD  CONSTRAINT [FK_Patient] FOREIGN KEY([PatientID])
REFERENCES [dbo].[Patient] ([PatientID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[AccountSummary] CHECK CONSTRAINT [FK_Patient]
GO
ALTER TABLE [dbo].[BillingStatement]  WITH CHECK ADD  CONSTRAINT [FK_InsuranceID] FOREIGN KEY([InsuranceID])
REFERENCES [dbo].[Insurance] ([InsuranceID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[BillingStatement] CHECK CONSTRAINT [FK_InsuranceID]
GO
ALTER TABLE [dbo].[BillingStatement]  WITH CHECK ADD  CONSTRAINT [FK_PatID] FOREIGN KEY([PatientID])
REFERENCES [dbo].[Patient] ([PatientID])
GO
ALTER TABLE [dbo].[BillingStatement] CHECK CONSTRAINT [FK_PatID]
GO
ALTER TABLE [dbo].[Insurance]  WITH CHECK ADD  CONSTRAINT [FK_PatientID] FOREIGN KEY([PatientID])
REFERENCES [dbo].[Patient] ([PatientID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Insurance] CHECK CONSTRAINT [FK_PatientID]
GO
ALTER TABLE [dbo].[Insurance]  WITH CHECK ADD  CONSTRAINT [FK_Zip] FOREIGN KEY([ZipCode])
REFERENCES [dbo].[ZipCode] ([ZipCode])
GO
ALTER TABLE [dbo].[Insurance] CHECK CONSTRAINT [FK_Zip]
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD  CONSTRAINT [FK_ZipCode] FOREIGN KEY([ZipCode])
REFERENCES [dbo].[ZipCode] ([ZipCode])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Patient] CHECK CONSTRAINT [FK_ZipCode]
GO
/****** Object:  StoredProcedure [dbo].[spEmployee]    Script Date: 4/25/2019 9:14:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spEmployee]
AS
Select * From Employee
Order by LastName;
GO
/****** Object:  StoredProcedure [dbo].[spFindInsuranceHolder]    Script Date: 4/25/2019 9:14:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spFindInsuranceHolder]
	@Holder varchar(50) = '%'
AS
BEGIN
	Select InsranceHolder, patientID
	From Insurance
	Where InsranceHolder Like @Holder
END
GO
/****** Object:  StoredProcedure [dbo].[spPatientCount]    Script Date: 4/25/2019 9:14:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spPatientCount]
AS
Declare @patientCount int;
Select @patientCount = Count(*)
From Patient
Return @patientCount;
GO
/****** Object:  StoredProcedure [dbo].[spPatientsContact]    Script Date: 4/25/2019 9:14:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spPatientsContact]
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
USE [master]
GO
ALTER DATABASE [HOSPITAL_TestDB] SET  READ_WRITE 
GO
