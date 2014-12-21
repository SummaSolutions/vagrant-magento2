Magento 2 Vagrant Setup
=================

This is a set of scripts to setup a development environment for Magento 2

## Usage:
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

3. Init vagrant environment
    ```bash
    vagrant up
    ```

4. Add the following line to your hosts file in your machine
    ```
    33.33.33.30 	magento2.localhost
    ```
    <i><u>Note:</u> Assuming you didn't modify VM ip in the Vagrantfile.local</i>