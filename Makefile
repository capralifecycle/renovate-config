.PHONY: all
all: build

.PHONY: build
build:
	@echo "Building..."
	npm install
	@./validate.sh
	npx commitlint <<< "chore: commitlint test-run"
