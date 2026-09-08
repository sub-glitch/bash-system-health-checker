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
- Configurable health-check thresholds
- Conditional health checks
- Exit status tracking
- Reusable Bash functions
- Disk and memory usage monitoring
- Timestamped health-check runs
- Health-check logging
- Input validation
- Docker containerization
- Docker argument support

## Technologies

- Bash
- Linux
- AWK
- Docker
- Ubuntu

## Project Structure

```text
.
├──.github/
   └──workflows/
    └──health_CI.yml 
├── health_check.sh
├── Dockerfile
├── compose.yml
├── README.md
├── .gitignore
└── logs/
```

## Running Locally

Make the script executable:

```bash
chmod +x health_check.sh
```

Run the health checker by providing a directory and a threshold:

```bash
./health_check.sh <directory> <threshold>
```

Example:

```bash
./health_check.sh /tmp 80
```

The first argument specifies the directory that should exist.

The second argument specifies the percentage threshold used for disk and memory checks.

If disk or memory usage exceeds the provided threshold, the check is marked as `HIGH`.

The script also validates the number of arguments, the directory path, and the threshold value before running the health checks.

## Logging

Health-check output is automatically written to:

```text
logs/health_check.log
```

The log contains timestamped health-check runs while also displaying the output in the terminal.

The generated log file is excluded from Git using `.gitignore`.

## Exit Codes

The script uses exit codes to indicate the result of the health check.

```text
0       All health checks passed
Non-zero    One or more health checks failed
```

## Docker

The health checker can also be packaged and executed as a Docker container.

### Build the Docker Image

```bash
docker build -t health-checker .
```

### Run the Container

The Dockerfile provides default values for the directory and threshold.

```bash
docker run --rm health-checker
```

This runs the equivalent of:

```bash
/health_check.sh /tmp 80
```

### Run With a Custom Threshold

The default threshold can be overridden when starting the container:

```bash
docker run --rm health-checker /tmp 50
```

This runs the equivalent of:

```bash
/health_check.sh /tmp 50
```

The container accepts the same directory and threshold arguments as the local Bash script.

## Docker Compose

Docker Compose is used to define and run the health checker with its required configuration.

### Start the Health Checker

```bash
docker compose up
```

The Compose configuration builds the health checker using the existing Dockerfile and mounts the `logs/` directory from the host into the container.

### Persistent Logs

The log is written inside the container to:

`/logs/health_check.log`

The `logs/` directory is mounted using Docker Compose, so the log is also available on the host:

`logs/health_check.log`

This means the log remains available even after the container is stopped or removed.

### Stop the Container

```bash
docker compose down
```


## Dockerfile

The Dockerfile:

- Uses Ubuntu as the base image
- Installs the required `ping` dependency
- Copies the health-check script into the image
- Makes the script executable
- Uses `ENTRYPOINT` to define the health checker
- Uses `CMD` to provide default arguments

The main Docker instructions used are:

```dockerfile
FROM
RUN
COPY
ENTRYPOINT
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

### Version 4 — Configurable Health Monitoring

- Positional arguments
- Argument count validation
- Input validation
- Regular expressions
- Configurable thresholds
- Error handling
- Reusable health-check functions
- Docker `ENTRYPOINT`
- Docker `CMD`
- Passing arguments into containers
- Default and custom Docker arguments

###  Version 5 — Docker Compose

- Docker Compose
- YAML
- Compose services
- `build`
- Volume mounts
- Persistent container data
- Host-to-container filesystem mapping
- `docker compose up`
- `docker compose down`

### Version 6 — GitHub Actions

- GitHub Actions
- CI/CD
- Workflow files
- YAML
- GitHub Actions runners
- `actions/checkout`
- Automated testing
- Workflow triggers
- Exit codes and CI status

## Version History

### V1 — System Health Checker

Created a Bash script capable of performing basic Linux system health checks and returning appropriate exit codes.

### V2 — Logging

Added timestamped logging while maintaining terminal output using `tee`.

### V3 — Dockerization

Created a Docker image containing the health checker and its required dependencies, allowing the script to run inside a Docker container.

### V4 — Configurable Health Monitoring

Improved the health checker by adding configurable thresholds, argument validation, input validation, and improved error handling.

Updated the Docker configuration to support default and custom arguments using `ENTRYPOINT` and `CMD`.

### V5 — Docker Compose

Added Docker Compose to manage the health checker and configured a volume to persist health-check logs outside the container.


### V6 — GitHub Actions

Added a GitHub Actions workflow that automatically runs the health checker whenever changes are pushed to the repository.

## Future Improvements

- Add CPU usage monitoring
- Add more system health checks
- Improve error reporting
- Automate health checks with scheduled execution
- Add container health checks


## Author

**Uleko Samuel**

Built as part of my hands-on Linux and DevOps learning journey.