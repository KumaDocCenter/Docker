# Docker-Toolbox常见问题解决方案

[原文](https://blog.csdn.net/gezhonglei2007/article/details/51541580/)   2016年05月30日 22:08:09

## 

官方原文：<https://docs.docker.com/faqs/troubleshoot/>

## 错误1

```
  Error checking TLS connection: Error checking and/or regenerating the certs: There was an error validating certificates for host "192.168.99.100:2376": dial tcp 192.168.99.100:2376: i/o timeout
```

## 错误2

```
  Error checking TLS connection: Error checking and/or regenerating the certs: There was an error validating certificates for host "192.168.99.100:2376": x509: certificate is valid for 192.168.99.101, not 192.168.99.100
  You can attempt to regenerate them using 'docker-machine regenerate-certs [name]'.
  Be advised that this will trigger a Docker daemon restart which will stop running containers.
```

## 错误3

```
 Unable to find image 'hello-world:latest' locally
  Pulling repository docker.io/library/hello-world
  Network timed out while trying to connect to https://index.docker.io/v1/repositories/library/hello-world/images. You may want to check your internet connection or if you are behind a proxy.
```

这些错误可能是由一些常用指令导致，像获取default主机的环境变量`docker-machine env default`连接主机获取环境变量， 
或者拉取镜像运行容器的指令`docker run hello-world`。



## 通用解决方案

问题出现突然，而且不稳定。以下介绍几种==通用的解决方案==。(以下以default主机为例)

### 重新生成证书

```
$ docker-machine regenerate-certs default
    Regenerate TLS machine certs?  Warning: this is irreversible. (y/n): y
    Regenerating TLS certificates
```

### 重启Docker主机

```
docker-machine restart default
```

### 将Docker Client连接的默认主机default

```
 # 设置环境变量: 将default主机作为docker deamon(服务端）
 eval $(docker-machine env default)
 # 查看主机列表：default主机Active状态为'*'
 docker-machine ls
```

### 关闭、移除、新建主机

```
 # 关闭default主机
 docker-machine stop default
 # 移除default主机
 docker-machine rm default
 # 新建主机
 docker-machine create --driver virtualbox default
```

### 使用HTTP代理出现的连接错误

通常在VPN网络环境中使用HTTP proxy时，用Docker Toolbox连接服务端会出错。

```
 $ docker run hello-world
  An error occurred trying to connect: Post https://192.168.99.100:2376/v1.20/containers/create: Forbidden

 $ docker run ubuntu echo "hi"
  An error occurred trying to connect: Post https://192.168.99.100:2376/v1.20/containers/create: Forbidden
```

### 在虚拟主机中配置代理设置

进入主机

```
 # 进入default主机
 docker-machine ssh default
```

编辑配置文件

```
 # 编辑配置文件：/var/lib/boot2docker/profile
 docker@default:~$ sudo vi /var/lib/boot2docker/profile
```

在配置文件最后添加NO_PROXY配置，配置文件内容如下：

```
# replace with your office's proxy environment
export "HTTP_PROXY=http://PROXY:PORT"
export "HTTPS_PROXY=http://PROXY:PORT"
# you can add more no_proxy with your environment.
export "NO_PROXY=192.168.99.*,*.local,169.254/16,*.example.com,192.168.59.*"
```

重启主机

```
docker@default:~$ sudo /etc/init.d/docker restart
docker@default:~$ exit12
```

### 创建虚拟机时直接指定配置

可删除虚拟机重建

```
docker-machine create -d virtualbox \
  --engine-env HTTP_PROXY=http://example.com:8080 \
  --engine-env HTTPS_PROXY=https://example.com:8080 \
  --engine-env NO_PROXY=example2.com \
  default
```