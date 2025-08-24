mkdir -p /usr/local/lbp
cp resolvectl.sh /usr/local/lbp/resolvectl.sh
chmod +x /usr/local/lbp/resolvectl.sh
cp *.service *.timer /etc/systemd/system
for s in *.service; do
	systemctl enable --now $s
	systemctl start $s
done
for s in *.timer; do
	systemctl enable --now $s
	systemctl start $s
done

systemctl daemon-reload
systemctl daemon-reexec

