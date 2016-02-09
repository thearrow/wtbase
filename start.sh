#!/bin/bash

python manage.py collectstatic --noinput
python manage.py migrate

# Prepare log files and start outputting logs to stdout
touch gunicorn.log
touch access.log
tail -n 0 -f *.log &

# Start Gunicorn processes
echo Starting Gunicorn.
exec gunicorn wtbase.wsgi:application \
    --name web \
    --bind 0.0.0.0:8000 \
    --workers 2 \
    --log-level=info \
    --log-file=gunicorn.log \
    --access-logfile=access.log \
    "$@"
