.DEFAULT_GOAL := help

init: ## Initialize repository
	git config core.hooksPath .githooks
	git config commit.template .gitmessage

format: ## Run formatters
	@echo Formatting...
	@yamlfmt .

lint: ## Run linters
	@echo Linting...
	@check-jsonschema --builtin-schema vendor.github-workflows ./.github/workflows/*.yml
	@check-jsonschema --builtin-schema vendor.renovate ./.github/renovate*.json
	@actionlint
	@yamlfmt -lint .
	@yamllint .
	@brew style .

help: ## Show help message
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m\033[0m\n"} /^[$$()% 0-9a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

.PHONY: format help init lint
