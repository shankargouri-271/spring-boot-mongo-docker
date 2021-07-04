FROM maven:3-openjdk-8
RUN git clone https://github.com/venkattharun4/spring-boot-mongo-docker.git
RUN cd maven-web-application/ && mvn package

 

FROM tomcat:7-jdk8-corretto
LABEL AUTHOR="venkat-tharun"
COPY --from=mvn/spring-boot-mongo-docker/springbootmongodocker-web/ target/spring-boot-mongo-docker*.war /usr/local/tomcat/webapps/spring-boot-mongo-docker.war
