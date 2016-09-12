Alter Trigger trDiseaseHistoryMedicineInsert
On DiseaseHistoryMedicine
For Insert
As

Declare @t Table (PatientId int, MedicineId int, IsNotAllowed bit);

Insert Into @t
	Select dh.PatientRef, i.MedicineRef, dbo.fnIsContraindicated(dh.PatientRef, i.MedicineRef)
	From DiseaseHistory dh join [Inserted] i on dh.Id = i.DiseaseHistoryRef

if Exists(select * From @t Where IsNotAllowed = 1)
	Throw 50001, 'Current medicine(s) or its(theirs) component(s) are contraindicated for patient(s)', 1

Go

insert into DiseaseHistory Values
(30, 4, 6, '2014-01-01', null, null, 'bla bla')

select * From DiseaseHistory Where PatientRef = 30

select * From DiseaseHistoryMedicine Where DiseaseHistoryRef = 86

Insert Into DiseaseHistoryMedicine Values
(1, 86)