[![Build Status](https://travis-ci.org/express42-cookbooks/testo.svg?branch=master)](https://travis-ci.org/express42-cookbooks/testo)

# Overview

To get a perfect pie every Chef should take a good testo (pastry in russian). Also this repository is a good start to test(o) a new Infrastructure as Code approach.

We use chef with berkshelf, vagrant and packer to develop infrastructure. The purpose of this repository is to show how to use this tools all together on an example project.

# Repository Directories

This repository contains several directories, and each directory contains a README file that describes what it is for in greater detail, and how to use it for managing your systems with Chef.

* `config/` - Contains the Knife configuration file, `knife.rb`.
* `cookbooks/` - Contains cookbooks that have been downloaded from remote repositories or created locally.
* `data_bags/` - Stores data bags (and data bag items) in JSON (.json).
* `environments/` - Stores environment in JSON (.json).
* `packer/` - Stores packer templates.
* `roles/` - Stores roles in JSON (.json).
* `Vagrantfile` - Contains the Vagrant configuration.
* `Berksfile` - Contains a list of sources identifying what cokbooks to retrieve and where to get them.
* `Berksfile.lock` - Contains the versions of all cookbook dependencies.

# Getting Started

Get the [latest release of Chef Development Kit][ChefDK]

Clone the repo from GitHub:
```
$ git clone git@github.com:express42-cookbooks/testo.git
```

Configure Knife:

```
$ knife configure
WARNING: No knife configuration file found
Where should I put the config file? [~/.chef/knife.rb]
Please enter the chef server URL: [http://chef-server-api:443]
Please enter an existing username or clientname for the API: [username]
Please enter the validation clientname: [chef-validator]
Please enter the location of the validation key: [~/.chef/chef-validator.pem]
Please enter the path to a chef repository (or leave blank):
```

Test knife configuration:
```
$ knife status
```

Install the cookbooks you specified in the Berksfile and their dependencies:
```
$ berks install
$ berks vendor
```

# Knife
knife is a command-line tool that provides an interface between a local chef-repo and the Chef server. Knife helps users to manage:

* Nodes
* Cookbooks and recipes
* Roles
* Stores of JSON data (data bags), including encrypted data
* Environments
* The installation of the chef-client on management workstations
* Searching of indexed data on the Chef server

## Working with Knife
```
$ knife status
$ knife node list
$ knife cookbook upload COOKBOOK
$ knife cookbook download COOKBOOK
$ knife node edit NODE
$ knife node run_list add [NODE] [ENTRY[,ENTRY]]
$ knife ssh 'name:*' 'uptime'
$ knife ssh 'name:*' 'sudo service nginx reload'
```

# Vagrant

Get the [latest release of Vagrant][Vagrant]

Install the Vagrant berkshelf plugin:
```
$ vagrant plugin install vagrant-berkshelf
```

Up and running:
```
$ vagrant up
$ vagrant provision
$ vagrant ssh
$ vagrant reload
$ vagrant destroy
```

# Test Kitchen

First install the [latest release of Vagrant][Vagrant].
```
$ kitchen list
$ kitchen converge base-ubuntu-1404
$ kitchen login base-ubuntu-1404
$ kitchen destroy base-ubuntu-1404
```

# Next Steps

Read the README file in each of the subdirectories for more information about what goes in those directories.

[ChefDK]: https://www.getchef.com/downloads/chef-dk "Chef Development Kit"
[Vagrant]: https://www.vagrantup.com/downloads "Vagrant"
