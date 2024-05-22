# Dockerfile for MongoDB restore
FROM mongo:latest

# Install necessary tools
RUN apt-get update && \
    apt-get install -y cron && \
    apt-get clean

# Copy the restore script into the container
COPY restore.sh /restore.sh

# Make the script executable
RUN chmod +x /restore.sh

# Run the restore script manually or as a cron job
CMD ["cron", "-f"]
