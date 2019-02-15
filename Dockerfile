From java:8-jdk-alpine
RUN mkdir /usr/app
COPY ./target/my-app-1.0-SNAPSHOT.jar /usr/app
WORKDIR /usr/app
entrypoint java -jar my-app-1.0-SNAPSHOT.jar