Create Trigger trManufacturerUserInsert
On Manufacturer
For Insert
As

Update Manufacturer
Set UCR = SYSTEM_USER,
	DCR = getDate()
From Manufacturer join [Inserted]
	on Manufacturer.Id = [Inserted].Id

Go

Create Trigger trManufacturerUserUpdate
On Manufacturer
For Update
As

Update Manufacturer
Set ULC = SYSTEM_USER,
	DLC = getDate()
From Manufacturer join [Inserted]
	on Manufacturer.Id = [Inserted].Id

Go

select * from Manufacturer

Insert Into Manufacturer
values ('Test', 'TestCountry', 'Test Telefone', 'Test Email', null, null, null, null)

Update Manufacturer
Set Name = 'Test2' 
Where Id = 

Delete From Manufacturer
Where Id = 


Update Manufacturer
Set ULC = SYSTEM_USER,
	DLC = getDate(),
	UCR = SYSTEM_USER,
	DCR = getDate()