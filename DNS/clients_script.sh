apt-get update
apt-get -y upgrade

cat ~/system-architecture/DNS/server/\\etc\\resolv.conf > /etc/resolv.conf
cat ~/system-architecture/DNS/server/\\etc\\bind\\named.conf > /etc/resolv.conf
