#!/bin/bash
source ~/.bashrc
if hash python3.5 2>/dev/null; then
    echo "python3.5 is installed!"
else
    wget https://www.python.org/ftp/python/3.5.1/Python-3.5.1.tar.xz
    tar -xf Python-3.5.1.tar.xz
    cd Python-3.5.1
    ./configure
    make -j4
    sudo make install
fi

# setup virtualenv
pyvenv-3.5 env
source env/bin/activate
pip install -r requirements.txt

# install wrk
git clone https://github.com/wg/wrk.git
cd wrk
make
