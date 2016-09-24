Create Login am_guest With Password = 'openTEST1234!';
Go
Create User am_guest For Login am_guest With DEFAULT_SCHEMA = dbo;

-----in db-----------
Create User am_guest For Login am_guest With DEFAULT_SCHEMA = dbo;
Grant Connect To am_guest


------------------------------------------------------------------------------------------

Create Login ihor_moderator_filler With Password = 'openTEST1234!';
Go
Create User ihor_moderator_filler For Login ihor_moderator_filler With DEFAULT_SCHEMA = dbo;
--Grant Connect To ihor_moderator_filler;

Go

Use Hospital

Go

Create User ihor_moderator_filler For Login ihor_moderator_filler With DEFAULT_SCHEMA = dbo;
Grant Connect To ihor_moderator_filler;

Go