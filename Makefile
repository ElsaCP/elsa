VERSION=0.0.3
PATH_BUILD=build/
FILE_COMMAND=heft
FILE_ARCH=darwin_amd64
S3_BUCKET_NAME=downloads.heft.io

clean:
	@rm -rf ./docs/release/build

build: clean build-version

build-version:
	@echo "Building v$(VERSION)"
	@$(GOPATH)/bin/goxc \
	  -pv=$(VERSION) \
	  -build-ldflags "-X main.VERSION=$(VERSION)"

version:
	@echo $(VERSION)

install:
	@install -d -m 755 '$(HOME)/bin/'
	install $(PATH_BUILD)$(VERSION)/$(FILE_ARCH)/$(FILE_COMMAND) '$(HOME)/bin/$(FILE_COMMAND)'

deploy:
	aws s3 sync $(PATH_BUILD)/$(VERSION) s3://$(S3_BUCKET_NAME)/$(VERSION)
