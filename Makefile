.PHONY: build
build:
	sh ./scripts/build.sh

.PHONY: run
run:
	@echo "Running..."
	bash scripts/run.sh

.PHONY: deploy
deploy:
	sh ./scripts/artifact_registory_init.sh
	sh ./scripts/artifact_build.sh
	sh ./scripts/artifact_push_container.sh
	sh ./scripts/cloudrun_deploy_or_update_from_artifact_container.sh

.PHONY: cleanup
cleanup:
	sh ./scripts/artifact_cleanup.sh
	sh ./scripts/cloudrun_cleanup.sh

.PHONY: test
test:
	@echo "Testing..."
	bash scripts/test.sh
