
--1-SELECT на базі однієї таблиці з використанням сортування, накладенням умов зі зв’язками OR та AND
--Витягнути всі історії хвороби з 2004-01-01 до 2014-01-01 докторів з Id = 5 або Id = 6
Select * From DiseaseHistory
Where 
	FromDate >= '2004-01-01' 
	And ToDate <= '2014-01-01'
	And (DoctorRef = 5 or DoctorRef = 6)
Order By FromDate

--2-SELECT з виводом обчислюваних полів (виразів) в колонках результату
--Кількість пацієнтів у докторів за весь період
Select 
	FirstName, LastName, 
	count(PatientRef) as PatientCount 
From Doctor left join DiseaseHistory 
	On Doctor.Id = DoctorRef
Group By FirstName, LastName

--3-SELECT на базі кількох таблиць з використанням сортування, накладенням умов зі зв’язками OR та AND
--Кількість лікарських засобів, що виробляє кожна фірма
Select 
	Manufacturer.Name, 
	Medicine.[Description], 
	count(Medicine.Id) as MedicineCount
From Manufacturer join Medicine 
	on Manufacturer.Id = Medicine.ManufacturerRef
Where 
	(Country = 'Russia' Or Country = 'USA') 
	And Medicine.[Description] like N'%Таблетки%'
Group By 
	Manufacturer.Name, 
	Medicine.[Description]
Order By Manufacturer.Name

--4-SELECT на базі кількох таблиць з типом поєднання Outer Join
--Всі доктори і їх пацієнти
Select Doctor.*, PatientRef 
From Doctor Left Outer Join DiseaseHistory
On Doctor.Id = DiseaseHistory.DoctorRef

--5-SELECT з використанням операторів Like, Between, In, Exists, All, Any
--Всі доктора, чиє імя починається на А і які мали хворих в періоді з 2004-01-01 до 2014-01-01
--і також їх оцінка є 61 або 39
Select * From Doctor join DiseaseHistory
On Doctor.Id = DiseaseHistory.DoctorRef
Where FirstName like(N' А%') 
And (FromDate Between '2004-01-01' And '2014-01-01')
AND Grade in(61, 39)

--Список докторів, що мали хоча б одного хворого за весь час
Select * From Doctor
Where Exists(select * from DiseaseHistory Where Doctor.Id = DoctorRef)

--Максимальна оцінка для доктора
Select Distinct Doctor.*, Grade From Doctor join DiseaseHistory
On Doctor.Id = DiseaseHistory.DoctorRef
Where DiseaseHistory.Grade > ANY(Select AVG(Grade) From DiseaseHistory )

--6-SELECT з використанням підсумовування та групування
--Середній бал для кожного лікаря

Select FirstName, LastName, Avg(Grade) as AverageGrade
From Doctor join DiseaseHistory 
	On Doctor.Id = DiseaseHistory.DoctorRef
Where Grade is not null
Group By FirstName, LastName, Doctor.Id

--7-SELECT з використанням під-запитів в частині Where
--Доктора, що має максимальну оцінку

Select FirstName, LastName, Grade From
Doctor join DiseaseHistory 
	On Doctor.Id = DiseaseHistory.DoctorRef
Where Grade = (select Max(Grade) from DiseaseHistory)

--8-SELECT з використанням під-запитів в частині From
--Список всіх людей, що зареєстровані у базі
Select * From (
	Select FirstName, MiddleName, LastName From Patient
	UNION
	Select FirstName, MiddleName, LastName From Doctor
) as x

--9-ієрархічний SELECT‑запит
--Найти з яких компонентів складається лікарський засіб

Declare @medicineId int = 4;

With MedicalComponents(Id, Name, ComponentRef) As
(
	Select m.Id, m.Name, mc.ComponentRef
	From Medicine m Join MedicineComponent mc
	On m.Id = mc.MedicineRef
	Where mc.MedicineRef = @medicineId

	UNION ALL

	Select x.Id, x.Name, x.ComponentRef
	From MedicalComponents join vwMedicineComponent as x
	On MedicalComponents.ComponentRef = x.Id
	
)

select Id, Name From MedicalComponents
Group By Id, Name

--10-SELECT‑запит типу CrossTab (Pivot)

--11-UPDATE на базі однієї таблиці.

select * from Patient

Update Patient
Set [Address] = 'ул. Стрийская, 78, г. Львов, 79026'
Where Id = 1

--12-UPDATE на базі кількох таблиць.

Declare @t Table
(
	PatientId int,
	NewCharac nvarchar(1000)
)

insert into @t values
(1, 'This guy has lots of problems with health'),
(2, 'This guy has a very strong health')

Update Patient
Set Characteristic = tmp.NewCharac
From Patient join @t tmp
	On Patient.Id = tmp.PatientId

select * From Patient Where Id in(1, 2)

--13-Append (INSERT) для додавання записів з явно вказаними значеннями.

select * From Manufacturer

Insert Into Manufacturer Values
('My New Company 1', 'Ukraine',   '12345678', 'test1@gmail.com'),
('My New Company 2', 'Argentina', '87654321', 'test2@gmail.com')

--14-Append (INSERT) для додавання записів з інших таблиць.

Declare @t TManufacturer
Insert Into @t Values
('My New Company 3', 'USA',   '77777777', 'test3@gmail.com'),
('My New Company 4', 'Paris', '99999999', 'test4@gmail.com')

Insert Into Manufacturer
	Select * From @t

--15-DELETE для видалення всіх даних з таблиці.

Delete From MedicineComponent

--16-DELETE для видалення вибраних записів таблиці.

Delete From MedicineComponent
Where Id in(10, 11)

--------------------------------------------------------