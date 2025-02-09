
## Overview
This guide demonstrates how to set up real-time monitoring on a Linux directory to detect filesystem events. When an event occurs, the system logs the corresponding file names in a log file located in the `/tmp` directory.

The source files for this example are available on GitHub.

## Files

- **`Dockerfile`**: Defines the Docker image build process.
- **`monitor.sh`**: Monitors the `/incoming_folder` directory for filesystem events.
- **`handler.sh`**: Executed by `monitor.sh` when a filesystem event is detected, logging the affected file name.

## Usage

To set up the monitoring system, follow these steps:

1. **Clone the Git Repository**, then build and run the Docker container:
   ```bash
   docker build -t file-monitor:v1 .
   docker run file-monitor:v1
   ```

2. **Access the Running Container**:
   Open a new terminal window and execute:
   ```bash
   docker ps  # Lists running containers
   docker exec -it <container-id> /bin/sh
   ```

3. **Trigger Filesystem Events**:
   Navigate to the monitored folder and create test files:
   ```bash
   cd /incoming_folder
   echo "Hello " > hello.txt
   echo "Hello 2" > hello2.txt
   ```

4. **View Logged Events**:
   Monitor the log file to observe the captured filesystem events:
   ```bash
   tail -f /tmp/event_log.txt
   ```
   Example output:
   ```
   A file create event was triggered for: {hello.txt}
   A file create event was triggered for: {hello2.txt}
   ```

This setup ensures real-time monitoring of directory changes, making it useful for automated processing workflows.