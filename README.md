# Springboot, OTEL and Tempo

This repo is forked from https://github.com/HechengLi/Docker_SpringBoot_Tomcat_MySQL_Demo.  Thanks to [HechengLi](https://github.com/HechengLi) for the inital work of setting up the Tomcat/Springboot/Java demo that this is built on top of.

## How to run this demo?

### Step 0 - Requirements
You will need:
1. Docker

### Step 1 - Clone this repo
`git clone https://github.com/joe-elliott/tempo-springboot-example`

### Step 2 - Run the project with docker
1. Open your commandline, cd to the git directory
1. Run `docker-compose up` (add -d if you want it to run in background)

### Step 3 - Rerun if there's an error on first run :(
1. If you get an error while starting tomcat, it probably is because the docker container running Tomcat doesn't wait for MySQL to finish running it's setup script.
1. Wait for MySQL to finish running its script (it will log ...ready for connections...)
1. Stop all containers and start again should fix the problem.

### Step 4 - Exercise the API
> `curl http://localhost:8080/TianMiao/api/users`

> `curl -X POST -H 'Content-Type: application/json' -d '{"username": "test"}'  http://localhost:8080/TianMiao/api/users`

> `curl http://localhost:8080/TianMiao/api/users/1`

> `curl -X PUT -H 'Content-Type: application/json' -d '{"username": "newUser"}' http://localhost:8080/TianMiao/api/notes/`

### Step 5 - Find some traces!

1. Open http://localhost:3000/explore and make sure that Tempo is selected.
1. Search!
