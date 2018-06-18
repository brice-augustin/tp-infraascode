#!/bin/bash

vm="fw lb www1 www2 mysql log"

# loop trough all config files
for b in $vm
do
  # clean dir
  if [ -d output-virtualbox-ovf ]
  then
    rm -rf output-virtualbox-ovf
  fi

  # build the vm
  packer build $b/$b.json

  if [ $? -ne 0 ]
  then
    echo "Packer build error. Remove current VMs, fix issue and rebuild."
    exit
  fi
done

for b in $vm
do
  VBoxManage startvm "$b"
done
