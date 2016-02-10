#!/bin/bash
sleep 10 # wait for DB to spin up
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
    --workers 3 \
    --log-level=info \
    --log-file=gunicorn.log \
    --access-logfile=access.log \
    "$@"
