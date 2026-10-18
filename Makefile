FLAVOR ?= staging

.PHONY: help
help: ## List available targets.
	@awk -F ':.*## ' '/^[a-zA-Z0-9_-]+:.*## / { printf "%-18s %s\n", $$1, $$2 }' Makefile
	@printf "\n"

.PHONY: gita
gita: ## for me
	@git add . && git commit --amend --no-edit && git push -f

.PHONY: install
install: ## Install tools or dev dependencies
	@lefthook install

.PHONY: run
run: ## Start dev web server.
	@flutter run -d web-server --web-hostname 0.0.0.0 --web-port 4000

.PHONY: preview
preview: ## Start preview web server.
	@flutter widget-preview start --web-server

.PHONY: run-app
run-app: ## Run on Android/iOS. Override flavor: make run-app FLAVOR=production
	@flutter run --flavor $(FLAVOR)

.PHONY: build-apk
build-apk: ## Build release APK. Override flavor: make build-apk FLAVOR=production
	@flutter build apk --flavor $(FLAVOR) --release

.PHONY: format
format: ## Format dart files.
	@dart format lib/
	@dart fix lib/ --apply

.PHONY: lint
lint: ## Analyze project files.
	@flutter analyze
	@dart run bloc_tools:bloc lint .

.PHONY: test
test: ## Test project files.
	@flutter test

.PHONY: pub-outdated
pub-outdated: ## Check outdated packages.
	@flutter pub outdated

.PHONY: pub-upgrade
pub-upgrade: ## Update outdated packages to latest.
	@flutter pub upgrade

.PHONY: gen-l10n
gen-l10n: ## Regenerate localizations from lib/l10n/*.arb.
	@flutter gen-l10n

.PHONY: gen-bloc
gen-bloc: ## Generate new bloc components
	@dart run bloc_tools:bloc new bloc

.PHONY: gen-splash
gen-splash: ## Regenerate the native launch screen from flutter_native_splash.yaml.
	@dart run flutter_native_splash:create

.PHONY: gen-icons
gen-icons: ## Regenerate the launcher and app icons from flutter_launcher_icons.yaml.
	@dart run flutter_launcher_icons

.PHONY: gen-build
gen-build: ## Generate code (freezed, json_serializable).
	@dart run build_runner build

.PHONY: gen-watch
gen-watch: ## Generate code (freezed, json_serializable).
	@dart run build_runner watch
