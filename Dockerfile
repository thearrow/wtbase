FROM python:3.5

RUN mkdir -p /app
WORKDIR /app

COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

COPY . /app/

RUN rm -rf static/dist/
RUN python manage.py collectstatic --noinput
RUN python manage.py compress

EXPOSE 8000

CMD ["/app/start.sh"]
