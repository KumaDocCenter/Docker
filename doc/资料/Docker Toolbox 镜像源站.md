# Docker Toolbox 镜像源站

[原文](https://blog.csdn.net/hyzhou33550336/article/details/58038958)   2017年02月27日 11:35:08

 

现在Docker只能运行在Linux内核的机器上。 
所以在Windows或是Mac系统上，需要通过运行Linux的虚拟机来使用Docker服务。 
而Docker Toolbox提供了一整套工具，让你在Windows或Mac系统上更快的搭建起这套环境。

**Docker Toolbox 组件包括:**

* Docker Client
* Docker Machine
* Docker Compose (Mac only)
* Docker Kitematic
* VirtualBox

## 前置依赖

Docker Toolbox 适用于 Mac OS X 10.10.3+ 或 Windows 7 & 8.1。

## 如何安装

* Docker Toolbox的帮助页面：<http://mirrors.aliyun.com/help/docker-toolbox/>
* Mac系统的安装包目录：<http://mirrors.aliyun.com/docker-toolbox/mac/docker-toolbox/>
* Windows系统的安装包目录：<http://mirrors.aliyun.com/docker-toolbox/windows/docker-toolbox/>

## 关于Linux系统

Docker Toolbox提供了一整套的容器编排、集群管理的工具。 
但是Linux系统安装Docker Engine的时候，并没有同时下载这些工具。 
用户可以在该镜像站下载Linux系统的容器编排、集群管理的工具。

* Linux系统的安装包目录：<http://mirrors.aliyun.com/docker-toolbox/linux/>



# Docker For Mac、Docker for Windows

和Docker Toolbox使用VirtualBox虚拟机不同的是。 
Docker for Mac使用了OS X自己的`Hypervisor framework`虚拟化技术。 
而Docker for Windows使用了Windows自己的`Hyper-V`虚拟机。 
两者都将虚拟机之类的细节包装起来了，用户使用的时候更接近在Linux上使用Docker的体验。

## 前置依赖

Docker Toolbox 适用于 Mac OS X 10.11+ 或 Windows 10。

## 如何安装

* Mac系统的安装包目录：<http://mirrors.aliyun.com/docker-toolbox/mac/docker-for-mac/>
* Windows系统的安装包目录：<http://mirrors.aliyun.com/docker-toolbox/windows/docker-for-windows/>

# 相关链接

* [[相关文章\] Docker Engine 镜像源站](http://blog.csdn.net/hyzhou33550336/article/details/58046274)
* [[相关文章\] Docker 镜像加速器](http://blog.csdn.net/hyzhou33550336/article/details/58033405)
* [[相关文章\] Docker镜像的基本使用](http://blog.csdn.net/hyzhou33550336/article/details/58587616)
* [[Docker官方文档\] Docker for Mac 首页](https://docs.docker.com/docker-for-mac/)
* [[Docker官方文档\] Docker for Windows 首页](https://docs.docker.com/docker-for-windows/)
* [阿里云 容器镜像服务控制台](https://cr.console.aliyun.com/)