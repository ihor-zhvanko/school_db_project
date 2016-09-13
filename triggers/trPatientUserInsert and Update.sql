Create Trigger trPatientUserInsert
On Patient
For Insert
As

Update Patient
Set UCR = SYSTEM_USER,
	DCR = getDate()
From Patient join [Inserted]
	on Patient.Id = [Inserted].Id

Go

Create Trigger trPatientUserUpdate
On Patient
For Update
As

Update Patient
Set ULC = SYSTEM_USER,
	DLC = getDate()
From Patient join [Inserted]
	on Patient.Id = [Inserted].Id

Go

select * from Patient

Insert Into Patient
values (... , null, null, null, null)

Update Patient
Set Name = 'Test2' 
Where Id = 

Delete From Patient
Where Id = 


Update Patient
Set ULC = SYSTEM_USER,
	DLC = getDate(),
	UCR = SYSTEM_USER,
	DCR = getDate()