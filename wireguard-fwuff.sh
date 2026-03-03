#!/bin/bash
set -euo pipefail

echo 'virsh net-destroy wgvm'
virsh net-destroy wgvm || echo 'wgvm already destroyed'
echo 'virsh net-undefine wgvm'
virsh net-undefine wgvm || echo 'wgvm already undefined'

echo 'ip route del 10.66.66.0/24 dev virbr1'
ip route del 10.66.66.0/24 dev virbr1 || echo 'ip route 0/24 already deleted'
echo 'ip route del 10.66.66.1/32 dev wg0 2>/dev/null'
ip route del 10.66.66.1/32 dev wg0 2>/dev/null || echo 'ip route 1 already deleted'
echo 'ip route del 10.66.66.4/32 dev wg0 2>/dev/null'
ip route del 10.66.66.4/32 dev wg0 2>/dev/null || echo 'ip route 4 already deleted'
echo 'ip link delete wg0'
ip link delete wg0 || echo 'ip link already deleted'

# Create interface
echo 'ip link add wg0 type wireguard'
ip link add wg0 type wireguard

# Bring link up
echo 'ip link set wg0 up'
ip link set wg0 up

# Assign address
echo 'ip addr add 10.66.66.2/32 dev wg0'
ip addr add 10.66.66.2/32 dev wg0

echo 'ip route add 10.66.66.1/32 dev wg0'
ip route add 10.66.66.1/32 dev wg0
echo 'ip route add 10.66.66.4/32 dev wg0'
ip route add 10.66.66.4/32 dev wg0

# Apply config (strips PostUp/PostDown automatically because wg ignores them)
echo 'wg setconf wg0 /etc/wireguard/wg0.conf'
wg setconf wg0 /etc/wireguard/wg0.conf

while [[ 1 ]]; do
	sleep 10
	ping -W 1 -c 1 10.66.66.1 > /dev/null || exit 1
done
