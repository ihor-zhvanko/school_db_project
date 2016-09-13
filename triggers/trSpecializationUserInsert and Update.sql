Create Trigger trSpecializationUserInsert
On Specialization
For Insert
As

Update Specialization
Set UCR = SYSTEM_USER,
	DCR = getDate()
From Specialization join [Inserted]
	on Specialization.Id = [Inserted].Id

Go

Create Trigger trSpecializationUserUpdate
On Specialization
For Update
As

Update Specialization
Set ULC = SYSTEM_USER,
	DLC = getDate()
From Specialization join [Inserted]
	on Specialization.Id = [Inserted].Id

Go

select * from Specialization

Insert Into Specialization
values (... , null, null, null, null)

Update Specialization
Set Name = 'Test2' 
Where Id = 

Delete From Specialization
Where Id = 


Update Specialization
Set ULC = SYSTEM_USER,
	DLC = getDate(),
	UCR = SYSTEM_USER,
	DCR = getDate()