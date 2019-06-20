SHELL := /bin/bash
PWD=$(shell pwd)
SRC_DIR=src
CODE_DIR=codes
STATUS=0

all: build 

init:
	./init.sh

build: init 
