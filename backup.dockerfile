# Dockerfile for MongoDB backup
FROM mongo:latest

# Install necessary tools
RUN apt-get update && \
    apt-get install -y cron && \
    apt-get clean

# Copy the backup script into the container
COPY backup.sh /backup.sh

# Make the script executable
RUN chmod +x /backup.sh

# Run the backup script every hour
CMD ["cron", "-f"]
