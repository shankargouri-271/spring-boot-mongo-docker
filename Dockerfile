FROM maven:3-jdk-8
RUN git clone https://github.com/venkattharun4/spring-boot-mongo-docker.git
RUN cd spring-boot-mongo-docker && mvn package

FROM openjdk:8-alpine
RUN apk update && apk add /bin/sh
RUN mkdir -p /opt/app
ENV PROJECT_HOME /opt/app
COPY --from=0 /spring-boot-mongo-docker/target/spring-boot-mongo-docker*.jar $PROJECT_HOME/boot-mongo-docker.jar
WORKDIR $PROJECT_HOME
CMD ["java" ,"-jar","./spring-boot-mongo.jar"]
