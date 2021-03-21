#!/bin/bash
sudo -i
apt-get update -y
apt-get install isc-dhcp-server -y

cat << EOF > /etc/dhcp/dhcpd.conf
#dhcp_config_file
ddns-update-style none;
subnet 192.168.0.0 netmask 255.255.255.0
{
        range 192.168.0.10 192.168.0.20;
        option routers 192.168.0.1;
        option domain-name-servers 192.168.0.1;
        default-lease-time 600;
        max-lease-time 7200;
}
log-facility local7;
EOF

cat << EOF > /etc/default/isc-dhcp-server
INTERFACES="eth2"
EOF

service isc-dhcp-server restart
