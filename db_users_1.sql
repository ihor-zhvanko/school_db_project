Create Login am_guest With Password = 'openTEST1234!';
Use Hospital
Create User am_guest For Login am_guest With DEFAULT_SCHEMA = dbo;
Grant Connect To am_guest

drop user  am_guest
drop login am_guest


-----in db-----------
Create User am_guest For Login am_guest With DEFAULT_SCHEMA = dbo;
Grant Connect To am_guest