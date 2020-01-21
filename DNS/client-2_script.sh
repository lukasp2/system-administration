apt-get update
apt-get -y upgrade

cat ~/system-architecture/DNS/client-2/\\etc\\network\\interfaces > /etc/network/interfaces
cat ~/system-architecture/DNS/client-2/\\etc\\resolv.conf > /etc/resolv.conf
