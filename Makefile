export KURENTO_VERSION=$(shell cat KURENTO_VERSION)

target = $(word 1,$(subst ., ,$@))
sub1 = $(word 2,$(subst ., ,$@))
sub2 = $(word 3,$(subst ., ,$@))

prepare: docker.amzn2 docker.el7 docker.ubuntu
	@scripts/prepare.sh

docker.%:
	@docker compose build --no-cache --progress=plain $(sub1)

run.%:
	@if [ "$(shell docker compose ps $(sub1) | tail -1 | awk '{print $4}')" != "running" ]; then \
		docker compose create $(sub1); \
		docker compose start $(sub1); \
	fi

exec.%:
	@docker compose exec $(sub1) /scripts/$(sub2).sh

build.amzn2.deps: run.amzn2 exec.amzn2.build-amzn2-deps
	@docker compose stop $(sub1)
	@docker compose rm --force $(sub1)

build.amzn2: run.amzn2 exec.amzn2.build-amzn2

build.el7.deps: run.el7 exec.el7.build-el7-deps
	@docker compose stop $(sub1)
	@docker compose rm --force $(sub1)

build.el7: run.el7 exec.el7.build-el7

build.ubuntu: run.ubuntu exec.ubuntu.build-ubuntu

build: build.amzn2.deps build.amzn2 build.ubuntu

down:
	@docker compose down

clean: down
	rm -rf {kms,packages}

version:
	@echo Kurento $(KURENTO_VERSION)

.PHONY: prepare run.% exec.% build.amzn2.deps build.amzn2 build.ubuntu build down clean version
