port=5000

cp /etc/nginx/nginx.conf /etc/nginx/nginx.conf.bk

cp /opt/files/nginx.conf /etc/nginx/nginx.conf

hosts_lines=`cat /etc/hosts`

# for line in $hosts_lines; do
#       echo $line
# done

app_names=()
while read -r line; do
        if [[ $line =~ "app" ]]; then
                app_names=("${app_names[@]}" `echo $line | cut -d " " -f 2`)
        fi
done </etc/hosts

upstream_lines=""

for app_name in "${app_names[@]}"; do
        server="server $app_name:$port;\n"
        upstream_lines="$upstream_lines$server"
done

upstream="upstream backend {\n $upstream_lines }"

sed -i "s/#add_upstream/$upstream/g" /etc/nginx/nginx.conf

