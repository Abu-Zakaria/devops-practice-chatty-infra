# run mongodb server
mongod_process=`pgrep mongod`
if [[ $mongod_process == "" ]]; then
	mongod --fork --logpath /root/mongod.log --auth
fi
