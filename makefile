BASE_PATH        := $(shell pwd | sed 's/ /\\ /g')

# default: help

.PHONY: help

help:
	@grep -E --no-filename '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

setup: ## Setup BASF OLS stack
	@helm install -n ols-basf ols-basf  helm-charts/ols-basf

update: ## Update kubernetes manifest with latest modifications
	@helm install -n ols-basf ols-basf  helm-charts/ols-basf

destroy: ## Update kubernetes manifest with latest modifications
	@helm uninstall -n ols-basf ols-basf