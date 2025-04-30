# Use a base image with Maven and JDK 21 for building the application
FROM maven:3.9.9-eclipse-temurin-21 as builder

# Set the working directory
WORKDIR /app

# Copy the Maven project file
COPY pom.xml .

# Set Maven options - Increase memory allocation
ENV MAVEN_OPTS="-Xmx4096m -Xms512m"

# Download dependencies (this layer will be cached if pom.xml doesn't change)
RUN mvn dependency:go-offline -X

# Copy the rest of the application source code
COPY src ./src

# Package the application
RUN mvn package -DskipTests

# Use a base image with JRE 21 for running the application
FROM eclipse-temurin:21-jre-jammy

# Set the working directory
WORKDIR /app

# Copy the JAR file from the builder stage
COPY --from=builder /app/target/flight-delay-*.jar app.jar

# Expose the port the application runs on
EXPOSE 8080

# Command to run the application
ENTRYPOINT ["java", "-jar", "app.jar"]