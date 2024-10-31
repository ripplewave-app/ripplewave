# Use a minimal base image for the final stage
FROM eclipse-temurin:23-jre-alpine

# Set the working directory
WORKDIR /app

# Create a non-root user and group
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# Change ownership of the working directory
RUN chown -R appuser:appgroup /app

# Switch to the non-root user
USER appuser

# Copy the layers extracted by layertools
COPY --chown=appuser:appgroup exploded/dependencies/ ./
COPY --chown=appuser:appgroup exploded/spring-boot-loader/ ./
COPY --chown=appuser:appgroup exploded/snapshot-dependencies/ ./
COPY --chown=appuser:appgroup exploded/application/ ./

# Expose the port the application runs on
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "org.springframework.boot.loader.launch.JarLauncher"]