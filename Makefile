-include Makefile.env
-include Makefile.env.local

default: help

help: ## Prints help for targets with comments
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' Makefile | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

version: ## Print the most recent version
	@scripts/tools.sh version

next: ## Create a new version (bump prerelease or patch)
	@scripts/tools.sh next

###########
## D E V ##
###########

prep: ## Prepare dev tools
	@scripts/tools.sh prep

diff: ## Check diff to ensure this project consistency
	@scripts/tools.sh diff

#################
## D O C K E R ##
#################

buildx: ## Build all images - multi-platform (use IMAGES env var to list specific images e.g. IMAGES=alpine make buildx)
	@scripts/docker.sh buildx

build: ## Build all images (use IMAGES env var to list specific images e.g. IMAGES=alpine make build)
	@scripts/docker.sh build

push: ## Push images
	@scripts/docker.sh push

#############
## D O C S ##
#############

docs: docs-main  ## Generate all docs
	@PACKAGES='$(shell find "${PWD}/img" -mindepth 1 -maxdepth 1 -type d -exec basename {} \; 2>/dev/null)' make docs-img

docs-main: ## Generate main docs
	@scripts/docs.sh main

docs-img: ## Generate img docs
	@scripts/docs.sh img

##########################
## D A N G E R  Z O N E ##
##########################

reset: ## Reset the environment
	@docker system prune <<< y || true
	@docker volume prune <<< y || true
	@rm -R -f tmp || true
	@rm -R -f var || true
