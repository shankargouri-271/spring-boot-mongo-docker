FROM maven:3-jdk-8 as mvn
RUN git clone https://github.com/venkattharun4/spring-boot-mongo-docker.git
RUN cd spring-boot-mongo-docker && mvn package

FROM openjdk:8-alpine
RUN apk update && apk add /bin/sh
RUN mkdir -p /opt/app
COPY --from=mvn /spring-boot-mongo-docker/target/spring-boot-mongo-docker*.jar /boot-mongo-docker.jar
CMD ["java" ,"-jar","./spring-boot-mongo.jar"]
