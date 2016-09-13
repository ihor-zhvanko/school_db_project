Create Trigger trDiseaseHistoryMedicineUserInsert
On DiseaseHistoryMedicine
For Insert
As

Update DiseaseHistoryMedicine
Set UCR = SYSTEM_USER,
	DCR = getDate()
From DiseaseHistoryMedicine join [Inserted]
	on DiseaseHistoryMedicine.MedicineRef = [Inserted].MedicineRef
		And DiseaseHistoryMedicine.DiseaseHistoryRef = [Inserted].DiseaseHistoryRef

Go

Create Trigger trDiseaseHistoryMedicineUserUpdate
On DiseaseHistoryMedicine
For Update
As

Update DiseaseHistoryMedicine
Set ULC = SYSTEM_USER,
	DLC = getDate()
From DiseaseHistoryMedicine join [Inserted]
	on DiseaseHistoryMedicine.MedicineRef = [Inserted].MedicineRef
		And DiseaseHistoryMedicine.DiseaseHistoryRef = [Inserted].DiseaseHistoryRef

Go

select * from DiseaseHistoryMedicine

Insert Into DiseaseHistoryMedicine
values (1, 1, null, null, null, null)

Update DiseaseHistoryMedicine
Set MedicineRef = 1
Where MedicineRef = 1 And DiseaseHistoryRef = 1

Delete From DiseaseHistoryMedicine
Where Id = 1


Update DiseaseHistoryMedicine
Set ULC = SYSTEM_USER,
	DLC = getDate(),
	UCR = SYSTEM_USER,
	DCR = getDate()