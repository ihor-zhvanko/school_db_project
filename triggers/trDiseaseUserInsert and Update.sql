Create Trigger trDiseaseUserInsert
On Disease
For Insert
As

Update Disease
Set UCR = SYSTEM_USER,
	DCR = getDate()
From Disease join [Inserted]
	on Disease.Id = [Inserted].Id

Go

Create Trigger trDiseaseUserUpdate
On Disease
For Update
As

Update Disease
Set ULC = SYSTEM_USER,
	DLC = getDate()
From Disease join [Inserted]
	on Disease.Id = [Inserted].Id

Go

select * from Disease

Insert Into Disease
values ('My Threatment 2', 'Cream', null, null, null, null)

Update Disease
Set Name = 'My Threatment 3'
Where Id = 51

Delete From Disease
Where Id = 51