# Docker Toolbox替换默认docker machine存储位置和镜像加速

[原文](https://www.cnblogs.com/ginponson/p/8601320.html)

一直想试试docker，但是docker高度依赖Linux内核，Windows7的机子用起来比较麻烦，由于某些契机还是用了起来。Windows想用docker的话，需要借助虚拟机，Windows7不像Windows10自带Hyper虚拟机，所以要用docker只有Docker Toolbox这个选择了。具体安装过程就不具体说了，官网也有详细的教程。



> ==注意：==
>
> 本文中的 `default`  均为 虚拟机创建虚拟主机的时指定的名称，如
>
> `docker-machine create --driver=virtualbox default`



## Docker ToolBox安装

1、安装前，需要去bios启用虚拟设置，这样虚拟机才能运行。
2、安装，安装可选的工具：

* Kitematic，docker的界面化，没什么太大需要
* Git，本来已安装的话也不用安装

3、修改 Docker QuickStart 快捷方式，将里面的Git的位置换成你的Git的安装位置(或者可以直接Git进入Docker Toolbox安装位置，运行`./start.sh`)

## 替换默认docker machine存储位置

我相信大部分人都是直接安装官网的教程或者上面的安装方式直接安装的，但是将虚拟机安装在系统盘可能会带来各种问题，所以趁docker的镜像还没膨胀的时候赶快迁移吧。下面步骤可以在安装前做，这样可以减少删除已安装的default docker虚拟机。

1. 在Windows的系统环境添加 **MACHINE_STORAGE_PATH** ，指向虚拟机的存储位置，如 D:\VM\ ，目录结构如下

   ```
   D:\VM\ 
   ├─cache
   │      boot2docker.iso
   │      
   ├─certs     --证书目录
   │      ca-key.pem
   │      ca.pem
   │      cert.pem
   │      key.pem
   │      
   └─machines    --虚拟机存放位置，会自动创建
   ```
   * 注意，不是指定到 `machines`目录，上面的目录结构会自动创建在首次运行命令时。
   * 无此变量时，默认在当前用户目录下存储，如 C:\Users\<uaername>\.docker\machine\machines
   * 如果证书目录也一起移动的话，需要修改相应的环境变量，参考后面的 [FAQ: 无法读取CA证书](#无法读取CA证书) 。

2. 复制boot2docker.iso到虚拟机的位置同级目录cache上（D:\VM\cache），如果不是最新的话需要下载最新。



**下面分两种情况：**

* 如果还没安装default docker虚拟机，可以进入Docker QuickStart直接安装。
* 已安装了default docker虚拟机，需要先删除原来的，再安装到指定位置。



## 删除default docker虚拟机

1、进入Docker QuickStart命令行（Docker QuickStart不能进的话，用Git命令行）
2、运行`docker-machine stop default`，停止运行中的虚拟机
3、运行`docker-machine rm default`，删除默认的虚拟机



## 创建docker虚拟机

1. 运行`docker-machine create --driver=virtualbox default`，等待创建完成
2. 创建完成后，运行`docker run hello-world`测试。会出现  **连接错误** ，参考 [FAQ：连接错误 ](#连接错误)里的方法解决。





## 镜像加速

### 1、修改docker 的配置

嫌弃官网的docker源太慢需要使用国内的源加速的话，要怎么配置呢？
1、运行`docker-machine ssh default`连接虚拟机
2、修改

```
docker@default:~$ sudo tee /var/lib/boot2docker/etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": [
    "https://registry.docker-cn.com"
  ]
}
EOF
```

3、退出ssh，重启`docker-machine restart default`



----

### 2、命令设置

[原文](https://www.cnblogs.com/chongyao/p/9078202.html)

* 我这里用的是阿里云的->容器镜像服务->镜像加速器 

* 首先登陆阿里云获取加速地址：我的加速地址https://c54mqrwj.mirror.aliyuncs.com

* 然后在powershell 输入如下命令

```
  docker-machine ssh default 
  sudo sed -i "s|EXTRA_ARGS='|EXTRA_ARGS='--registry-mirror=加速地址 |g" /var/lib/boot2docker/profile 
  exit 
  docker-machine restart default
```


## 批处理代码

批处理配置docker machine的存储位置等环境变量

`设置docker machine的存储位置和CA 证书路径.bat`

```bash
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
```



----

# FAQ

### 连接错误

因为修改了docker machine存储位置，所以在创建虚拟机后，运行命令时会报如下错误：

```
error during connect: Get http://%2F%2F.%2Fpipe%2Fdocker_engine/v1.36/version: open //./pipe/docker_engine: The system cannot find the file specified. In the default daemon configuration on Windows, the docker client must be run elevated to connect. This error may also indicate that the docker daemon is not running.
```

**解决方法**

* 运行`docker-machine env default`，可以看到docker server的变量，=号后面的内容是根据实际环境生成的，~~copy变量在命令行中运行。~~

  ```bash
  C:\Users\Administrator>docker-machine env default
  SET DOCKER_TLS_VERIFY=1
  SET DOCKER_HOST=tcp://192.168.99.103:2376
  SET DOCKER_CERT_PATH=F:\Data\VirtualBox_Save\docker\machine\machines\default
  SET DOCKER_MACHINE_NAME=default
  SET COMPOSE_CONVERT_WINDOWS_PATHS=true
  REM Run this command to configure your shell:
  REM     @FOR /f "tokens=*" %i IN ('docker-machine env default') DO @%i
  ```

  ==修正：== 

  SET  要换成 SETX  ， 才能将更改保存到系统中。实际可将上面的部分内容复制到bat文件中，然后运行此文件。

  SETX 语法，是 =号 换成 空格 

  ```bash
  SETX DOCKER_TLS_VERIFY 1
  SETX DOCKER_HOST tcp://192.168.99.103:2376
  SETX DOCKER_CERT_PATH F:\Data\VirtualBox_Save\docker\machine\machines\default
  SETX DOCKER_MACHINE_NAME default
  SETX COMPOSE_CONVERT_WINDOWS_PATHS true
  ```

* 再次运行`docker run hello-world`测试，这次应该没问题。



### 无法读取CA证书

参考阅读： [无法读取CA证书xxxx系统找不到指定的文件](https://github.com/docker/toolbox/issues/537)



如果证书目录也一起移动的话，需要修改相应的环境变量，不然会报如下类似的错误：

```
Could not read CA certificate "C:\\Users\\admin\\.docker\\machine\\machines\\def
ault\\ca.pem": open C:\Users\admin\.docker\machine\machines\default\ca.pem: The
system cannot find the file specified.
```

**解决办法**

添加环境变量可以解决该问题，如下`<path>`更改为实际路径，在命令行或bat文件中应用。

```bash
setx DOCKER_CERT_PATH <path>\machine\certs
```







