if grep buntu /etc/issue > /dev/null; then bash ubuntu.sh; fi
git config --global user.name jimm
git config --global user.email 'jimm@jimm.horse'
if [[ $(which fd) ]] then
	echo "Found fd"
else
	git clone https://github.com/sharkdp/fd.git
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
	. "$HOME/.cargo/env"
	cd fd
	make install
	cd ..
fi
which vim && git config --global core.editor vim
cp lbp-systemd-reload /usr/local/bin/lbp-systemd-reload
chmod +x /usr/local/bin/lbp-systemd-reload
cp lbp-xargs /usr/local/bin/lbp-xargs
chmod +x /usr/local/bin/lbp-xargs
