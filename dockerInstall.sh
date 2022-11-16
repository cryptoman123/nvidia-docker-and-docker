apt remove *docker *docker* docker* -y
apt update -y
apt upgrade -y
apt-get update -y
apt-get upgrade -y
apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
apt-key fingerprint 0EBFCD88
add-apt-repository \
"deb [arch=amd64] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) \
stable"
add-apt-repository \
"deb [arch=x86_64] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) \
stable"
apt update -y
apt upgrade -y
apt-get update -y
apt-get upgrade -y
apt-get install -y docker-ce docker-ce-cli containerd.io
apt update -y
apt upgrade -y
apt-get update -y
apt-get upgrade -y
apt-get install -y docker-ce docker-ce-cli containerd.io
apt update -y
apt upgrade -y
apt-get update -y
apt-get upgrade -y
docker run hello-world
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list
apt-get update && sudo apt-get install -y nvidia-container-toolkit
systemctl restart docker
docker run --rm --gpus all nvidia/cuda:11.0.3-base-ubuntu20.04 nvidia-smi





