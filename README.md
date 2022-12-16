# Proxmox Auto Snapshot

Simple automatic snapshots for Proxmox.

This is a very simple but useful script I did for Proxmox snapshot automation. Hope it can help someone as it already did many times for me and my customers.

If you want something more sofisticated take a look at below projetcs:
```
https://github.com/kvaps/pve-autosnap
https://github.com/Corsinvest/cv4pve-autosnap
```

# How to Install & Run

1. Just download/copy the script to your Proxmox box, chmod +x it (replace "my-scripts-dir" with your path for scripts):
```
cd /my-scripts-dir
wget https://raw.githubusercontent.com/jzardo/proxmox-auto-snapshot/main/pve-auto-snapshot.sh
chmod +x pve-auto-snapshot.sh
```
2. Add followig line to /etc/crontab to run it within the period you want to take the snapshots, like 6x6 hours and restart crond service.
```
echo "08 */6  * * *   root   /my-scripts-dir/pve-auto-snapshot.sh">> /etc/crontab 
service crond restart
```
Inside the script you can configure the maximum number of snapshots the script will keep. The older ones will be deleted.
```
maxsnapshots=8
```
In this example will we have 8 snapshots taken each 6 hours so we will have 48 hours of snapshots. Adjust this with your scenario. 

And remember: Some storage types do not allow for snapshots to be taken. Refer to this URL for more informaton:
```
https://pve.proxmox.com/wiki/Storage
```
