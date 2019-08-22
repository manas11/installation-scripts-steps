#installing ns-3.29

#for dependencies

sudo apt-get update
sudo apt-get upgrade -y


sudo apt-get install gcc g++ python python-dev -y
sudo apt-get install python-setuptools git mercurial -y

#for netanim
sudo apt-get install qt5-default -y

#for pyviz
sudo apt-get install python-pygraphviz python-kiwi ipython -y 
sudo apt-get install gir1.2-goocanvas-2.0 python-gi python-gi-cairo python-pygraphviz python3-gi python3-gi-cairo python3-pygraphviz gir1.2-gtk-3.0 ipython ipython3  -y


#for bake build tool
sudo apt-get install autoconf cvs bzr unrar -y

#debugging gdb
sudo apt-get install gdb valgrind -y

#for pcap
sudo apt-get install tcpdump -y

sudo apt-get install libgtk2.0-0 libgtk2.0-dev -y

#from blog
sudo apt-get install qt4-dev-tools libgtk-3-dev wireshark gnuplot openjdk-8-jdk -y

#remove not required
sudo apt-get autoremove -y
sudo apt-get autoclean -y

#now download ns3 from https://www.nsnam.org/releases/ns-allinone-3.29.tar.bz2
#now extract this to a directory and enter the ns-allinone-3.29 directory
#now run this 
#              ./build.py --enable-examples --enable-tests
#now enter the ns-3.29 directory and run this
#              ./test.py -c core

#done 
