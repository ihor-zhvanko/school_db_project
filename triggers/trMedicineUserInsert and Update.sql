Create Trigger trMedicineUserInsert
On Medicine
For Insert
As

Update Medicine
Set UCR = SYSTEM_USER,
	DCR = getDate()
From Medicine join [Inserted]
	on Medicine.Id = [Inserted].Id

Go

Create Trigger trMedicineUserUpdate
On Medicine
For Update
As

Update Medicine
Set ULC = SYSTEM_USER,
	DLC = getDate()
From Medicine join [Inserted]
	on Medicine.Id = [Inserted].Id

Go

select * from Medicine

Insert Into Medicine
values (... , null, null, null, null)

Update Medicine
Set Name = 'Test2' 
Where Id = 

Delete From Medicine
Where Id = 


Update Manufacturer
Set ULC = SYSTEM_USER,
	DLC = getDate(),
	UCR = SYSTEM_USER,
	DCR = getDate()