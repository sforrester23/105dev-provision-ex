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

- the "-y" is there to say yes to the prompts
- now, to leave the ssh execute:

        logout

- we can now edit our vagrant file by entering, below the config.vm.box = "ubuntu/xenial64" line:

        config.vm.network "private network", ip: "192.168.10.100"

- this sets up a private local network at ip address 192.168.10.100
- you can test if this has worked by visiting 192.168.10.100 on your browser
- next, we need to install the hostsupdater plugin, so we can alias our local ip address with a name of our choice.

- make sure you're outside of the vagrant ssh command line, and execute:

        vagrant plugin install vagrant-hostsupdater        

- in our vagrant file, below the config.vm.network line we just created, we can add:

        config.hostsupdater.aliases = ["your_name"]

- you can call it whatever you want in the "your_name" part!
