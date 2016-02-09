cp .env.prod .env

docker build -t thearrow/wtbase .
docker push thearrow/wtbase

docker build -t thearrow/wtbase-static ./static/
docker push thearrow/wtbase-static

cp .env.dev .env
