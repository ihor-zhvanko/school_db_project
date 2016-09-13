Create Trigger trDiseaseHistoryUserInsert
On DiseaseHistory
For Insert
As

Update DiseaseHistory
Set UCR = SYSTEM_USER,
	DCR = getDate()
From DiseaseHistory join [Inserted]
	on DiseaseHistory.Id = [Inserted].Id

Go

Create Trigger trDiseaseHistoryUserUpdate
On DiseaseHistory
For Update
As

Update DiseaseHistory
Set ULC = SYSTEM_USER,
	DLC = getDate()
From DiseaseHistory join [Inserted]
	on DiseaseHistory.Id = [Inserted].Id

Go

select * from DiseaseHistory

Insert Into DiseaseHistory
values (70, 14, 19, getDate(), null, null, 'some description', null, null, null, null)

Update DiseaseHistory
Set DiagnosisDescription = 'He is very sick'
Where Id = 

Delete From DiseaseHistory
Where Id = 51


Update DiseaseHistory
Set ULC = SYSTEM_USER,
	DLC = getDate(),
	UCR = SYSTEM_USER,
	DCR = getDate()