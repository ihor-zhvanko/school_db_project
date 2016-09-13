Create Trigger trDoctorUserInsert
On Doctor
For Insert
As

Update Doctor
Set UCR = SYSTEM_USER,
	DCR = getDate()
From Doctor join [Inserted]
	on Doctor.Id = [Inserted].Id

Go

Create Trigger trDoctorUserUpdate
On Doctor
For Update
As

Update Doctor
Set ULC = SYSTEM_USER,
	DLC = getDate()
From Doctor join [Inserted]
	on Doctor.Id = [Inserted].Id

Go

select * from Doctor

Insert Into Doctor
values ('Test', 'Test', 'Test', 1, 'Test Address', null, null, null, null)

Update Doctor
Set Name = 'Test2' 
Where Id = 

Delete From Doctor
Where Id = 


Update Doctor
Set ULC = SYSTEM_USER,
	DLC = getDate(),
	UCR = SYSTEM_USER,
	DCR = getDate()