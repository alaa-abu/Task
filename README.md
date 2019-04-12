## Hello-dropwizard service task

- Basically, I used a combination of  Docker, Docker-compose, Bash, Nginx to achieve the required, I tried to keep things as simple as possible.

- I have written a docker file to build the image for the Hello-dropwizard service based on an openjdk varaition of alpine.

- Nginx will be acting as the reverse proxy for the application on the required path(/hello), it will be using port 80.

- The application ports are not published on the host machine but this can be changed easily from the docker-compose.yml if you will.

- A Bash script has been written to automate the process of building & running the whole thing easily.


## Getting Started

You can simply clone the project to the target machine, and run "run.sh" on any Linux machine.


### What do I need to run the project?

1. A Linux machine.

2. Docker, Docker Compose.

3. Maven.

