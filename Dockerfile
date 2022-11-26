FROM openjdk:17-alpine
ARG JAR_FILE=target/Seles-0.0.1-SNAPSHOT.jar
COPY ${JAR_FILE} Seles-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java","-jar","/Seles-0.0.1-SNAPSHOT.jar"]
