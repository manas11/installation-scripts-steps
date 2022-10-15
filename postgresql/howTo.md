Getting Started with PostgreSQL
I assume that you are familiar with SQL commands (such as CREATE TABLE, DROP TABLE, INSERT, SELECT, UPDATE and DELETE). Otherwise, read ...

1.  Introduction
PostgreSQL is an open-source Object-Relational Database Management System (ORDBMS). It supports a large part of the SQL standards such as foreign keys, triggers, views and transactions; and object-oriented features such as inheritance.

The project started in UC Berkeley in 1986, and is now developed by a group of volunteers called "PostgreSQL Global Development Group".

The mother site for PostgreSQL is http://www.postgresql.org; with manual @ http://www.postgresql.org/docs/manuals/.

2.  Installing PostgreSQL 10.6
Ubuntu
// Refresh the apt-get repository
$ sudo apt-get update
// Install PostgreSQL
$ sudo apt-get install postgresql postgresql-contrib

// Verify the installation
$ dpkg --status postgresql
Package: postgresql
Version: 10+190
......
$ whereis postgresql
postgresql: /etc/postgresql /usr/lib/postgresql /usr/share/postgresql ...
$ which psql     // psql is an interactive PostgreSQL client
/usr/bin/psql
$ ll /usr/bin/psql
lrwxrwxrwx 1 root root 37 xxx xx  xxxx /usr/bin/psql -> ../share/postgresql-common/pg_wrapper*
The following packages will be installed:

postgresql, postgresql-common, postgresql-10: Core database server.
postgresql-client-common, postgresql-client-10: Client binaries and libraries.
postgresql-contrib-10: Additional supplied modules.
PostgreSQL Configuration Files
The PostgreSQL configuration files are stored in directory /etc/postgresql/10/main (for Ubuntu). The main configuration file is called "postgresql.conf".

$ less /etc/postgresql/10/main/postgresql.conf 
......
data_directory = '/var/lib/postgresql/10/main'
hba_file = '/etc/postgresql/10/main/pg_hba.conf'     # host-based authentication file
ident_file = '/etc/postgresql/10/main/pg_ident.conf' # ident configuration file
#listen_addresses = 'localhost'   # what IP address(es) to listen on;
                                  # comma-separated list of addresses;
                                  # defaults to 'localhost', '*' = all
port = 5432
max_connections = 100
......
Notes:

data_directory directive specifies where the databases are stored.
hba_file directive specifies the host-based authentication file.
ident_file directive specifies the ident authentication file.
The port directive specifies the TCP port number. The default is 5432.
3.  Getting Started
Reference: PostgreSQL Documentation - Tutorial @ http://www.postgresql.org/docs/10/static/tutorial.html.

3.1  PostgreSQL Client-Server System
PostgreSQL runs as a client-server system.

[TODO] more explanation.

PostgreSQL Server
In Ubuntu, the server is run as a service called postgresql (configured in /etc/init.d/postgresql). The postgresql service is started automatically upon startup. Like all other services, you could:

$ sudo service postgresql stop     // Stop the service
$ sudo service postgresql start    // Start the service
$ sudo service postgresql restart  // Stop and restart the service
$ sudo service postgresql reload   // Reload the configuration without stopping the service

// OR
$ sudo systemctl start postgresql
$ sudo systemctl stop postgresql
$ sudo systemctl restart postgresql
$ sudo systemctl reload postgresql
$ sudo systemctl status postgresql   // Show th status
The PostgreSQL server accepts connection by client program over the TCP/IP network. The default TCP port number is 5432.

The PostgreSQL server program is called postgres (in directory /usr/lib/postgresql/10/bin). There is also a symlink called postmaster in the same directory. You could display the PostgreSQL server process via:

$ ps aux | grep postgres
postgres  7136  0.0  0.2 134068  9608 ?        S    Dec13   0:01 
/usr/lib/postgresql/10/bin/postgres -D /var/lib/postgresql/10/main 
-c config_file=/etc/postgresql/10/main/postgresql.conf
......
Command-line Client Program "psql"
The PostgreSQL installation provides a command-line client program called psql, which can be used to login to the server.

