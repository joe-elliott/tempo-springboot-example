# We want the latest Maven image
FROM maven:3.6.3-openjdk-11-slim as build

WORKDIR /usr/src/app

# Ensure we copy just the app code
COPY TianMiao /usr/src/app

# Build the WAR file, install to /usr/src/app/target
RUN mvn clean install -Dmaven.test.skip=true

# Now create the actual run image
FROM tomcat:9-jre11-slim

# Copy the WAR file from the build image
COPY --from=build /usr/src/app/target/TianMiao.war /usr/local/tomcat/webapps/TianMiao.war
# Copy the autoinstrumentation JAR into the image
COPY opentelemetry-javaagent-all-DONOTUSE.jar /opentelemetry-javaagent-all.jar
