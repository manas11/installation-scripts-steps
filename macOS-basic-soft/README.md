1.  Getting Started with "Terminal" - MUST READ Before You Start Programming
Programmers use "Terminal" to issue commands, instead of the graphical user interface - which is meant for common users.

You MUST have some basic knowledge on using the Terminal and the file system. Read "Unix Survival Guide for Mac & Ubuntu - Terminal, File System and Users".

2.  How to Install JDK and Get Started with Java Programming on Mac
Read HERE.

3.  Programming Text Editors for Mac
3.1  TextEdit for Mac
TextEdit (the default text editor in Mac OS X) is NOT a programming text editor, as it lacks features like syntax highlighting. I strongly suggest you install a programming text editor.

To use TextEdit to write source file, you need to open a new file ⇒ choose "Format" ⇒ "Make Plain Text".

You can open an existing file in TextEdit from Terminal by issuing:

$ open -e filename
3.2  nano (or pico) Command-line Text Editor
nano is a GNU text editor that is available for Unix Systems (including Mac OS X), that is suitable for creating/editing small files. To start nano, open a Terminal and issue:

$ nano                // Create a new file
$ nano filename       // Edit an existing file
You can run nano with superuser (for accessing restricted directories), as follows:

$ sudo nano           // Run nano with superuser to create a new file
$ sudo nano filename  // Run nano with superuser to edit an existing file
3.3  JEdit for Mac
jEdit is a popular open-source cross-platform (Mac, Windows, Linux) programming text editor. The mother site is http://www.jedit.org.

Step 1: Download and Install jEdit for Mac
Download jEdit package from http://www.jedit.org ⇒ Download ⇒ Select Mac OS X package (stable version).
Double click the downloaded Disk Image (".dmg") file. Drag the "jEdit" icon to "Applications" folder.
Eject the Disk Image "jedit.dmg".
Step 2: Install "Console" plugins
Launch jEdit (from "Applications").
Open plugin manager: From "Plugins" menu ⇒ Plugin Manager.
Select "Install" tab.
Search and select "Console" plugin. "ErrorList" plugin will selected automatically ⇒ Install.
Step 3: Write a Hello-World Java Program
Open a new file by selecting "File" menu ⇒ "New".
Enter the following Java source code and save the file as "Hello.java".
public class Hello {   // saved as "Hello.java"
   public static void main(String[] args) {
      System.out.println("Hello, world!");
   }
}
Step 4: Compile and Run the Hello-World Java Program
You can start a "Terminal" to compile and run your Java program as described in the above JDK section.

You can also use the "Console" plugin:

To compile: From Plugins ⇒ Console ⇒ Compile Current Buffer. Click on the "Console" button to view the console. If message "Process javac exited with code 0" appears, the program is compiled successfully.
To run: From Plugins ⇒ Console ⇒ Run Current Buffer.
3.4  gedit for Mac
gedit is the official text editor of the GNOME desktop environment. The mother site for gedit is http://projects.gnome.org/gedit/.

Download gedit for Mac (DMG version) from http://projects.gnome.org/gedit/ ⇒ "gedit mac os x" ⇒ Choose your specific Mac OS version.
To install:
Double-click the downloaded Disk Image (".dmg") file.
Drag the "gedit" icon to the "Applications" folder.
Eject the Disk Image "gedit.dmg".
Notes: To use "gedit" commands in Terminal, you need to add "/Applications/gedit.app/Contents/MacOS/" to PATH environment variable.

3.5  Sublime
@ http://www.sublimetext.com.

4.  How to Install Eclipse on Mac
Read "How to Install Eclipse for Mac OS".

5.  How to Install NetBeans on Mac
Read "How to Install NetBeans on Mac".

6.  How to Install MySQL 5.6 on Mac OS X 10.7 Lion
6.1  Install MySQL using the DMG Package
Reference: "Installing MySQL on Mac OS X" @ http://dev.mysql.com/doc/refman/5.6/en/macosx-installation.html.

Step 1: Download and Install MySQL
Download the MySQL "DMG Archive":

Go to http://dev.mysql.com/downloads/mysql/. In platform, select the "Mac OS X".
Select the appropriate "DMG Archive" for your specific Mac OS version:
Click the Apple logo ⇒ "About this Mac" to check your Mac OS version.
Read http://support.apple.com/kb/ht3696 to check if your OS is 32-bit or 64-bit.
For example, Choose "Mac OS X ver. 10.7 (x86, 64-bit), DMG Archive (117.5M)" for Lion and Core i7 processor.
Click "No thanks, just start my download".
To install MySQL:

