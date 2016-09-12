Alter Trigger trDiseaseHistoryInsert
On DiseaseHistory
For Insert
As

Declare @patientsCounts table ( Total int );

Insert Into @patientsCounts
	Select Count(DiseaseHistory.PatientRef)
	From DiseaseHistory join [Inserted] on DiseaseHistory.DoctorRef = [Inserted].DoctorRef
	Where DiseaseHistory.ToDate is null
	Group by DiseaseHistory.[DoctorRef]

If 10 < Any(select * from @patientsCounts)
	Throw 500001, 'Doctor has already 10 patients. You can"t add more.', 1

Go

select * from DiseaseHistory

Insert Into DiseaseHistory
Values (70, 14, 16, '2014-01-01', null, null, 'bla bla')

select * From DiseaseHistory Where DoctorRef = 16

Delete from DiseaseHistory
Where Id in(83)
