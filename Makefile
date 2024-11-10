.PHONY: install
install:
	jb install

.PHONY: generate
generate:
	jsonnet -J vendor/ main.jsonnet -cm out/

.PHONY: buildimage
buildimage:
	export DOCKER_BUILDKIT=0
	export COMPOSE_DOCKER_CLI_BUILD=0
	docker build -t jsonnet:local github.com/mateusz-uminski/dockerfiles#jsonnet-v0.1.0:/jsonnet
	docker build -t custom-grafana .

.PHONY: rungrafana
rungrafana:
	docker run \
		-it --rm -p 3000:3000 \
		-e GF_AUTH_DISABLE_LOGIN_FORM=true \
		-e GF_AUTH_ANONYMOUS_ENABLED=true \
		custom-grafana

.PHONY: tests
tests:
	buildimage rungrafana

.PHONY: clean
clean:
	rm -rf vendor/
	rm -rf out/
