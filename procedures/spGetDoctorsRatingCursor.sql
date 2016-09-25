Create Procedure spGetDoctorsRatingCursor
As

Declare DoctorCursor Cursor Local For
	Select Id From Doctor

Declare @currentId int;

Open DoctorCursor
Fetch Next From DoctorCursor Into @currentId

While @@FETCH_STATUS = 0
Begin

	exec spGetDoctorRating @currentId

	Fetch Next From DoctorCursor
	Into @currentId

End

Go