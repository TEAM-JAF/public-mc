Certainly! Here's a `README.md` file that explains your public Minecraft server, how to run the script, and provides detailed instructions and explanations.

```markdown
# MCJAF Public Minecraft Server

Welcome to the MCJAF Public Minecraft Server! This repository provides a convenient script to set up and run our Minecraft server using Docker. Follow the instructions below to get started.

## How to Run the Script

To run the setup script, simply use the following command in your terminal:

```sh
curl -fsSL https://get.mcjaf.uk | sh
```

### What the Script Does

1. **Checks if Docker is Installed**:
    - The script first checks if Docker is installed on your system.
    - If Docker is not installed, it will automatically download and install Docker using the official Docker installation script from `https://get.docker.com`.
    - The script adds the current user to the `docker` group and prompts you to reboot your system.

2. **Runs the Docker Container**:
    - After ensuring Docker is installed, the script runs a Docker container for the Minecraft server with the following command:
      ```sh
      docker run -d --restart=always -p 19132:19132/udp --name cmc aljaf/mc:$(date +%d-%m-%Y) sh -c './start.sh'
      ```
    - This command runs the container in detached mode (`-d`), restarts the container automatically if it stops (`--restart=always`), maps the UDP port 19132 (`-p 19132:19132/udp`), names the container `cmc`, and uses an image tagged with the current date.

## Changing the Date Tag

The script uses the current date as the tag for the Docker image. If you want to run a specific version of the Minecraft server based on a different date, you can modify the date in the `docker run` command.

### Example

To run the server with an image tagged `01-06-2024`, modify the `docker run` command as follows:

```sh
docker run -d --restart=always -p 19132:19132/udp --name cmc aljaf/mc:01-06-2024 sh -c './start.sh'
```

## Finding Available Dates for Images

To find available dates for the Minecraft server images, you can list the tags available for the Docker repository. Use the following command to fetch and list the tags:

```sh
curl -s https://registry.hub.docker.com/v1/repositories/aljaf/mc/tags | jq -r '.[].name'
```

This command uses `curl` to fetch the tags from Docker Hub and `jq` to parse and list the tag names. Ensure you have `jq` installed on your system to run this command.

### Installing `jq`

If you don't have `jq` installed, you can install it using the following commands:

- **Debian/Ubuntu**:
  ```sh
  sudo apt-get install jq
  ```

- **CentOS/RHEL**:
  ```sh
  sudo yum install jq
  ```

- **macOS**:
  ```sh
  brew install jq
  ```

## Conclusion

We hope you enjoy playing on the MCJAF Public Minecraft Server. If you have any questions or need further assistance, please don't hesitate to reach out to us. Happy gaming!
```

This `README.md` file provides clear instructions on how to run the script, explains what the script does, and includes details on changing the date tag and finding available tags for the Docker image.
