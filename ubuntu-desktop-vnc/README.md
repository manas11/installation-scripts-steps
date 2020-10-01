
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

