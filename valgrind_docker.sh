#!/bin/bash


case "$1" in
	"clean")
		docker system prune --volumes --all --force
		exit 0
		;;
esac


[ -z "$1" -o -z "$2" ] && { echo "Usage: ./valgrind_docker.sh [PATH_TO_PROJECT] [BINARY_NAME_TO_RUN]"; exit 1; }


DIR="$1"
PROJECT=$( echo ${DIR} | rev | cut -d"/" -f1 | rev )

BIN="$2"

cp -r ${DIR} .

cp Dockerfile.sample Dockerfile

echo "ENTRYPOINT	[ \"/bin/bash\", \"entrypoint.sh\", \"${BIN}\" ]" >> Dockerfile

docker build --build-arg DIR=${PROJECT} -t valgrind:latest .
docker run -it --rm valgrind


rm -rf ${PROJECT}
rm Dockerfile


exit 0
