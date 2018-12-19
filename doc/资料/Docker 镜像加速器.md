# Docker 镜像加速器

[原文](https://blog.csdn.net/hyzhou33550336/article/details/58033405)     2017年02月27日 11:25:52



> 我们使用Docker的第一步，应该是获取一个官方的镜像，例如`mysql`、`wordpress`，基于这些基础镜像我们可以开发自己个性化的应用。我们可以使用`Docker`命令行工具来下载官方镜像。 
> 但是因为网络原因，我们下载一个300M的镜像需要很长的时间，甚至下载失败。因为这个原因，阿里云容器Hub服务提供了官方的镜像站点加速官方镜像的下载速度。

## 获取镜像加速器地址

在不同的系统下面，配置加速器的方式有一些不同，所以我们介绍主要的几个操作系统的配置方法。 
关于加速器的地址，你只需要登录[容器镜像服务](https://cr.console.aliyun.com/)的控制台，左侧的加速器帮助页面就会显示为你独立分配的加速地址。

## 当你的docker版本较新时

当你下载安装的Docker Version不低于1.10时，建议直接通过daemon config进行配置。 
使用配置文件 /etc/docker/daemon.json（没有时新建该文件）

```
{
    "registry-mirrors": ["<your accelerate address>"]
}
```

重启Docker Daemon就可以了。

## 当你的docker版本较旧时

只能根据系统的不同修改对应的配置文件了。

### Ubuntu 12.04 14.04

Ubuntu的配置文件的位置在 `/etc/default/docker` 
你只需要在这个配置文件，添加加速器的配置项，重启Docker就可以了

```
echo "DOCKER_OPTS=\"\$DOCKER_OPTS --registry-mirror=<your accelerate address>\"" | sudo tee -a /etc/default/docker
sudo service docker restart
```

### Ubuntu 15.04 15.10

Ubuntu 15.04 之后的加速器配置方式有了一些变化 
Ubuntu的配置文件的位置在 `/etc/systemd/system/docker.service.d/`目录下 
在这个目录下创建任意的`*.conf`文件就可以作为配置文件。然后在这个配置文件，添加加速器的配置项，重启Docker就可以了

```
sudo mkdir -p /etc/systemd/system/docker.service.d
sudo tee /etc/systemd/system/docker.service.d/mirror.conf <<-'EOF'
[Service]
ExecStart=
ExecStart=/usr/bin/docker daemon -H fd:// --registry-mirror=<your accelerate address>
EOF
sudo systemctl daemon-reload
sudo systemctl restart docker
```

### CentOS 7

CentOS的配置方式略微复杂，需要先将默认的配置文件复制出来 
/lib/systemd/system/docker.service -> /etc/systemd/system/docker.service 
然后再将加速器地址添加到配置文件的启动命令 
重启Docker就可以了。

```
sudo cp -n /lib/systemd/system/docker.service /etc/systemd/system/docker.service
sudo sed -i "s|ExecStart=/usr/bin/docker daemon|ExecStart=/usr/bin/docker daemon --registry-mirror=<your accelerate address>|g" /etc/systemd/system/docker.service
sudo systemctl daemon-reload
sudo service docker restart
```

### Redhat 7

Redhat 7配置加速器的方式与其他系统都不一样，需要编辑`/etc/sysconfig/docker`配置文件。 
在`OPTIONS`配置项中添加加速器配置`--registry-mirror=<your accelerate address>` 
最后`sudo service docker restart`重启docker daemon。

### Redhat 6、CentOS 6

在这两个系统上没有办法直接安装Docker，需要升级内核。 
配置加速器的方式和上一个配置类似，也是通过编辑`/etc/sysconfig/docker`配置文件。 
在`other_args`配置项中添加加速器配置`--registry-mirror=<your accelerate address>` 
最后`sudo service docker restart`重启docker daemon。

### Docker Toolbox

在Windows、Mac系统上使用Docker Toolbox使用Docker的话 
推荐做法是在创建Linux虚拟机的时候，就将加速器的地址配置进去

```
docker-machine create --engine-registry-mirror=<your accelerate address> -d virtualbox default
docker-machine env default
eval "$(docker-machine env default)"
docker info
```

如果你已经通过docker-machine创建了虚拟机的话，则需要通过登录机器修改配置了 
首先通过`docker-machine ssh <machine-name>`登录虚拟机 
然后修改`/var/lib/boot2docker/profile`文件，将`--registry-mirror=<your accelerate address>`添加到`EXTRA_ARGS`中 
最后`sudo /etc/init.d/docker restart`重启Docker服务就可以了

## 注意

> **文中命令中的加速器地址<your accelerate address>是示例，请您到容器镜像服务控制台获取自己的加速器地址**

 