# Add Docker's official GPG key:
if (UID = 0) then {
	sudo apt-get update
	sudo apt-get install ca-certificates curl
	sudo install -m 0755 -d /etc/apt/keyrings
	sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
	sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
	echo \
	"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
	$(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
	sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
	sudo apt-get update

	sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Testing docker
	sudo docker run hello-world

# Post-install configuration
	sudo groupadd docker
	sudo usermod -aG docker ubuntu

# Reboot to finish setup
	echo "Rebooting!"
	sleep 5
	sudo reboot
} else {
	echo "This script needs to be run as root!"
}
fi
 
