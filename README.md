# UserKBDeployment

----

To enable Personalized Data Ownership, this project provides the deployment guidance to 
allow inviduals install and maintain MediaWiki Knowledge Stores on Laptop or Personal Desktops.

The goal is to help indivdual users to operate a full-featured MediaWiki service as a document 
server that contains all key-value paired references to personalized knowledge content.

Users will need to follow the instructions below to install relevant solftware from scratch. Based on 
our current test results, Mac OS X, Windows 10, and Linux Ubuntu should be able to run this configuration. 
To ensure portability, this project uses Virtualbox, Vagrant, and Docker. So that it standardizes configuration 
using standardized Docker images. Overtime, this project will deploy these Docker Services on Kubernetes. So
that individual users can try out a cluster of services on personal desktops or laptops, and eventually deploy 
to the cloud. 

----

## Install VirtualBox 6.1.18_

Please go to the following link and download appropriate installation binary for your platform.
[VirtualBox Download].


## Install Vagrant

After VirtualBox installation, please install Vagrant:
[Vagrant Download]]


## Install Git

Your system must have Git installed. Therefore, please go to the website to install Git.
[Git Installation]

## Working from this Project Directory

After Git has been installed on your local system, please go to a command line interface (CLI), and use Git 
to download the this project. To a local directory.

```
git clone https://github.com/benkoo/UserKBDeployment.git
```

Then, "change directory" (type "cd" in Command Line Prompt) to the top level directory of this project. 
On Mac, a typical CLI would be the Terminal.app. On Windows 10, one should use GitBash. On Linux platforms, 
use the proper command line tool and type the following command: 

```
cd UserKBDeployment
```

## Launch vagrant up

In the top level working directory, there is a text file named: "VagrantFile". This file contains the configuration 
information regarding how to download and launch a VirtualBox Ubuntu instance.

You may trigger this sequence of actions using the following command:
```
vagrant up
```

## Use ssh to get into the Ubuntu-Linux instance running on VirtualBox

After Vagrant launched the Ununtu-Linux intance successful, please use the following instruction to get into
the Ubuntu-Linux instance:
```
vagrant ssh
```
This should take you to the "vagrant" directory in that Ubuntu instance. 

## Launch the intallation script in the InstallationScript directory

To ease the installation process, this instance of Ubuntu-Linux already has access to your host machine's directory: InstallationScript.

Please run the following commands to install Docker and other relevant software in your Ubuntu-Linux system.
```
cd InstallationScript
./installDockerAndOtherSoftware
```

## Launch MediaWiki from Command Line

Once Docker and other supporting software has been installed, just run the following command to start MediaWiki.
Note that it will first install MariaDB, and then MediaWiki, it will take a while.
```
./up
```

Due to the massive size (about 2Gb +) of softwrae downloads, the download procedure might hang, if it waits for too long, just use 
the following command to stop the download process, and relaunch the "./up" command.
```
service docker stop
./up
```


[VirtualBox Download]: https://www.virtualbox.org/wiki/Downloads
[Vagrant Download]: https://www.vagrantup.com/downloads
[Git Installation]: https://git-scm.com/book/en/v2/Getting-Started-Installing-Git
[Docker environment]: https://docs.docker.com/engine
