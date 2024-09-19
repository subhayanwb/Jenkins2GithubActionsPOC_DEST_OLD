FROM openjdk:8-jre-alpine

EXPOSE 8080
CMD pwd
COPY ./target/sjenkins-aws-java-maven-app-*.jar /usr/app/
WORKDIR /usr/app

CMD java -jar sjenkins-aws-java-maven-app-*.jar