Go to "Downloads" ⇒ Double-click ".dmg" file downloaded.
Double-click "mysql-5.5.{xx}-osx10.x-xxx.pkg" ⇒ Follow the instructions to install MySQL. Click continue if "unindentified developer" warning dialog appeared.
MySQL will be installed in "/usr/local/mysql-5.5.{xx}-osx10.x-x86_xx" directory. A symbolic link "/usr/local/mysql" will be created automatically to the MySQL installed directory.
Eject the ".dmg" file.
Step 2: Configuring MySQL - Change TCP Port Number for MySQL Server
The default TCP port number used by MySQL Server is 3306.
[For novices: SKIP THIS STEP to run the MySQL Server on port 3306. Goto Step 3.]
You can change the port number by editing the configuration file "my.cnf" at directory "/usr/local/mysql".
[mysqld]
.....
port=8888
.....

[client]
port=8888
To create this file, open a new "Terminal" and run the "nano" editor using this command:
sudo nano /usr/local/mysql/my.cnf
Modify the lines in green and add in the lines in red; and press ctrl-X to exit. (We use the "nano" editor in this case, you can use any text editor, but run in superuser.)
Notes: On Unix/Mac, the MySQL read the options file in this order: "/etc/my.cnf", "SYSCONFDIR/mf.cnf", "$MYSQL_HOME/my.cnf", "~/.my.cnf".

Step 3: Start/Shutdown the MySQL Server
Open a new "Terminal" and issue these commands to start the MySQL server:

$ cd /usr/local/mysql/bin
$ sudo ./mysqld_safe --console
Enter your password: 
xxxxxx xx:xx:xx mysql_safe logging to '/usr/local/mysql/data/xxxxxx.err'
xxxxxx xx:xx:xx mysql_safe Starting mysqld daemon with databases from /usr/local/mysql/data
To shutdown the server, start a new terminal and issue:

$ cd /usr/local/mysql/bin
 
$ sudo ./mysqladmin -u root shutdown     // BEFORE you set a password for root
// OR
$ sudo ./mysqladmin -u root -p shutdown  // AFTER you set a password for root
Step 4: Start/Stop a MySQL Client
Open a new "Terminal" and issue this command to start a MySQL client with superuser root:

$ cd /usr/local/mysql/bin
 
$ ./mysql -u root      // BEFORE you set a password for root
// OR
$ ./mysql -u root -p   // AFTER you set a password for root
To terminate the client, issue command "exit" (or "quit") from the "mysql>" prompt:

mysql> exit
Notes:
You can use "Activity Monitor" (under Applications/Utilities) to check if the MySQL Server is running. Look for process starting with mysqld.
The log messages are written to /usr/local/mysql/data/xxx.err, where xxx denotes your machine name. Issue "sudo cat /usr/local/mysql/data/xxx.err" to view the messages.
If you get the following error message when starting a client: "Can't connect to local MySQL server through socket '....', check your "Activity Monitor" to see if the MySQL server has been started.
Step 5: (For Java Programmers) Install MySQL JDBC Driver
Download the latest JDBC driver from http://www.mysql.com/downloads ⇒ MySQL Connectors ⇒ Connector/J ⇒ Compressed TAR archive (e.g., mysql-connector-java-{5.x.xx}.tar.gz, where {5.x.xx} is the latest release number).
Double-click on the downloaded TAR file to expand into folder "mysql-connector-java-{5.x.xx}".
Open the expanded folder. Copy the JAR file "mysql-connector-java-{5.x.xx}-bin.jar" to JDK's extension directory at "/Library/Java/Extension".
6.2  How to Uninstall and Remove MySQL 5
Open a Terminal ⇒ Run the "nano" editor to edit /etc/hostconfig, as follows:
sudo nano /etc/hostconfig
Enter your password: ....
Delete this line if present: "MYSQLCOM=-YES-". Press cntl-x to exit "nano" and enter "Y" to save the file. The line "MYSQLCOM=-YES-" starts MySQL automatically during startup.
Make sure that MySQL is not running (Open the "Activity Monitor" under the "Applications/Utilities", and check for the process "mysqld"). Open a Terminal and issue "rm -r" to remove these directories and their sub-directories (with "f" indicating no confirmation prompt).
sudo rm /usr/local/mysql
sudo rm -rf /usr/local/mysql*
sudo rm -rf /Library/StartupItems/MySQLCOM
sudo rm -rf /Library/PreferencePanes/My*
sudo rm -rf /Library/Receipts/mysql*
sudo rm -rf /Library/Receipts/MySQL*
sudo rm /etc/my.cnf
That's all!

6.3  (Advanced) Install MySQL using Tarball
Reference: http://dev.mysql.com/doc/refman/5.5/en/macosx-installation-pkg.html.

[TODO]

