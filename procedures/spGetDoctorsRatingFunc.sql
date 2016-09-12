Create Procedure spGetDoctorsRatingFunc
As

Select *, dbo.fnCalculateDoctorRating(Id) as Rating 
From Doctor
Order By Rating Desc

Go