sudo apt-get update

sudo apt-get install apt-transport-https ca-certificates gnupg software-properties-common wget -y

wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | gpg --dearmor - | sudo tee /etc/apt/trusted.gpg.d/kitware.gpg >/dev/null

sudo apt-add-repository 'deb https://apt.kitware.com/ubuntu/ bionic main'

sudo apt-get update

sudo apt-add-repository 'deb https://apt.kitware.com/ubuntu/ bionic-rc main'

sudo apt-get update

sudo apt-get install kitware-archive-keyring -y

sudo rm /etc/apt/trusted.gpg.d/kitware.gpg

sudo apt-get install cmake -y

sudo apt-get update

sudo apt-get dist-upgrade -y

sudo apt-get autoremove -y

sudo apt-get autoclean -y