$ which psql
/usr/bin/psql
$ ll /usr/bin/psql
lrwxrwxrwx 1 root root 37 xxx xx xxxx /usr/bin/psql -> ../share/postgresql-common/pg_wrapper*
psql is a symlink located in /usr/bin (a PATH entry). The actual program and utilities are located at /usr/lib/postgresql/10/bin and linked via pg_wrapper.

Utilities createdb, createuser
The directory /usr/lib/postgresql/10/bin also contains many utilities such as createdb (create database), dropdb (drop database), createuser (create PostgreSQL user), dropuser (drop PostgreSQL user), among others, with symlinks defined in /usr/bin.

$ ll /usr/bin/create*
lrwxrwxrwx 1 root root 37 xxx xx  xxxx /usr/bin/createdb -> ../share/postgresql-common/pg_wrapper*
lrwxrwxrwx 1 root root 37 xxx xx  xxxx /usr/bin/createuser -> ../share/postgresql-common/pg_wrapper*
Graphical Clients
Besides the command-line client psql, many graphical clients are available to access PostgreSQL, e.g., pgAdmin3, PhpPgAdmin (for PHP, model after PhpMyAdmin), etc. I will describe these tools in later sections.

3.2  Login to the PostgreSQL Server
Default PostgreSQL Superuser "postgres"
The PostgreSQL installation creates a "UNIX USER" called postgres, who is ALSO the "Default PostgreSQL's SUPERUSER". The UNIX USER postgres cannot login interactively to the system, as its password is not enabled.

Login as PostgreSQL Superuser "postgres" via "psql" Client
To run psql using "UNIX USER" postgres, you need to invoke "sudo -u postgres psql", which switches to "UNIX USER" postgres and run the psql command.

$ sudo -u postgres psql
   -- Run command "psql" as UNIX USER "postgres".
   -- Enter the CURRENT SUPERUSER password for sudo.
psql (10.6 (Ubuntu 10.6-0ubuntu0.18.04.1))
Type "help" for help.

postgres=# help 
You are using psql, the command-line interface to PostgreSQL.
Type:  \copyright for distribution terms
       \h for help with SQL commands
       \? for help with psql commands
       \g or terminate with semicolon to execute query
       \q to quit

-- Display version
postgres=# SELECT version();
     version                                                   
---------------------------------------------------
 PostgreSQL 10.6 (Ubuntu 10.6-0ubuntu0.18.04.1) ...
press q to quit display

-- Quit
postgres=# \q
Notes:

The PostgreSQL's prompt is in the format of databaseName=# for superuser or databaseName=> for regular user. In this case, the current database is also called postgres, which is the same as the username.
The prompt changes to -# (superuser) or -> (regular user) for command continuation.
Type "help" to see the help menu.
Type \q to quit.
Type \? to see all the psql commands.
You need to end a SQL statement with a semicolon (;) or \g (for GO) to execute the statement. For example, in "SELECT version();".
Comments: In a SQL script or command, an end-of-line comment begins with --; a block comment is enclosed by /* and */
3.3  Create Database, Create Table, CURD (Create-Update-Read-Delete) Records
-- Login to server
$ sudo -u postgres psql
......

-- List all databases via \l (or \list), or \l+ for more details
postgres=# \l
   Name    | ...
-----------+-----------
postgres   | ...
template0  | ...
template1  | ...
 
-- Help on SQL command syntax
postgres=# \h CREATE DATABASE
......
 
-- Create a new database called mytest
postgres=# CREATE DATABASE mytest;
CREATE DATABASE
   -- By default, the owner of the database is the current login user.
 
-- List all databases via \l (or \list), or \l+ for more details
postgres=# \l
                                  List of databases
   Name    |  Owner   | Encoding |   Collate   |    Ctype    |   Access privileges   
-----------+----------+----------+-------------+-------------+-----------------------
 mytest    | postgres | UTF8     | en_US.UTF-8 | en_US.UTF-8 |
 ......

   -- By default, CREATE DATABASE copies the "template1", which you could customize.
   -- "template0" has the same contents as "template1", but you should not change.
 
