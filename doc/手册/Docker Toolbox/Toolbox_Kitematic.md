---
typora-root-url: DockerToolbox_img
typora-copy-images-to: DockerToolbox_img
---

# Docker Toolbox



## Kitematic

Kitematic是与[Docker Toolbox](https://docs.docker.com/toolbox/overview/)捆绑在一起的传统解决方案。如果您的系统满足其中一个应用程序的要求，我们建议您更新到[Docker for Mac](https://docs.docker.com/docker-for-mac/)或[Docker for Windows](https://docs.docker.com/docker-for-windows/)。 

### ==Kitematic简介和概述==

from:  [Kitematic用户指南：简介和概述](https://docs.docker.com/kitematic/userguide/)

#### 概述

Kitematic是一个开源项目，旨在简化和简化在Mac或Windows PC上使用Docker的过程。Kitematic自动化Docker安装和设置过程，并提供直观的图形用户界面（GUI）来运行Docker容器。Kitematic与[Docker Machine](https://docs.docker.com/machine/)集成 以配置VirtualBox VM并在您的计算机上本地安装Docker Engine。

安装完成后，Kitematic GUI即会启动，您可以在主屏幕上看到可以立即运行的精选映像。您只需在搜索栏中输入，即可从Kitematic搜索Docker Hub上的任何公共映像。只需单击按钮，即可使用GUI创建，运行和管理容器。Kitematic允许您在Docker CLI和GUI之间来回切换。Kitematic还可以自动执行高级功能，例如管理端口和配置卷。您可以使用Kitematic从GUI更改环境变量，流日志和单击终端到Docker容器中。

首先，如果您还没有这样做，请通过以下方式之一下载并安装Kitematic：

* 从Docker for Mac或Docker for Windows菜单中选择**Kitematic**，开始使用Kitematic安装。
* 安装[Docker Toolbox](https://docs.docker.com/toolbox/overview/#ready-to-get-started)（在不符合[Docker for Mac](https://docs.docker.com/docker-for-mac/install/#what-to-know-before-you-install)或[Docker for Windows](https://docs.docker.com/docker-for-windows/install/#what-to-know-before-you-install)要求的旧系统上）。
* 直接从[Kitematic版本页面](https://github.com/docker/kitematic/releases/)下载Kitematic 。

开始Kitematic。（在桌面系统上，单击应用程序。）

#### 使用您的Docker ID登录

提供您的Docker ID和用户名，然后单击**LOG IN**或单击**Skip for now**以访客身份浏览Docker Hub。

#### 容器清单

Kitematic在“新容器”链接下方的左侧列出所有正在运行和已停止的容器。

容器列表包括所有容器，甚至包括那些不是由Kitematic启动的容器，可让您快速查看Docker守护程序的状态。

您可以单击任何容器以查看其日志（主容器进程的输出），重新启动，停止或执行`sh`该容器。有关更多详细信息，请参阅[使用容器](https://docs.docker.com/kitematic/userguide/#working-with-a-container)。

#### 创建一个新容器

“新容器”页面允许您在Docker Hub上搜索和选择映像。当您找到要运行的映像时，可以单击“创建”以拉取，创建和运行容器。

![Nginx创造](/browse-images.png)

#### 使用容器

如果选择非运行容器（停止或暂停），则可以使用图标“重新启动”或“停止”容器。您还可以查看整个主容器进程的输出日志，并在“设置”部分中进行更改，如果“重新启动”此容器，则可以使用这些更改。

通过从左侧列表中选择正在运行的容器，您可以看到容器的一些状态信息 - 具有Web服务器的容器的HTML输出预览，主容器进程的日志以及已经存在的任何容器卷配置。

![Redis容器在Kitematic中](/cli-redis-container.png)

摘要页面根据映像元数据显示不同的内容。如果是一个已知的“网络”端口（见下文）`EXPOSED`，那么Kitematic会假设它是一个网页，并显示该网站的预览`/`。如果公开了其他端口，则会显示这些端口的列表，以及它们映射到的Docker守护程序IP和端口。如果有`VOLUMES`，则显示这些。摘要屏幕至少显示主容器进程的日志输出。

当前检测到的“网络”端口，`80`，`8000`，`8080`，`3000`，`5000`， `2368`，`9200`，和`8983`。

##### 查看容器日志

您可以通过单击“日志”预览映像或单击“日志”选项卡来查看整个主容器进程的日志输出。

然后，您可以滚动当前正在运行的容器中的日志。请注意，如果更改容器设置，则会重新启动容器，因此会重置此日志视图。

##### 在容器中启动终端

运行容器摘要顶部的“终端”图标`docker container exec -i -t <your container> sh`。这允许您进行快速更改或调试问题。

> **注意**：您执行的 `sh`进程与主容器进程及其子进程的环境设置不同。获取shell的环境命令：`docker-machine env default`。

##### 管理卷

您可以通过单击容器摘要屏幕的“编辑文件”部分中的文件夹，选择将所有容器的卷映射到Mac上的目录。

这允许您通过Finder管理卷中的文件。Kitematic公开了容器的体积数据`~/Documents/Kitematic/<container's name>/`。通过应用程序可以快速访问此文件夹（或目录）：

![访问卷目录](/volumes-dir.png)

> **注意**：当“启用所有卷以在Finder中编辑文件”时，Docker容器将被停止，删除并使用新`volumes` 标志重新创建。

**更改卷目录**

假设你有一个通过Kitematic运行的Nginx网络服务器（使用DockerHub上的 `kitematic/hello-world-nginx`映像）。但是，您不希望使用为website_files卷创建的默认目录。相反，您已经为您的网站提供了HTML，Javascript和CSS 目录在`~/workspace/website`。

导航到容器的“设置”选项卡，然后转到“卷”。此屏幕允许您单独设置映射。

![屏幕截图2015-02-28 at 2 48 01 pm](/change-folder.png)

> **注意**：当您“更改文件夹”时，Docker容器将被停止，删除并使用新`volumes` 标志重新创建。

##### 设置容器名称

默认情况下，Kitematic将容器名称设置为与映像名称相同（或者`-<number>`如果有多个，则设置为。为了简化管理，或者使用容器链接或卷时，您可能需要重命名它。

> **注意**：重命名容器时，将使用新名称停止，删除并重新创建容器（由于默认卷映射）。

##### 添加环境变量

许多映像使用环境变量来自定义它们。“常规”“设置”选项卡允许您添加和修改用于启动容器的环境变量。

环境变量列表显示已在映像元数据上设置的任何内容 - 例如，使用`ENV`Dockerfile中的指令。

当您“保存”更改的环境变量时，将停止，删除并重新创建容器。

##### 删除容器

在“常规”“设置”选项卡上，您可以删除容器。如有必要，单击“删除容器”也会停止容器。

您还可以通过单击`X`容器列表中的图标来删除容器。

Kitematic会提示您确认是否要删除。



#### 列出公开的端口以及如何访问它们

要查看公开端口的完整列表，请转到“设置”，然后转到“端口”。此页面列出了所有公开的容器端口，以及您可以访问用于从macOS系统访问该容器的IP地址和仅主机网络端口。



#### Docker命令行访问

您可以与Kitematic中的现有容器进行交互，或通过Docker命令行界面（CLI）创建新容器。您在CLI上所做的任何更改都会直接反映在Kitematic中。

要通过Kitematic打开终端，只需按下左下角的鲸鱼按钮，如下所示：

![CLI访问按钮](/cli-access-button.png)

##### 示例：创建新的Redis容器

首先，通过单击上面描述的鲸鱼按钮打开Docker-CLI就绪终端。终端打开后，输入`docker run -d -P redis`。这将通过Docker CLI提取，创建和运行新的Redis容器。

![Docker CLI终端窗口](/cli-terminal.png)

> **注意**：如果要从命令行创建容器，请使用`docker run -d` 以便Kitematic可以在通过Kitematic用户界面更改设置时重新创建容器。容器启动时没有`-d`重启。

现在，回到Kitematic。Redis容器现在可见。

![Redis容器在Kitematic中](/cli-redis-container.png)



### ==安装Nginx Web服务器==

from:  [设置Nginx Web服务器](https://docs.docker.com/kitematic/nginx-web-server/)

*Kitematic教程：使用NGINX提供静态网站*

**本教程将指导您完成以下步骤：**

* 下载并运行Web服务器容器
* 在Mac上本机浏览容器的网站数据
* 使用卷修改网站数据

这个示例网站提供流行的2048游戏。我们来吧！

![2048年比赛](/nginx-2048.png)

#### 运行Nginx Web服务器容器

首先，如果您还没有这样做，请[下载并启动Kitematic](https://docs.docker.com/kitematic/)。安装并运行后，应用程序应如下所示：

![Nginx创造](/nginx-create-1540012491038.png)

单击列表的“ *创建”*按钮，`hello-world-nginx`如上所示。Kitematic在Docker容器中提取并运行一个小型Nginx Web服务器，允许它向Mac提供网站数据。

![下载Nginx你好世界](/nginx-hello-world.png)

下载完成后，您应该看到容器附带的示例网站的快速预览，如下所示。单击预览以在您自己的浏览器中查看结果。

![Nginx预览](/nginx-preview-1540012543351.png)

**刚刚发生了什么？**

Kitematic 的`kitematic/hello-world-nginx` 从Docker Hub 下载了映像，然后从该映像创建并运行了Docker Nginx容器。

#### 在Finder中查看网站数据

此容器通过*Docker卷*公开网站数据。Kitematic使管理Docker卷变得简单 - 您可以在Finder中或使用您喜欢的文本编辑器编辑数据。默认情况下，Kitematic会将卷放在`~/Kitematic`下面， 但您可以在容器设置中更改此值。要通过finder访问文件，请单击容器的应用程序内文件夹图标和“通过Finder启用所有卷编辑”：

![Nginx数据量](/nginx-data-volume.png)

应该打开文件夹的Finder窗口，其中包含我们看到由容器提供服务的index.html文件。

![Nginx数据文件夹](/nginx-data-folder.png)

#### 提供您自己的网站数据

现在让我们尝试提供一个更有趣的网站。下载 [2048 ](https://github.com/gabrielecirulli/2048/archive/master.zip)的压缩文件，这是一款流行的（和令人上瘾的）基于网络的平铺游戏。将此zip文件解压缩到刚刚打开的文件夹中：

![2048的网站文件](/nginx-2048-files-1540012665547.png)

切换回Kitematic并通过单击“重新启动”按钮重新启动容器，如下所示。你的Nginx容器现在应该服务2048。

![Nginx运行2048](/nginx-serving-2048-1540012666368.png)

**刚刚发生了什么？**

Kitematic可以将Docker容器卷映射到Mac上的目录。在这种情况下，您通过Finder更改了容器的卷数据，以便为我们下载的网站提供服务。



### ==安装Minecraft服务器==

from:  [设置Minecraft服务器](https://docs.docker.com/kitematic/minecraft-server/)

*Kitematic教程：设置Minecraft服务器*



这是一个快速教程，演示如何使用Kitematic和Docker设置本地Minecraft服务器。

#### 创建Minecraft服务器容器

首先，如果您还没有这样做，请[下载并启动Kitematic](https://docs.docker.com/kitematic/)。安装并运行后，应用程序应如下所示：

单击“创建”按钮，从推荐的Minecraft映像创建容器。

![创建Minecraft容器](/minecraft-create.png)

映像完成下载后，您会看到Minecraft容器的主屏幕。您的Minecraft服务器现在已在Docker容器内启动并运行。我们已经标记了可用于以红色连接到Minecraft服务器的IP和端口（您的IP和端口可能与显示的不同）。

![Minecraft服务器端口和IP信息](/minecraft-port.png)

#### 连接到Minecraft服务器

打开您的Minecraft客户端，使用您的Minecraft帐户登录并单击“多人游戏”按钮。

![我的世界登录界面](/minecraft-login.png)

单击“添加服务器”按钮以添加要连接的Minecraft服务器。

![我的世界登录界面](/minecraft-login.png)

使用您之前看到的Kitematic标记的IP和端口填写“服务器地址”文本框。

![我的世界服务器地址](/minecraft-server-address.png)

点击播放按钮连接到您的Minecraft服务器并享受！

#### 使用Docker卷更改地图

从Kitematic打开“data”文件夹（选择“启用所有卷以通过Finder编辑文件”）。我们使用Docker Volume将Minecraft Docker容器中的文件夹映射到您的计算机上。

![Minecraft数据量](/minecraft-data-volume.png)

Finder打开，允许您用您想要的新地图替换当前地图。

![我的世界地图](/minecraft-map.png)

单击“重新启动”按钮重新启动容器。

![重启Minecraft容器](/minecraft-restart.png)

返回您的Minecraft客户端并加入您的服务器。应该加载新地图。





### ==创建本地RethinkDB数据库以进行开发==

from:  [创建本地RethinkDB数据库以进行开发](https://docs.docker.com/kitematic/rethinkdb-dev-database/)

*Kitematic教程：创建一个用于开发的本地RethinkDB数据库*



本教程将指导您完成以下步骤：

* 创建一个RethinkDB容器进行开发
* （高级）克隆一个小型Node.js应用程序并将数据写入RethinkDB。

#### 在Kitematic中设置RethinkDB

首先，如果您还没有这样做，请[下载并启动Kitematic](https://docs.docker.com/kitematic/)。打开后，应用程序应如下所示：

![重新思考创建按钮](/rethink-create.png)

单击推荐列表中映像列表的“ *创建”*按钮，`rethinkdb`如上所示。这将在几分钟内下载并运行RethinkDB容器。一旦完成，本地RethinkDB数据库就会启动并运行。

![重新思考容器](/rethink-container.png)

让我们开始用它来开发node.js应用程序。现在，让我们弄清楚RethinkDB正在侦听哪个IP地址和端口。要查找，请单击`Settings` 选项卡，然后单击以下`Ports`部分：

![重新思考创建按钮](/rethink-ports.png)

您可以看到，对于RethinkDB端口`28015`，容器正在侦听主机`localhost`和端口`32783`（在此示例中 - 端口可能与您不同）。这意味着您现在可以通过客户端驱动程序访问RethinkDB `127.0.0.1:32783`。同样，此IP地址可能与您不同。

#### （高级）使用本地Node.js应用程序将数据保存到RethinkDB中

现在，创建在本地macOS系统上运行的RethinkDB示例聊天应用程序，以测试驱动新的容器化数据库。

首先，如果你没有它，[下载并安装Node.js的](http://nodejs.org/)。

> **注意**：此示例需要安装Xcode。

在您的终端中，键入：

```
 $ export RDB_HOST=127.0.0.1 # replace with IP from above step
 $ export RDB_PORT=32783 # replace with Port from above step
 $ git clone https://github.com/rethinkdb/rethinkdb-example-nodejs-chat
 $ cd rethinkdb-example-nodejs-chat
 $ npm install
 $ npm start
```

现在，将浏览器指向`http://localhost:8000`。恭喜，您已成功使用Kitematic中的RethinkDB容器构建实时聊天应用程序。快乐的编码！

![重新思考应用预览](/rethinkdb-preview.png)





### ==常见问题(FAQ)==

from:  [经常问的问题](https://docs.docker.com/kitematic/faq/)



#### Kitematic是开源的吗？

是! 我们的源代码可以在[GitHub](https://github.com/kitematic/kitematic)上找到。Kitematic是在Apache 2.0许可下发布的开源软件。



#### 我如何为Kitematic做出贡献？

我们始终欢迎（并深深感谢！）对该项目的新贡献。开始为Kitematic做贡献的最佳方式是查看我们的[贡献](https://github.com/kitematic/kitematic/blob/master/CONTRIBUTING.md)文档。



#### Kitematic如何与Docker合作？（重点）

==Kitematic直接连接到正在运行的Docker实例，并通过Docker Engine API对其进行控制。==



#### Kitematic支持哪些平台？

现在Kitematic可以在macOS和Windows上运行。Linux计划在未来发展。查看我们的产品[路线图](https://github.com/kitematic/kitematic/blob/master/ROADMAP.md)。



#### 为什么Kitematic会收集使用情况分析和错误报告？

Kitematic跟踪匿名错误和分析，以帮助理解出现问题的原因，并帮助了解用户如何与应用程序进行交互，以便我们可以不断改进它。

您可以通过应用内偏好随时选择退出此选项。

##### 我们不收集什么

* 个人信息：允许我们确定Kitematic特定用户的任何信息
* 与通过Kitematic打开的代码，容器或Docker映像相关的信息或数据。

##### 我们收集什么

* 应用中的操作的匿名事件。我们从不收集与事件相关的数据。例如：
  * 用户搜索了映像（但不是搜索查询的内容）。
  * 用户创建了一个容器（但不是哪个映像，容器的名称或涉及的任何数据）
  * 用户打开了首选项窗格
  * 用户删除了一个容器
* 错误名称，消息和堆栈跟踪（为用户名擦除）
* 操作系统，Kitematic和已安装的VirtualBox版本

我们很乐意回答有关此问题的任何问题。请随时通过kitematic@docker.com与我们联系或在GitHub上打开一个问题。



### ==已知问题==

from:  [已知的问题](https://docs.docker.com/kitematic/known-issues/)



Kitematic最常见的错误发生在设置阶段，因为使用VirtualBox可靠地创建VM可能很棘手。我们正在研究这个问题。

以下是适用于大多数人的常见错误和解决方案列表。

#### 安装错误或悬挂在99％

有时Kitematic没有正确设置VirtualBox。重试设置通常有效（通过两个重试按钮之一）。如果没有，请在命令行上尝试以下命令：

* `docker-machine rm -f dev`
* `docker-machine create -d virtualbox dev`

然后重新打开Kitematic。这通常可以解决问题，但如果问题仍然存在，请随时查看我们[现有的GitHub问题](https://github.com/kitematic/kitematic/issues?q=is%3Aopen+is%3Aissue+label%3Abug)。



#### 贡献修复

我们一直在寻求帮助，使Kitematic更好，更可靠！访问 [我们的GitHub页面](https://github.com/kitematic/kitematic)，了解如何贡献的文档。

在底层 ，Kitematic使用[Docker Machine](https://github.com/docker/machine)通过VirtualBox配置支持Docker的VM。我们仍在努力加强与该项目的整合。如果您希望帮助解决有关VM配置的特定问题，那么他们的[GitHub仓库](https://github.com/docker/machine)是一个很好的起点。



#### 查看所有问题

有关Kitematic错误或问题的完整列表，请参阅标记为的[现有GitHub问题](https://github.com/kitematic/kitematic/issues?q=is%3Aopen+is%3Aissue+label%3Abug)`bug`。





