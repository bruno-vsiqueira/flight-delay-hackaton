# Flight Delay Prediction Service

Spring Boot backend for predicting flight delays.

## Prerequisites

*   Java 21
*   Maven 3.9+
*   Docker (optional, for containerized deployment)
*   Make (optional, for using Makefile commands)

## Building and Running

### Using Maven

1.  **Build the project:**
    ```bash
    mvn clean package
    ```
2.  **Run the application:**
    ```bash
    java -jar target/flight-delay-*.jar
    ```
    The application will be available at `http://localhost:8080`.

### Using Docker (with Makefile)

The provided `Makefile` simplifies Docker operations. Ensure Docker is running.

1.  **Build the Docker image:**
    ```bash
    make build
    ```
2.  **Run the container (foreground):**
    ```bash
    make run
    ```
3.  **Run the container (detached):**
    ```bash
    make run-detached
    ```
4.  **Stop the container:**
    ```bash
    make stop
    ```
5.  **View logs of the container:**
    ```bash
    make logs
    ```

The application will be available at `http://localhost:8080`.
