#! /bin/bash

#checking if ~/src already exists and if not create it.
if [[ -d ~/src ]] 
then
	echo "Src folder already exist."
else 
	sudo mkdir ~/src 	
fi

#going to the src folder and checking if utilisateur has already been clone there and if not, clone it.
cd ~/src 
if [[ -d ~/src/utilisateur ]]
then
	echo "utilisateur repository already clone to src folder."
else 
	sudo git clone https://github.com/henna19/utilisateur.git
fi

cd ~/bin
sudo cp ~/src/utilisateur/bin/check.sh ~/bin/check.sh
sudo chmod +x check.sh #give executable rights


sudo cp ~/src/utilisateur/bin/check.service /etc/systemd/system/check.service
sudo chmod 644 /etc/systemd/system/check.service

sudo sudo systemctl start check.service
 
sudo sudo systemctl enable check.service

echo -e " \e[5mInstallation Completed \e[25m!"
