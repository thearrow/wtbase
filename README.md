A skeleton dockerized Wagtail app using PostgreSQL and Gunicorn.
(Started with the wagtail generator.)

> Note: Currently the docker container for the web app pulls a specific commit from Github for wagtail (without django-compressor) and manually builds the static assets for it with gulp. See [wagtail.sh](https://github.com/thearrow/wtbase/blob/master/wagtail.sh).


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



## Aliases
Available for convenience on the Vagrant Guest.

---

######  Docker Compose:

`dc {command}`: run docker-compose command

`start`: start all docker-compose containers

`stop`: stop all docker-compose containers

`restart`: restart all docker-compose containers

`build`: rebuild all docker-compose images

---

###### Django:

`wt {command}`: run manage.py command

`migrate`: run migration

`createsuperuser`: create a super user

---

###### Docker:

`dockerkill`: stop and remove all docker containers

`dockerclean`: delete all docker images



## Deployment
> *NOTE:* Will probably want to move to hosted DB solution for real production: remove `db` from `docker-compose-prod.yml` and set `DATABASE_URL` in `.env.prod` accordingly.

Make a `.env.prod` file containing:
```
DEBUG=False
ALLOWED_HOSTS=['{APP HOSTS}']
SECRET_KEY={YOUR SECRET KEY}
DATABASE_URL={YOUR DATABASE URL}
```

Deploy from Vagrant Guest:
```
docker login
{ENTER DOCKER HUB LOGIN CREDENTIALS}

sh deploy.sh

ecs-cli configure --region us-east-1 --access-key {AWS_ACCESS_KEY_ID} --secret-key {AWS_SECRET_ACCESS_KEY} --cluster wtbase

ecs-cli up --keypair {KEY_PAIR_NAME} --capability-iam --size 1 --instance-type t2.micro

ecs-cli compose -f docker-compose-prod.yml service up
```

On container EC2 instance:
```
docker ps

docker exec -it {CONTAINER_ID} python manage.py createsuperuser
```

Shutdown from Vagrant Guest:
```
ecs-cli compose -f docker-compose-prod.yml service rm

ecs-cli down --force
```
