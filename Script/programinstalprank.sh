#!/bin/bash
#PRANK
data="/home/rstudio/data/mydatalocal"
cd $data

wget http://wasabiapp.org/download/prank/prank.linux64.170427.tgz
tar xzf prank.linux64.170427.tgz

export PATH=$PATH:/ifb/data/mydatalocal/prank/bin/

#PHYML

git clone https://github.com/stephaneguindon/phyml.git

mv phyml $data

cd $data/phyml

./autogen.sh
./configure --enable-phyml
make

export PATH=$PATH:/ifb/data/mydatalocal/phyml/src/

#TRIMAL

git clone https://github.com/scapella/trimal.git

cd trimal/source

make

export PATH=$PATH:/ifb/data/mydatalocal/trimal/source/

