PRECOMMIT = prek

##@ Utility

.PHONY: help
help:  ## Display this help
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m\033[0m\n"} /^[a-zA-Z0-9_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

##@ Setup

.PHONY: deps
deps: deps-brew install-precommit deps-peru ## Install dependencies

.PHONY: deps-brew
deps-brew: Brewfile ## Installs Homebrew provided deps
	brew bundle install --verbose --file=Brewfile

.PHONY: deps-peru
deps-peru: peru.yaml ## Installs peru-tracked deps
	peru sync

# file(s) written by pre-commit setup
GIT_HOOKS = .git/hooks/pre-commit
.PHONY: install-precommit
install-precommit: $(GIT_HOOKS) ## Sets up pre-commit hooks
	@echo "Pre-commit configured, will run on future commits!"
$(GIT_HOOKS): .pre-commit-config.yaml
	$(PRECOMMIT) install

##@ Talk setup

.PHONY: new
new:
	copier copy _template $(PATH)

