Docker commands

docker build -t seles .    <- build image with name as seles
docker run -dp 8080:8080 seles  <- localhost8080 on left connect to container 8080 port rightside


With profiles 
ENTRYPOINT ["java", "-Dspring.profiles.active=test", "-jar", "/app.jar"]
docker run -e "SPRING_PROFILES_ACTIVE=test,test2" seles