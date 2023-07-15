hosts=`cat /etc/hosts`

ip_files_path="/etc/app_private_ip_addresses/"
ip_files=`ls $ip_files_path`

process_each_ip_file() {
        label=`echo $1 | cut -d "_" -f 1`

        file_path=$ip_files_path$1

        private_ip_address=`cat $file_path`

        if [[ $hosts =~ "app01" ]];then
                echo $label "already exists"
        else
                echo $private_ip_address $label >> /etc/hosts
        fi
}

for i in $ip_files; do
        process_each_ip_file $i
done

