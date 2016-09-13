Create Procedure spRunUpdateScript (@tableName nvarchar(100))
As

Declare @addTemplate nvarchar(1000) = 'Begin Transaction
Alter Table '+@tableName+' Add
	UCR nchar(100) Constraint DF_'+@tableName+'_UCR default('+ char(39)+ char(39)+'),
	DCR datetime2 Constraint DF_'+@tableName+'_DCR default(getDate()),
	ULC nchar(100) Constraint DF_'+@tableName+'_ULC default('+ char(39)+ char(39)+'),
	DLC datetime2 Constraint DF_'+@tableName+'_DLC default(getDate())

Commit'

Declare @updateTemplate nvarchar(1000) = 'Update '+@tableName+'
Set UCR = '+ char(39)+ 'ihor'+char(39)+',
	DCR = getDate(),
	ULC = '+char(39)+'ihor'+char(39)+',
	DLC = getDate()';

exec sp_executesql @addTemplate
exec sp_executesql @updateTemplate

Go

Declare @currentTable nvarchar(100)

Declare @t Table ([Name] nvarchar(100))
Insert Into @t Values
	('Manufacturer'),
	('Medicine'),
	('Specialization'),
	('Doctor'),
	('Patient'),
	('MedicineComponent'),
	('DiseaseHistory'),
	('DiseaseHistoryMedicine')

Declare TableCursor Cursor Local
For (select * from @t)

Open TableCursor;
Fetch Next From TableCursor
Into @currentTable

While @@FETCH_STATUS = 0
Begin

	exec spRunUpdateScript @currentTable

	Fetch Next From TableCursor
	Into @currentTable

End