7.  How to Install Tomcat 7 on Mac
Step 1: Download and Install Tomcat
Goto http://tomcat.apache.org ⇒ Download ⇒ Tomcat 7.0 ⇒ 7.0.{xx} (where {xx} denotes the latest release) ⇒ Binary distribution ⇒ Core. Download the "tar.gz" package (e.g., "apache-tomcat-7.0.{xx}.tar.gz").
To install Tomcat:
Goto "~/Downloads", double-click the downloaded TAR file (e.g., "apache-tomcat-7.0.{xx}.tar.gz") to expand it into a folder (e.g., "apache-tomcat-7.0.{xx}").
(Notes for Advanced Users) Alternatively, you can use the tar command to expand the tarball as follow:
$ cd ~/Downloads
$ tar xvf apache-tomcat-7.0.{xx}.tar.gz
Move the extracted folder (e.g., "apache-tomcat-7.0.{xx}") to "/Applications".
Rename the folder "tomcat", for ease of use.
(Notes for Advanced Users):

It is probably better to keep the tomcat in "/usr/local" or "/Library".
Instead of renaming the tomcat's folder, it it better to create a symlink called tomcat as follows:
$ cd /Applications
$ sudo ln -s apache-tomcat-7.0.{xx} tomcat
For security reason, you should not run Tomcat as root user. Instead, assign Tomat to user nobody (of group nobody):
$ sudo chown -R nobody:nobody /Applications/tomcat
   // -R: recursive thru sub-directories
   // {user}:{group}
 
// To start tomcat as user nobody
$ cd /Applications/tomcat/bin
$ sudo -u nobody ./startup.sh       // No console message
$ sudo -u nobody ./catalina.sh run  // See console message
 
// To stop tomcat
$ sudo -u nobody ./shutdown.sh
Step 2: Configure Tomcat Server
Read "Configure Tomcat Server".

Step 3: Start the Tomcat Server
To start the Tomcat server, open a new "Terminal" (Go ⇒ Utilities ⇒ Terminal) and issue:

$ cd /Applications/tomcat/bin
$ ./catalina.sh run
Check for the Tomcat server's TCP port number from the console messages. The default is 8080.

To verify if the Tomcat server is started, start a browser (Safari) and issue URL http://localhost:8080, suppose that Tomcat is running on the default TCP port number of 8080.

Also try URL http://localhost:8080/examples which shows the Servlet/JSP examples.

Step 4: Shutdown the Tomcat Server
To shutdown the Tomcat server, you can simply press control-c (NOT command-c) on the tomcat console, or issue command:

$ cd /Applications/tomcat/bin
$ ./shutdown.sh
Step 5: Servlet API
To write Java servlets, you need to COPY the Servlet API JAR file ("servlet-api.jar") from "/Applications/tomcat/lib" to the JDK's extension directory at "/Library/Java/Extension".

8.  Installing GCC and Get Started with C/C++ Programming on Mac
To install

Goto http://connect.apple.com, and login with your AppleID.
Download "Command Line Tools (OS X xxxx) for XCode" Disk Image (DMG).
Double-click the download disk image (DMG) ⇒ Open "Command Line Tools (xxx).mkpg" ⇒ Follow the instructions to install.
Eject the disk image.
To verify:

// Show the location of gcc
$ which gcc
/usr/bin/gcc
 
// Show gcc/g++ version
$ gcc --version
... (GCC) 4.2.1 ...
$ g++ --version
... (GCC) 4.2.1 ...
 
// Compile and run a C program
$ cd path-to-hello.c
$ gcc -o hello hello.c
$ ./hello
9.  Installing XCode & Get Started
XCode is the development toolset for Mac, iPhone/iPad, which includes the Mac OS SDK (for Mac) and iOS SDK (for iPhone/iPad).

To install:

Goto http://connect.apple.com, and login with your AppleID.
Download "XCode 4.x" Disk Image (DMG) - It is HUGE!
Double-click the download disk image (DMG) ⇒ Open "XCode" ⇒ Follow the instructions to install.
XCode will be installed in "/Developer/Applications/Xcode".
Eject the disk image.
To start Xcode, launch "XCode" from "/Developer/Applications".

[TODO] Getting Started

10.  More on Terminal & Bash Shell
Goto "Terminal & Bash Shell".

11.  Mac's Tips & Tweaks
11.1  Root (or Superuser, or Administrator)
In some cases (such as installing software and starting server), you need to be the so-called root user (or superuser or administrator) of your machine to complete some commands that require high privilege. Put "sudo" (superuser do) in front of your command to run the command as root user, and provide the your password. Only authorized user can issue sudo command. For example, to start the MySQL server:

$ sudo /usr/local/mysql/bin/mysqld_safe --console
password: 
11.2  How to View All Files in Finder
Open a terminal and enter this commands:
$ defaults write com.apple.finder AppleShowAllFiles -bool true
Stop the Finder via:
$ killall Finder
Re-start the Finder. You shall see all the files (including the dot files and dot folders) now.