SHELL := /bin/bash
PWD=$(shell pwd)
SRC_DIR=${PWD}/src
BUILD_DIR=${PWD}/build
SRIP_DIR=${PWD}/srip-quiz
STATUS=0

all: get-quiz-lib build

init:
	./init.sh

get-quiz-lib: init 

build: 
	mkdir ${BUILD_DIR};rsync -avz --progress ${SRC_DIR}/* ${BUILD_DIR}

clean:
	rm -rf ${BUILD_DIR}
	rm -rf ${SRIP_DIR}




