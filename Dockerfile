########################################
# Stage 1 – Build the JAR with Maven
########################################
FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

########################################
# Stage 2 – Run the JAR with OpenJDK 17
########################################
FROM openjdk:17.0.1-jdk-slim
WORKDIR /app
COPY --from=build /app/target/Shopping_Cart-0.0.1-SNAPSHOT.jar app.jar

EXPOSE 8080
CMD ["java", "-jar", "app.jar"]


