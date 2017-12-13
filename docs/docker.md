### Deploy with docker

You can deploy LibreRead using a docker image. To keep this image as small as possible, LibreRead uses multi-stage builds, which require docker 17.05 or higher.

You can build this image using

    docker build -t libreread .

You can also quickly spawn a fully working setup with docker-compose by executing

    docker-compose up

After that, open <http://127.0.0.1:8080> in your browser. Note that the docker-compose setup is still work in progress and subject to change.
