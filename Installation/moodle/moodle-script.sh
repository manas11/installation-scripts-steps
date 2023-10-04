sudo apt-get update
sudo apt-get dist-upgrade -y
sudo apt-get autoremove -y
sudo apt-get autoclean -y

sudo apt-get install git -y

sudo apt install apache2 mysql-client mysql-server php libapache2-mod-php  -y

sudo mysql_secure_installation

sudo apt install graphviz -y

sudo apt install ghostscript -y

sudo apt install php7.4-pspell  -y

sudo apt install php7.4-curl  -y

sudo apt install php7.4-gd  -y

sudo apt install php7.4-intl  -y

sudo apt install php7.4-mysql -y

sudo apt install php7.4-xml  -y

sudo apt install php7.4-xmlrpc  -y

sudo apt install php7.4-ldap  -y

sudo apt install php7.4-zip  -y

sudo apt install php7.4-soap  -y

sudo apt install  php7.4-mbstring -y

sudo apt-get install aspell -y

sudo service apache2 restart

sudo apt-get update 
sudo apt-get upgrade -y
sudo apt-get autoremove -y
sudo apt-get autoclean -y

cd /opt
sudo git clone git://git.moodle.org/moodle.git

cd moodle
sudo git branch --track MOODLE_39_STABLE origin/MOODLE_39_STABLE
sudo git checkout MOODLE_39_STABLE
sudo cp -R /opt/moodle /var/www/html/
sudo mkdir /var/moodledata
sudo chown -R www-data /var/moodledata
sudo chmod -R 777 /var/moodledata
sudo chmod -R 0755 /var/www/html/moodle
sudo service apache2 restart
sudo /etc/init.d/mysql restart


# sudo echo 'default_storage_engine = innodb' >> /etc/mysql/mysql.conf.d/mysqld.cnf
# sudo echo 'innodb_file_per_table = 1' >> /etc/mysql/mysql.conf.d/mysqld.cnf

sudo service mysql restart


# sudo apt-get update 
# sudo apt-get upgrade -y
# sudo apt-get autoremove -y
# sudo apt-get autoclean -y
# sudo apt install clamav  -y


# mysql -u root -p
# CREATE DATABASE moodle DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
# create user 'admin'@'localhost' IDENTIFIED BY 'MoodleTest20';
# GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,CREATE TEMPORARY TABLES,DROP,INDEX,ALTER ON moodle.* TO 'admin'@'localhost';
# quit;

sudo chmod -R 777 /var/www/html/moodle
# open browser to IPADDRESS/moodle
# path of moodledata /var/moodledata
# database type mysqli
#Host server: localhost
#Database: moodle
#User: admin
#Password: MoodleData20
#Tables Prefix: mdl_

# cd /var/www/html/moodle sudo vi config.php put ip for setting the ip for apache server