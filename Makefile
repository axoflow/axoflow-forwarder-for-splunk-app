APP_TREE ?= $(abspath .)
APP_VERSION := $(shell sed -nE 's|^version = ([0-9.]+)$$|\1|p' ${APP_TREE}/axoflow_forwarder/default/app.conf)
UNAME := $(shell uname)

.PHONY: build-slim
build-slim:
	@echo "Building docker image for the Splunk Packaging Toolkit..."
	docker build -f Dockerfile . -t slim-pip:latest

.PHONY: cleanup-env
cleanup-env: ## Cleanup working directory
	@echo "Cleaning up working directory..."
	find ${APP_TREE} -name "*~" -delete -o -name "#Untitled*" -delete

.PHONY: build-package
build-package: build-slim cleanup-env ## Build Splunk app package
	@echo "Building package..."
	docker run --volume ${APP_TREE}:/apps slim-pip:latest slim package /apps/axoflow_forwarder
	mv -f axoflow_forwarder-${APP_VERSION}.tar.gz axoflow_forwarder-${APP_VERSION}.spl

.PHONY: validate-package
validate-package: build-package ## Validate Splunk app package
	docker run --volume ${APP_TREE}:/apps slim-pip:latest slim validate /apps/axoflow_forwarder-${APP_VERSION}.spl

# Self-documenting Makefile
.DEFAULT_GOAL = help
.PHONY: help
help: ## Show this help
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_0-9-]+:.*?##/ { printf "  \033[36m%-16s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)