-- Connect to mytest database via \c (or \connect)
-- Take note of the change of database name in the command prompt.
postgres=# \c mytest 
You are now connected to database "mytest" as user "postgres".

-- Display all tables (aka relations) via \dt or \dt+ for more details
mytest=# \dt
Did not find any relations.
 
-- We will be using an enumeration (TYPE) in our table, let's define it.
mytest=# CREATE TYPE cat_enum AS ENUM ('coffee', 'tea');
CREATE TYPE

-- Display all types via /dT or /dT+ for more details.
mytest=# \dT+
                        List of data types
 Schema |   Name   | Internal name | Size | Elements | Description 
--------+----------+---------------+------+----------+-------------
 public | cat_enum | cat_enum      | 4    | coffee  +| 
        |          |               |      | tea      | 
 
-- Create a new table.
mytest=# CREATE TABLE IF NOT EXISTS cafe (
  id SERIAL PRIMARY KEY,        -- AUTO_INCREMENT integer, as primary key
  category cat_enum NOT NULL,   -- Use the enum type defined earlier
  name VARCHAR(50) NOT NULL,    -- Variable-length string of up to 50 characters
  price NUMERIC(5,2) NOT NULL,  -- 5 digits total, with 2 decimal places
  last_update DATE              -- 'YYYY-MM-DD'
);
NOTICE:  CREATE TABLE will create implicit sequence "cafe_id_seq" for serial column "cafe.id"
NOTICE:  CREATE TABLE / PRIMARY KEY will create implicit index "cafe_pkey" for table "cafe"
CREATE TABLE
 
-- Display all tables in the current database, via \dt or \dt+ for more details
mytest=# \dt+
                    List of relations
 Schema | Name | Type  |  Owner   |  Size   | Description 
--------+------+-------+----------+---------+-------------
 public | cafe | table | postgres | 0 bytes | 

-- Display details of a particular table.
mytest=# \d+ cafe
                                               Table "public.cafe"
   Column    |         Type          |                     Modifiers                     | Storage  | Description 
-------------+-----------------------+---------------------------------------------------+----------+-------------
 id          | integer               | not null default nextval('cafe_id_seq'::regclass) | plain    | 
 category    | cat_enum              | not null                                          | plain    | 
 name        | character varying(50) | not null                                          | extended | 
 price       | numeric(5,2)          | not null                                          | main     | 
 last_update | date                  |                                                   | plain    | 
Indexes:
    "cafe_pkey" PRIMARY KEY, btree (id)
Has OIDs: no

-- Insert rows.
mytest=# INSERT INTO cafe (category, name, price) VALUES
  ('coffee', 'Espresso', 3.19),
  ('coffee', 'Cappuccino', 3.29),
  ('coffee', 'Caffe Latte', 3.39),
  ('coffee', 'Caffe Mocha', 3.49),
  ('coffee', 'Brewed Coffee', 3.59),
  ('tea', 'Green Tea', 2.99),
  ('tea', 'Wulong Tea', 2.89);
INSERT 0 7
-- The output shows the OID (Object Identification Number) and the rows affected.
-- Each row has an hidden OID. OID is not a standard SQL feature and not recommended.
   
-- Query (SELECT)
mytest=# SELECT * FROM cafe;
 id | category |     name      | price | last_update 
----+----------+---------------+-------+-------------
  1 | coffee   | Espresso      |  3.19 | 2013-12-14
  2 | coffee   | Cappuccino    |  3.29 | 2013-12-14
  3 | coffee   | Caffe Latte   |  3.39 | 2013-12-14
  4 | coffee   | Caffe Mocha   |  3.49 | 2013-12-14
  5 | coffee   | Brewed Coffee |  3.59 | 2013-12-14
  6 | tea      | Green Tea     |  2.99 | 2013-12-14
  7 | tea      | Wulong Tea    |  2.89 | 2013-12-14
(7 rows)

