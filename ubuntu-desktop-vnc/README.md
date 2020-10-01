
## run this to add startup configurations
```
vim ~/.vnc/xstartup
```

## add bottom mentioned lines and save
```
#!/bin/sh 
[ -x /etc/vnc/xstartup ] && exec /etc/vnc/xstartup
[ -r $HOME/.Xresources ] && xrdb $HOME/.Xresources
vncconfig -iconic &
dbus-launch --exit-with-session gnome-session &
```
## run below command to start vnc server and set sharpness, resolution for that
```
vncserver -localhost no -geometry 800x600 -depth 24
```

## Run following script to autostart vnc on system startup

Create a file with the name vncserver@.service in the /etc/systemd/system folder. 
```
sudo nano /etc/systemd/system/vncserver@.service
```

Add following content to this file: 
> User can be the user with which you want to run vncserver
```
[Unit]
Description=VNC Server by TeknoTut
After=syslog.target network.target

[Service]
Type=forking
User=root

# Clean any existing files in /tmp/.X11-unix environment
ExecStartPre=/usr/bin/vncserver -kill :%i > /dev/null 2>&1 || :
ExecStart=/usr/bin/vncserver -geometry 800x600 -depth 24 -localhost no :%i
ExecStop=/usr/bin/vncserver -kill :%i

[Install]
WantedBy=multi-user.target
```

Now you can set this script to be run at start 
```
sudo systemctl enable vncserver@1
sudo systemctl start vncserver@1
```

### Now you can use public ip of ther server and use PUBLIC_IP:1 to VNC into the gnome-ubuntu desktop

