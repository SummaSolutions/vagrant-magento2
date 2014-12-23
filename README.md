Magento 2 Vagrant Setup
=================

This is a set of scripts to setup a development environment using Vagrant for Magento 2.

It uses Debian 7(wheezy) and this is the stack installed:
* Apache 2.2.22
* Percona MySQL 5.6.21
* Php 5.5.20
* Xdebug

If you want to see to official Magento 2 installation guide click [here] (http://devdocs.magento.com/guides/v1.0/install-gde/bk-install-guide.html)

If you have any comment or suggestion you can contact me [here] (mailto:fcapua@summasolutions.net)

## Prerequisites
* Vagrant: Latest available version on the [website] (https://www.vagrantup.com/downloads.html)
* VirtualBox: Latest available version on the [website] (https://www.virtualbox.org/wiki/Downloads) 

## Usage
1. Clone repository:
    ```bash
    git clone [REPOSITORY_URL] vagrant-magento2
    ```

2. Rename Vagrantfile.local.sample
    ```bash
    cd vagrant-magento2
    cp Vagrantfile.local.sample Vagrantfile.local
    ```
    
    Here you can change some of the virtual machine configurations, such as vm name/ip/cpus/ram.
    
    If you want the sample data to been installed as well you should uncomment line 12 of your <strong>Vagrantfile.local</strong>
    ```ruby
    config.vm.provision :shell, :path => "bin/tool/sample-data-install.sh", :privileged => false
    ```

3. Init vagrant environment
    ```bash
    vagrant up
    ```

4. Add the following line to your hosts file in the host machine
    ```
    33.33.33.30 	magento2.localhost
    ```
    <small><i>Assuming you didn't modify VM ip in the Vagrantfile.local</i><small>
    
## Credentials

* Admin
    * URL: http://magento2.localhost/admin
    * Username: admin
    * Password: Magento2
 
* Mysql
    * User: root
    * No password needed

