if [[ -f /opt/.mongo_db_configured ]]; then
	exit 0
fi
DB_NAME="lets_chat"
DB_USER="app_user"
DB_PASSWORD=`cat /etc/lets_chat_db_password.txt`

# start the mongodb server in background
mongod --fork --logpath /root/mongod.log --dbpath /data/db/

sleep 2
# create a user for app servers in lets_chat database
mongo lets_chat <<EOF
db.createUser({ "user": "$DB_USER", "pwd": "$DB_PASSWORD", "roles": [{ "role": "readWrite", "db": "$DB_NAME" }] })
EOF

sleep 2

# stop the mongodb server that is running in the background
kill -9 `pgrep mongod`

touch /opt/.mongo_db_configured
