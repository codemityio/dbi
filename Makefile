-include Makefile.env
-include Makefile.env.local

default: help

help: ## Prints help for targets with comments
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' Makefile | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

version: ## Print the most recent version
	@scripts/tools.sh version

next: ## Create a new version (bump prerelease or patch)
	@scripts/tools.sh next

###############
## B U I L D ##
###############

build: ## Build all images
	@scripts/build.sh

buildx: ## Build all images (multi-platform)
	@scripts/buildx.sh

#################
## D O C K E R ##
#################

tag: ## ECR tag images
	@scripts/docker.sh tag

push: ## ECR push images
	@scripts/docker.sh push

##########################
## D A N G E R  Z O N E ##
##########################

reset: ## Reset the environment
	@docker system prune <<< y || true
	@docker volume prune <<< y || true
	@rm -R -f tmp || true
	@rm -R -f var || true

#############
## D O C S ##
#############

docs: ## Generate all docs
	@scripts/docs.sh main
