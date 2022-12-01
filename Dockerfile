# Multi-Stage build, only carry what you need from each build stage to the next

# initial base image
FROM maven:3.8.3-openjdk-17 AS stage1
# speed improvement for maven jvm
ENV MAVEN_OPTS="-XX:+TieredCompilation -XX:TieredStopAtLevel=1"
# set working dir
WORKDIR /rhv/selesapp
# layer for pom changes
COPY pom.xml .
# can start here if only code change occurs, use cached image of previous instructions.
COPY ./src ./src
# compile code and package it
RUN mvn clean package

#Stage 2 - main application image - use alipine
# FROM gcr.io/distroless/java - if we use java 11, we can slim image size more!
FROM openjdk:17-alpine
# deployment dir
WORKDIR /rhv/selesapp
# copy artifacts from first build stage
COPY --from=stage1 /rhv/selesapp/target/Seles-0.0.1-SNAPSHOT.jar /Seles-0.0.1-SNAPSHOT.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/Seles-0.0.1-SNAPSHOT.jar"]

# Docker layers - created only by FROM, COPY, RUN , CMD

# basic docker - PACKAGE ONLY - requires JDK/Maven installed on host - Big image size
# require its to be packaged already.
#FROM openjdk:17-alpine
#ARG JAR_FILE=target/Seles-0.0.1-SNAPSHOT.jar
#COPY ${JAR_FILE} Seles-0.0.1-SNAPSHOT.jar
#ENTRYPOINT ["java","-jar","/Seles-0.0.1-SNAPSHOT.jar"]
