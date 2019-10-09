# This project is to display and explain how to run vagrant and utilise bash scripts to automate the process to make it much faster

## Step by Step to set up Vagrant:

- need to install: vagrant and oracle virtual box
- disable HyperV if it's enabled
- troubleshooting, if necessary, involves going into windows bios and disabling and re-enabling virtualization
- Initiate a git repository/directory with .gitignore, readme
- .gitignore should contain: .vagrant/, star.log
- in bash window, execute:

        vagrant init ubuntu/xenial64

- which initiates the vagrant and uses the OS ubuntu
- you can go into the vagrant file and edit it (remove comments maybe)
- you are now ready to vagrant up, so execute:

        vagrant up

- you now need to install nginx
- execute:

        vagrant ssh

- now you must run, inside the ssh:

        sudo apt-get update -y
        sudo apt install nginx

- the "-y" is there to say yes to the prompts, say yes to any when prompted!
- now, to leave the ssh execute:

        logout

- we can now edit our vagrant file by entering, below the config.vm.box = "ubuntu/xenial64" line:

        config.vm.network "private network", ip: "192.168.10.100"

- now, reload vagrant to update what we've changed:

        reload vagrant

- this sets up a private local network at ip address 192.168.10.100
- you can test if this has worked by visiting 192.168.10.100 on your browser
- next, we need to install the hostsupdater plugin, so we can alias our local ip address with a name of our choice.

- make sure you're outside of the vagrant ssh command line, and execute:

        vagrant plugin install vagrant-hostsupdater        

- in our vagrant file, below the config.vm.network line we just created, we can add:

        config.hostsupdater.aliases = ["your_name"]

- now, reload vagrant to update what we've changed:

        reload vagrant

- you can call it whatever you want in the "your_name" part!

- you can also check it worked by putting: your_name/ into your browser

## Step by step to automate set-up of vagrant, using provisioning

- we can customise our vagrant file so that we can sync a folder. In your main directory make a directory called "app":

        mkdir app

- as an example, make an example.txt file to sync:

        touch example.txt

- now we customise our vagrant file once again, below the previous alterations, with:

        config.vm.synced_folder "app", "app/"

- now, we have synced our folder, so changes can be made in the remote ssh to that folder! See for yourself by:

        reload vagrant
        vagrant ssh

- cd to app directory:
        cd ..
        cd ..
        cd app
        echo "hello" > example.txt

- see the changes it makes in real time in atom!

- now we can use a shell file to automate the initiation of the processes we need to set up vagrant

- in your main directory, , i.e. alongside the app directory, make a new directory (called "environment")

        mkdir environment

- cd into that directory and make a shell file called provision:

        touch provision.sh

- we can put the commands in this file to run the set up files in bash for us when we vagrant up

- at the top of provision.sh file, write:

        #!/bin/bash

- this makes it a bash script

- then we can start adding the codes we'd like to be executed for us:

        sudo apt-get update -y

- to get vagrant to run this for us, we have to put a part in our vagrant file, below our previous alterations:

        config.vm.provision "shell", path: "environment/provision.sh"

- this will run the first bit of set up code, for getting the update that we need

- we can extend our provision.sh file further to execute the code required to install nginx too:

        sudo apt install nginx

- why not install node.js too!

        curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
        sudo apt-get install -y nodejs
