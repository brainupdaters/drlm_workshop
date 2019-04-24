echo "Hello from $HOSTNAME at Cyberweek 2017"

echo "$(date) - Adjusting Timezone ..."
ln -sf /usr/share/zoneinfo/Europe/Madrid /etc/localtime

echo "$(date) - Restarting network service ..."
systemctl restart network

echo "$(date) - Refreshing repositories ..."
yum clean all
yum repolist

echo "$(date) - Installing packages ..."
yum install -y lvm2 dosfstools efibootmgr epel-release

echo "$(date) - Setting up SSH..."
sed -ie '/PasswordAuthentication/s/no/yes/g' /etc/ssh/sshd_config
systemctl restart sshd.service

echo "End of $HOSTNAME customization ..."
