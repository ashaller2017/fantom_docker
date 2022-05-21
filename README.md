# fantom_docker
yup

setup a new user on ubuntu:

# SSH into your machine
(local)$ ssh root@{VALIDATOR_IP_ADDRESS}
# Update the system
(validator)$ sudo apt-get update && sudo apt-get upgrade -y
# Create a non-root user
(validator)$ USER={USERNAME}
(validator)$ sudo mkdir -p /home/$USER/.ssh
(validator)$ sudo touch /home/$USER/.ssh/authorized_keys
(validator)$ sudo useradd -d /home/$USER $USER
(validator)$ sudo usermod -aG sudo $USER
(validator)$ sudo chown -R $USER:$USER /home/$USER/
(validator)$ sudo chmod 700 /home/$USER/.ssh
(validator)$ sudo chmod 644 /home/$USER/.ssh/authorized_keys

# Enable sudo without password for the user
(validator)$ sudo vi /etc/sudoers

{USERNAME} ALL=NOPASSWD: ALL

# Close the root SSH connection
(validator)$ exit
# Log in as new user
(local)$ ssh {USERNAME}@{VALIDATOR_IP_ADDRESS}

# Install build-essential
(validator)$ sudo apt-get install -y build-essential

$ sudo apt-get docker-compose


allow tcp/udp for 5050
mount drives

sudo apt-get update
install docker dependencies



# SSH into your machine
(local)$ ssh root@{VALIDATOR_IP_ADDRESS}
# Update the system
(validator)$ sudo apt-get update && sudo apt-get upgrade -y
# Create a non-root user

(validator)$ USER=ari
(validator)$ sudo mkdir -p /home/$USER/.ssh
(validator)$ sudo touch /home/$USER/.ssh/authorized_keys
(validator)$ sudo useradd -d /home/$USER $USER
(validator)$ sudo usermod -aG sudo $USER
(validator)$ sudo chown -R $USER:$USER /home/$USER/
(validator)$ sudo chmod 700 /home/$USER/.ssh
(validator)$ sudo chmod 644 /home/$USER/.ssh/authorized_keys


# Change Docker Disk
while initially doing this I found Docker autmatically installs to etc/var/lib or something along those lines
I needed to copy the engine over to the disk in order for it to have memory to install the node
i could have also custom confiured the way docker builds the images but there were some nuances here i avoided
