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

# Function for date selection
choose_date() {
    echo "Would you like a specific date in the past? (y/n)"
    read -r date_choice
    if [[ "$date_choice" == "y" || "$date_choice" == "Y" ]]; then
        read -p "Enter the date (DD-MM-YYYY): " date_input
        if [[ "$date_input" =~ ^[0-3][0-9]-[0-1][0-9]-[0-9]{4}$ ]]; then
            echo "You chose the date: $date_input"
        else
            echo "Invalid date format. Please use DD-MM-YYYY."
            exit 1
        fi
    else
        date_input="latest"
        echo "Using the 'latest' backup"
    fi
}

# Check if Docker is installed
if command_exists docker; then
    echo "Docker is already installed. Proceeding with the rest of the script..."
else
    install_docker
    exit 0
fi

# Main logic for server selection
echo "Which server do you want to run?"
echo "[C] Creative or [S] Survival"
read -r choice

if [[ "$choice" == "c" || "$choice" == "C" ]]; then
    choose_date
    echo "Running the Creative Docker container..."
    docker rm -f cmc 2>/dev/null || true  # Remove existing container if any
    docker run -d --restart=always -p 19130:19130/udp --name cmc aljaf/cmc:$date_input sh -c './start.sh' 
    echo "Server has now been installed"
    echo "To access the server, use:"
    echo "  docker exec -it cmc bash"
    echo "Enable port forwarding on your router:"
    echo "  Forward port 19130 (UDP) to your server's local IP address."
    echo "Your public IP address is:"
    curl -s ipinfo.io/ip
    printf "\n"

elif [[ "$choice" == "s" || "$choice" == "S" ]]; then
    choose_date
    echo "Running the Survival Docker container..."
    docker rm -f mc 2>/dev/null || true  # Remove existing container if any
    docker run -d --restart=always -p 19132:19132/udp --name mc aljaf/mc:$date_input sh -c './start.sh'
    echo "Server has now been installed"
    echo "To access the server, use:"
    echo "  docker exec -it mc bash"
    echo "Enable port forwarding on your router:"
    echo "  Forward port 19132 (UDP) to your server's local IP address."
    echo "Your public IP address is:"
    curl -s ipinfo.io/ip
    printf "\n"

else
    echo "Invalid choice. Please enter 'C' for Creative or 'S' for Survival."
fi
