Create View vwMedicineComponent
As
	select * From Medicine m
		left join MedicineComponent mc
		On m.Id = mc.MedicineRef
Go