mytest=# SELECT name, price FROM cafe WHERE category = 'coffee' AND price < 3.3; 
    name    | price 
------------+-------
 Espresso   |  3.19
 Cappuccino |  3.29
(2 rows)

-- Update
mytest=# UPDATE cafe SET price = price * 1.1 WHERE category = 'tea';
UPDATE 2
 
mytest=# SELECT * FROM cafe WHERE category = 'tea';
 id | category |    name    | price | last_update 
----+----------+------------+-------+-------------
  6 | tea      | Green Tea  |  3.29 | 2013-12-14
  7 | tea      | Wulong Tea |  3.18 | 2013-12-14
(2 rows)

-- Delete
mytest=# DELETE FROM cafe WHERE id = 6;
DELETE 1
 
mytest=# SELECT * FROM cafe WHERE category = 'tea';
 id | category |    name    | price | last_update 
----+----------+------------+-------+-------------
  7 | tea      | Wulong Tea |  3.18 | 2013-12-14
(1 row)

-- Quit
mytest=# \q
Notes:

Take note that there are two sets of commands:
psql commands: such as \c, \l, \dt.
SQL commands: such as CREATE DATABASE, CREATE TABLE and SELECT. SQL command KEYWORDS are not case sensitive. I show them in uppercase for clarity. PostgreSQL automatically converts all names (identifiers) to lowercase (even you type in uppercase or mixed case). To use uppercase or mixed case, you need to double-quote the names.
You need to end your SQL commands with a semi-colon (;) or \g. If you forget to enter a semi-colon, the command-prompt changes to "dbname-#" to indicate continuation (A SQL command can span many lines). You can enter the semi-colon on the new line.
More on psql commands
\?: show all psql commands.
\h sql-command: show syntax on SQL command.
\c dbname [username]: Connect to database, with an optional username (or \connect).
Display Commands: You can append + to show more details.
\l: List all database (or \list).
\d: Display all tables, indexes, views, and sequences.
\dt: Display all tables.
\di: Display all indexes.
\dv: Display all views.
\ds: Display all sequences.
\dT: Display all types.
\dS: Display all system tables.
\du: Display all users.
\x auto|on|off: Toggle|On|Off expanded output mode.
More on SQL commands
See ....

3.4  Using Utility "createuser" and "createdb"
As an example, let's create a PostgreSQL user called testuser, and a new database called testdb owned by testuser.

# Create a new PostgreSQL user called testuser, allow user to login, but NOT creating databases
$ sudo -u postgres createuser --login --pwprompt testuser
Enter password for new role: xxxx

# Create a new database called testdb, owned by testuser.
$ sudo -u postgres createdb --owner=testuser testdb
Tailor the PostgreSQL configuration file /etc/postgresql/10/main/pg_hba.conf to allow non-default user testuser to login to PostgreSQL server, by adding the following entry:

# TYPE  DATABASE    USER        ADDRESS          METHOD
local   testdb      testuser                     md5
Restart PostgreSQL server:

$ sudo service postgresql restart
Login to PostgreSQL server:

# Login to PostgreSQL: psql -U user database
$ psql -U testuser testdb
Password for user testuser: ......
psql (9.3.10)
Type "help" for help.

# List all databases (\list or \l)
testdb=>\list
   Name    |  Owner   | Encoding |   Collate   |    Ctype    |   Access privileges   
-----------+----------+----------+-------------+-------------+-----------------------
 testdb    | testuser | UTF8     | en_SG.UTF-8 | en_SG.UTF-8 |
......

# Create table
testdb=> create table if not exists cafe (
           name varchar(50),
           price numeric(5,2),
           primary key (name));
CREATE TABLE

# Insert rows
testdb=> insert into cafe values
           ('Espresso', 3.99),
           ('Green Tea', 2.99);
INSERT 0 2

# Select query
testdb=> select * from cafe;
   name    | price 
-----------+-------
 Espresso  |  3.99
 Green Tea |  2.99
(2 rows)

# To change password for the current user
testdb=> \password
......

testdb=> \q
You can also use other utilities like dropuser, dropdb, and etc.

