# Springboot, OTEL and Tempo

This repo is forked from https://github.com/HechengLi/Docker_SpringBoot_Tomcat_MySQL_Demo.

## How to run this demo?

### Step 0 - Requirements
Here are the tools you need:
> 1. Docker
> 2. Maven
> 3. Java10

### Step 1 - Clone this repo
```git clone https://github.com/HechengLi/Docker_SpringBoot_Tomcat_MySQL_Demo.git```

### Step 2 - Build TianMiao as a war file
> cd TianMiao
> mvn clean install -Dmaven.test.skip=true

### Step 3 - Install Loki logging driver
> `docker plugin install grafana/loki-docker-driver:latest --alias loki --grant-all-permissions`

### Step 4 - Run the project with docker
> Open your commandline, cd to the git directory
> Make sure you have docker app running
> Run 'docker-compose -f stack.yml up' (add -d if you want it to run in background)

### Step 5 - Rerun if there's an error on first run
> If you get an error while starting tomcat, it probably is because the docker container running Tomcat doesn't wait for MySQL to finish running it's setup script.
> Wait for MySQL to finish running its script (it will log ...ready for connections...)
> Stop all containers and start again should fix the problem.

### Step 6 - Check if it works
> `curl http://localhost:8080/TianMiao/api/users`
> `curl -X POST -H 'Content-Type: application/json' -d '{"username": "test"}'  http://localhost:8080/TianMiao/api/users`
> `curl http://localhost:8080/TianMiao/api/users/1`