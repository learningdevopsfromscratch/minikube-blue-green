helm:
	helm upgrade --install blue-green ./blue-green

build-and-push:
	docker build -t davidbour/minikube-blue-green:latest ./fastapi-app && \
	docker push davidbour/minikube-blue-green:latest

clean:
	helm uninstall blue-green
