
# OpenNebula

## TODO

* HA Front instalation
* External database configuration
* SSH inter-node communication

## Description

Configures OpenNebula cluster using libvirt/kvm nested virtualization in Vagrant. Vagrant starts 3 nodes.
Ryba is then used to deploy and configure 1 frontend and 2 workers.

## Before you start

Nested virtualization allows you to run a virtual machine (VM) inside another VM while still using hardware acceleration from the host. 
Make sure that nested virtualization is enabled on the host, to do so :

```bash
cat /sys/module/kvm_intel/parameters/nested
```

If the result is `Y`, you're good to go, if its not you should enable it by setting `kvm-intel.nested=1` on your kernel.

### Archlinux / Fedora 25

```bash
sudo tee -a /etc/modprobe.d/kvm-nested.conf << CONFIG
# create new
options kvm_intel nested=1
CONFIG
sudo modprobe -r kvm_intel # disable module
sudo modprobe kvm_intel # reload module
cat /sys/module/kvm_intel/parameters/nested # Sould be Y
```

You should also add yourself to the `libvirt` group if you do not want to enter your password each time you do something with Vagrant.

```bash
sudo gpasswd -a ${USER} libvirt
newgrp libvirt
```

## Quickstart

```bash
git clone https://github.com/ryba-io/ryba-env-nebula
cd ryba-env-nebula
npm install
./bin/vagrant up
./bin/ryba install
```
