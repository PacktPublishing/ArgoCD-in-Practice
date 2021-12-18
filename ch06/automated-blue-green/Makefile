## Docker Build Versions
DOCKER_BUILD_IMAGE = golang:1.16.6
DOCKER_BASE_IMAGE = alpine:3.14
#######################################
# Docker
TAG ?= test
REGISTRY ?= spirosoik
CH06_IMAGE ?= ${REGISTRY}/ch06:${TAG}
################################################################################

.PHONY: build-linux
build-linux: # Building linux binaries
	@echo Building ${TAG} binary for linux
	GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -ldflags="-X 'main.BuildVersion=${TAG}'" -o bin/server ./cmd

.PHONY: build-mac
build-mac: # Building mac binaries
	@echo Building ${TAG} binary for linux
	GOOS=darwin GOARCH=amd64 CGO_ENABLED=0 go build -ldflags="-X 'main.BuildVersion=${TAG}'" -o bin/server ./cmd

.PHONY: build-image
build-image:  ## Build the docker image for mattermost-cloud
	@echo Building App Docker
	docker build \
	--build-arg DOCKER_BUILD_IMAGE=$(DOCKER_BUILD_IMAGE) \
	--build-arg DOCKER_BASE_IMAGE=$(DOCKER_BASE_IMAGE) \
	--build-arg TAG=$(TAG) \
	. -f Dockerfile -t $(CH06_IMAGE)

.PHONY: deploy
update-docker-tag: # Update the docker tag
	@echo Deploying App Docker
	yq e -i '.spec.template.spec.containers[0].image="spirosoik/ch06:${TAG}"' deployments/argo/rollout.yaml
	sed -i 's/APP_VERSION/${TAG}/g' deployments/integration-tests/integration-job.yaml
	git config user.name github-actions
	git config user.email github-actions@github.com
	git add .
	git commit -m "Release ${TAG} - Build #${BUILD_NUMBER}"
	git push

.PHONY: create-argo-app
create-argo-app: # Creates the argo app
	@echo Deploying Argo App
	argocd app create ${APP} \
	--repo https://github.com/spirosoik/argocd-rollouts-cicd.git \
	--path ${ARGOCD_PATH} \
	--dest-namespace team-demo \
	--dest-server https://kubernetes.default.svc \
	--sync-option CreateNamespace=true \
	--project ${PROJ} \
	--auth-token ${JWT} \
	--upsert

.PHONY: deploy-argo-app
deploy-argo-app: # Deploys the app
	@echo Syncing Argo App
	argocd app sync ${APP} --auth-token ${JWT}

	@echo Waiting Argo App to be healthy
	argocd app wait ${APP} --auth-token ${JWT} ${ARGOCD_STATE} --timeout 120

.PHONY: download-argo-cli
download-argo-cli: # Downloads the Argo CLI
	@echo Downloading Argo CLI
	curl -sSL -o /usr/local/bin/argocd https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
	chmod +x /usr/local/bin/argocd

.PHONY: clean-tests-on-success
clean-tests-on-success:
	@echo Cleaning smoke tests on success
	argocd app delete ${APP} --auth-token ${JWT}
	
.PHONY: check-linet
check-lint: ## Checks if golangci-lint exists
	@if ! [ -x "$$(command -v golangci-lint)" ]; then \
		echo "Downloading golangci-lint..."; \
		go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest; \
	fi;

.PHONY: lint
lint: check-lint # Run lint in go
	golangci-lint run ./...

.PHONY: push-image
push-image: build-image # Docker push
	@echo Pushing docker image
	docker push ${CH06_IMAGE}
