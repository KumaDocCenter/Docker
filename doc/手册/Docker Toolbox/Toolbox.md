---
typora-root-url: DockerToolbox_img
typora-copy-images-to: DockerToolbox_img
---

# Docker Toolbox

## ==概述==

from:  [工具箱概述](https://docs.docker.com/toolbox/overview/)

> **传统的桌面解决方案。**Docker Toolbox适用于较旧的Mac和Windows系统，不能满足[Docker for Mac](https://docs.docker.com/docker-for-mac/)和[Docker for Windows的要求](https://docs.docker.com/docker-for-windows/)。如果可能，我们建议您更新到较新的应用程序。



Docker Toolbox是一个安装程序，用于在较旧的Mac和Windows系统上快速设置和启动Docker环境，这些环境不符合新[Docker for Mac](https://docs.docker.com/docker-for-mac/)和[Docker for Windows](https://docs.docker.com/docker-for-windows/)应用程序的要求。

![工具箱安装程序](/toolbox-installer.png)

### 盒子里装了什么

**Toolbox包含以下Docker工具：**

* 用于运行`docker-machine`命令的==Docker Machine==
* 用于运行`docker`命令的==Docker Engine==
* ==Docker Compose==用于运行`docker-compose`命令
* ==Kitematic==，==Docker GUI==
* 为Docker命令行环境预配置的shell
* ==Oracle VirtualBox==

您可以在[Toolbox Releases](https://github.com/docker/toolbox/releases)上找到各种版本的工具，或者`--version`在终端中使用标志运行它们，例如，`docker-compose --version`。

### 下载

1. 获取适用于您平台的最新Toolbox安装程序：

   | 适用于Mac的工具箱                                            | 适用于Windows的工具箱                                        |
   | ------------------------------------------------------------ | ------------------------------------------------------------ |
   | [获取适用于Mac的Docker Toolbox](https://download.docker.com/mac/stable/DockerToolbox.pkg) | [适用于Windows的Docker Toolbox](https://download.docker.com/win/stable/DockerToolbox.exe) |
   | [GitHub下载](https://github.com/docker/toolbox/releases)     | [GitHub下载](https://github.com/docker/toolbox/releases)     |

2. 选择适用于您的平台的安装说明，然后按照以下步骤操作：

   * [在macOS上安装Docker Toolbox](https://docs.docker.com/toolbox/toolbox_install_mac/)
   * [在Windows上安装Docker Toolbox](https://docs.docker.com/toolbox/toolbox_install_windows/)



## ==在Mac上安装Toolbox==

from:  [在Mac上安装Toolbox](https://docs.docker.com/toolbox/toolbox_install_mac/)

Docker Toolbox提供了一种在较旧的Mac上使用Docker的方法，这些方法不能满足[Docker for Mac](https://docs.docker.com/docker-for-mac/)的最低系统要求。 

> **提示**：较新的[Docker for Mac](https://docs.docker.com/docker-for-mac/)解决方案的一个优点 是它使用本机虚拟化，并且不需要VirtualBox来运行Docker。 



### 第1步：检查您的版本

您的Mac必须运行macOS 10.8“Mountain Lion”或更新版本才能运行Docker软件。要了解您拥有的操作系统版本：

1. 从Apple菜单中选择**关于此Mac**。

   版本号直接显示在单词下方`macOS`。

2. 如果您的版本正确，请转到下一步。

   如果您未使用受支持的版本，则可以考虑升级操作系统。

   如果你有macOS 10.10.3 Yosemite或更新，请考虑使用[Docker for Mac](https://docs.docker.com/docker-for-mac/)。它在Mac上本机运行，因此不需要预配置的Docker QuickStart shell。它使用本机macOS Hypervisor框架进行虚拟化，而不是Oracle VirutalBox。为[Mac Docker](https://docs.docker.com/docker-for-mac/#what-to-know-before-you-install)的Mac主题在Docker中提供了完整的安装必备条件。 

### 第2步：安装Docker Toolbox

1. 通过双击包或右键单击并从弹出菜单中选择“打开”来安装Docker Toolbox。

   安装程序将启动一个介绍性对话框，然后概述已安装的内容。

   ![安装Docker Toolbox](/mac-welcome-page.png)

2. 按**继续**以安装工具箱。

   安装程序为您提供自定义标准安装的选项。

   ![标准安装](/mac-page-two.png)

   默认情况下，标准Docker Toolbox安装：

   * 安装Docker工具的二进制文件在 `/usr/local/bin`
   * 使这些二进制文件可供所有用户使用
   * 更新任何现有的Virtual Box安装

   目前，请勿更改任何默认值。

3. 按“ **安装”**以执行标准安装。

   系统会提示您输入密码。

   ![密码提示](/mac-password-prompt.png)

4. 提供密码以继续安装。

   完成后，安装程序会为您提供一些快捷方式。您现在可以忽略它，然后单击**继续**。

   ![快速开始](/mac-page-quickstart.png)

   然后单击“ **关闭”**以完成安装程序。

   ![全部完成](/mac-page-finished.png)

### 第3步：验证您的安装

要运行Docker容器，您需要：

* 创建一个新的（或启动现有的）Docker Engine主机运行
* 将您的环境切换到新VM
* 使用`docker`客户端来创建，加载和管理容器

创建计算机后，您可以根据需要随时重复使用它。与任何Virtual Box VM一样，它在使用之间维护其配置。

1. 打开**Launchpad**并找到Docker Quickstart Terminal图标。

   ![发射台](/applications_folder.png)

2. 单击该图标以启动Docker Quickstart Terminal窗口。

   终端为您设置Docker Quickstart Terminal做了很多事情。

   ```
    Last login: Sat Jul 11 20:09:45 on ttys002
    bash '/Applications/Docker Quickstart Terminal.app/Contents/Resources/Scripts/start.sh'
    Get http:///var/run/docker.sock/v1.19/images/json?all=1&filters=%7B%22dangling%22%3A%5B%22true%22%5D%7D: dial unix /var/run/docker.sock: no such file or directory. Are you trying to connect to a TLS-enabled daemon without TLS?
    Get http:///var/run/docker.sock/v1.19/images/json?all=1: dial unix /var/run/docker.sock: no such file or directory. Are you trying to connect to a TLS-enabled daemon without TLS?
    -bash: lolcat: command not found
   
    mary at meepers in ~
    $ bash '/Applications/Docker Quickstart Terminal.app/Contents/Resources/Scripts/start.sh'
    Creating Machine dev...
    Creating VirtualBox VM...
    Creating SSH key...
    Starting VirtualBox VM...
    Starting VM...
    To see how to connect Docker to this machine, run: docker-machine env dev
    Starting machine dev...
    Setting environment variables for machine dev...
   
                            ##         .
                      ## ## ##        ==
                   ## ## ## ## ##    ===
               /"""""""""""""""""\___/ ===
          ~~~ {~~ ~~~~ ~~~ ~~~~ ~~~ ~ /  ===- ~~~
               \______ o           __/
                 \    \         __/
                  \____\_______/
   
    The Docker Quick Start Terminal is configured to use Docker with the "default" VM.
   ```

3. 在终端窗口中单击鼠标以使其处于活动状态。

   如果您不熟悉终端窗口，请参阅以下快速提示。

   ![终奌站](/terminal.png)

   提示传统上是一个`$`美元符号。在*命令行中*键入命令，该 *命令行*是提示后的区域。光标由突出显示的区域或`|`命令行中显示的区域指示。输入命令后，请始终按 `回车键`。

4. 键入`docker run hello-world`命令，然后按 `回车键`。

   该命令可以为您完成一些工作，如果一切运行良好，命令的输出如下所示：

   ```
    $ docker run hello-world
    Unable to find image 'hello-world:latest' locally
    latest: Pulling from library/hello-world
    535020c3e8ad: Pull complete
    af340544ed62: Pull complete
    Digest: sha256:a68868bfe696c00866942e8f5ca39e3e31b79c1e50feaee4ce5e28df2f051d5c
    Status: Downloaded newer image for hello-world:latest
   
    Hello from Docker.
    This message shows that your installation appears to be working correctly.
   
    To generate this message, Docker took the following steps:
    1. The Docker Engine CLI client contacted the Docker Engine daemon.
    2. The Docker Engine daemon pulled the "hello-world" image from the Docker Hub.
    3. The Docker Engine daemon created a new container from that image which runs the
       executable that produces the output you are currently reading.
    4. The Docker Engine daemon streamed that output to the Docker Engine CLI client, which sent it
       to your terminal.
   
    To try something more ambitious, you can run an Ubuntu container with:
    $ docker run -it ubuntu bash
   
    Share images, automate workflows, and more with a free Docker Hub account:
    https://hub.docker.com
   
    For more examples and ideas, visit:
    https://docs.docker.com/userguide/
   ```

### 可选：添加共享目录

默认情况下，Toolbox只能访问该`/Users`目录并将其安装到VM中`/Users`。如果您的项目位于其他位置或需要访问主机文件系统上的其他目录，则可以添加它们。

#### 使用VirtualBox GUI

您可以在VirtualBox UI中配置共享文件夹。

1. 打开VirtualBox UI。
2. 单击“ **设置”**齿轮，然后转到“ **共享文件夹”**。
3. 选择**机器文件夹**下的任何现有列表，然后单击**+**图标。
   * 选择主机上的**文件夹路径** ，在VM中输入**文件夹名称**（或采用默认值，与主机上的名称相同），并配置所需的任何其他选项。
   * 选择**自动安装**，如果你需要的文件夹自动被安装到虚拟机，并选择**设为永久**它被认为是一个永久的共享文件夹。
4. 单击“ **确定”**将新文件夹添加到“共享文件夹”列表中。
5. 再次单击“ **确定”**以保存更改并退出“设置”对话框。

#### 使用命令行

您可以使用如下命令配置共享文件夹：

```
$ mount -t vboxsf -o uid=1000,gid=50 your-other-share-name /some/mount/location
```

此命令安装`/some/mount/location`到VM `/your-other-share-hame`，由UID =1000和GID =50拥有。

> **注意**：使用命令行不支持自动安装和永久安装选项。

### 如何卸载Toolbox

删除工具箱涉及删除它包含的所有Docker组件。

完全卸载还包括删除使用Docker Machine创建的本地和远程计算机。在某些情况下，您可能希望保留使用Docker Machine创建的计算机。

例如，如果您计划将Docker Machine重新安装为Docker for Mac的一部分，则可以继续通过Docker管理这些计算机。或者，如果云提供商上有远程计算机，并且您计划使用提供程序管理它们，则不希望将其删除。因此，删除机器的步骤在此处描述为可选的。

**要在Mac上卸载Toolbox，请执行以下操作：**

1. 列出你的机器。

   ```
   $ docker-machine ls
   NAME   			ACTIVE   	DRIVER       STATE     		URL            		SWARM
   dev                 *        virtualbox   Running   tcp://192.168.99.100:2376
   my-docker-machine            virtualbox   Stopped
   default                      virtualbox   Stopped
   ```

2. （可选）删除每台计算机。例如：

   ```
   $ docker-machine rm my-docker-machine
   Successfully removed my-docker-machine
   ```

   此步骤是可选的，因为如果您计划将Docker Machine重新安装为[Docker for Mac](https://docs.docker.com/docker-for-mac/)的一部分，则可以通过Docker导入并继续管理这些计算机。

3. 在“Applications”文件夹中，删除“Docker”目录，其中包含“Docker Quickstart Terminal”和“Kitematic”。

4. 在命令shell中运行以下命令以完全删除Kitematic：

   ```
   $ rm -fr ~/Library/Application\ Support/Kitematic
   ```

5. 取出`docker`，`docker-compose`以及`docker-machine`从命令`/usr/local/bin`文件夹。适用于Mac和Brew的Docker也可以安装它们; 如有疑问请留下，或通过Brew重新安装，或重新运行Docker for Mac（无需重新安装）。

   ```
   $ rm -f /usr/local/bin/docker
   $ rm -f /usr/local/bin/docker-compose
   $ rm -f /usr/local/bin/docker-machine
   ```

6. （可选）删除`~/.docker/machine`目录。

   此目录存储一些配置和/或状态，例如有关已创建的计算机和证书的信息。

7. 卸载Oracle VirtualBox，它是作为Toolbox安装的一部分安装的。



## ==在Windows上安装Toolbox==

from:  [在Windows上安装Toolbox](https://docs.docker.com/toolbox/toolbox_install_windows/)

Docker Toolbox提供了一种在Windows系统上使用Docker的方法，该系统不满足[Docker for Windows](https://docs.docker.com/docker-for-windows/)应用程序的最低系统要求。 

> **提示**：较新的[Docker for Windows](https://docs.docker.com/docker-for-windows/)解决方案的一个优点 是它使用本机虚拟化，并且不需要VirtualBox来运行Docker。 



### 第1步：检查您的版本

要运行Docker，您的计算机必须具有运行Windows 7或更高版本的64位操作系统。此外，您必须确保在计算机上启用了虚拟化。要验证您的机器是否满足这些要求，请执行以下操作：

1. 右键单击Windows消息，然后选择“ **系统”**。

   如果您未使用受支持的版本，则可以考虑升级操作系统。

   如果您有更新的系统，特别是64位Windows 10 Pro，具有企业和教育（1607周年更新，Build 14393或更高版本），请考虑使用[Docker for Windows](https://docs.docker.com/docker-for-windows)。它在Windows上本机运行，因此不需要预配置的Docker QuickStart shell。它还使用Hyper-V进行虚拟化，因此对于较新的Windows系统，下面的检查虚拟化的说明将过时。在安装之前的[“知道的内容”](https://docs.docker.com/docker-for-windows/#what-to-know-before-you-install)中，Docker for Windows主题中提供了完整的安装先决条件。

2. 确保您的Windows系统支持硬件虚拟化技术并且已启用虚拟化。

   **对于Windows 10**

   运行[Speccy](https://www.piriform.com/speccy)，查看CPU信息。

   **对于Windows 8或8.1**

   选择“ **开始>任务管理器”**，导航至“ **性能”**选项卡。在**CPU下，**您应该看到以下内容：

   ![发布页面](/virtualization.png)

   如果系统上未启用虚拟化，请按照制造商的说明启用它。

   **对于Windows 7**

   运行[Microsoft®硬件辅助虚拟化检测工具](http://www.microsoft.com/en-us/download/details.aspx?id=592)或[Speccy等](https://www.piriform.com/speccy)[工具](http://www.microsoft.com/en-us/download/details.aspx?id=592)，然后按照屏幕上的说明进行操作。 

3. 验证您的Windows操作系统是64位（x64）

   如何进行此验证取决于您的Windows版本。
   有关详细信息，请参阅Windows文章[如何确定计算机是运行32位版本还是64位版本的Windows操作系统](https://support.microsoft.com/zh-cn/help/827218/how-to-determine-whether-a-computer-is-running-a-32-bit-version-or-64)。

### 第2步：安装Docker Toolbox

在本节中，您将安装Docker Toolbox软件和几个“帮助程序”的应用程序。安装程序会将以下软件添加到您的计算机：

* 适用于Windows的Docker客户端
* Docker Toolbox管理工具和ISO
* Oracle VM VirtualBox
* Git MSYS-git UNIX工具

如果安装了以前版本的VirtualBox，请不要使用Docker Toolbox安装程序重新安装。出现提示时，取消选中它。

如果运行Virtual Box，则必须在运行安装程序之前将其关闭。

1. 转到[Docker Toolbox](https://www.docker.com/toolbox)页面。

2. 单击安装程序链接进行下载。

3. 双击安装程序安装Docker Toolbox。

   安装程序启动“安装程序 - Docker Toolbox”对话框。

   如果Windows安全对话框提示您允许程序进行更改，请选择“ **是”**。系统显示**Setup - Docker Toolbox for Windows**向导。

   ![发布页面](/installer_open.png)

4. 按“ **下一步”**接受所有默认值，然后按**“** **安装”**。

   接受所有安装程序默认值。安装程序需要几分钟时间来安装所有组件：

5. 当Windows安全通知时，安装程序将进行更改，确保允许安装程序进行必要的更改。

   完成后，安装程序会报告它成功：

   ![成功](/finish.png)

6. 取消选中“在文件资源管理器中查看快捷方式”，然后按“ **完成”**。

### 第3步：验证您的安装

安装程序将**Docker Toolbox**，**VirtualBox**和**Kitematic**添加到“ **应用程序”**文件夹中。在此步骤中，您将启动Docker Toolbox并运行一个简单的Docker命令。

1. 在桌面上，找到Docker QuickStart终端图标。

   ![桌面](/icon-set.png)

2. 单击Docker QuickStart图标以启动预配置的Docker Toolbox终端。

   如果系统显示“ **用户帐户控制”**提示，以允许VirtualBox对您的计算机进行更改。选择**是**。

   终端为您设置Docker Toolbox做了几件事。完成后，终端显示`$`提示。

   ![桌面](/b2d_shell.png)

   终端运行特殊`bash`环境而不是标准Windows命令提示符。该`bash`环境Docker必须的。

3. 通过单击`$`提示旁边的鼠标激活终端。

   如果您不熟悉终端窗口，请参阅以下快速提示。

   ![/终端shell](/b2d_shell.png)

   提示传统上是一个`$`美元符号。在*命令行中*键入命令，该 *命令行*是提示后的区域。光标由突出显示的区域或`|`命令行中显示的区域指示。输入命令后，请始终按 `回车键`。

4. 键入`docker run hello-world`命令，然后按 `回车键`。

   该命令可以为您完成一些工作，如果一切运行良好，命令的输出如下所示：

   ```
    $ docker run hello-world
    Unable to find image 'hello-world:latest' locally
    Pulling repository hello-world
    91c95931e552: Download complete
    a8219747be10: Download complete
    Status: Downloaded newer image for hello-world:latest
    Hello from Docker.
    This message shows that your installation appears to be working correctly.
   
    To generate this message, Docker took the following steps:
     1. The Docker Engine CLI client contacted the Docker Engine daemon.
     2. The Docker Engine daemon pulled the "hello-world" image from the Docker Hub.
        (Assuming it was not already locally available.)
     3. The Docker Engine daemon created a new container from that image which runs the
        executable that produces the output you are currently reading.
     4. The Docker Engine daemon streamed that output to the Docker Engine CLI client, which sent it
        to your terminal.
   
    To try something more ambitious, you can run an Ubuntu container with:
     $ docker run -it ubuntu bash
   
    For more examples and ideas, visit:
     https://docs.docker.com/userguide/
   ```

### 寻找故障排除帮助？

通常，上述步骤开箱即用，但某些情况可能会导致问题。如果您的`docker run hello-world`工作无效并导致错误，请查看[故障排除](https://docs.docker.com/toolbox/faqs/troubleshoot/)以快速解决常见问题。

您可能遇到的Windows特定问题与NDIS6主机网络筛选器驱动程序有关，已知该驱动程序会导致某些Windows版本出现问题。对于Windows Vista系统及更新版本，VirtualBox默认安装NDIS6驱动程序。问题可能包括系统速度下降到虚拟机（VM）的网络问题。如果发现问题，请**重新运行Docker Toolbox安装程序**，然后选择**使用NDIS5驱动程序安装VirtualBox**的选项。

### 可选：添加共享目录

默认情况下，Toolbox只能访问该`C:\Users`目录并将其安装到VM中`/c/Users`。

> **注意**：在VM路径中，`c`为小写且`Users`中的`U`大写。

如果您的项目位于其他位置或需要访问主机文件系统上的其他目录，则可以使用VirtualBox UI添加它们。

1. 打开VirtualBox UI。
2. 单击“ **设置”**齿轮，然后转到“ **共享文件夹”**。
3. 选择**机器文件夹**下的任何现有列表，然后单击**+**图标。
   * 选择主机上的**文件夹路径** ，在VM中输入**文件夹名称**（或采用默认值，与主机上的名称相同），并配置所需的任何其他选项。
   * 选择**自动安装**，如果你需要的文件夹自动被安装到虚拟机，并选择**设为永久**它被认为是一个永久的共享文件夹。
4. 单击“ **确定”**将新文件夹添加到“共享文件夹”列表中。
5. 再次单击“ **确定”**以保存更改并退出“设置”对话框。

### 如何卸载Toolbox

删除工具箱涉及删除它包含的所有Docker组件。

完全卸载还包括删除使用Docker Machine创建的本地和远程计算机。在某些情况下，您可能希望保留使用Docker Machine创建的计算机。

例如，如果您计划将Docker Machine重新安装为Docker for Windows的一部分，则可以继续通过Docker管理这些计算机。或者，如果云提供商上有远程计算机，并且您计划使用提供程序管理它们，则不希望将其删除。因此，删除机器的步骤在此处描述为可选的。

要在Windows上卸载Toolbox，请执行以下操作：

1. 列出你的机器。

   ```
   $ docker-machine ls
   NAME                ACTIVE   DRIVER       STATE     URL                        SWARM
   dev                 *        virtualbox   Running   tcp://192.168.99.100:2376
   my-docker-machine            virtualbox   Stopped
   default                      virtualbox   Stopped
   ```

2. （可选）删除每台计算机。例如：

   ```
   $ docker-machine rm my-docker-machine
   Successfully removed my-docker-machine
   ```

   此步骤是可选的，因为如果您计划将Docker Machine重新安装为[Docker for Windows](https://docs.docker.com/docker-for-windows/)的一部分，则可以通过Docker导入并继续管理这些计算机。

3. 使用Window的标准过程卸载Docker Toolbox，通过控制面板卸载程序（程序和功能）。

   > **注意**：此过程不会删除该`docker-install.exe`文件。您必须自己删除该文件。

4. （可选）删除 `C:\Users\<your-user>\.docker`目录。

   如果要完全删除Docker，可以验证卸载是否删除了`.docker`用户路径下的目录。如果它仍然存在，请手动将其删除。此目录存储一些Docker程序配置和状态，例如有关已创建的计算机和证书的信息。您通常不需要删除此目录。

5. 卸载Oracle VirtualBox，它是作为Toolbox安装的一部分安装的。



## ==Kitematic==

参考阅读： [Kitematic](Toolbox_Kitematic.md)



## ==故障排除==

from:  [故障排除](https://docs.docker.com/toolbox/faqs/troubleshoot/)

通常，QuickStart开箱即用，但某些情况可能会导致问题。

### 示例错误

尝试连接到计算机（例如`docker-machine env default`）或从Docker Hub中提取映像时（例如），您可能会收到错误`docker run hello-world`。

您获得的错误可能特定于证书，如下所示：

```
Error checking TLS connection: Error checking and/or regenerating the certs: There was an error validating certificates for host "192.168.99.100:2376": dial tcp 192.168.99.100:2376: i/o timeout
```

其他人明确建议重新生成证书：

```
  Error checking TLS connection: Error checking and/or regenerating the certs: There was an error validating certificates for host "192.168.99.100:2376": x509: certificate is valid for 192.168.99.101, not 192.168.99.100
  You can attempt to regenerate them using 'docker-machine regenerate-certs [name]'.
  Be advised that this will trigger a Docker daemon restart which will stop running containers.
```

或者，指示网络超时，如下所示：

```
  bash-3.2$ docker run hello-world
  Unable to find image 'hello-world:latest' locally
  Pulling repository docker.io/library/hello-world
  Network timed out while trying to connect to https://index.docker.io/v1/repositories/library/hello-world/images. You may want to check your internet connection or if you are behind a proxy.
  bash-3.2$
```

### 解决方案

以下是一些快速解决方案，可帮助我们重回正轨。这些示例假设Docker主机是一台名为的机器`default`。

#### 重新生成证书

某些错误明确告诉您重新生成证书。您也可以尝试使用与证书和/或连接相关的其他错误。

```
  $ docker-machine regenerate-certs default
    Regenerate TLS machine certs?  Warning: this is irreversible. (y/n): y
    Regenerating TLS certificates
```

#### 重启DOCKER主机

```
$ docker-machine restart default
```

机器启动后，为命令窗口设置环境变量。

```
$ eval $(docker-machine env default)
```

运行`docker-machine ls`以验证计算机是否正在运行，并且此命令窗口已配置为与其通信，如活动计算机的星号（*****）所示。

```
$ docker-machine ls
NAME             ACTIVE   DRIVER         STATE     URL                         SWARM   DOCKER    ERRORS
default          *        virtualbox     Running   tcp://192.168.99.101:2376           v1.10.1
```

#### 停止机器，将其移除，然后创建一个新机器。

```
$ docker-machine stop default
  Stopping "default"...
  Machine "default" was stopped.

$ docker-machine rm default
  About to remove default
  Are you sure? (y/n): y
  Successfully removed default
```

您可以将该`docker-machine create`命令与`virtualbox`驱动程序一起使用来创建一个名为`default`（或任何您想要的机器名称）的新机器。

```
$ docker-machine create --driver virtualbox default
  Running pre-create checks...
  (default) Default Boot2Docker ISO is out-of-date, downloading the latest release...
  (default) Latest release for github.com/boot2docker/boot2docker is v1.10.1
  (default) Downloading
  ...
  Docker is up and running!
  To see how to connect your Docker Client to the Docker Engine running on this virtual machine, run: docker-machine env default
```

设置命令窗口的环境变量。

```
$ eval $(docker-machine env default)
```

运行`docker-machine ls`以验证新计算机是否正在运行，并且此命令窗口已配置为与其通信，如活动计算机的星号（*****）所示。



### HTTP代理和连接错误

HTTP代理可能导致特殊品牌的连接错误。如果在使用使用HTTP代理（例如公司网络）的虚拟专用网络（VPN）的系统上安装Docker Toolbox，则在客户端尝试连接到服务器时可能会遇到错误。

以下是此类错误的示例：

```
  $ docker run hello-world
  An error occurred trying to connect: Post https://192.168.99.100:2376/v1.20/containers/create: Forbidden

  $ docker run ubuntu echo "hi"
  An error occurred trying to connect: Post https://192.168.99.100:2376/v1.20/containers/create: Forbidden
```



### 在Docker计算机上配置HTTP代理设置

当工具箱创建虚拟机（VM）运行`start.sh`，这样会很值`HTTP_PROXY`，`HTTPS_PROXY`和`NO_PROXY`，并将它们作为`create`选项来创建的`default machine`。

您可以在已创建的Docker计算机（例如计算机）上为专用网络重新配置HTTP代理设置`default`，然后在其他网络上使用同一系统时更改配置。

或者，您可以通过`/var/lib/boot2docker/profile`VM内部的配置文件手动修改计算机上的代理设置，或将代理设置配置为`docker-machine create`命令的一部分。

两种解决方案如下所述。



#### 在Docker机器上更新`/VAR/LIB/BOOT2DOCKER/PROFILE`

解决此问题的一种方法是更新`/var/lib/boot2docker/profile`现有计算机上的文件以指定所需的代理设置。

此文件存在于VM本身，因此您需要`ssh`进入计算机，然后在那里编辑并保存文件。

您可以将计算机地址添加为`NO_PROXY`设置的值，还可以指定您想要使用的代理服务器。通常设置Docker机器URL以`NO_PROXY`解决此类连接问题，因此此处显示了示例。

1. 使用`ssh`登录到虚拟机。此示例登录到 `default`计算机。

   ```
    $ docker-machine ssh default
    docker@default:~$ sudo vi /var/lib/boot2docker/profile
   ```

2. 将`NO_PROXY`设置添加到文件末尾，类似于以下示例。

   ```
    # replace with your office's proxy environment
    export "HTTP_PROXY=http://PROXY:PORT"
    export "HTTPS_PROXY=http://PROXY:PORT"
    # you can add more no_proxy with your environment.
    export "NO_PROXY=192.168.99.*,*.local,169.254/16,*.example.com,192.168.59.*"
   ```

3. 重启Docker。

   修改`profile`VM后，重新启动Docker并注销计算机。

   ```
    docker@default:~$ sudo /etc/init.d/docker restart
    docker@default:~$ exit
   ```

重试Docker命令。Docker和Kitematic现在都应该正常运行。

当您移动到其他网络（例如，离开办公室的公司网络并返回主页）时，删除或注释掉这些代理设置在`/var/lib/boot2docker/profile`并重新启动Docker。



#### 使用`--engine env`手动创建计算机以指定代理设置

您可以`default`使用该`docker-machine create`命令手动删除它们并使用该命令手动创建计算机，而不是重新配置自动创建的计算机，而是使用该`--engine env`标志指定所需的代理设置。

以下是创建`default`代理设置为`http://example.com:8080`和的机器的示例`https://example.com:8080`，以及`N0_PROXY`服务器的设置`example2.com`。

```
docker-machine create -d virtualbox \
--engine-env HTTP_PROXY=http://example.com:8080 \
--engine-env HTTPS_PROXY=https://example.com:8080 \
--engine-env NO_PROXY=example2.com \
default
```

要了解有关使用的更多信息`docker-machine create`，请参阅[Docker Machine](https://docs.docker.com/machine/overview/)参考中的[create](https://docs.docker.com/machine/reference/create/)命令。







