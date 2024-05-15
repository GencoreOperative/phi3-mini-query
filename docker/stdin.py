import sys
import select

# When reading from the stdin, we encounter a challenge inside
# a Docker image. We need to use the "docker run -i" flag to ensure
# that the STDIN is provided to the Docker process. However, if 
# nothing is provided, then commands that read the STDIN will
# hang forever. Therefore, we need a read with timeout feature
# that will attempt to read for 1 second. If nothing is there
# then we stop trying.

# We can demonstrate the reading of stdin inside Docker using the 
# following command:

# echo "hello" | docker run -i  ubuntu /bin/bash -c 'cat'

# However, this command fails when there is no stdin for the reason
# mentioned above.

def read_stdin(timeout=1):
    try:
        # Use select to wait for input with a timeout of 1 second
        ready, _, _ = select.select([sys.stdin], [], [], timeout)
        if ready:
            # Attempt to read all lines from STDIN
            lines = sys.stdin.readlines()
            for line in lines:
                print(line.strip())
            sys.exit(0)  # Exit after printing the values
    except KeyboardInterrupt:
        sys.exit(0)  # Exit gracefully if interrupted by Ctrl+C

if __name__ == "__main__":
    read_stdin()
