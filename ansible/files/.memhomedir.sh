#!/bin/sh -e

mkdir /dev/shm/upper
mkdir /dev/shm/work
sudo mount -t overlay -o lowerdir=/home/developer,upperdir=/dev/shm/upper,workdir=/dev/shm/work overlay /home/developer
