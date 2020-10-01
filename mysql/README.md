## Installing MySQL 

```
sudo apt-get install mysql-server -y
sudo mysql_secure_installation
```

- Try running `mysql -u root -p`

- (In case you get the wrong password, do `sudo su`, then `mysql` create new user with password and use that)
#### Issue links : 

If you face error 1698: 
- follow this link: https://stackoverflow.com/questions/39281594/error-1698-28000-access-denied-for-user-rootlocalhost
```
Now do sudo mysql_secure_installation
```
if you face error 1045: 
- follow this link: https://stackoverflow.com/questions/21944936/error-1045-28000-access-denied-for-user-rootlocalhost-using-password-y


> To test mysql installation with root as user, check if `mysql -u root -p` command is working with root password specified above
