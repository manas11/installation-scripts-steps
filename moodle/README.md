### Apart from running script, follow the following commands: 

```
sudo echo 'default_storage_engine = innodb' >> /etc/mysql/mysql.conf.d/mysqld.cnf
sudo echo 'innodb_file_per_table = 1' >> /etc/mysql/mysql.conf.d/mysqld.cnf
sudo service mysql restart
```

### MySQL setup

```
 mysql -u root -p
 
 CREATE DATABASE moodle DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
 create user 'admin'@'localhost' IDENTIFIED BY 'MoodleTest20';
 GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,CREATE TEMPORARY TABLES,DROP,INDEX,ALTER ON moodle.* TO 'admin'@'localhost';
 quit;
```

### IP related configurations
```
cd /var/www/html/moodle 
sudo vi config.php 
```
> Specify IP of the server to which Apache server binds
Sample Configuration: 
```
database type mysqli
Host server: localhost
Database: moodle
User: admin
Password: MoodleData20
Tables Prefix: mdl_
```
### Now, open browser to IPADDRESS/moodle
