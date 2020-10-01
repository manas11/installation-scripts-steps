sudo apt-get update
sudo apt-get dist-upgrade -y
sudo apt-get autoremove -y
sudo apt-get autoclean -y

sudo apt-get install xserver-xorg-core -y
sudo apt-get install tigervnc-standalone-server tigervnc-xorg-extension tigervnc-viewer -y

sudo apt-get install ubuntu-gnome-desktop -y

# add gnome desktop manager to run at boot time
sudo systemctl start gdm
sudo systemctl enable gdm

# add a password for vnc server
vncserver

# kill running vnc processes
vncserver -kill :*

# run this to add startup configurations
vim ~/.vnc/xstartup

# add bottom mentioned lines and save
##!/bin/sh 
#[ -x /etc/vnc/xstartup ] && exec /etc/vnc/xstartup
#[ -r $HOME/.Xresources ] && xrdb $HOME/.Xresources
#vncconfig -iconic &
#dbus-launch --exit-with-session gnome-session &

# run below command to start vnc server and set sharpness, resolution for that
vncserver -localhost no -geometry 800x600 -depth 24

