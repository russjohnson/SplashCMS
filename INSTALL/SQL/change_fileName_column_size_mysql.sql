// modify the column names in order to accept the new UUID value (plus the string ".cfm")

alter table pageparts modify fileName VARCHAR(39);

alter table layouts modify fileName VARCHAR(39);

// this is not needed (for some reason was created in "INSTALL/SQL/add_fileName_column_mysql.sql"
// alter table pages modify fileName VARCHAR(39);