if grep buntu /etc/issue > /dev/null; then bash ubuntu.sh; fi
git config --global user.name jimm
git config --global user.email 'jimm@jimm.horse'
git clone https://github.com/sharkdp/fd.git
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
. "$HOME/.cargo/env"
cd fd
make install
cd ..
