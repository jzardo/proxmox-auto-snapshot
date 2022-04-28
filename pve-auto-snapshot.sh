#!/bin/bash

### Very Simple Auto Snapshot for Proxmox
### Version 0.1 23/03/2022

maxsnapshots=8

# Create VM ID's list to loop

qm list | grep -v "VMID" | cut -f 8 -d " " > /tmp/lista-vms.txt

# Main loop for create new and delete old snapshots

while read lista; do

   vmid=$(echo $lista | awk -F\; '{print $1}')

   # Snapshot Creation

   nome="auto-snap-$vmid"-`date +"%Y%m%d%H%M%S"`
   qm snapshot $vmid $nome
   echo "Criando Snapshot Snapshot $nome" >> /var/log/proxmox-auto-snapshots.log

   # Old Snapshots Deletion

   qtdesnapshots=`qm listsnapshot $vmid | grep "no-desc" -c`

   if [ "$qtdesnapshots" -gt "$maxsnapshots" ]; then
      del=`qm listsnapshot $vmid | head -1 | cut -f 2 -d " "`
      qm delsnapshot $vmid $del
      echo "Execluindo Snapshot $del" >> /var/log/proxmox-auto-snapshots.log
   else
      echo "There aren't old snapshots to delete"
   fi

done < /tmp/lista-vms.txt

rm -fr /tmp/lista-vms.txt
