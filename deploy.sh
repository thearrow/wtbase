cp .env.prod .env
docker build -t thearrow/wtbase .
docker push thearrow/wtbase
cp .env.dev .env
