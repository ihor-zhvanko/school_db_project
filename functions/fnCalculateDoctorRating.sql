Create Function fnCalculateDoctorRating(@id int)
Returns float(24)
As
Begin

Declare @totalPatients int = 
	(Select Count(PatientRef) From DiseaseHistory Where DoctorRef = @id);
Declare @totalTimeSpent int = 
	(Select Sum(DateDiff(d, FromDate, IIF(ToDate is null, getDate(), ToDate))) From DiseaseHistory Where DoctorRef = @id)
Declare @avgGrade float(24) = 
	(Select Avg(Grade) From DiseaseHistory Where DoctorRef = @id and Grade is not null)

return cast(@avgGrade * 0.1 + @totalTimeSpent * 0.5 + @totalPatients * 0.4 as float(24));

End;
Go