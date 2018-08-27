VERSION=0.0.1
PATH_BUILD=docs/release/
FILE_COMMAND=elsa-cli
FILE_ARCH=linux_amd64
S3_BUCKET_NAME=downloads.heft.io

clean:
	@rm -rf ./docs/release/build

build: clean build-version

build-version:
	@echo "Building v$(VERSION)"
    for GOARCH in 386 amd64;
      do go build -v -o $(PATH_BUILD)/$(FILE_COMMAND)-v$(VERSION)-$GOARCH
    done

	#@$(GOPATH)/bin/goxc \
	#  -pv=$(VERSION) \
	#  -build-ldflags "-X main.VERSION=$(VERSION)"

version:
	@echo $(VERSION)

install:
	@install -d -m 755 '$(HOME)/bin/'
	install $(PATH_BUILD)$(VERSION)/$(FILE_ARCH)/$(FILE_COMMAND) '$(HOME)/bin/$(FILE_COMMAND)'

deploy:
	aws s3 sync $(PATH_BUILD)/$(VERSION) s3://$(S3_BUCKET_NAME)/$(VERSION)
