docker-mongorocker fork
=======================

# 操作处理
* 1 修改docker-compose.yml中的环境变量(主要是host以及端口)
* 2 执行docker-compose up -d 之后参考1.sh中的脚步进行配置
* 3 拷贝config.php 修改其中的配置

```
docker cp rockmongo:/app/config.php config.php

vim config.php

$MONGO["servers"][$i]["mongo_db"] = "admin";//default mongo db to connect, works only if mongo_auth=false
$MONGO["servers"][$i]["mongo_user"] = "用户名";//mongo authentication user name, works only if mongo_auth=false
$MONGO["servers"][$i]["mongo_pass"] = "密码";//mongo authentication password, works only if mongo_auth=false
$MONGO["servers"][$i]["mongo_auth"] = true;//enable mongo authentication?
```

* 4 创建htpasswd文件，输入http basic 的用户名名和密码

```
chmod 777 htpasswd.py
./htpasswd.py -c -b htpasswd username password
```

* 5 将上面的配置重新拷贝进虚拟机

```
docker cp config.php rockmongo:/app/config.php
docker cp htpasswd rockmongo:/etc/nginx/htpasswd
docker cp rockmongo.conf rockmongo:/etc/nginx/sites-available/default
```

* 6 重启虚拟机

```
docker-compose restart
```
