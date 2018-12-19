@echo off

REM 设置颜色
color 0A

:: --------------  默认docker machine的存储位置(根目录) ---------------------   
:: 无此变量时，默认在当前用户目录下存储，如 C:\Users\<uaername>\.docker\machine\machines
:: 结构： 
::	  /
::	   cache
::	   carts
::	   machines
setx MACHINE_STORAGE_PATH  F:\Data\VirtualBox_Save\docker\machine\
:: --------------  默认docker machine的存储位置(根目录) --------------------- 


:: --------------  CA 证书路径 ---------------------   
setx DOCKER_CERT_PATH   F:\Data\VirtualBox_Save\docker\machine\certs
:: --------------  CA 证书路径 ---------------------     



:: -------------- docker 默认的用户变量备份 -------------- 
:::: 运行docker-machine env default，可以看到docker server的变量

REM setx DOCKER_CERT_PATH  C:\Users\Administrator\.docker\machine\machines
REM setx DOCKER_HOST  tcp://192.168.99.100:2376
REM setx DOCKER_MACHINE_NAME  default
REM setx DOCKER_TLS_VERIFY  1
REM SETx COMPOSE_CONVERT_WINDOWS_PATHS true
REM setx NO_PROXY  192.168.99.100

:: -------------- docker 默认的用户变量备份 -------------- 


:: -------------- Docker Toolbox 安装目录 -------------- 
REM setx DOCKER_TOOLBOX_INSTALL_PATH  d:\Docker\Docker Toolbox
:: -------------- Docker Toolbox 安装目录 -------------- 


pause