Create Trigger trMedicineComponentUserInsert
On MedicineComponent
For Insert
As

Update MedicineComponent
Set UCR = SYSTEM_USER,
	DCR = getDate()
From MedicineComponent join [Inserted]
	on MedicineComponent.ComponentRef = [Inserted].ComponentRef 
	   AND MedicineComponent.MedicineRef = [Inserted].MedicineRef

Go

Create Trigger trMedicineComponentUserUpdate
On MedicineComponent
For Update
As

Update MedicineComponent
Set ULC = SYSTEM_USER,
	DLC = getDate()
From MedicineComponent join [Inserted]
	on MedicineComponent.ComponentRef = [Inserted].ComponentRef 
	   AND MedicineComponent.MedicineRef = [Inserted].MedicineRef

Go

select * from MedicineComponent

Insert Into MedicineComponent
values (..., null, null, null, null)

Update MedicineComponent
Set MedicineRef = 1
Where PatientRef = 1 And MedicineRef = 1

Delete From MedicineComponent
Where MedicineRef = 1 And PatientRef = 1