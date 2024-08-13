# NLW DevOps Go Project

A Go application developed during the NLW DevOps event, focusing on DevOps practices using Go, Docker, and Docker Compose.

## Technologies Used

* **Go**: The programming language used to develop the application.
* **Docker**: Used to create containers that encapsulate the environment necessary to run the application.
* **Docker Compose**: A tool for defining and managing multi-container applications.

## Project Structure

The project uses a multi-stage Dockerfile to build a lightweight image of the application. The first stage compiles the Go application, and the second stage, based on the `scratch` image, creates a final image containing only the compiled binary and necessary dependencies for execution.

## Running the Postgres Container with Docker Compose

Docker Compose is used in this project to define and run the Postgres database service in a container, making it easy to connect to the Go application without manual installation and configuration of Postgres.

### Steps to Run the Postgres Container

1. **Install Docker and Docker Compose**: Ensure you have Docker and Docker Compose installed on your machine.

2. **Configure Environment Variables**: The `docker-compose.yaml` file defines several environment variables necessary for the `api` service, including configurations for connecting to the Postgres database. Ensure you provide suitable values for these variables.

3. **Start the Services**: In the project directory, run the following command in your terminal to start the services defined in `docker-compose.yaml`, including the Postgres database:

```bash
docker-compose up --build -d 
k3d cluster create nlw-journey --servers 2
```
