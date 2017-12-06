# Ansible Role Testing

To run the test playbook(s) in `{{ role_name }}/tests` directory:

  1. Install and start [Docker](https://www.docker.com/).
  2. Change into the role directory `cd {{ role_name }}`
  2. Download the test shim into `/tests/test.sh`:
    - `wget -O tests/test.sh https://raw.githubusercontent.com/polymimetic/ansible-utility/master/scripts/test.sh`
  3. Make the test shim executable: `chmod +x tests/test.sh`.
  4. Run (from the role root directory) `distro=[distro] playbook=[playbook] ./tests/test.sh`

If you don't want the container to be automatically deleted after the test playbook is run, add the following environment variables: `cleanup=false container_id=$(date +%s)`

## Installing Docker

To install [Docker](https://www.docker.com/) on an Ubuntu 16.04 LTS (Xenial) or similar machine, follow the directions below. These were built primarily from the [Official Docker Installation](https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/) & [Post-Installation](https://docs.docker.com/engine/installation/linux/linux-postinstall/) guides.

### Docker Prerequisites

Remove old Docker versions (if they exist):

    sudo apt remove docker docker-engine docker.io

Install Docker dependencies:

    sudo apt update
    sudo apt install apt-transport-https ca-certificates curl software-properties-common

### Docker Installation

Add Docker’s official GPG key:

    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

Verify the fingerprint:

    sudo apt-key fingerprint 0EBFCD88

Setup the stable repository:

    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

Update the apt package index:

    sudo apt update

Install the latest version of Docker CE:

    sudo apt install docker-ce

Verify that Docker CE is installed correctly by running the hello-world image:

    sudo docker run hello-world

### Docker Post-Installation

Create the docker group:

    sudo groupadd docker

Add your user to the docker group:

    sudo usermod -aG docker $USER

Verify that you can run docker commands without sudo:

    docker run hello-world

Change docker folder permissions:

    sudo chown "$USER":"$USER" /home/"$USER"/.docker -R
    sudo chmod g+rwx "/home/$USER/.docker" -R

Configure Docker to start on boot:

    sudo systemctl enable docker

To disable this behavior, use `disable` instead.:

    sudo systemctl disable docker

### Reload Docker Daemon

Reload the Docker daemon:

    sudo systemctl daemon-reload

Restart Docker:

    sudo systemctl restart docker

## Installing Ansible Lint

To install [Ansible Lint](https://github.com/willthames/ansible-lint) on an Ubuntu 16.04 LTS (Xenial) or similar machine, follow the directions below.

Ensure Python is installed:

    which python

Install Python (if not installed):

    sudo apt update
    sudo apt install -y -qq python-minimal

Install Python pip:

    sudo apt install python-pip

Install Ansible Lint:

    pip2 install ansible-lint