-- Create new users for the following cases:
--     1: Web/desktop application, which should be able to SELECT, INSERT, UPDATE, DELETE and execute stored procedures from the sql_store and all it's tables.

-- We should use a stronger password, but this is just an example.
-- We can also specify a domian using "user@domain.com" or "user@localhost" to prevent users from connecting externally.
CREATE USER sample_app IDENTIFIED BY '1234'; 

GRANT SELECT, INSERT, UPDATE, DELETE, EXECUTE
    ON sql_store.*
    TO sample_app;

--     2: DB admin, which should be able to have control over all the databases and all the tables.
CREATE USER another_admin IDENTIFIED BY 'superSecurePassword';

-- The "*.*" means that the user will have access to every database, table, trigger, event, etc... In the entire MySQL server.
GRANT ALL
	ON *.*
    TO another_admin;