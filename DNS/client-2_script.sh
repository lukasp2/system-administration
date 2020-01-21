apt-get update
apt-get -y upgrade

cat ./resources/client-2/\\etc\\network\\interfaces > /etc/network/interfaces
cat ./resources/client-2/\\etc\\resolv.conf > /etc/resolv.conf
