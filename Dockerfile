# Use Java 11
FROM maven:3.8.6-openjdk-11 AS build

WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Run stage
FROM openjdk:11-jre-slim
WORKDIR /app
COPY --from=build /app/target/Food-App.war ./Food-App.war

EXPOSE 8080

CMD ["java", "-Dserver.port=8080", "-jar", "Food-App.war"]
