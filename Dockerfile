FROM maven:3-jdk-8 as mvn
RUN git clone https://github.com/venkattharun4/spring-boot-mongo-docker.git
RUN cd spring-boot-mongo-docker && mvn package

FROM openjdk:8-alpine
LABEL AUTHOR="Tharun"
COPY --from=mvn /spring-boot-mongo-docker/target/spring-boot-mongo-docker*.jar /boot-mongo-docker.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar"]
CMD ["/spring-boot-mongo-docker.jar"]
