# MCJAF Public Minecraft Server

Welcome to the MCJAF Public Minecraft Server! This repository provides a convenient script to set up and run our Minecraft server using Docker. Follow the instructions below to get started, whether you're using Windows or Linux.

## Prerequisites

- **Linux**: Ensure you have a terminal with `curl` installed.
- **Windows**: You need Windows Subsystem for Linux (WSL) to run the script. Follow the instructions below to set it up.
- **Experts**: Install docker and find the image on [here](https://hub.docker.com/u/aljaf)  (Creative uses port 19130 and everthing else is default) 
---

## Experts

After you installed docker and found the image. use this as an example
```bash
docker run -d --restart=always -p 19130:19130/udp -name cmc aljaf/cmc sh -c './start.sh'
```
for terraria you do 7777/tcp instead of udp.

If you want a custom date then do it like this
```bash
docker run -d --restart=always -p 19132:19132/udp -name mc aljaf/mc:07-12-2024 sh -c './start.sh'
```

## Setting Up WSL on Windows

If you're on Windows and don't already have WSL installed, follow these steps:

1. **Enable WSL**:
   - Open PowerShell as Administrator and run:
     ```powershell
     wsl --install
     ```
   - This command installs the latest version of WSL along with the default Ubuntu distribution.

2. **Reboot Your System**:
   - Once the installation is complete, restart your computer if prompted.

3. **Open Ubuntu**:
   - Launch Ubuntu from the Start menu and set up your user account.

4. **Install Required Tools**:
   - Update and install `curl`:
     ```bash
     sudo apt update && sudo apt install curl -y
     ```

---

## How to Use the Script

Once you have a compatible environment (Linux, macOS, or WSL on Windows), follow these steps:

1. Open a terminal.
2. Run the setup script using the following command:
   ```bash
   curl -fsSL https://raw.githubusercontent.com/AhmadAlJaf/public-mc/main/run.sh | sh
   ```

How to remove the minecraft server

First and foremost it is important to check wich containers are running in order to ensure they have been removed later on.
this can be done using the following command
```bash
docker ps
```
If your running the creative server use this command to remove it
```bash
docker stop cmc && docker rm cmc
```

If your running the survival server use this command to remove it
```bash
docker stop mc && docker rm mc
```
At the end, check if it has been removed using this command
 ```bash
docker ps
```
