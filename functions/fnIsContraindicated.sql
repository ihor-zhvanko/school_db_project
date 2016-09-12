Create Function fnIsContraindicated(@patientId int, @medicineId int)
Returns Bit
As
Begin

Declare @t Table (Id int);

With MedicalComponents(Id, Name, ComponentRef) As
(
	Select m.Id, m.Name, mc.ComponentRef
	From Medicine m Left Join MedicineComponent mc
	On m.Id = mc.MedicineRef
	Where m.Id = @medicineId

	UNION ALL

	Select x.Id, x.Name, x.ComponentRef
	From MedicalComponents join vwMedicineComponent as x
	On MedicalComponents.ComponentRef = x.Id
	
)

Insert Into @t
Select Id From Contraindication c join MedicalComponents mc 
	on c.MedicineRef = mc.Id and c.PatientRef = @patientId

Return Case When (select count(*) From @t) > 0 Then 1 Else 0 End;

End;
Go

select * From Contraindication Where PatientRef = 30


--30

Select dbo.fnIsContraindicated(30, 6)