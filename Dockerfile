FROM langflowai/langflow:1.0.14

# Switch to root to install build tools and system dependencies
USER root

# Install build tools, Java, and required system libraries
RUN apt-get update && apt-get install -y

RUN pip install twilio httpx

# Switch back to the non-root user
USER user

# Set the working directory
WORKDIR /app

# Set environment variables
ENV LANGFLOW_AUTO_LOGIN=false
ENV LANGFLOW_SUPERUSER=admin
ENV LANGFLOW_SUPERUSER_PASSWORD=password
ENV LANGFLOW_DATABASE_URL=sqlite:///./langflow.db

# Set the entrypoint for the container
ENTRYPOINT ["python", "-m", "langflow", "run"]

# Set the default command-line arguments for the entrypoint
CMD ["--host", "0.0.0.0", "--port", "7860"]