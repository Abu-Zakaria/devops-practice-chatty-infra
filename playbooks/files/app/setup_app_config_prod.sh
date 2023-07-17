APP_DIR=/opt/app
DB_USER=app_user
DB_PASS=`cat /secrets/db_password.txt | sed "s/@/%40/g"`
DB_HOST=`cat /etc/db01_ip_address.txt`

cd $APP_DIR

cp settings.yml.sample settings.yml

sed -i "s/'localhost'/0.0.0.0/g" settings.yml

sed -i "s|mongodb://localhost/letschat|mongodb://$DB_USER:$DB_PASS@$DB_HOST/lets_chat|g" settings.yml

