Vagrant
=======

subtitle
: Development Environments Made Easy

author
: Colin Dean

institution
: IBM

theme
: nari

allotted-time
: 1800

Introduction
============

![Colin Dean - @colindean](me.jpg){:relative_height='35' align='left' reflect_ratio='0.1' }

* Software Engineer @ IBM (formerly Vivisimo)

* Advisor @ YourTalentAgents

Obligatory statement
====================

> All opinions are my own and not that of my employer(s).

Credentials
===========

Using **Vagrant** since 1.0

(now 1.6.5)

when it was just a **Ruby** gem

(now a full program)

Agenda
======

* Introduction
* What is Vagrant?
* Installation
* Basic configuration
* Advanced usage

What is Vagrant?
================

![](vagrant_logo.png){:relative_width='90' reflect_ratio='0.5'}

Vagrant makes development environments easy.

What does Vagrant do?
=====================

Creates and configures *lightweight*, *reproducible*, and *portable* development environments.

The value of Vagrant
====================

    vagrant up
{: lang="shell"}

A wild development environment appears!
=========================================

    Bringing machine 'default' up with 'virtualbox' provider...
    ==> default: Importing base box 'precise64'...
    ==> default: Setting the name of the VM: lanager_default_1400390353743_74044
    ==> default: Preparing network interfaces based on configuration...
    ==> default: Forwarding ports...
    ==> default: Booting VM...
    ==> default: Waiting for machine to boot. This may take a few minutes...
    ==> default: Machine booted and ready!

That's it.
==========
* No more "works on my machine"
* No more rebuilding a shared dev server
* Everyone gets their own versioned dev environment


Under the hood
==============

* Ruby
* Choice of virtualization
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
{: lang="ruby"}

Breakdown
=========

* Declarative configuration

Declaration
===========

    Vagrant.configure("2") do |config|
    end
{: lang="ruby"}

Guest nature
============

    config.vm.guest = :linux
{: lang="ruby"}

1.6+ supports `:windows`, too.

Box identity
============

    config.vm.box = "precise64"
    config.vm.box_url = "http://files.vagrantup.com/precise64.box"
{: lang="ruby"}

Caching
=======

Boxes are

* cached
* copied on use

Network settings
================

    config.vm.network :forwarded_port, guest: 80, host: 8080
    config.vm.network :forwarded_port, guest: 3306, host: 3307

    # Default for :linux
    config.vm.network :forwarded_port, guest: 22, host: 2222
{: lang="ruby"}

Provisioning
===========================

    config.vm.provision :shell, :inline => $script
{: lang="ruby"}

More later...

Any Ruby is valid in config
===========================

    $script = <<SCRIPT
      if [ ! -f "$HOME/.provisioned" ]; then
        # Bind MySQL to all of the box's NICs to enable external access
        sed -i 's/bind-address/;bind-address/g' /etc/mysql/my.cnf
        sudo service mysql restart
      fi
    SCRIPT
{: lang="ruby"}

Advanced Usage
==============

* Multi-VM
* Provisioning with configuration management systems (Chef, Puppet, etc.)
* Plugins
* Real world usage

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
{: lang="ruby"}

Provisioning
============

Base installation -> Everything

# Shell scripts, inline or in a file

    config.vm.provision :shell, :inline => $script
{: lang="ruby"}

# Config Management with Chef or Puppet

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
{: lang="ruby"}

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

*aws* azure *digitalocean* joyent
kvm *libvirt* lxc *openstack* parallels
*rackspace* softlayer *vsphere*

Usage in the real world
==========================

* [Lanager](https://github.com/zeropingheroes/lanager)
* [Gittip](https://github.com/gittip/www.gittip.com)

Resources
=========

* [Vagrant docs](https://docs.vagrantup.com/v2)

This talk is open source
===========================

https://github.com/colindean/talks


Go try it out
=============

vagrantup.com

Thanks
======

[@colindean](http://twitter.com/colindean)

IBM Watson is hiring!

http://j.mp/watson-pgh-jobs
