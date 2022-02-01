# What is DevOps

## Why DevOps?

### Benefits of DevOps

**Four pillars of DevOps best practice**

- Ease of Use
- Flexibility
- Robustness - faster delivery of product
- Cost - cost effective (by automating the process, creating CI/CD pipelines)

### Monolith - 2 tier & Microservices Architectures

## Virtualisation with Vagrant

![virtualisation-with-vagrant-diagram](./public/assets/img/virtualisation-with-vagrant-diagram.png)

## Installing dependencies and creating first VM (Windows)

### Step 1 - Install Ruby

- Go to this link and download **Ruby** `https://github.com/oneclick/rubyinstaller2/releases/download/RubyInstaller-2.6.6-1/rubyinstaller-devkit-2.6.6-1-x64.exe`

- To check if Ruby is installed correctly, run `ruby --version` in your terminal. If it returns a version it means that Ruby is correctly installed on your machine.

### Step 2 - Install Vagrant

- Install Vagrant by clicking on [this link](https://www.vagrantup.com).
- Check vagrant version by typing `vagrant --version` in your terminal.
- To view a list of commands, type in `vagrant` in your terminal.

### Step 3 - Install Virtualbox

- Install Virtualbox by clicking on [this link](https://www.virtualbox.org/wiki/Downloads) and, from **"VirtualBox 6.1.32 platform packages"** choose `Windows hosts`.
- Install everything that you are being asked to.
- Navigate to `C:\Program Files\Oracle\VirtualBox\drivers\vboxdrv`
- Right click on the VBoxDrv.inf Setup Information file and and select Install
- When it's finished installing, open up a new terminal window and run `sc start vboxdrv`
- Press the Windows Key and search for Control Panel, go from there to Network and Internet, then Network and Sharing Centre, then Change Adapter Settings.
- Right click on VirtualBox Host-Only Network and choose Properties
- Click on Install => Service
- Under Manufacturer choose Oracle Corporation and under Network Service, choose VirtualBox NDIS6 Bridged Networking driver

### Step 4 - add the vagrant file

- This file `needs` to be in the folder that you're running the VM from
- Use `nano vagrantfile` and add this block of code:

```
Vagrant.configure("2") do |config|

 config.vm.box = "ubuntu/xenial64"
# creating a virtual machine ubuntu




end
```

### Run your VM

- To run the VM, `cd` into your parent folder (the one that holds the `Vagrant` file) and run `vagrant up`
- To check the status use `vagrant status`
- To go into your VM do `vagrant ssh`

You should now be in you (in this case) Linux Virtual Machine

### Update and install packages in VM

For Linux Ubuntu Distro, you can use several commands to update and install packages or check the status of different processes

- `sudo apt-get update` downloads and installs available updates
- `sudo apt-get upgrade` upgrades all packages that have available upgrades
- `sudo apt-get install <package-name>` installs the specified package
- `systemctl status <app-name>` returns the status for the specified app
- `exit` will exit the Virtual Machine
- use `-y` when installing or upgrading/updating packages to automatically confirm everything

### Useful commands

- `vagrant up` creates a VM
- `vagrant status` displays the status of the machine
- `vagrant destroy` deletes the VM
- `vagrant halt` pauses the VM
- `vagrant reload` updates the VM (for example when you update the vagrant file)
- `vagrant ssh` enter the VM

### Linux Basics

- `uname` finds out the name of the machine. Add `-a` flag to add extra info with the name.
- `pwd` displays the path to current folder.
- `ls` lists directories/files. Add the `-al` flag to format the nicely when displayed and displays the hidden folder/files.
- `mkdir <directory-name>` make directory.
- `cd <name of directory>` changes the directory. If you don't specify the name of the folder, it will return you to the root folder.
- `touch <file-name>` creates a file.
- `nano <file-name>` creates a text file using nano.
- `cat <file-name>` displays the content of the file.
- `rm -rf <file-name>` removes the specified filename.
- `cp <file-destination-name> <final-destination>` copies the specified file to the specified destination.
- `mv <file-name(with path if necessary)> <destination-filepath>` moves a certain file to a specified folder.
- `top` check running processes

### Bash scripting

- READ Write Executable read-only.
- To check permissions `ll`.
- `chmod <permission> <file-name>` to change permission.
- When you make a file executable, it is good practice to make it read-only.

### Automate updates, upgrades and install of nginx

- create `provision.sh` file
- add this block of code inside `provision.sh`:

  ```
  #!/bin/bash

  # run updates
  sudo apt-get update -y

  # run upgrades
  sudo apt-get upgrade -y

  # install nginx
  sudo apt-get install nginx -y
  ```

  This will ask Linux to install the updates, upgrade the files and install nginx.

- Make `provision.sh` executable by typing `chmod +x provision.sh`. This gives the file `executable permission`
- run `provision.sh` file by typing in the terminal `sudo provision.sh`

### Add provision file file and

- create a folder called `src` in the same location that the `vagrant` file is in.
- add a `provision.sh` file inside the `src` folder.
- add the next code snippet inside the `provision.sh` file to update, upgrade and install nginx:

  ```
  #!/bin/bash

  # run updates
  sudo apt-get update -y

  # run upgrades
  sudo apt-get upgrade -y

  # install nginx
  sudo apt-get install nginx -y
  ```

- add the next block of code in your `vagrantfile` file.

  ```
  # sync folder       , localhost path, path for vm
  config.vm.synced_folder ".", "/home/vagrant/code"

  # sync and run provision file
  config.vm.provision "shell", path: "./src/provision.sh"
  ```

- to update VM with the provisioned commands, stop the VM and restart it with `vagrant up --provision`. When you create a new vm with a `provision script`, you do not need the `--provision` flag.
