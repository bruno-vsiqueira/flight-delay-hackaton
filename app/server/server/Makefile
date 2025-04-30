# Define variables
IMAGE_NAME=flight-delay-app
CONTAINER_NAME=flight-delay-container

# Default target
all: build

# Target to build the Docker image
build:
	@echo "Building Docker image $(IMAGE_NAME)..."
	@docker build -t $(IMAGE_NAME) .

# Target to run the Docker container in the foreground
run: build
	@echo "Running Docker container $(CONTAINER_NAME) from image $(IMAGE_NAME)..."
	@docker run --rm -p 8080:8080 --name $(CONTAINER_NAME) $(IMAGE_NAME)

# Target to run the Docker container in the background (detached)
run-detached: build
	@echo "Running Docker container $(CONTAINER_NAME) in detached mode..."
	@docker run --rm -d -p 8080:8080 --name $(CONTAINER_NAME) $(IMAGE_NAME)

# Target to stop the running container
stop:
	@echo "Stopping container $(CONTAINER_NAME)..."
	@docker stop $(CONTAINER_NAME) || true

# Target to view logs of the detached container
logs:
	@echo "Showing logs for container $(CONTAINER_NAME)..."
	@docker logs -f $(CONTAINER_NAME)

# Target to clean up (stop and remove container) - useful if not using --rm
clean: stop
	@echo "Removing container $(CONTAINER_NAME)..."
	@docker rm $(CONTAINER_NAME) || true

# Phony targets prevent conflicts with files of the same name
.PHONY: all build run run-detached stop logs clean

