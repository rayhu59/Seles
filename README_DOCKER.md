Docker commands

docker build -t seles .    <- build image with name as seles
docker run -dp 8080:8080 seles  <- localhost8080 on left connect to container 8080 port rightside


With profiles 
ENTRYPOINT ["java", "-Dspring.profiles.active=test", "-jar", "/app.jar"]
docker run -e "SPRING_PROFILES_ACTIVE=test,test2" seles


Docker for new project
Create Repo in docker hub.

docker tag seles USER_ID/seles
docker push USER_ID/seles 

**Named volumes**
docker volume create sample-db # for data persistence after a container is removed
docker run -dp 3000:3000 -v sample-db:/etc/random seles # tells volume to 
                        capture all files created etc/random

docker volume inspect
Data is stored at Mountpoint, require root access from host.

**Bind mounts**
Control exact mountpoint of host, can use to persist data but more used for additional data
We can mount source code in bind mount to let us see code changes straight away ex : changing color of text rather than rebuilding entire image