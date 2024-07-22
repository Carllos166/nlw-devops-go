# Dockerfile for building a Go application

# Stage 1: Builder
FROM golang:1.22.2-alpine AS builder

### Set working directory to /app
WORKDIR /app

### Copy go.mod and go.sum files
COPY go.mod go.sum ./

### Download and verify Go modules
## This step is not necessary since we're using a Go base image (golang:1.22.2-alpine)
RUN go mod download && go mod verify

### Copy application code
COPY . .

### Build the Go application
## Example: go build -o /bin/journey cmd/journey/journey.go
RUN go build -o /bin/journey cmd/journey/journey.go

# Stage 2: Runtime
FROM scratch

### Set working directory to /app
WORKDIR /app

### Copy the built application from the builder stage
COPY --from=builder /bin/journey .

### Expose port 8080 for the applicatio
EXPOSE 8080

### Set the entry point for the application
## Example: ENTRYPOINT [ "./journey" ]
ENTRYPOINT [ "./journey" ]
