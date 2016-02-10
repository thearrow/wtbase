A skeleton dockerized Wagtail app using PostgreSQL and Gunicorn.
(Started with the wagtail generator.)


## Development Setup
```
host > git clone {repo}
host > cd {repo}
host > vagrant plugin install vagrant-vbguest
host > vagrant plugin install vagrant-docker-compose
host > vagrant up
host > vagrant ssh

guest > createsuperuser
guest > start
```

Open http://0.0.0.0:8000 in browser


## Database
PostgreSQL is used for development and is available for connection from the host machine for inspection at 0.0.0.0:5432.


## Recipes
Run manage.py command:
```
guest > wt {command}
```

Run migration:
```
guest > migrate
```

Create super user:
```
guest > createsuperuser
```

Start docker-compose:
```
guest > start
```

Stop docker-compose:
```
guest > stop
```

Restart docker-compose:
```
guest > restart
```

Rebuild all docker-compose images:
```
guest > build
```

Stop and remove all docker containers:
```
guest > dockerkill
```

Delete all docker images:
```
guest > dockerclean
```


## Deployment
Deploy:

*NOTE:* Will probably want to move to hosted DB solution for prod: remove db from `docker-compose-prod.yml` and update `DATABASE_URL` in `.env.prod` accordingly.

Make a `.env.prod` file containing:
```
DEBUG=False
ALLOWED_HOSTS=['*']
SECRET_KEY={YOUR SECRET KEY}
DATABASE_URL={PROPER DATABASE URL}
```

Deploy from Vagrant:
```
guest > docker login
{ENTER DOCKER HUB LOGIN CREDENTIALS}

guest > sh deploy.sh

guest > ecs-cli configure --region us-east-1 --access-key {AWS_ACCESS_KEY_ID} --secret-key {AWS_SECRET_ACCESS_KEY} --cluster wtbase

guest > ecs-cli up --keypair {KEY_PAIR_NAME} --capability-iam --size 1 --instance-type t2.micro

guest > ecs-cli compose -f docker-compose-prod.yml service up
```

On container EC2 instance:
```
docker ps
docker exec -it {CONTAINER_ID} python manage.py createsuperuser
```

Shutdown from Vagrant:
```
guest > ecs-cli compose -f docker-compose-prod.yml service rm

guest > ecs-cli down --force
```
