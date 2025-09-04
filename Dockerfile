# Etape 1 : Build
FROM maven:3.9.6-eclipse-temurin-17 as builder
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline -B

COPY src ./src

RUN mvn package -DskipTests

# Etape 2 : Lancement
FROM openjdk:17-jdk-slim
WORKDIR /app
EXPOSE 8080
COPY --from=builder /app/target/*.jar  app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]


