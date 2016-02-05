A simple, dockerized wagtail app started with the wagtail generator.

## Development Setup

```
host > git clone {repo}
host > cd {repo}
host > vagrant plugin install vagrant-vbguest
host > vagrant plugin install vagrant-docker-compose
host > vagrant up
host > vagrant ssh

guest > migrate
guest > createsuperuser
```

Open http://0.0.0.0:8000 in browser


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
guest > start (start docker-compose)
```

Stop docker-compose:
```
guest > stop (stop docker-compose)
```

Restart docker-compose:
```
guest > restart (restart docker-compose)
```
