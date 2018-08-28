#!make
include .makerc
export $(shell sed 's/=.*//' .makerc)

VERSION=0.0.2
BUILD_DATE=$(shell date)
BUILD_PATH=docs/release
FILE_NAME=elsa-cli
OUTPUT=$(BUILD_PATH)/$(FILE_NAME)-v$(VERSION)

clean:
	@rm -rf ./docs/release/*

build: clean build-version

build-version:
	@echo "Building version $(VERSION)\nBuild date: $(BUILD_DATE)"
	@$(shell perl -pi -e 's#(.*VERSION.*=\x20)(.*)#$${1}"$(VERSION)"#' main.go)
	@$(shell perl -pi -e 's#(.*BUILD_DATE.*=\x20)(.*)#$${1}"$(BUILD_DATE)"#' main.go)

	@echo "Building version $(VERSION) for Linux x64"
	@$(shell perl -pi -e 's#(.*BUILD_ARCH.*=\x20)(.*)#$${1}"x64"#' main.go)
	env GOOS=linux GOARCH=amd64 go build -o $(OUTPUT)-x64

	# @for GOARCH in 386 amd64 ; do \
	# 	${shell perl -pi -e 's#(.*BUILD_ARCH.*=\x20)(.*)#$${1}"'${$$GOARCH}'"#' main.go} \
    #     env GOOS=linux GOARCH=$$GOARCH go build -o $(OUTPUT)-$$GOARCH ; \
	# done

version:
	@echo "Version: $(VERSION) - $(BUILD_DATE)"

install:
	@echo "Installing $(FILE_NAME) to system"
	@install -d -m 755 '/usr/local/bin/'

    ifeq ($(shell uname -p), x86_64)
		install $(OUTPUT)-x64 '/usr/local/bin/ecp'
	else
		install $(OUTPUT)-x86 '/usr/local/bin/ecp'
    endif

release:
	@echo "Releasing v$(VERSION) to Github"
