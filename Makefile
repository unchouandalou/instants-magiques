GEM=gem
BUNDLE_PATH=vendor/bundle
BUNDLE_BIN=$(BUNDLE_PATH)/bin/bundle
export GEM_PATH:=$(PWD)/vendor/bundle

# help: help        Display callable targets
help:
	@echo "Please use \`make <target>' where <target> is one of"
	@echo
	@sed -n '/^# help:/{s/# help: /    /;p;}' $(lastword $(MAKEFILE_LIST)) | LC_ALL=C sort
	@echo

# help: install     Install bundler
install:
	${GEM} install --install-dir $(BUNDLE_PATH) bundler

# help: clean       Remove dependencies
clean:
	rm -Rf vendor

# help: update      Install and update dependencies
update:
	$(BUNDLE_BIN) install --path $(BUNDLE_PATH)

# help: serve       Launch server
serve:
	$(BUNDLE_BIN) exec jekyll serve -w

# help: build       Build project for production
build:
	$(BUNDLE_BIN) exec jekyll build