3.5  Commonly-used SQL Data Types
As illustrated in the above example, the commonly-used SQL data types in PostgreSQL are:

INT, SMALLINT: whole number. There is no UNSIGNED attribute in PostgreSQL.
SERIAL: auto-increment integer (AUTO_INCREMENT in MySQL).
REAL, DOUBLE: single and double precision floating-point number.
CHAR(n) and VARCHAR(n): fixed-length string of n characters and variable-length string of up to n characters. String literals are enclosed by single quotes, e.g., 'Peter', 'Hello, world'.
NUMERIC(m,n): decimal number with m total digits and n decimal places (DECIMAL(m,n) in MySQL).
DATE, TIME, TIMESTAMP, INTERVAL: date and time.
User-defined types.
NULL: A special value indicates unknown value or no value (of an optional field), which is different from 0 and empty string (that represent known value of 0 and empty string). To test for NULL value, use operator IS NULL or IS NOT NULL (e.g., email IS NULL). Comparing two NULLs with = or != results in unknown.
4.  PostgreSQL Administration
4.1  Default Superuser "postgres"
During installation, a "UNIX USER" (who cannot login to the system interactively) called postgres is created. You can verify by checking the entry in /etc/passwd and /etc/shadow:

$ sudo less /etc/passwd | grep postgres
postgres:x:120:130:PostgreSQL administrator,,,:/var/lib/postgresql:/bin/bash
 
$ sudo less /etc/shadow | grep postgres
postgres:*:16049:0:99999:7:::  
   // * indicates that password is not enabled (this user cannot login interactively).
The user postgres belongs to the following groups:

$ groups postgres
postgres : postgres ssl-cert
An entry is also defined in PostgreSQL's HBA (Host-Based Authentication) configuration file for this user (PostgreSQL 9.5, NOT 10?!):

$ sudo less /etc/postgresql/10/main/pg_hba.conf
......
# TYPE  DATABASE        USER            ADDRESS                 METHOD
local   all             postgres                                peer
   // UNIX user "postgres" can access all databases from the localhost.
   // The "peer" authentication method means that if "foo" is a UNIX user and "foo" is also an PostgreSQL user,
   // then "foo" can login to PostgreSQL server from localhost without password.
 
# "local" is for Unix domain socket connections only
local   all             all                                     peer
# IPv4 local connections:
host    all             all             127.0.0.1/32            md5
# IPv6 local connections:
host    all             all             ::1/128                 md5
4.2  Authentication Methods
PostgreSQL supports a number of authentication methods. The commonly-used are:

ident, peer: identical (or fully match) to the OS account, with an optional name mapping defined in pg_ident.conf file. ident is applicable to TCP/IP; while peer for "local" connection.
md5: require md5-hashed password (most common).
password: require clear-text password.
trust: no password, as long as meeting the IP, user, and database criteria defined in the HBA.
reject: reject login immediately.
others, such as GSSAPI, SSPI, Kerberos, LDAP, RADIUS, Certificate, PAM.
There are two ways to login PostgreSQL:

By running the "psql" command as a UNIX user which is also configured as PostgreSQL user using so-called IDENT/PEER authentication, e.g., "sudo -u postgres psql".
Via TCP/IP connection using PostgreSQL's own managed username/password (using so-called MD5 authentication).
4.3  Set a Password for User postgres
To set a password, login to PostgreSQL server using postgres via psql and issue command "\password username", as follows:

-- Login in to server via "psql" with user "postgres"
$ sudo -u postgres psql
......
 
-- Change password for current user "postgres"
postgres=# \password postgres
Enter new password: xxxx
Enter it again: xxxx
  
-- Display the user table
postgres=# SELECT * FROM pg_user;
 usename  | usesysid | usecreatedb | usesuper | usecatupd | userepl |  passwd  | valuntil | useconfig 
----------+----------+-------------+----------+-----------+---------+----------+----------+-----------
 postgres |       10 | t           | t        | t         | t       | ******** |          |
 
