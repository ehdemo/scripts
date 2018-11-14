#!/bin/bash

sudo apt-get update
sudo apt install -y xfce4 xfce4-goodies tightvncserver

vncserver
vncserver -kill :1

mv ~/.vnc/xstartup ~/.vnc/xstartup.bak
echo "#!/bin/bash" > ~/.vnc/xstartup
echo "xrdb $HOME/.Xresources" >> ~/.vnc/xstartup
echo "startxfce4 &" >> ~/.vnc/xstartup

sudo chmod +x ~/.vnc/xstartup
vncserver