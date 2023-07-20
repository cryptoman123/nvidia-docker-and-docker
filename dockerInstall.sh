#!/bin/bash

# Remove any existing Docker-related packages from the system
apt remove *docker *docker* docker* -y

# Update package lists from the repositories
apt update -y

# Upgrade installed packages to their latest versions
apt upgrade -y

# Update package lists from the repositories (apt-get)
apt-get update -y

# Upgrade installed packages to their latest versions (apt-get)
apt-get upgrade -y

# Install necessary packages for adding repositories and handling HTTPS connections
apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

# Add Docker's official GPG key to ensure package integrity
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Verify the fingerprint of the added GPG key
apt-key fingerprint 0EBFCD88

# Add Docker repository for the Ubuntu version detected on the system
add-apt-repository \
"deb [arch=amd64] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) \
stable"

# Add Docker repository for the Ubuntu version detected on the system (different architecture)
add-apt-repository \
"deb [arch=x86_64] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) \
stable"

# Update package lists from the repositories after adding Docker repository
apt update -y

# Upgrade installed packages to their latest versions after adding Docker repository
apt upgrade -y

# Update package lists from the repositories (apt-get) after adding Docker repository
apt-get update -y

# Upgrade installed packages to their latest versions (apt-get) after adding Docker repository
apt-get upgrade -y

# Install Docker packages along with containerd
apt-get install -y docker-ce docker-ce-cli containerd.io

# Update package lists from the repositories after installing Docker
apt update -y

# Upgrade installed packages to their latest versions after installing Docker
apt upgrade -y

# Update package lists from the repositories (apt-get) after installing Docker
apt-get update -y

# Upgrade installed packages to their latest versions (apt-get) after installing Docker
apt-get upgrade -y

# Install Docker packages along with containerd
apt-get install -y docker-ce docker-ce-cli containerd.io

# Update package lists from the repositories after installing Docker
apt update -y

# Upgrade installed packages to their latest versions after installing Docker
apt upgrade -y

# Update package lists from the repositories (apt-get) after installing Docker
apt-get update -y

# Upgrade installed packages to their latest versions (apt-get) after installing Docker
apt-get upgrade -y

# Run a simple Docker container "hello-world" to check if Docker is working correctly
docker run hello-world

# Set the "distribution" variable to identify the Linux distribution (e.g., "ubuntu20.04")
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)

# Download and add NVIDIA's GPG key to the system
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -

# Add NVIDIA Container Toolkit repository to the system's package sources
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list

# Update package lists and install NVIDIA Container Toolkit
apt-get update && sudo apt-get install -y nvidia-container-toolkit

# Restart the Docker service to apply the changes made with NVIDIA Container Toolkit
systemctl restart docker

# Run a Docker container with the specified NVIDIA CUDA image and execute "nvidia-smi" inside the container to display GPU information
docker run --rm --gpus all nvidia/cuda:11.0.3-base-ubuntu20.04 nvidia-smi
