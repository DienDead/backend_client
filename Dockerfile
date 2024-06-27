FROM maven:3.8.5-openjdk-17-slim AS build
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:21-jdk-slim
COPY --from=build /target/MovieApp-0.0.1-SNAPSHOT.jar MovieApp.jar
EXPOSE 8080

ENTRYPOINT ["java", "-jar","MovieApp.jar "]