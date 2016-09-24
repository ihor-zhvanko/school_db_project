Create Trigger trDbAuditCreateTable
On Database
For CREATE_TABLE
As
	insert into HospitalActionLog Values
	(getDate(), SYSTEM_USER, 'Create')
Go

Create Trigger trDbAuditAlterTable
On Database
For ALTER_TABLE
As
	insert into HospitalActionLog Values
	(getDate(), SYSTEM_USER, 'Alter')
Go

Create Trigger trDbAuditDropTable
On Database
For DROP_TABLE
As
	insert into HospitalActionLog Values
	(getDate(), SYSTEM_USER, 'Drop')
Go