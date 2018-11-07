docker cp dockermongorocker_rockmongo_1:/app/config.php config.php
# 修改里面的MongoDB配置


chmod 777 htpasswd.py
./htpasswd.py -c -b htpasswd username password
#./htpasswd.py -c -b htpasswd test  test


#auth_basic            "Password please";
#auth_basic_user_file  /usr/local/nginx/conf/htpasswd;


docker cp config.php dockermongorocker_rockmongo_1:/app/config.php
docker cp htpasswd dockermongorocker_rockmongo_1:/etc/nginx/htpasswd
docker cp rockmongo.conf dockermongorocker_rockmongo_1:/etc/nginx/sites-available/default
