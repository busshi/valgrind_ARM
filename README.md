### VALGRIND ON ARM PROCESSOR WITH DOCKER


- Usage:
/bin/bash valgrind_docker.sh [PROJECT_PATH] [ARG1] [ARG2]

If there is a Makefile, no ARG2. ARG1 is the arguments passed to valgrind after the binary.
If there is no Makefile, ARG1 is the file(s) name(s). ARG2 is the arguments passed to valgrind.


- Cleaning/purge:
./valgrind_docker.sh clean


Note: You can change commands to run in the entrypoint.sh...
