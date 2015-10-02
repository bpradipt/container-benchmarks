#!/bin/bash
#Prepare container for running the benchmarks

#Create base image for container
RELEASE='trusty'
apt-get install -y debootstrap
rm -fr /${RELEASE}
debootstrap --components=main,universe ${RELEASE} /${RELEASE}

#Add update repo
echo "deb http://ports.ubuntu.com/ubuntu-ports ${RELEASE}-updates main" >> /${RELEASE}/etc/apt/sources.list

#Update the image with latest fixes

#Do the mounting for entering chroot
mount -o bind /dev /${RELEASE}/dev/
mount -t sysfs none /${RELEASE}/sys/
mount -t proc none /${RELEASE}/proc/
mount -t devpts none /${RELEASE}/dev/pts/
#Change to chroot environment
chroot /${RELEASE} apt-get update && apt-get upgrade -y  && apt-get autoremove -y

#Unmount the files after exiting the chroot
#exit
umount /${RELEASE}/dev/pts/
umount /${RELEASE}/dev/
umount /${RELEASE}/sys/
umount /${RELEASE}/proc/


tar -C /${RELEASE} -c . | sudo docker import - benchmark/ubuntu:latest

docker build -t benchmark/execution --rm=true .
