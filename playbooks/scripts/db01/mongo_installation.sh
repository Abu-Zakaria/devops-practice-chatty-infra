if [[ -f /opt/.mongo_installed ]]; then
	exit 0
fi

cd /root

curl -O http://downloads.mongodb.org/linux/mongodb-linux-x86_64-2.6.12.tgz

tar -zxvf mongodb-linux-x86_64-2.6.12.tgz

mkdir /root/mongodb

cp -R mongodb-linux-x86_64-2.6.12/* mongodb

echo -e "\nexport PATH=/root/mongodb/bin:$PATH\n" >> /root/.bashrc

echo -e "\nexport LANGUAGE=en_US.UTF-8 \
export LANG=en_US.UTF-8 \
export LC_ALL=en_US.UTF-8 \
\n" >> /root/.bashrc

source /root/.bashrc

touch /opt/.mongo_installed