-- Quit
postgres=# \q
To test the password login, you need to change the the authentication method from "peer" to "md5" in pg_hba.conf. Restart the server, and login via sudo -u postgres sql. The system will prompt you for the password.

4.4  Add your UNIX user as PostgreSQL user
Using user "postgres" (which is a UNIX user as well as PostgreSQL user) to run "psql" involves switching user (via "sudo -u username" or "su - username"). You can simply the process by configuring your current UNIX userID as PostgreSQL user, as follows:

-- Switch to default superuser "postgres",
-- run utility "createuser" to create a superuser same name as current login.
-- "$USER" is an environment variable denoting the current login user.
$ sudo -u postgres createuser --superuser $USER

-- Create the default database which shall be the same as the username.
$ sudo -u postgres createdb $USER

-- Now, you can invoke "psql" from your user account.
$ psql
......
yourusername=# SELECT * FROM pg_user;
   usename    | usesysid | usecreatedb | usesuper | usecatupd | userepl |  passwd  | valuntil | useconfig 
--------------+----------+-------------+----------+-----------+---------+----------+----------+-----------
 yourusername |    16424 | t           | t        | t         | t       | ******** |          |            
 
-- Perform database operations.
.......
4.5  Create Group and User
The latest PostgreSQL treats both group and user as role. Some roles can login (i.e. user), some roles have member of other roles (i.e., group). You should use CREATE ROLE to create both users and groups (CREATE USER and CREATE GROUP are meant for compatibility).

-- Create a login user role
CREATE ROLE user1 LOGIN PASSWORD 'xxxx' CREATEDB VALID UNTIL 'infinity';

-- Create a login superuser role
CREATE ROLE user2 LOGIN PASSWORD 'xxxx' SUPERUSER VALID UNTIL '2019-12-31';

-- Create a group role
CREATE ROLE group1 INHERIT;
-- Add a user (or group) to this group
GRANT group1 TO user1;
4.6  Backup and Restore
PostgreSQL provides two utilities for backup:

pg_dump: backup a specific database.
pg_dumpall: backup all databases and server globals. Need to be run by superuser.
For example,

-- Create a compressed backup for a database
pg_dump -h localhost -p 5432 -U username -F c -b -v -f mydatabase.backup mydatabase

-- Create a plain-text backup for a database, including the CREATE DATABASE
pg_dump -h localhost -p 5432 -U username -C -F p -b -v -f mydatabase.backup.sql mydatabase
To restore a database from backup generated by pg_dump or pg_dumpall:

Use "psql" to run the plain-text backup.
-- Run SQL script
$ psql -U username -f filename.sql
Use utility "pg_restore" to restore compressed backup.
5.  Admin Tools
5.1  pgAdmin 3
The mother site is http://www.pgadmin.org.

To install pgAdmin 3 (on Ubuntu):

$ sudo apt-get install pgadmin3
To launch: Run "pgadmin3" from terminal; or launch "pgAdmin III" form the dash. Push the "Connection" button. In "Properties" tab: enter a description in "Name"; "localhost" or "127.0.0.1" in Host; "postgres" in Username and its password.

[TODO] more

6.  PHP-PostgreSQL
6.1  Install Driver
Install PDO PostgreSQL driver:

$ sudo apt-get install php5-pgsql
6.2  Example
1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
41
42
43
44
45
46
47
48
49
50
51
52
53
54
55
56
57
58
59
60
61
62
63
64
65
66
67
68
69
70
71
72
73
74
75
76
77
78
79
80
81
82
83
84
85
86
87
88
89
90
<?php
/**
 * Testing PDO MySQL Database Connection, query() and exec().
 * For CREATE TABLE, INSERT, DELETE, UPDATE:
 *   exec(): returns the affected rows.
 * For SELECT:
 *   query(): returns a result set.
 */
define('DB_HOST', 'localhost');  // MySQL server hostname
define('DB_PORT', '5432');       // MySQL server port number (default 3306)
define('DB_NAME', 'mytest');       // MySQL database name
define('DB_USER', 'postgres');   // MySQL username
define('DB_PASS', 'xxxx');       // password
 
