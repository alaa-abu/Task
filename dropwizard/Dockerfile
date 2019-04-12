FROM openjdk:8u121-jre-alpine
 
WORKDIR /app/dropwizard-rest-stub
 
ADD target/hello-dropwizard-1.0-SNAPSHOT.jar /app/dropwizard-service/hello-dropwizard-1.jar
ADD example.yaml /app/dropwizard-service/config.yml
 
EXPOSE 8080 8081
 
ENTRYPOINT ["java", "-jar", "/app/dropwizard-service/hello-dropwizard-1.jar", "server", "/app/dropwizard-service/config.yml"]