echo "Hello from $HOSTNAME at Cyberweek 2017"

echo "$(date) - Adjusting Timezone ..."
ln -sf /usr/share/zoneinfo/Europe/Madrid /etc/localtime
echo "Europe/Madrid" > /etc/timezone

echo "$(date) - Refreshing repositories ..."
sed -i "/ftp/s/.us./.es./g" /etc/apt/sources.list
apt-get update

echo "$(date) - Setting up SSH..."
sed -ie '/PasswordAuthentication/s/no/yes/g' /etc/ssh/sshd_config
systemctl restart sshd.service

echo "End of $HOSTNAME customization ..."
