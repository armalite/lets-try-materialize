SHELL=/bin/bash -e -o pipefail
bold := $(shell tput bold)
sgr0 := $(shell tput sgr0)

.PHONY: help install check lint test hooks 
.SILENT:

output_location = "output"

MAKEFLAGS += --warn-undefined-variables
.DEFAULT_GOAL := help

## display help message
help:
	@awk '/^##.*$$/,/^[~\/\.0-9a-zA-Z_-]+:/' $(MAKEFILE_LIST) | awk '!(NR%2){print $$0p}{p=$$0}' | awk 'BEGIN {FS = ":.*?##"}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}' | sort


install: 
	cd scripts; chmod 777 materialize_install.sh
	/bin/bash ./scripts/materialize_install.sh

install-poetry:
	/bin/bash ./scripts/poetry_install.sh

###############################################################################
# Local Development Targets
#
###############################################################################


###############################################################################
# Deployment targets
#
###############################################################################


###############################################################################
# Tests
#
###############################################################################

