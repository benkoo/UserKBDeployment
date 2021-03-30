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

## Operating System Requirements
At the time of this writing, we have tested on Mac, Windows 10, and Linux computers. The following versions
of operating systems have worked. 

 Windows 10 Home or Professional: version 20H2
  Note: Certain commercial VPN software interferes with WSL2, so please uninstall these VPN to enable Docker to run on your Windows 10 machine.
 
 Mac OS X: Big Sur 11.2.3 Note: in case you want to use the MultiVM features, you might encounter problems with Big Sur 11.1 and 11.2, more over, Catalina 10.5.7 has shown to work with Earlier models of Mac Book, but has problems with Vagrant for more recent machines.
 
 Linux Ubuntu 16.04 + Note: We have also tested the configurations in 20.04 in Virtual Machine settings.

----

# Restarting Your Computer Recommended
If you have a computer with more than 2 cores and 8GB of memory, the computer should be able to execute 
the following tasks. Make sure you reboot your computer before starting all these procedures. Sometimes,
background processes or users that were logged in to the same computer might occupy significant resources. 
Therefore, restarting at this time would be a good practice.

## Host Machine Software Installation 


### Install Git

Your system must have Git installed. Therefore, please go to the website to install Git.
[Git Installation]


### Install Docker

Your system must have Docker installed. [Docker Installation]
If your host machine is running Ubuntu, just go to the next step, the "./up.sh" script will install Docker software for you.

## Grab code from Git, and Execute the installation activities
After Git has been installed on your local system, please go to a command line interface (CLI), and use Git 
to download the this project to a local working directory.

```
git clone https://github.com/benkoo/UserKBDeployment.git
```

Then, "change directory" (type "cd" in Command Line Prompt) to the top level directory of this project. 


```
cd UserKBDeployment
```

### Launch MediaWiki from Command Line

Go to your command line, and type of copy the following command.

```
./up.sh
```
After it shows the docker processes have done launching, one can use http://localhost:8080 to access the MediaWiki docker service.

If your Ubuntu system didn't have Docker installed, this script will detect it and try to install Docker for you. If you are using other platforms, you need to following instructions on http://docker.io.


## References(reference content hidden, viewable in raw text form.)
[Docker Installation]: https://docs.docker.com/get-started/
[Git Installation]: https://git-scm.com/book/en/v2/Getting-Started-Installing-Git
[Docker environment]: https://docs.docker.com/engine
[Rebooting Windows into BIOS/UEFI]:https://2nwiki.2n.cz/pages/viewpage.action?pageId=75202968
[Ask Ubuntu's Answer on End of Line problems]:https://askubuntu.com/questions/966488/how-do-i-fix-r-command-not-found-errors-running-bash-scripts-in-wsl
