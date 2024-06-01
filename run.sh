#!/bin/bash

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to install Docker
install_docker() {
    echo "Docker is not installed. Installing Docker..."
    curl -fsSL https://get.docker.com | sh
    sudo usermod -aG docker "$USER"
    echo "Docker installation complete. Please reboot your system."
    echo "Do you want to reboot now? (y/n)"
    read -r response
    if [[ "$response" == "y" || "$response" == "Y" ]]; then
        sudo reboot
    else
        echo "Please reboot your system manually and rerun this script."
        exit 0
    fi
}

# Main script logic
if command_exists docker; then
    echo "Docker is already installed. Proceeding with the rest of the script..."
else
    install_docker
    exit 0
fi

# After ensuring Docker is installed, run the Docker command
echo "Running the Docker container..."
docker run -d --restart=always -p 19132:19132/udp --name mc aljaf/mc:$(date +%d-%m-%Y) sh -c './start.sh'
clear
echo "Server has now been installed"
echo "To Access the Server please use:"
echo "docker exec -it mc bash"
echo "You will now need to enable port forwarding on your router"
echo "Enable port forwarding for 19132 UDP"
echo "Then share your public ip address:"
curl ipinfo.io/ip
echo
