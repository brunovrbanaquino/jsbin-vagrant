In the host machine, update the hosts file with `127.0.0.1		jsbin.nix`.

After installing Vagrant, run `vagrant box add hashicorp/precise32`.

Clone the project and move inside the directory.

`vagrant up` to start the machine.

`vagrant halt` to shut down the machine.

`vagrant ssh` to connect to the machine.

`vagrant reload` required for changes made in the Vagrantfile to take effect.

`vagrant destroy` to erase the machine.