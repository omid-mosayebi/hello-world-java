# === STAGE 1: BUILD THE APPLICATION ===
# Use a JDK image to compile the Java source code
FROM eclipse-temurin:21-jdk-alpine AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy the Java source file into the container
COPY HelloWorld.java .

# Compile the Java source file, creating HelloWorld.class
RUN javac HelloWorld.java
 

# === STAGE 2: CREATE THE FINAL RUNTIME IMAGE ===
# Use a JRE image, which is much smaller than the JDK, for running the application
FROM eclipse-temurin:21-jre-alpine

# Set the working directory
WORKDIR /app

# Copy the compiled class file from the 'builder' stage
COPY --from=builder /app/HelloWorld.class .

# Set the default command to run when the container starts
CMD ["java", "HelloWorld"]
