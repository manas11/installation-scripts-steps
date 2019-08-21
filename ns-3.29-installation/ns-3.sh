#installing ns-3.29

#for dependencies

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y

sudo apt-get install gcc g++ python python-dev -y
sudo apt-get install python-setuptools git mercurial -y
sudo apt-get install qt5-default -y
sudo apt-get install python-pygraphviz python-kiwi ipython -y 
sudo apt-get install gir1.2-goocanvas-2.0 python-gi python-gi-cairo python-pygraphviz python3-gi python3-gi-cairo python3-pygraphviz gir1.2-gtk-3.0 ipython ipython3  -y
sudo apt-get install openmpi-bin openmpi-common openmpi-doc libopenmpi-dev -y
sudo apt-get install autoconf cvs bzr unrar -y
sudo apt-get install gdb valgrind -y
sudo apt-get install uncrustify -y
sudo apt-get install doxygen graphviz imagemagick -y
sudo apt-get install texlive texlive-extra-utils texlive-latex-extra texlive-font-utils texlive-lang-portuguese dvipng latexmk -y
sudo apt-get install python-sphinx dia -y
sudo apt-get install gsl-bin libgsl-dev libgsl23 libgslcblas0 -y 
sudo apt-get install tcpdump -y
sudo apt-get install sqlite sqlite3 libsqlite3-dev -y
sudo apt-get install libxml2 libxml2-dev -y
sudo apt-get install cmake libc6-dev libc6-dev-i386 libclang-6.0-dev llvm-6.0-dev automake -y

#for pip
sudo apt-get install python3-pip -y
pip install --upgrade  pip --user
pip install cxxfilt --user

sudo apt-get install libgtk2.0-0 libgtk2.0-dev -y
sudo apt-get install vtun lxc -y
sudo apt-get install libboost-signals-dev libboost-filesystem-dev -y

#from blog
sudo apt-get install qt4-dev-tools libgtk-3-dev wireshark gnuplot openjdk-8-jdk -y

#check again
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y

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
