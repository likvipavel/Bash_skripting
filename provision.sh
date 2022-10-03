#!/bin/bash
#Script for installing and configuring NFS server on the 1 VM with parameter “server”, and  automatically installing and dynamically configuring client on the 2 VM with parameter “client”
if [ -n "$1" ] && [ $1 == "server" ]; then    #check for parameter existence
	read -p "Enter client IP-address:" IPClient
#Section_1: nfs-utils installation check
	if [[ -z $(sudo systemctl list-units | grep nfs) ]]; then
		sudo yum install -y nfs-utils
	fi
#Section_2: add a share folder
	if [ ! -d "/var/nfsshare" ]; then
		sudo mkdir /var/nfsshare
        	sudo chmod -R 755 /var/nfsshare
	       	sudo chown nfsnobody:nfsnobody /var/nfsshare
	fi
#Section_3: start the services and enable them to be started at boot time 
	sudo systemctl enable rpcbind 
	sudo systemctl enable nfs-server
	sudo systemctl enable nfs-lock
	sudo systemctl enable nfs-idmap
	sudo systemctl start rpcbind
	sudo systemctl start nfs-server
	sudo systemctl start nfs-lock
	sudo systemctl start nfs-idmap
#Section_4: share the NFS directory over the network
	echo  "/var/nfsshare	${IPClient}(rw,sync,no_root_squash,no_all_squash)" | sudo tee -a /etc/exports
	sudo systemctl restart nfs-server    #start the NFS service
#Section_5: add the NFS service override in CentOS 7 firewall-cmd public zone service 
	sudo firewall-cmd --permanent --zone=public --add-service=nfs 
	sudo firewall-cmd --permanent --zone=public --add-service=mountd
	sudo firewall-cmd --permanent --zone=public --add-service=rpc-bind 
	sudo firewall-cmd --reload
	echo Done
#Section_6: install and dynamically configure client 
elif [ -n "$1" ] && [ $1 == "client" ]; then      #check for parameter existence
	read -p "Enter server IP-address:" IPServer
	read -p "Enter client IP-address:" IPClient
	read -p "Enter client username:" ClientName
ssh $ClientName@$IPClient	'if  [[ -z $(sudo systemctl list-unit-files | grep nfs-utils) ]]; then 
       					sudo yum install -y nfs-utils;
				fi; 
			  	sudo mkdir -p /mnt/nfs/var/nfsshare;
				sudo mount -t nfs '${IPServer}':/var/nfsshare /mnt/nfs/var/nfsshare/;
				echo  "'${IPServer}':/var/nfsshare /mnt/nfs/var/nfsshare nfs defaults 0 0" | sudo tee -a /etc/fstab'   #remote installation of required components on client 
echo Done
else
	echo -e "Enter \"server\" or \"client\" parameter"    #if parameter not don't existence
fi
