apt-get update
apt-get -y upgrade

cat ~/system-architecture/DNS/client-1/\\etc\\network\\interfaces > /etc/network/interfaces
cat ~/system-architecture/DNS/client-1/\\etc\\resolv.conf > /etc/resolv.conf