// Create a database connection to PostgreSQL server.
try {
   // new PDO('pgsql:host=hostname;port=number;dbname=database;user=username;password=pw')
   $dbConn = new PDO('pgsql:host=' . DB_HOST . ';'
                     . 'port=' . DB_PORT . ';'
                     . 'dbname=' . DB_NAME . ';'
                     . 'user=' . DB_USER . ';'
                     . 'password=' . DB_PASS);
   $dbConn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION); // Set error mode to exception
   echo 'Connected', '<br />';
 
} catch (PDOException $e) {
   $fileName = basename($e->getFile(), ".php"); // File that triggers the exception
   $lineNumber = $e->getLine();          // Line number that triggers the exception
   die("[$fileName][$lineNumber] Database connect failed: " . $e->getMessage() . '<br />');
}
 
// Run SQL statements
try {
   // Use exec() to run a CREATE TABLE, DROP TABLE, INSERT, DELETE and UPDATE,
   // which returns the affected row count.
   $rowCount = $dbConn->exec('DROP TABLE IF EXISTS test');
   echo 'DROP TABLE: ', $rowCount, ' rows', '<br />';
 
   $rowCount = $dbConn->exec(
         'CREATE TABLE IF NOT EXISTS test (
           id SERIAL,
           name VARCHAR(20),
           PRIMARY KEY (id))');
   echo 'CREATE TABLE: ', $rowCount, ' rows', '<br />';
 
   $rowCount = $dbConn->exec("INSERT INTO test (id, name) VALUES (1001, 'peter')");
   echo 'INSERT INTO: ', $rowCount, ' rows', '<br />';
// Cannot called lastInsertId as nextval() was not called in the previous insert.
// echo 'LAST_INSERT_ID (of the AUTO_INCREMENT column) is ', $dbConn->lastInsertId('test_id_seq'), '<br />';
 
   $rowCount = $dbConn->exec("INSERT INTO test (name) VALUES ('paul'),('patrick')");
   echo 'INSERT INTO: ', $rowCount, ' rows', '<br />';
   echo 'LAST_INSERT_ID (of the AUTO_INCREMENT column) is ', $dbConn->lastInsertId('test_id_seq'), '<br />';
 
   // Use query() to run a SELECT, which returns a resultset.
   $sql = 'SELECT * FROM test';
   $resultset = $dbConn->query($sql);
   foreach ($resultset as $row) {
      echo 'Using column name: id=', $row['id'], ' name=', $row['name'], '<br />';
      echo 'Using column number: id=', $row[0], ' name=', $row[1], '<br />';
      print_r($row); // for illustrating the contents of resultset's row
                     // indexed by both column-name and 0-indexed column-number
      echo '<br />';
   }
 
   // Run again with FETCH_ASSOC.
   $resultset = $dbConn->query($sql, PDO::FETCH_ASSOC);
   foreach ($resultset as $row) {  // by column-name only
      echo 'Using column name: id=', $row['id'], ' name=', $row['name'], '<br />';
      print_r($row); // for illustrating the contents of resultset's row
                     // indexed by column-name only
      echo '<br />';
   }
 
   // PostgreSQL supports "INSERT ... RETURNING ID", which returns a resultset of IDs.
   $sql = "INSERT INTO test (name) VALUES ('john'), ('jimmy') RETURNING ID";
   $resultset = $dbConn->query($sql, PDO::FETCH_ASSOC);
   foreach ($resultset as $row) {
      echo "Last insert id is {$row['id']}<br />";
   }
 
   // Close the database connection  (optional).
   $dbConn = NULL;
 
} catch (PDOException $e) {
   $fileName = basename($e->getFile(), ".php"); // File that trigger the exception
   $lineNumber = $e->getLine();         // Line number that triggers the exception
   die("[$fileName][$lineNumber] Database error: " . $e->getMessage() . '<br />');
}
?>
6.3  More Examples
See "PHP PDO" (some modifications needed from MySQL to PostgreSQL).

7.  Python-PostgreSQL
Goto "Python-PostgreSQL Database Programming".

REFERENCES & RESOURCES
