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

clean-build:
	rm -rf ${BUILD_DIR}

clean-quiz:
	rm -rf ${SRIP_DIR};cd ${SRC_DIR}/lab/;rm -rf quiz.html;rm -rf quiz-data.json;cd ${SRC_DIR}/lab/libs/;rm -rf evaluate.js;rm -rf index.css;rm -rf label.css; 	
run:
	cd ${BUILD_DIR};python -m SimpleHTTPServer 8000

