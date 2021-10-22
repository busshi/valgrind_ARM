### VALGRIND ON ARM PROCESSOR WITH DOCKER


- Usage:
```bash
/bin/bash valgrind_docker.sh [PROJECT_PATH] [ARG1] [ARG2]
```

If there is a Makefile, no ARG2. ARG1 is the arguments passed to valgrind after the binary.

If there is no Makefile, ARG1 is the file(s) name(s). ARG2 is the arguments passed to valgrind.


- Cleaning/purge:
```bash
./valgrind_docker.sh clean
```

Note: You can change commands to run in the entrypoint.sh...


Examples:
- with a Makefile:
```bash
./valgrind_docker.sh ../CPP/CPP/cpp00/ex00
./valgrind_docker.sh ../CPP/CPP/cpp00/ex00 "hello goodbye"
```

- without Makefile but with compilation:
```bash
/valgrind_docker.sh ../exam_rank04 microshell.c "/bin/ls ; echo hello ; /bin/echo hello whats up ? | /usr/bin/wc -c"
```
