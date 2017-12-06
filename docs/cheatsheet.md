# Ansible Cheetsheet

## Ansible Commands

### Install Ansible via Ubuntu PPA

Source: https://jeffdecola.github.io/my-cheat-sheets/

```bash
sudo apt install software-properties-common
sudo apt-add-repository ppa:ansible/ansible
sudo apt update
sudo apt install ansible
```

### Install Ansible via Python PIP

Source: http://docs.ansible.com/ansible/latest/intro_installation.html#latest-releases-via-pip

```bash
pip install ansible==$ANSIBLE_VERSION
```

### Add Ansible directory structure

Source: https://raymii.org/s/snippets/Ansible_-_create_playbooks_and_role_file_and_folder_structure.html

```bash
mkdir -p roles/common/{tasks,handlers,templates,files,vars,defaults,meta}
touch roles/common/{tasks,handlers,templates,files,vars,defaults,meta}/main.yml
```

## Ansible Galaxy Commands

### Install a role from Ansible Galaxy

Source: http://docs.ansible.com/ansible/latest/galaxy.html

```bash
$ ansible-galaxy install username.role_name
```

### Install a role from GitHub

Source: http://docs.ansible.com/ansible/latest/galaxy.html#installing-roles

```bash
$ ansible-galaxy install git+https://github.com/polymimetic/ansible-role-{{ role_name }}.git
```

## Docker Commands

### Stop all Docker containers

Source: https://gist.github.com/evanscottgray/8571828

```bash
docker kill $(docker ps -q)
```

### Remove all Docker containers

Source: https://gist.github.com/evanscottgray/8571828

```bash
docker rm $(docker ps -a -q)
```

### Remove all Docker images

Source: https://gist.github.com/evanscottgray/8571828

```bash
docker rmi $(docker images -q)
```

### Remove all unused Docker data

Source: https://docs.docker.com/engine/reference/commandline/system_prune/

```bash
docker system prune -a
```