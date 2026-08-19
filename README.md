# Bash System Health Checker

A Bash-based system health checker that monitors basic Linux system health, reports potential issues, logs health-check results, and can be packaged and run as a Docker container.

## Current Checks

- Current user
- Hostname
- Date and time
- Kernel version
- Internet connectivity
- Logs directory validation
- Disk usage
- Memory usage

## Features

- Command-line argument validation
- Conditional health checks
- Exit status tracking
- Reusable Bash functions
- Disk and memory usage monitoring
- Timestamped health-check runs
- Health-check logging
- Docker containerization

## Technologies

- Bash
- Linux
- AWK
- Docker
- Ubuntu

## Project Structure

```text
.
├── health_check.sh
├── Dockerfile
├── README.md
└── .gitignore
```

## Running Locally

Make the script executable:

```bash
chmod +x health_check.sh
```

Run the health checker by providing a directory:

```bash
./health_check.sh <logs-directory>
```

Example:

```bash
./health_check.sh logs
```

The script checks whether the provided directory exists and uses the exit status to indicate whether a health check passed or encountered an issue.

## Logging

Health-check output is automatically written to:

```text
health_check.log
```

The log contains timestamped health-check runs while also displaying the output in the terminal.

The generated log file is excluded from Git using `.gitignore`.

## Docker

The health checker can also be packaged and executed as a Docker container.

### Build the Docker Image

```bash
docker build -t health-checker .
```

### Run the Container

```bash
docker run --rm health-checker
```

The Docker image uses Ubuntu as its base image and installs the `iputils-ping` package required by the health checker.

## Dockerfile

The Dockerfile:

- Uses Ubuntu as the base image
- Installs the required `ping` dependency
- Copies the health-check script into the image
- Makes the script executable
- Defines the health checker as the default container command

The main Docker instructions used are:

```dockerfile
FROM
RUN
COPY
CMD
```

## What I Learned

This project was built progressively to practice Linux, Bash, and DevOps concepts.

### Version 1 — Bash System Health Checker

- Bash variables
- Command substitution
- Conditional statements
- Command-line arguments
- AWK
- Functions
- Exit codes
- Disk and memory monitoring
- Network connectivity checks

### Version 2 — Logging

- Output redirection
- `tee`
- Log files
- Timestamps
- `.gitignore`
- Separating generated files from source code

### Version 3 — Docker

- Docker images
- Docker containers
- Dockerfiles
- Docker build context
- `FROM`
- `RUN`
- `COPY`
- `CMD`
- Container dependencies
- Docker and WSL2 integration
- Running a Bash application inside a container

## Version History

### V1 — System Health Checker

Created a Bash script capable of performing basic Linux system health checks and returning appropriate exit codes.

### V2 — Logging

Added timestamped logging while maintaining terminal output using `tee`.

### V3 — Dockerization

Created a Docker image containing the health checker and its required dependencies, allowing the script to run inside a Docker container.

## Future Improvements

- Add configurable health thresholds
- Add CPU usage monitoring
- Add more system health checks
- Improve error reporting
- Add persistent Docker volumes for logs
- Automate health checks with scheduled execution
- Add container health checks
- Integrate the project into a CI/CD workflow

## Author

**Uleko Samuel**

Built as part of my hands-on Linux and DevOps learning journey.