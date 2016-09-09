
--1-SELECT на базі однієї таблиці з використанням сортування, накладенням умов зі зв’язками OR та AND
Select * From DiseaseHistory
Where 
	FromDate >= '2004-01-01' 
	And ToDate <= '2014-01-01'
	And (DoctorRef = 5 or DoctorRef = 6)
Order By FromDate

--2-SELECT з виводом обчислюваних полів (виразів) в колонках результату
Select FirstName, LastName, count(PatientRef) as PatientCount 
From Doctor join DiseaseHistory On Doctor.Id = DoctorRef
Group By FirstName, LastName

--3-SELECT на базі кількох таблиць з використанням сортування, накладенням умов зі зв’язками OR та AND
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

Select Doctor.*, PatientRef From Doctor Left Outer Join DiseaseHistory
On Doctor.Id = DiseaseHistory.DoctorRef

--5-SELECT з використанням операторів Like, Between, In, Exists, All, Any

Select * From Doctor join DiseaseHistory
On Doctor.Id = DiseaseHistory.DoctorRef
Where FirstName like(N' А%') 
And (FromDate Between '2004-01-01' And '2014-01-01')
AND Grade in(61, 39)

select * From DiseaseHistory

--6-SELECT з використанням підсумовування та групування

Select FirstName, LastName, Avg(Grade) From
Doctor join DiseaseHistory 
	On Doctor.Id = DiseaseHistory.DoctorRef
Where Grade is not null
Group By FirstName, LastName

--7-SELECT з використанням під-запитів в частині Where

Select FirstName, LastName, Grade From
Doctor join DiseaseHistory 
	On Doctor.Id = DiseaseHistory.DoctorRef
Where Grade = (select Max(Grade) from DiseaseHistory)

--8-SELECT з використанням під-запитів в частині From

--9-ієрархічний SELECT‑запит

--10-SELECT‑запит типу CrossTab (Pivot)

--11-UPDATE на базі однієї таблиці.

--12-UPDATE на базі кількох таблиць.

--13-Append (INSERT) для додавання записів з явно вказаними значеннями.

--14-Append (INSERT) для додавання записів з інших таблиць.

--15-DELETE для видалення всіх даних з таблиці.

--16-DELETE для видалення вибраних записів таблиці.
