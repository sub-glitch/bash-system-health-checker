# Bash System Health Checker

A Bash script for monitoring basic Linux system health and reporting potential issues.

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

## Requirements

- Linux or WSL2
- Bash
- `awk`
- `df`
- `free`
- `ping`

## Project Structure

```text
01 health check/
├── health_check.sh
└── README.md
```

## Usage

First, make the script executable:


```bash
chmod +x health_check.sh
```

Run the health checker by providing a logs directory:

```bash
./health_check.sh <logs-directory>
```

Example:

```bash
./health_check.sh logs
```

If the directory does not exist, the script reports the issue and continues with the remaining health checks.

If no directory is provided, the script exits immediately with a failure status.

## Example Output

```text
====================
System Health Check
====================

Current User: uleko

Hostname: SUB

Date: Tue Aug 11 16:49:49 WAT 2026

Kernel release: 6.6.87.2-microsoft-standard-WSL2

--- Network ---
Internet connectivity successful

Logs directory exists

--- Storage ---
Disk usage: 1%
Disk usage is okay

--- Memory ---
Memory usage: 5%
Memory usage is okay
```

## Exit Codes

The script uses exit codes to communicate whether the health checks passed or failed.

| Exit Code | Meaning |
|---|---|
| `0` | All health checks passed |
| `1` | One or more health checks failed |

The script tracks failures using an `EXIT_CODE` variable and returns the final status after completing the checks.

## Bash Concepts Practiced

This project was built to practice several Bash and Linux concepts:

- Variables
- Command substitution
- Positional parameters
- `if`, `then`, `else`, and `fi`
- Test operators such as `-z`, `-d`, and `-gt`
- Exit codes
- Functions
- Function arguments
- Global variables
- Pipes
- `awk`
- `df`
- `free`
- `ping`
- Output redirection
- Basic Linux system administration

## Example Failure

Running the script without providing a directory:

```bash
./health_check.sh
```

produces:

```text
Please provide a directory
```

and returns:

```text
1
```

A missing logs directory is treated as a failed health check, while the script continues checking the rest of the system.

## Technologies

- Bash
- Linux
- WSL2
- awk
- Git

## Future Improvements

Planned improvements include:

- Logging health-check results to a file
- Adding timestamps to logs
- Adding more system health checks
- Improving error reporting
- Adding configurable thresholds
- Automating health checks with scheduled execution
- Integrating the script into a CI/CD workflow

## Author

**Uleko Samuel**

Built as part of a hands-on Linux and DevOps learning journey.

