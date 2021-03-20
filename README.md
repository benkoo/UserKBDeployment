# UserKBDeployment

----

To enable Personalized Data Ownership, this project provides the deployment guidance to 
allow individuals install and maintain MediaWiki Knowledge Stores on Laptop or Personal Desktops.

The goal is to help indivdual users to operate a full-featured MediaWiki service as a document 
server that contains all key-value paired references to personalized knowledge content.

Users will need to follow the instructions below to install relevant solftware from scratch. Based on 
our current test results, Mac OS X, Windows 10, and Linux Ubuntu should be able to run this configuration. 
To ensure portability, this project uses Virtualbox, Vagrant, and Docker. So that it standardizes configuration 
using standardized Docker images. Overtime, this project will deploy these Docker Services on Kubernetes. So
that individual users can try out a cluster of services on personal desktops or laptops, and eventually deploy 
to the cloud. 

----

# Restarting Your Computer Recommended
If you have a computer with more than 2 cores and 8GB of memory, the computer should be able to execute 
the following tasks. Make sure you reboot your computer before starting all these procedures. Sometimes,
background processes or users that were logged in to the same computer might occupy significant resources. 
Therefore, restarting at this time would be a good practice.

## Host Machine Software Installation 

### Install VirtualBox (Tested with 6.1.18)

Please go to the following link and download appropriate installation binary for your platform.
[VirtualBox Download].

Mac: If you're using a mac OS then download OS X hosts


### Install Vagrant

After VirtualBox installation, please install Vagrant:
[Vagrant Download]


### Install Git

Your system must have Git installed. Therefore, please go to the website to install Git.
[Git Installation]

## Grab code from Git, and Execute the installation activities


### Working from this Project Directory

After Git has been installed on your local system, please go to a command line interface (CLI), and use Git 
to download the this project. To a local directory.

Note: On Mac, a typical CLI would be the Terminal.app. On Windows 10, I would recommend you to reboot your machine at this
time before continuing this list of instructions. Vagrant configuration might not take place after Git is installed. 
Therefore, one could use other command line app, such as CMD or search for the PowerShell application as your command line
interface. On Linux platforms, use the proper command line tool and type the following command: 
```
git clone https://github.com/benkoo/UserKBDeployment.git
```

Then, "change directory" (type "cd" in Command Line Prompt) to the top level directory of this project. 


```
cd UserKBDeployment
```

### Launch vagrant processes

In the top level working directory, there is a text file named: "VagrantFile". This file contains the configuration 
information regarding how to download and launch a VirtualBox Ubuntu instance.

You may trigger this sequence of actions using the following command:
```
vagrant up
```

Note: Windows users might witness some hickups after Vagrant is installed. When running vagrant up, it might provide a 
message saying that your Hyper-Visor or VT-x options is disabled. You might need to go to BIOS or UEFI to turn it on.

The sequence in rebooting your Windows machine and changing the BIOS or UEFI configurations can be found here:
[Rebooting Windows into BIOS/UEFI]

### Use ssh to get into the Ubuntu-Linux instance running on VirtualBox

After Vagrant launched the Ununtu-Linux intance successful, please use the following instruction to get into
the Ubuntu-Linux instance:
```
vagrant ssh
```
This should take you to the "vagrant" directory in that Ubuntu instance. 

Note: Windows users are likely to face the issue of "`$\r` command not found" error message when executing script files.
This is due to the incompatible end of line symbol set between Windows and other Unix variants. To resolve this problem,
one needs to install dos2unix command on Linux, and run dos2unix on the script files.

Please type in the following command in a Command Line Interface on Windows environment, within the vagrant-Linux 
command prompt:
```
sudo add-apt-repository universe
sudo apt update && sudo apt install dos2unix
# Then, go to the directory that contains script files, run the following command.
sudo dos2unix *.sh
```
Some useful references can be found here: [Ask Ubuntu's Answer on End of Line problems]

### Launch the installation script in the InstallationScript directory

To ease the installation process, this instance of Ubuntu-Linux already has access to your host machine's directory: InstallationScript.

This installation script will copy the initialData.zip in the vagrant_data/ directory to Ubuntu-Linux's /data directory and decompress
all the data content into /data/initialData/ directory.
Please run the following commands to install Docker and other relevant software in your Ubuntu-Linux system.
```
cd data
./installDockerAndOtherSoftware.sh
```

### Launch MediaWiki from Command Line

Once Docker and other supporting software has been installed, just run the following command to start MediaWiki.
Note that it will first install MariaDB, and then MediaWiki, it will take a while.
```
./up.sh
```

After it shows the docker processes have done launching, one can use http://localhost:5151 to access the MediaWiki docker service.

### Backing up the entire Wiki to initialData.zip

Whenever user feel like backing up the entire data set, including content in the MariaDB database, as well as all the MediaFile
in the images directory under mediawiki/, just type the following instruction. The zip-compressed file will be named with the 
the following format: XLPDATA%month%day%year.zip.

```
./wikibackup.sh
```
If you want to repeatedly backup the entire database and all media files in the MediaWiki service, you may just type the following
instruction:

```
sudo crontab -e
```

Then, choose an editor of your choice, by typing "1". And put in this line at the end of the crontab file:
```
0 * * * * /home/vagrant/data/backuplatest.sh
```
This configuration means the backuplatest.sh script will be run once everyhour.
The backed up file will show up in your host machine's vagrant_data/ directory, the file name is: XLPDATA_LATEST.zip
This file will be overwritten every hour.




## Exception Handling
Due to the massive size (about 2Gb +) of softwrae downloads, the download procedure might hang, if it waits for too long, just use 
the following command to stop the download process, and relaunch the "./up.sh" command.
```
service docker stop
```

## References(All links' references are stored under this hidden portion of the page.)
[VirtualBox Download]: https://www.virtualbox.org/wiki/Downloads
[Vagrant Download]: https://www.vagrantup.com/downloads
[Git Installation]: https://git-scm.com/book/en/v2/Getting-Started-Installing-Git
[Docker environment]: https://docs.docker.com/engine
[Rebooting Windows into BIOS/UEFI]:https://2nwiki.2n.cz/pages/viewpage.action?pageId=75202968
[Ask Ubuntu's Answer on End of Line problems]:https://askubuntu.com/questions/966488/how-do-i-fix-r-command-not-found-errors-running-bash-scripts-in-wsl
