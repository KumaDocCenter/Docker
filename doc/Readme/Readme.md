# Docker 

## 基本信息

**Docker** 是一种容器虚拟化技术，使用Go 语言开发，并遵从 Apache2.0 协议开源。其主要的目的是让开发者打包他们的应用以及依赖包到一个轻量级、可移植的容器中，然后可以快速的部署到服务器上进行运用。



**WebSite** :  https://docker.com/

**维基百科**： [Docker](https://en.wikipedia.org/wiki/Docker_(software) )

**GitHub**： [Docker 社区版](https://github.com/docker/docker-ce)





## 产品信息

**Docker有两个版本：** [^2]

* 社区版（CE）
* 企业版（EE）

Docker 社区版（CE）非常适合希望开始使用Docker并尝试使用基于容器的应用程序的个人开发人员和小型团队。[^2]

Docker企业版（EE）专为企业开发和IT团队而设计，他们可以在生产中大规模构建，发布和运行业务关键型应用程序。[^2]

|               功能                |            社区版             |         企业版基础版          |          企业版标准           |         企业版高级版          |
| :-------------------------------: | :---------------------------: | :---------------------------: | :---------------------------: | :---------------------------: |
| 容器引擎和内置编排，网络，安全性  | ![是](assets/green-check.svg) | ![是](assets/green-check.svg) | ![是](assets/green-check.svg) | ![是](assets/green-check.svg) |
| 经过认证的基础设施，插件和ISV容器 |                               | ![是](assets/green-check.svg) | ![是](assets/green-check.svg) | ![是](assets/green-check.svg) |
|             映像管理              |                               |                               | ![是](assets/green-check.svg) | ![是](assets/green-check.svg) |
|           容器应用管理            |                               |                               | ![是](assets/green-check.svg) | ![是](assets/green-check.svg) |
|           映像安全扫描            |                               |                               |                               | ![是](assets/green-check.svg) |

 

### 社区版（CE）

#### 下载

* [Docker CE for Windows from Docker Store](https://store.docker.com/editions/community/docker-ce-desktop-windows) 
* [Docker CE for Mac from Docker Store](https://store.docker.com/editions/community/docker-ce-desktop-mac) 



> Docker CE可在许多平台上使用，从桌面到云，再到服务器。构建和共享容器并从单一环境自动化开发管道。选择边缘通道以访问最新功能，或选择稳定通道以获得更多可预测性。 [^1]



Docker Community Edition（CE）非常适合希望开始使用Docker并尝试使用基于容器的应用程序的开发人员和小型团队。Docker CE有三种类型的更新通道：**stable**，**test**和**nightly**：

* **Stable** 为您提供一般可用性的最新版本。
* **test** 提供在一般可用之前准备好进行测试的预发布。
* **Nightly** 为您提供下一个主要版本的最新正在进行的工作。

对于Docker CE引擎，开放库[Docker Engine](https://github.com/docker/engine)和[Docker客户端](https://github.com/docker/cli)应用。

发行版的Docker CE二进制文件可从[download.docker.com](https://download.docker.com/)获得， 作为支持的操作系统的软件包。 [Docker Store](https://store.docker.com/)提供了Docker EE二进制文件，用于支持的操作系统。发布渠道适用于每个月的版本，并允许用户“固定”年度发布的选择。发布渠道在可用时也会收到补丁发布。 [^4]



#### 支持的平台[^4]

桌面

|                             平台                             |            x86_64             |
| :----------------------------------------------------------: | :---------------------------: |
| [Docker for Mac (macOS)](https://docs.docker.com/docker-for-mac/install/) | ![是](assets/green-check.svg) |
| [Docker for Windows (Microsoft Windows 10)](https://docs.docker.com/docker-for-windows/install/) | ![是](assets/green-check.svg) |



服务端

|                             平台                             |        x86_64 / amd64         |              ARM              |        ARM64 / AARCH64        |      IBM Power (ppc64le)      |         IBM Z (s390x)         |
| :----------------------------------------------------------: | :---------------------------: | :---------------------------: | :---------------------------: | :---------------------------: | :---------------------------: |
| [CentOS](https://docs.docker.com/install/linux/docker-ce/centos/) | ![是](assets/green-check.svg) | ![是](assets/green-check.svg) |                               |                               |                               |
| [Debian](https://docs.docker.com/install/linux/docker-ce/debian/) | ![是](assets/green-check.svg) | ![是](assets/green-check.svg) | ![是](assets/green-check.svg) |                               |                               |
| [Fedora](https://docs.docker.com/install/linux/docker-ce/fedora/) | ![是](assets/green-check.svg) |                               |                               |                               |                               |
| [Ubuntu](https://docs.docker.com/install/linux/docker-ce/ubuntu/) | ![是](assets/green-check.svg) | ![是](assets/green-check.svg) | ![是](assets/green-check.svg) | ![是](assets/green-check.svg) | ![是](assets/green-check.svg) |



* [关于Docker CE](https://docs.docker.com/install/)
* Cloud
  * 适用于AWS的Docker
    * [为什么Docker for AWS？](https://docs.docker.com/docker-for-aws/why/) 
    * ……
  * 适用于Azure的Docker
    * [为什么Docker for Azure？](https://docs.docker.com/docker-for-azure/why/) 
    * ……
* Linux
  * [CentOS](https://docs.docker.com/install/linux/docker-ce/centos/)
  * [Debian](https://docs.docker.com/install/linux/docker-ce/debian/)
  * [Fedora](https://docs.docker.com/install/linux/docker-ce/fedora/)
  * [Ubuntu](https://docs.docker.com/install/linux/docker-ce/ubuntu/)
  * [二进制](https://docs.docker.com/install/linux/docker-ce/binaries/)
  * [可选的Linux安装后步骤](https://docs.docker.com/install/linux/linux-postinstall/)
* [MacOS](https://docs.docker.com/docker-for-mac/install/)
* [Microsoft Windows](https://docs.docker.com/docker-for-windows/install/)
* Docker Toolbox (旧版)[^6]
  * [工具箱概述](https://docs.docker.com/toolbox/overview/)
  * [在Mac上安装Toolbox](https://docs.docker.com/toolbox/toolbox_install_mac/)
  * [在Windows上安装Toolbox](https://docs.docker.com/toolbox/toolbox_install_windows/)
  * Kitematic[^3]
    * [Kitematic用户指南：简介和概述](https://docs.docker.com/kitematic/userguide/) 
  * [故障排除](https://docs.docker.com/toolbox/faqs/troubleshoot/)
* [发行说明](https://docs.docker.com/release-notes/docker-ce/)





### 企业版（EE）

#### 下载



> 专为企业开发和IT团队而设计，他们可以在生产中大规模构建，运送和运行业务关键型应用程序。集成，认证和支持，为企业提供业内最安全的容器平台，以实现所有应用程序的现代化。**Docker EE 高级版**附带了UCP和DTR等企业 附加组件。 [^1]



* Docker Enterprise Edition（EE）  -- Docker企业版
  * Docker EE Basic   -- Docker 企业基础版
  * Docker EE Standard   -- Docker 企业标准版
  * Docker EE Advanced   -- Docker 企业高级版



Docker Enterprise Edition（EE）专为企业开发和IT团队而设计，他们可以在生产和规模上构建，发布和运行业务关键型应用程序。Docker EE经过集成，认证和支持，可为企业提供业内最安全的容器平台。有关Docker EE的更多信息，包括购买选项，请参阅[Docker Enterprise Edition](https://www.docker.com/enterprise-edition/)。[^5]

**目前有两种版本的Docker EE Engine可用：**

* **18.03** - 如果您只运行Docker EE Engine，请使用此版本。
* **17.06** - 如果您想使用Docker Enterprise Edition 2.0（Docker Engine，UCP和DTR），请使用此版本。



#### 企业基础版[^5]

使用**Docker EE 基础版**，您可以部署Docker Enterprise Engine以灵活的方式管理容器工作负载。您可以在Windows，Linux，内部部署或云上管理工作负载。

**Docker EE 基础版**具有企业级支持，具有已定义的SLA，可为长达24个月的补丁延长维护周期。



#### 企业 标准版和高级版[^5]

**Docker EE 标准版** 具有基础版所具有的一切，并通过私有映像管理，集成映像签名策略和集群管理扩展它，并支持Kubernetes和Swarm协调器。

**Docker EE 高级版** 更进一步，允许您实施基于节点的RBAC策略，映像升级策略，映像镜像以及扫描映像中的漏洞。



#### 支持的平台[^5]

下表显示了可用于Docker EE的所有平台。第一列中的每个链接都会将您带到相应平台的安装说明。Docker EE是针对列出的云提供商和操作系统的集成，支持和认证的容器平台。

##### 本地

这些是可以安装Docker EE的操作系统。

|                             平台                             |        x86_64 / amd64         |      IBM Power (ppc64le)      |         IBM Z (s390x)         |
| :----------------------------------------------------------: | :---------------------------: | :---------------------------: | :---------------------------: |
| [CentOS](https://docs.docker.com/install/linux/docker-ee/centos/) | ![是](assets/green-check.svg) |                               |                               |
| [Oracle Linux](https://docs.docker.com/install/linux/docker-ee/oracle/) | ![是](assets/green-check.svg) |                               |                               |
| [Red Hat Enterprise Linux](https://docs.docker.com/install/linux/docker-ee/rhel/) | ![是](assets/green-check.svg) | ![是](assets/green-check.svg) | ![是](assets/green-check.svg) |
| [SUSE Linux Enterprise Server](https://docs.docker.com/install/linux/docker-ee/suse/) | ![是](assets/green-check.svg) | ![是](assets/green-check.svg) | ![是](assets/green-check.svg) |
| [Ubuntu](https://docs.docker.com/install/linux/docker-ee/ubuntu/) | ![是](assets/green-check.svg) | ![是](assets/green-check.svg) | ![是](assets/green-check.svg) |
| [Microsoft Windows Server 2016](https://docs.docker.com/install/windows/docker-ee/) | ![是](assets/green-check.svg) |                               |                               |
| [Microsoft Windows Server 1709](https://docs.docker.com/install/windows/docker-ee/) | ![是](assets/green-check.svg) |                               |                               |
| [Microsoft Windows Server 1803](https://docs.docker.com/install/windows/docker-ee/) | ![是](assets/green-check.svg) |                               |                               |

> **使用Docker EE Standard或Advanced时** 
>
> IBM Power 是不支持作为 managers 或 workers。 Microsoft Windows Server 是不支持作为一个 manager。Microsoft Windows Server 1803 是不支持作为一个 worker.



##### Docker认证基础架构

Docker认证基础架构是Docker在一系列基础架构选择上部署Docker Enterprise Edition（EE）的规范方法。每个Docker认证基础架构都包含参考架构，自动化模板和第三方生态系统解决方案简介。

|                             平台                             |   Docker Enterprise Edition   |
| :----------------------------------------------------------: | :---------------------------: |
| [VMware](https://success.docker.com/article/certified-infrastructures-vmware-vsphere) | ![是](assets/green-check.svg) |
| [Amazon Web Services](https://success.docker.com/article/certified-infrastructures-aws) | ![是](assets/green-check.svg) |
| [Microsoft Azure](https://success.docker.com/article/certified-infrastructures-azure) | ![是](assets/green-check.svg) |
|                          IBM Cloud                           |           即将到来            |



#### Docker企业版发布周期[^5]

每个Docker EE版本都支持并维护24个月，并在此期间接收安全性和关键错误修复。

Docker API版本独立于Docker平台版本。我们保持谨慎的API向后兼容性，并缓慢而保守地弃用API和功能。我们在弃用它们三个稳定版本时删除了这些功能。Docker 1.13引入了使用不同API版本的客户端和服务器之间改进的互操作性，包括动态功能协商。



* [关于Docker EE](https://docs.docker.com/ee/supported-platforms/)
* Linux
  * [CentOS](https://docs.docker.com/install/linux/docker-ee/centos/)
  * [Oracle Linux](https://docs.docker.com/install/linux/docker-ee/oracle/)
  * [RHEL](https://docs.docker.com/install/linux/docker-ee/rhel/)
  * [SLES](https://docs.docker.com/install/linux/docker-ee/suse/)
  * [Ubuntu](https://docs.docker.com/install/linux/docker-ee/ubuntu/)
* [Microsoft Windows Server](https://docs.docker.com/install/windows/docker-ee/)
* [发行说明](https://docs.docker.com/ee/engine/release-notes/)



### CE与EE代码之间的关系

对于给定的年度版本，Docker同时发布CE和EE变体。EE是CE中提供的代码的超集。Docker维护CE代码的公开可见存储库以及EE代码的私有存储库。自动化（机器人）用于使CE和EE之间的分支保持同步，以便在CE存储库（上游）的各个分支上合并特征和修复，相应的EE存储库和分支保持同步（下游）。虽然Docker及其合作伙伴尽一切努力减少CE和EE之间的合并冲突，但偶尔会发生这种冲突，Docker将努力及时解决它们。[^4]

 



----------------------------------



## 参考阅读



### 官方网站

Docker 官方主页：https://www.docker.com
Docker 官方博客：https://blog.docker.com/
Docker 官方文档：https://docs.docker.com/
Docker Store：https://store.docker.com
Docker Cloud：https://cloud.docker.com
Docker Hub：https://hub.docker.com
Docker 的源代码仓库：https://github.com/moby/moby
Docker 发布版本历史：https://docs.docker.com/release-notes/
Docker 常见问题：https://docs.docker.com/engine/faq/
Docker 远端应用 API：https://docs.docker.com/develop/sdk/



### 实践参考

[Dockerfile 参考](https://docs.docker.com/engine/reference/builder/)
[Dockerfile 最佳实践](https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/)

[Boot2Docker.iso  - 轻量级Linux for Docker](https://github.com/boot2docker/boot2docker) [^7]




### 技术交流

Docker 邮件列表： https://groups.google.com/forum/#!forum/docker-user
Docker 的 IRC 频道：https://chat.freenode.net#docker
Docker 的 Twitter 主页：https://twitter.com/docker



### 其它

[中文社区](http://www.docker.org.cn/index.html)

[Docker阿里云 ](https://dev.aliyun.com) -- [Docker仓库](https://hub.docker.com/) 国内镜像

[网易镜像仓库 ](https://www.163yun.com/product/repo) -- [Docker仓库](https://hub.docker.com/) 国内镜像

[DaoCloud 镜像市场 ](https://hub.daocloud.io/) -- [Docker仓库](https://hub.docker.com/) 国内镜像

[Docker 加速器  - daocloud提供](https://www.daocloud.io/mirror#accelerator-doc)





[Docker 的 StackOverflow 问答主页](https://stackoverflow.com/search?q=docker)

[docker菜鸟教程](http://www.runoob.com/docker/docker-tutorial.html)

[用Docker和Vagrant构建简洁高效开发环境](http://cloud.51cto.com/art/201503/470256.htm)

[八种最常见Docker开发模式](http://cloud.51cto.com/art/201503/469496.htm)

[Docker学习总结之Docker与Vagrant之间的特点比较](https://www.cnblogs.com/vikings-blog/p/3973265.html)

[**Docker与Vagrant的简单区别**](http://dockone.io/article/271)

[docker 和vagrant比较](https://blog.csdn.net/carolzhang8406/article/details/80153869)



[Docker 镜像的基本使用](https://blog.csdn.net/hyzhou33550336/article/details/58587616)

[Docker 镜像加速器](https://blog.csdn.net/hyzhou33550336/article/details/58033405)

[Docker Toolbox 镜像源站](https://blog.csdn.net/hyzhou33550336/article/details/58038958)



## 引文


[^1]: [Docker文档中心](https://docs.docker.com/)

[^2]: [Docker版本概述](https://docs.docker.com/install/overview/)
[^3]: [Kitematic]( https://docs.docker.com/kitematic/userguide/#overview) 是一个开源项目，旨在简化和简化在Mac或Windows PC上使用Docker的过程。Kitematic自动化Docker安装和设置过程，并提供直观的图形用户界面（GUI）来运行Docker容器。 
[^4]: [关于Docker CE](https://docs.docker.com/install/)
[^5]: [关于Docker EE](https://docs.docker.com/ee/supported-platforms/)

[^6]: [Docker Toolbox](https://docs.docker.com/toolbox/overview/) 是一个安装程序，用于在较旧的Mac和Windows系统上快速设置和启动Docker环境，这些环境不符合新[Docker for Mac](https://docs.docker.com/docker-for-mac/)和[Docker for Windows](https://docs.docker.com/docker-for-windows/)应用程序的要求。 

[^7]: Boot2Docker是一个专门用于运行Docker容器的轻量级的Linux发行版 。它完全从RAM运行，下载约45MB并快速启动。





