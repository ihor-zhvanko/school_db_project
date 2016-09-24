--////////////////INITIAL SCRIPT//////////////////
if OBJECT_ID('Disease') Is Null
	Create Table Disease
	(
		[Id] int Identity(1, 1),
		[Name] nvarchar(100) NOT NULL,
		[Description] nvarchar(1000) NOT NULL,
		Constraint PK_Disease Primary Key(Id)
	)

Go
--//////////////////////////////////////////////////
if OBJECT_ID('Manufacturer') Is Null
	Create Table Manufacturer
	(
		[Id] int Identity(1, 1),
		[Name] nvarchar(100) NOT NULL,
		[Country] nvarchar(100) NULL,
		[Telefone] nvarchar(50) NULL,
		[Email] nvarchar(50) NULL,
		Constraint PK_Manufacturer Primary Key(Id)
	)

Go
--//////////////////////////////////////////////////
if OBJECT_ID('Medicine') Is Null
	Create Table Medicine
	(
		[Id] int Identity(1, 1),
		[Name] nvarchar(100) NOT NULL,
		[Description] nvarchar(1000) NOT NULL,
		[ManufacturerRef] int NULL,
		Constraint PK_Medicine Primary Key(Id),
		Constraint FK_Medicine_Manufacturer Foreign Key([ManufacturerRef]) References Manufacturer(Id)
	)

Go
--//////////////////////////////////////////////////
if OBJECT_ID('Specialization') Is Null
	Create Table Specialization
	(
		Id int Identity(1, 1),
		Name nvarchar(50) NOT NULL,
		Salary int NOT NULL,
		Constraint PK_Specialization Primary Key(Id),
		Constraint CHK_Specialization_Salary Check(Salary > 1200)
	)

Go
--//////////////////////////////////////////////////
if OBJECT_ID('Doctor') Is Null
	Create Table Doctor
	(
		Id int Identity(1, 1),
		FirstName nvarchar(50) NOT NULL,
		MiddleName nvarchar(50) NOT NULL,
		LastName nvarchar(50) NOT NULL,
		SpecializationRef int NOT NULL,
		[Address] nvarchar(50) NULL,
		Constraint PK_Doctor Primary Key(Id),
		Constraint FK_Doctor_Specialization Foreign Key(SpecializationRef) References Specialization(Id),
	)

Go
--//////////////////////////////////////////////////
if OBJECT_ID('Patient') Is Null
	Create Table Patient
	(
		Id int Identity(1, 1),
		FirstName nvarchar(50) NOT NULL,
		MiddleName nvarchar(50) NOT NULL,
		LastName nvarchar(50) NOT NULL,
		[Address] nvarchar(50) NULL,
		Characteristic nvarchar(1000) NULL,
		Constraint PK_Patient Primary Key(Id)
	)

Go
--//////////////////////////////////////////////////
if OBJECT_ID('DiseaseHistory') Is Null
	Create Table DiseaseHistory
	(
		Id int Identity(1, 1),
		PatientRef int NOT NULL,
		DiseaseRef int NOT NULL,
		DoctorRef int NOT NULL,
		FromDate datetime2 NOT NULL,
		ToDate datetime2 NULL,
		Grade int NULL,
		DiagnosisDescription nvarchar(1000),
		Constraint PK_DiseaseHistory Primary Key(Id),
		Constraint FK_DiseaseHistory_Patient Foreign Key(PatientRef) References [Patient](Id),
		Constraint FK_DiseaseHistory_Doctor  Foreign Key(DoctorRef) References [Doctor](Id),
		Constraint FK_DiseaseHistory_Disease Foreign Key(DiseaseRef) References [Disease](Id),
		Constraint CHK_DiseaseHistory_Grade Check(Grade >= 0 AND Grade <= 100)
	)
Go
--//////////////////////////////////////////////////
if OBJECT_ID('DiseaseHistoryMedicine') Is Null
	Create Table DiseaseHistoryMedicine
	(
		MedicineRef int,
		DiseaseHistoryRef int,
		Constraint PK_DiseaseHistoryMedicine Primary Key(MedicineRef, DiseaseHistoryRef),
		Constraint FK_DiseaseHistoryMedicine_Medicine       Foreign Key(MedicineRef) References Medicine(Id),
		Constraint FK_DiseaseHistoryMedicine_DiseaseHistory Foreign Key(DiseaseHistoryRef) References DiseaseHistory(Id)
	)

Go
--//////////////////////////////////////////////////
if OBJECT_ID('MedicineComponent') Is Null
	Create Table MedicineComponent
	(
		MedicineRef int,
		ComponentRef int,
		Constraint PK_MedicineComponent Primary Key(MedicineRef, ComponentRef),
		Constraint FK_MedicineComponent_Medicine  Foreign Key(MedicineRef) References Medicine(Id),
		Constraint FK_MedicineComponent_Component Foreign Key(ComponentRef) References Medicine(Id)
	)

Go
--//////////////////////////////////////////////////
if OBJECT_ID('Contraindication') Is Null
	Create Table Contraindication
	(
		PatientRef int,
		MedicineRef int,
		Constraint PK_Contraindication Primary Key(PatientRef, MedicineRef),
		Constraint FK_Contraindication_Patient  Foreign Key(PatientRef) References Patient(Id),
		Constraint FK_Contraindication_Medicine Foreign Key(MedicineRef) References Medicine(Id)
	)

Go
--/////////////////////////////////////////////////
If OBJECT_ID('HospitalActionLog') Is NULL
	Create Table HospitalActionLog
	(
		[Date] datetime2, 
		[User] nchar(100),
		[Action] nchar(10),
		Constraint PK_HospitalActionLog Primary Key([Date], [User])
	)

Go
--//////////////////////////////////////////////////
if TYPE_ID('TManufacturer') Is Null
	Create Type TManufacturer as Table
	(
		[Name] nvarchar(100),
		[Country] nvarchar(100),
		[Telefone] nvarchar(50),
		[Email] nvarchar(50)
	)

Go