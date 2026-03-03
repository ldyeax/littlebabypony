cp wireguard-fwuff.sh /opt/wireguard-fwuff.sh
chmod 744 /opt/wireguard-fwuff.sh
systemctl disable --now wireguard-fwuff.service || echo 'wireguard-fwuff.service not already enabled'
systemctl enable --now ./wireguard-fwuff.service
lbp-systemd-reload
