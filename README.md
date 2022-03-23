# proxmox-auto-snapshot

Simple automatic snapshots for Proxmox

This is a very simple but useful script I did for Proxmox snapshot automation.

If you want something more sofisticated take a look at below projetcs:

https://github.com/kvaps/pve-autosnap

https://github.com/Corsinvest/cv4pve-autosnap

# How to Run

Just download/copy the script to your Proxmox Box, chmod +x it and configure cron to run it within the period you want to take the snapshots, like 6/6 hours and so on.

Inside the script you can configure the maximum number of snapshots the script will keep and delete the older ones.
