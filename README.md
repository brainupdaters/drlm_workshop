# DRLM Workshop
> Disaster Recovery Management with ReaR and DRLM (Workshop instructions)


In this README you will find explained the required steps to prepare your own testing environment to follow the workshop and
play with ReaR and DRLM installation.

## Requirements

- Install Virtualbox and the extension pack from here: https://www.virtualbox.org/wiki/Downloads
- Install latest Vagrant software: https://www.vagrantup.com/downloads.html

## Configuration

### GNU/Linux & OS X:

Create a new Host-Only network in your Virtualbox installation:

#### A. Using GUI:

1. Go to Preferences > Networks > Host-only Networks.

2a. Create a new network named vboxnet1, edit and set:

```sh
 IPv4 address: 10.100.0.254
 IPv4 Network Mask: 255.255.255.0
 Disable DHCP Server
```

##### NOTE:
```sh
If Host-only network environment in your VBox installation is more complex, 
please create a new network with the required configuration and adjust 
the Vagrantfile accordingly.
```

#### B. Using CLI:

1. List Host-only interfaces of your VBox installation:
```sh
$ VBoxManage list -l hostonlyifs
Name:            vboxnet0
GUID:            786f6276-656e-4074-8000-0a0027000000
DHCP:            Disabled
IPAddress:       192.168.56.1
NetworkMask:     255.255.255.0
IPV6Address:
IPV6NetworkMaskPrefixLength: 0
HardwareAddress: 0a:00:27:00:00:00
MediumType:      Ethernet
Status:          Down
VBoxNetworkName: HostInterfaceNetworking-vboxnet0
```
2a. If vboxnet0 is already present create vboxnet1 network and configure it: 
```sh
$ VBoxManage hostonlyif create
$ VBoxManage hostonlyif ipconfig vboxnet1 --ip 10.100.0.254 --netmask 255.255.255.0
```
2b. If vboxnet0 is not present create vboxnet0, vboxnet1 and vboxnet2 networks and configure last 2: 
```sh
$ VBoxManage hostonlyif create
$ VBoxManage hostonlyif create
$ VBoxManage hostonlyif ipconfig vboxnet1 --ip 10.100.0.254 --netmask 255.255.255.0
```

### Windows:

For Microsoft Windows OS will be pretty the same configuration (GUI & CLI), but the VirtualBox networks will be named diferent:

- Host-Only Ethernet Adapter (vboxnet1)

Note that there is no vboxnet0 in Windows and you must be in C:\Program files\Oracle\VirtualBox\ or adjust your PATH environment variable to run same VBox CLI commands.

##### NOTE:
```sh
If Host-only network environment in your VBox installation is more complex, 
please create a new network with the required configuration and adjust 
the Vagrantfile accordingly. 
```

Now, we have all the requirements to prepare the workshop environment.

## Download all required vagrant boxes

- CentOS 7
- Debian 8
- Ubuntu 16.04


##### NOTE:
All boxes have the user "vagrant" with sudo privileges and password "vagrant". 

### GNU/Linux, OS X & Windows:

```sh   
$ vagrant box add https://atlas.hashicorp.com/minimal/boxes/centos7

$ vagrant box add https://atlas.hashicorp.com/minimal/boxes/jessie64

$ vagrant box add https://atlas.hashicorp.com/minimal/boxes/xenial64
```
```sh
$ vagrant box list
minimal/centos7  (virtualbox, 7.0)
minimal/jessie64 (virtualbox, 8.0)
minimal/xenial64 (virtualbox, 16.04.1)
```

## Get the workshop from Github

### GNU/Linux, OS X & Windows:

#### Using GIT:
```sh
$ git clone https://github.com/brainupdaters/drlm_workshop
$ cd drlm_workshop
```
#### Download ZIP file from github (https://github.com/brainupdaters/drlm_workshop/archive/master.zip)
1. Uncompress.
2. Go to drlm_workshop folder.

Now, we have all the requirements to prepare the workshop environment.

## Start the environment

This takes about 10 minutes ...

### GNU/Linux, OS X & Windows:

```sh
$ vagrant up
```

## Suspend the environment

### GNU/Linux, OS X & Windows:

```sh
$ vagrant suspend
```

## Resume the environment

### GNU/Linux, OS X & Windows:

```sh
$ vagrant resume
```

## Destroy the environment

### GNU/Linux, OS X & Windows:

```sh
$ vagrant destroy -f
```
Previous command will keep downloaded boxes in your hard drive, 
just the VM's deployed with ```vagrant up``` will be destroyed.
If you do not need those boxes anymore, you can remove them:

```sh
$ vagrant box remove minimal/centos7
Removing box 'minimal/centos7' (v7.0) with provider 'virtualbox'...

$ vagrant box remove minimal/jessie64
Removing box 'minimal/jessie64' (v8.0) with provider 'virtualbox'...

$ vagrant box remove minimal/xenial64
Removing box 'minimal/xenial64' (v16.04.1) with provider 'virtualbox'...
```
As well, to clean up Virtualbox networks added for the workshop, do this:

### GNU/Linux & OS X:

```sh
$ VBoxManage hostonlyif remove vboxnet1
```

### Windows:

```sh
C:\Program files\Oracle\VirtualBox\VBoxManage hostonlyif remove "Virtualbox Host-Only Ethernet Adapter"
```

##### NOTE:
```sh
If the network environment in your VBox installation is different, 
please remove added networks accordingly.
```

## Release History

* 1.0.1
    * CHANGE: Changes to make this a standard DRLM workshop to everyone interested in testing/learning ReaR & DRLM.
* 1.0.0
    * The first proper release
    * CHANGE: Ready for the workshop at Cyberweek'17
* 0.0.1
    * Work in progress

## Author

Didac Oliveira – [@didacog](https://twitter.com/didacog) – didac@brainupdaters.net

Distributed under the GPLv3 license. See ``LICENSE`` for more information.

[https://github.com/didacog](https://github.com/didacog/)

[https://www.linkedin.com/in/didacoliveiragarcia](https://www.linkedin.com/in/didacoliveiragarcia)
