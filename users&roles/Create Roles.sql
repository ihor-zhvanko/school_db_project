Declare @dbRoles Table 
(
	[RoleName] sysname,
	[RoleId] smallint,
	[IsAppRole] int
)
Insert Into @dbRoles
	exec sp_helprole
If Not Exists(select * from @dbRoles Where RoleName = 'Administrator')
	Create Role Administrator

If Not Exists(select * from @dbRoles Where RoleName = 'Editor')
	Create Role Editor

If Not Exists(select * from @dbRoles Where RoleName = 'Moderator')
	Create Role Moderator

If Not Exists(select * from @dbRoles Where RoleName = 'Filler')
	Create Role Filler

If Not Exists(select * from @dbRoles Where RoleName = 'Reader')
	Create Role Reader
--alter role Editor drop member am_guest

Go

--We give full control to administrator role
Grant Control To Administrator

--Grant base permission for editing all tables
Grant Select To Editor
Grant Insert To Editor
Grant Update To Editor
Grant Delete To Editor

--Grant all needed permissions for Moderator
Grant Select To Moderator
Grant Delete To Moderator

--Necessary permissions for Filler
Grant Select To Filler
Grant Insert To Filler

--Reader requires only select permission
Grant Select To Reader

Go

--Give ihor_moderator_filler permission to delete, select, insert
Alter Role Moderator Add Member ihor_moderator_filler
Alter Role Filler    Add Member ihor_moderator_filler

Go

Alter Role Filler Drop Member ihor_moderator_filler

Go

Revoke Delete To Moderator

Go

Revoke Select On dbo.Medicine To Editor
Revoke Insert On dbo.Medicine To Editor
Revoke Update On dbo.Medicine To Editor
Revoke Delete On dbo.Medicine To Editor

Go

Alter Role Moderator Drop Member ihor_moderator_filler
Alter Role Filler    Drop Member ihor_moderator_filler
