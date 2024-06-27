FROM maven:3.3.1-openjdk-21 AS build
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:21-jdk-slim
COPY --from=build /target/MovieApp-0.0.1-SNAPSHOT.jar MovieApp.jar
EXPOSE 8080

ENTRYPOINT ["java", "-jar","MovieApp.jar "]