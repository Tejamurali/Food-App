# ── Stage 1: Build the WAR file ──────────────────────────────
FROM maven:3.8.8-eclipse-temurin-11 AS build

WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# ── Stage 2: Run with Tomcat ─────────────────────────────────
FROM tomcat:9.0-jdk11-temurin

# Remove default Tomcat apps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your WAR into Tomcat
COPY --from=build /app/target/Food-App.war /usr/local/tomcat/webapps/ROOT.war

# Expose port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
