mkdir -p  /home/circleci/.ssh
rm /home/circleci/.ssh/*

sudo ssh-keygen -t rsa -N "" -f /home/circleci/.ssh/id_rsa 
sudo echo -e "Host github.com\n\tStrictHostKeyChecking no\n\tUserKnownHostsFile=/dev/null\n" >  /home/circleci/.ssh/config
sudo ssh-keyscan github.com >> /home/circleci/.ssh/known_hosts

sudo chown -R circleci /home/circleci/.ssh
sudo chgrp -R circleci /home/circleci/.ssh
sudo chmod 700 /home/circleci/.ssh
sudo chmod 644 /home/circleci/.ssh/authorized_keys
sudo chmod 644 /home/circleci/.ssh/known_hosts
sudo chmod 644 /home/circleci/.ssh/config
sudo chmod 600 /home/circleci/.ssh/id_rsa
sudo chmod 644 /home/circleci/.ssh/id_rsa.pub
