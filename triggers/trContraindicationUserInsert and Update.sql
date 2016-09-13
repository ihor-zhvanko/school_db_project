Create Trigger trContraindicationUserInsert
On Contraindication
For Insert
As

Update [Contraindication]
Set UCR = SYSTEM_USER,
	DCR = getDate()
From [Contraindication] join [Inserted]
	on [Contraindication].PatientRef = [Inserted].PatientRef 
	   AND [Contraindication].MedicineRef = [Inserted].MedicineRef

Go

Create Trigger trContraindicationUserUpdate
On Contraindication
For Update
As

Update [Contraindication]
Set ULC = SYSTEM_USER,
	DLC = getDate()
From [Contraindication] join [Inserted]
	on [Contraindication].PatientRef = [Inserted].PatientRef 
	   AND [Contraindication].MedicineRef = [Inserted].MedicineRef

Go

select * from [Contraindication]

Insert Into [Contraindication]
values (1, 1, null, null, null, null)

Update [Contraindication]
Set MedicineRef = 1
Where PatientRef = 1 And MedicineRef = 1

Delete From [Contraindication]
Where MedicineRef = 1 And PatientRef = 1