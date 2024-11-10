brew install go-jsonnet
brew install jsonnet-bundler
jsonnet $FILE -o data.json
jb install github.com/grafana/grafonnet/gen/grafonnet-latest@main
 jb install github.com/grafana/grafonnet/gen/grafonnet-v11.1.0@main


 sonnet -J vendor main.jsonnet -cm out/

 jb install --source ./path/to/mylib

 jb install


docker build -t jsonnet:local github.com/mateusz-uminski/dockerfiles#feat/jsonnet:/jsonnet
Sending build context to Docker daemon  4.096kB

GF_AUTH_DISABLE_LOGIN_FORM=true
GF_AUTH_ANONYMOUS_ENABLED=true



This repository contains Grafana dashboards designed for automated provisioning in a Grafana instance. Dashboards are stored as JSON files under the /dashboards directory and are provisioned through YAML configuration files located in /provisioning/dashboards. This setup allows Grafana to automatically detect and load dashboards upon startup, making it easy to deploy, version, and manage dashboard configurations. Simply add your dashboard JSON files to the /dashboards folder and ensure the provisioning YAML is updated accordingly for seamless integration.


	docker run \
		-it --rm -p 3000:3000 \
		/-e GF_AUTH_DISABLE_LOGIN_FORM=true \
		-e GF_AUTH_ANONYMOUS_ENABLED=true \
		custom-grafana
