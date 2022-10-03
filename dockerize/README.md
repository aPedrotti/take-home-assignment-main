# Task 1: Dockerize

## Exercise Goals

This is your first task in out assignment. Here you are supposed to build a Dockfile with a Go Webserver within.

* Create a `Dockerfile`;
  * Build `golang` executable inside your `Dockerfile`;
  * Let the executable run as you load the image;
* Build a `Docker` image using your `Dockerfile`;
* Run your new created image and get a `200` HTTP Code once your container is running;

## Expected Output

Please, provide us with the `Dockerfile` you created. Your `Dockerfile` is supposed to:

* Copy our source code inside this folder to the image;
* Build the binary from our source code inside the image;
* Run the binary at the end of the image;

[Optional] You can also share screenshots of your progress.

```bash
docker built -t myapp-web:latest -f Dockerfile .
docker -d -p 8080:8080 myapp-web:latest
```

0-copy-source-code.png

1-build-binary.png

2-run-binary.png

3-run-binary-container.png

### Extra

Created a docker-compose file to spin-up a database for this application.

* Requires [docker-compose](https://docs.docker.com/compose/install/linux/)

```bash
# Create env
docker-compose up -d

# Stop Env
docker-compose down
```

## Next steps?

Once you complete this task, you can proceed to the [Kubernetes](../kubernetes) task;
