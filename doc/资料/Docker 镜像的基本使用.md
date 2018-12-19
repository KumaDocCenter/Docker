# Docker 镜像的基本使用

[原文](https://blog.csdn.net/hyzhou33550336/article/details/58587616)   2017年02月28日 10:50:18



## 前言

> Docker的使用条件和基础不再复述 
> Docker安装和Docker镜像下载的加速器文档在下方的”相关链接”中已经给出，磨刀不误砍柴工。

## 基本概念

Docker的镜像存储中心通常被称为`Registry`。 
当您需要获取Docker镜像的时候，首先需要登录`Registry`，然后拉取镜像。 
在您修改重新打包好镜像之后，您又可以再次将镜像推送到`Registry`中去。

Docker的镜像地址是什么？我们来看一个完整的例子。（以容器服务的公共镜像为例） 
`registry.cn-hangzhou.aliyuncs.com/acs/agent:0.8`

* `Registry域名`：`registry.cn-hangzhou.aliyuncs.com`
* `命名空间`：`acs`
* `仓库名称`：`agent`
* `Tag`、`镜像标签`：`0.8`（非必须，默认latest）

将这个几个完全独立的概念组合一下，还有几个术语。

* `仓库坐标`：`registry.cn-hangzhou.aliyuncs.com/acs/agent`
* `仓库全名`：`acs/agent`

## 基本使用

本文的重点是介绍Docker最常用的三个命令：**login**、**pull**、**push**。

### docker login

登陆时必须指明登陆的`Registry域名` 
以阿里云杭州公网Registry为例：(必要时需要使用sudo)

```
docker@default-online:~$ docker login registry.cn-hangzhou.aliyuncs.com
Username: sample@alibaba-inc.com
Password:
Login Succeeded
```

登陆成功之后会显示 Login Succeeded。 
另外你还可以通过查看这个文件，确认您的登陆信息。

```
docker@default-online:~$ cat ~/.docker/config.json
{
    "auths": {
        "registry.cn-hangzhou.aliyuncs.com": {
            "auth": "XXXXXXXXXXXXXXXXXXXXXX"
        }
    }
}
```

### docker pull

拉取镜像首先需要提示您的是：

1. 如果你要拉取Docker官方的镜像的话，参考一下下方相关链接中的加速器文章。
2. 如果你要拉取公共仓库下的镜像的话，不登陆Registry也是可以拉去的。

还是以容器服务的公共镜像 `registry.cn-hangzhou.aliyuncs.com/acs/agent:0.8` 为例

```
docker@default-online:~$ docker pull registry.cn-hangzhou.aliyuncs.com/acs/agent:0.8
0.8: Pulling from acs/agent
5a026b6c4964: Already exists
e4b621e8d9cb: Already exists
8bc2fd04bdd4: Pull complete
a977b0087b3e: Pull complete
8f6e00ea13c6: Pull complete
875dd8c9666f: Pull complete
9c07bcabc35d: Pull complete
Digest: sha256:cac848bd31bccf2a041bda7b57e3051341093abde6859df9ee9d332dfec6ddd9
Status: Downloaded newer image for registry.cn-hangzhou.aliyuncs.com/acs/agent:0.8
```

查看一下下载下来的镜像（注意`仓库坐标`和`Tag`这两个概念）

```
docker@default-online:~$ docker images
REPOSITORY                                    TAG                 IMAGE ID            CREATED             SIZE
registry.cn-hangzhou.aliyuncs.com/acs/agent   0.8                 b9ba5841bdb0        24 hours ago        42.18 MB
```

### docker push

镜像在本地环境构建或是打包好之后，就可以推到Registry啦。 
当然前提条件是，你有对这个仓库的读写权限或是读写授权。否则你会看到下面这样的错误。

```
docker@default-online:~$ docker push registry.cn-hangzhou.aliyuncs.com/acs/agent:0.8
The push refers to a repository [registry.cn-hangzhou.aliyuncs.com/acs/agent]
359f80267111: Layer already exists
7e5fa28d90b8: Layer already exists
b20d7f600f63: Layer already exists
4a159b4f8370: Layer already exists
7c3712ebe877: Layer already exists
d91d130a53aa: Layer already exists
fcad8ad5a40f: Layer already exists
unauthorized: authentication required
```

## FAQ

### docker login 失败

> 主要需要排查有两种可能 
>
> 1. 用户使用了阿里云账户的登陆密码，而没有使用Registry的独立登陆密码。Registry的登陆密码是在容器镜像服务的控制台上设置与修改的。 
> 2. 用户使用了sudo进行登陆，这个时候系统第一个要求输入的密码是Linux的用户密码。很多用户在这里输入了Registry的登陆密码，导致登陆操作失败。区分这个错误的方式很简单，Linux的用户密码大多允许尝试三次，错误时会提示`Sorry, try again.`。而Registry的登陆密码错误一次之后就会退出，并返回以下错误。

```
Error response from daemon: Get https://registry.cn-hangzhou.aliyuncs.com/v2/: unauthorized: authentication required1
```



### docker pull 失败，提示`Error: image xxx not found`

> 主要的排查步骤 ：
>
> 1. 自己下载的是公共仓库，那么问题应该在镜像地址不正确。请在控制台搜索一下这个公共仓库，检查一下想要下载的这个镜像版本是不是真实存在。 
> 2. 自己想要下载的是一个私有仓库中的镜像，这时首先确认一下Registry登陆状态。`cat ~/.docker/config.json`可以看到所有登陆的Registry域名。里面是不是包括你想要下载镜像的Registry域名。如果没有的话，您需要参考上面的文档，先进行登陆操作。如果这里已经登陆了的话，那么您需要确认的就是您登陆的这个账户是否有权限下载这个镜像。子账户默认是没有任何权限的，参考下方相关链接中主子账户授权的文章。



### docker pull 失败，提示`Error: filesystem layer verification failed for digest`

极少数情况下偶现，下载的块文件检验失败。一般重试可以解决。



### docker push 失败

> 主要的排查步骤和docker pull基本一致，仅仅是授权要求的级别较pull更高一些。



## 相关链接

* [[相关博客\] Docker Engine 镜像源站](http://blog.csdn.net/hyzhou33550336/article/details/58046274)
* [[相关博客\] Docker Toolbox 镜像源站](http://blog.csdn.net/hyzhou33550336/article/details/58038958)
* [[相关博客\] Docker 镜像加速器](http://blog.csdn.net/hyzhou33550336/article/details/58033405)
* [[Docker官方文档\] Docker Registry 配置参考文档](https://github.com/docker/distribution/blob/master/docs/configuration.md)
* [阿里云 容器镜像服务控制台](https://cr.console.aliyun.com/)