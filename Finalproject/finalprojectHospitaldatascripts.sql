USE [HOSPITAL_TestDB]
/*
GO
INSERT [dbo].[ZipCode] ([ZipCode], [City], [State]) VALUES (N'27085', N'Paradise', N'MI')
INSERT [dbo].[ZipCode] ([ZipCode], [City], [State]) VALUES (N'34967', N'Deluth', N'AK')
INSERT [dbo].[ZipCode] ([ZipCode], [City], [State]) VALUES (N'36497', N'Paris', N'MI')
INSERT [dbo].[ZipCode] ([ZipCode], [City], [State]) VALUES (N'46823', N'Atlanta', N'GA')
INSERT [dbo].[ZipCode] ([ZipCode], [City], [State]) VALUES (N'56821', N'Seattle', N'WA')
INSERT [dbo].[ZipCode] ([ZipCode], [City], [State]) VALUES (N'65842', N'Detroit', N'MI')
INSERT [dbo].[ZipCode] ([ZipCode], [City], [State]) VALUES (N'67852', N'Grand Rapids', N'MI')
INSERT [dbo].[Patient] ([PatientID], [FirstName], [LastName], [DateOfBirth], [SocialSecurityNumber], [ZipCode]) VALUES (1024, N'Pearl', N'Slaghoople', CAST(N'1890-07-20' AS Date), 111111111, N'65842')
INSERT [dbo].[Patient] ([PatientID], [FirstName], [LastName], [DateOfBirth], [SocialSecurityNumber], [ZipCode]) VALUES (13408, N'Emmer', N'Fudd', CAST(N'1906-04-04' AS Date), 0, N'27085')
INSERT [dbo].[Patient] ([PatientID], [FirstName], [LastName], [DateOfBirth], [SocialSecurityNumber], [ZipCode]) VALUES (18642, N'Tasmanian', N'Devil', CAST(N'1966-02-09' AS Date), 0, N'67852')
INSERT [dbo].[Patient] ([PatientID], [FirstName], [LastName], [DateOfBirth], [SocialSecurityNumber], [ZipCode]) VALUES (100672, N'Fred', N'Flintstone', CAST(N'1908-10-11' AS Date), 123456789, N'56821')
INSERT [dbo].[Patient] ([PatientID], [FirstName], [LastName], [DateOfBirth], [SocialSecurityNumber], [ZipCode]) VALUES (100689, N'Daffy', N'Duck', CAST(N'1937-04-17' AS Date), 0, N'34967')
INSERT [dbo].[Patient] ([PatientID], [FirstName], [LastName], [DateOfBirth], [SocialSecurityNumber], [ZipCode]) VALUES (103554, N'Barny', N'Rubble', CAST(N'1908-05-30' AS Date), 1234, N'36497')
INSERT [dbo].[Patient] ([PatientID], [FirstName], [LastName], [DateOfBirth], [SocialSecurityNumber], [ZipCode]) VALUES (103697, N'Wilma', N'Flintstone', CAST(N'1919-10-11' AS Date), 987654321, N'56821')
INSERT [dbo].[Patient] ([PatientID], [FirstName], [LastName], [DateOfBirth], [SocialSecurityNumber], [ZipCode]) VALUES (1003468, N'Betty', N'Rubble', CAST(N'1906-04-04' AS Date), 0, N'36497')
INSERT [dbo].[Patient] ([PatientID], [FirstName], [LastName], [DateOfBirth], [SocialSecurityNumber], [ZipCode]) VALUES (1025679, N'BammBamm', N'Rubble', CAST(N'1906-04-04' AS Date), 999999999, N'46823')
INSERT [dbo].[Insurance] ([InsuranceID], [PatientID], [InsranceHolder], [ZipCode]) VALUES (167, 13408, N'Elmers Fudd', N'27085')
INSERT [dbo].[Insurance] ([InsuranceID], [PatientID], [InsranceHolder], [ZipCode]) VALUES (204, 18642, N'Tasmanian Devil', N'67852')
INSERT [dbo].[Insurance] ([InsuranceID], [PatientID], [InsranceHolder], [ZipCode]) VALUES (376, 100689, N'Daffy Duck', N'34967')
INSERT [dbo].[Insurance] ([InsuranceID], [PatientID], [InsranceHolder], [ZipCode]) VALUES (500, 1024, N'Pearl Slaghoople', N'65842')
INSERT [dbo].[Insurance] ([InsuranceID], [PatientID], [InsranceHolder], [ZipCode]) VALUES (550, 103554, N'Betty Rubble', N'36497')
INSERT [dbo].[Insurance] ([InsuranceID], [PatientID], [InsranceHolder], [ZipCode]) VALUES (800, 100672, N'Wilma Flintstone', N'56821')
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [MiddleInitial], [DateOfHire]) VALUES (100234, N'Wild', N'Coyotee', N'P', CAST(N'1998-01-02' AS Date))
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [MiddleInitial], [DateOfHire]) VALUES (100235, N'Road', N'Runner', N'J', CAST(N'2000-02-01' AS Date))
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [MiddleInitial], [DateOfHire]) VALUES (100249, N'Buggs', N'Bunny', N'K', CAST(N'2010-03-25' AS Date))
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [MiddleInitial], [DateOfHire]) VALUES (100496, N'Donald', N'Duck', N'A', CAST(N'2014-02-27' AS Date))
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [MiddleInitial], [DateOfHire]) VALUES (100562, N'Porkey', N'Pig', N'P', CAST(N'2017-07-16' AS Date))
INSERT [dbo].[AccountSummary] ([EncounterID], [PatientID], [ServiceType], [DateOFService], [EmployeeID]) VALUES (183077, 1003468, N'IP', CAST(N'2018-02-10' AS Date), 100562)
INSERT [dbo].[AccountSummary] ([EncounterID], [PatientID], [ServiceType], [DateOFService], [EmployeeID]) VALUES (183265, 1025679, N'OP', CAST(N'2018-02-10' AS Date), 100235)
INSERT [dbo].[AccountSummary] ([EncounterID], [PatientID], [ServiceType], [DateOFService], [EmployeeID]) VALUES (183278, 103554, N'ER', CAST(N'2018-03-07' AS Date), 100496)
INSERT [dbo].[AccountSummary] ([EncounterID], [PatientID], [ServiceType], [DateOFService], [EmployeeID]) VALUES (183704, 18642, N'IP', CAST(N'2018-10-05' AS Date), 100235)
INSERT [dbo].[AccountSummary] ([EncounterID], [PatientID], [ServiceType], [DateOFService], [EmployeeID]) VALUES (183774, 18642, N'OP', CAST(N'2018-10-05' AS Date), 100496)
INSERT [dbo].[AccountSummary] ([EncounterID], [PatientID], [ServiceType], [DateOFService], [EmployeeID]) VALUES (183794, 100689, N'OP', CAST(N'2018-02-07' AS Date), 100496)
INSERT [dbo].[BillingStatement] ([BillingID], [PatientID], [EncounterID], [InsuranceID], [ClaimTotal], [InsurancePayment], [BalanceDue]) VALUES (N'G346', 103554, 183278, 550, 2678.0000, 1935.0000, 743.0000)
INSERT [dbo].[BillingStatement] ([BillingID], [PatientID], [EncounterID], [InsuranceID], [ClaimTotal], [InsurancePayment], [BalanceDue]) VALUES (N'G376', 100689, 183744, 376, 1015.0000, 750.0000, 265.0000)
INSERT [dbo].[BillingStatement] ([BillingID], [PatientID], [EncounterID], [InsuranceID], [ClaimTotal], [InsurancePayment], [BalanceDue]) VALUES (N'M128', 1025679, 183265, 550, 1004.0000, 700.0000, 304.0000)
INSERT [dbo].[BillingStatement] ([BillingID], [PatientID], [EncounterID], [InsuranceID], [ClaimTotal], [InsurancePayment], [BalanceDue]) VALUES (N'M769', 18642, 183704, 204, 36907.0000, 29000.0000, 7907.0000)
INSERT [dbo].[BillingStatement] ([BillingID], [PatientID], [EncounterID], [InsuranceID], [ClaimTotal], [InsurancePayment], [BalanceDue]) VALUES (N'P286', 1003468, 183077, 550, 34085.0000, 32452.0000, 1633.0000)

/* Changing data from 0 to null because when I originally entered it I forgot how*/
update Patient
Set SocialSecurityNumber = Null
Where SocialSecurityNumber = 0;*/


