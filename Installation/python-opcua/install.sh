#run update
sudo apt-get update
sudo apt-get -y upgrade

#install python3, pip
sudo apt-get install python3.6 -y
sudo apt install -y python3-pip

#install opcua library
sudo pip install opcua -y

#install dependencies 
#numpy
sudo pip install numpy -y
#cryptography
sudo pip install cryptography -y
#dateutil
sudo pip install python-dateutil -y
#lxml
sudo pip install lxml -y
#pytz
sudo pip install pytz -y

#install python library
sudo apt install python-opcua -y
sudo apt install python-opcua-tools -y

#install pyqt5 for GUI client
sudo pip install PyQt5 -y

#install GUI client
sudo pip install opcua-client -y

#run the client
sudo opcua-client
