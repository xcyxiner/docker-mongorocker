docker cp rockmongo:/app/config.php config.php
# 修改里面的MongoDB配置


chmod 777 htpasswd.py
./htpasswd.py -c -b htpasswd username password
#./htpasswd.py -c -b htpasswd test  test


#auth_basic            "Password please";
#auth_basic_user_file  /usr/local/nginx/conf/htpasswd;


docker cp config.php rockmongo:/app/config.php
docker cp htpasswd rockmongo:/etc/nginx/htpasswd
docker cp rockmongo.conf rockmongo:/etc/nginx/sites-available/default
