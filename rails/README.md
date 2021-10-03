## Installing Ruby on Rails

### Update your system
``` 
sudo apt-get udpate
sudo apt-get dist-upgrade -y
sudo apt-get autoremove -y
sudo apt-get autoclean -y
```

### Install RVM and libraries required
Using rvm to manage different ruby versions on your machine

```
sudo apt-get install curl -y
sudo apt-get install gnupg2 -y

gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB

\curl -sSL https://get.rvm.io | bash -s stable
```
> Check the ouput of above program, if setup asks some commands to be run Run them
>  For RVM to work properly, you have to check the 'Run command as login shell' checkbox on the Title and Command tab of the terminal's Edit ▸ Profile Preferences menu dialog, in case the menu is missing right-click the terminal app and navigate Profiles ▸ Profile Preferences.


### Install Ruby 2.6.1 with Rails 5.2.2
```
rvm install 2.6.1
rvm use 2.6.1 --default
gem install bundler
gem install rails -v 5.2.2
```

### Install essential gems and if using MySQL, then MySQL related gems
Install mysql gem and the libmysql-dev library
```
sudo apt install libmysqld-dev
```
> For Ubuntu 20.04, this will throw an error, please install libmysqlclient-dev package instead of libmysqld-dev

Install mysql2 gem required to use MySQL database with RubyOnRails
```
gem install mysql2
```
> Note: For some of the js gems Run `sudo apt install nodejs`

