# Base image with PowerShell Core
FROM mcr.microsoft.com/powershell:latest

# Set working directory
WORKDIR /app

# Copy the game script into the container
COPY snake.ps1 .

# Set the entry point to run the game
ENTRYPOINT ["pwsh", "-File", "snake.ps1"]