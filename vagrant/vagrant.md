Vagrant
=======

Agenda
======

* Introduction
* What is Vagrant?
* Installation
* Basic configuration
* Advanced configuration
* Provisioning with configuration management systems (Chef, Puppet, etc.)
* Plugins
* Real world usage

Introduction
============

Colin Dean

@colindean

Software Engineer @ IBM (formerly Vivísimo)

Advisor @ YourTalentAgents

Credentials
===========

Using Vagrant since 1.0

(now 1.6.5)

when it was just a Ruby gem

(now a full program)

What is Vagrant?
================

Vagrant makes development environments easy.

> Create and configure lightweight, reproducible, and portable development environments.

The value of Vagrant
====================

    vagrant up

A wild development environment appears!
    
That's it.
==========
* No more "works on my machine"
* No more rebuilding a shared dev server
* Everyone gets their own dev environment


Under the hood
==============

* Ruby
* Your choice of virtualization system
  * Virtualbox
  * VMware, if you pay
  * Many others via plugins
    
Installing Vagrant
==================

* [vagrantup.com](http://vagrantup.com)
* Native packages
* Don't install via Rubygems

Vagrantfile is Ruby
=====================

    Vagrant.configure("2") do |config|
      config.vm.guest = :linux
      config.vm.box = "precise64"
      config.vm.box_url = "http://files.vagrantup.com/precise64.box"
      config.vm.network :forwarded_port, guest: 80, host: 8080
      config.vm.network :forwarded_port, guest: 3306, host: 3307
      config.vm.provision :shell, :inline => $script
    end

Multiple machines, too!
=======================

    Vagrant.configure("2") do |config|
      config.vm.define "web" do |web|
        web.vm.box = "apache"
      end
      config.vm.define "db" do |db|
        db.vm.box = "mysql"
      end
    end
    
Provisioning
============

### Shell scripts, inline or in a file

	config.vm.provision :shell, :inline => $script
	
### Config Management with Chef or Puppet

	config.vm.provision "chef_solo" do |chef|
      chef.add_recipe "iptables"
      chef.json = {
        "iptables-ng"=> {
          "rules"=> {
            "filter"=> {
              "INPUT"=> {
                "default"=> "ACCEPT [0:0]",
                "established" => {
                  "rule" => "--match state --state ESTABLISHED,RELATED --jump ACCEPT"
                }}}}}}
	end
	
Plugins
=======

General helpers:

* vagrant-cachier
* vagrant-pristine
* vagrant-vbguest
* vagrant-rdp

Plugins
=======

Useful for Chef provisioning:

* vagrant-omnibus
* vagrant-berkshelf
* vagrant-ohai

Providers
=========

Run Vagrant VMs anywhere!

aws azure digitalocean joyent
kvm libvirt lxc openstack parallels
rackspace softlayer vsphere

Usage in the real world
=======================

Resources
=========

* [Vagrant docs](https://docs.vagrantup.com/v2)

