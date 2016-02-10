# set up useful aliases
echo "alias l='ls -la'" >> /home/vagrant/.bashrc
echo "alias wt='docker-compose run web python manage.py'" >> /home/vagrant/.bashrc
echo "alias migrate='wt migrate'" >> /home/vagrant/.bashrc
echo "alias createsuperuser='wt createsuperuser'" >> /home/vagrant/.bashrc
echo "alias dc='docker-compose'" >> /home/vagrant/.bashrc
echo "alias start='docker-compose up'" >> /home/vagrant/.bashrc
echo "alias stop='docker-compose stop'" >> /home/vagrant/.bashrc
echo "alias restart='docker-compose restart'" >> /home/vagrant/.bashrc
echo "alias build='docker-compose build'" >> /home/vagrant/.bashrc
echo "alias dockerkill='docker stop \$(docker ps -a -q) && docker rm \$(docker ps -a -q)'" >> /home/vagrant/.bashrc
echo "alias dockerclean='docker rmi \$(docker images -q)'" >> /home/vagrant/.bashrc
echo "cd /vagrant" >> /home/vagrant/.bashrc

# install aws ecs-cli tools
curl -o /usr/local/bin/ecs-cli https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-linux-amd64-latest
chmod +x /usr/local/bin/ecs-cli
ecs-cli -v
