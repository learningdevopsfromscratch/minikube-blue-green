# Installs a blue and green deployment & svc within the same namespace
helm:
	helm upgrade --install --set color=blue --set fullnameOverride=blue blue ./blue-green && \
	helm upgrade --install --set color=green --set fullnameOverride=green green ./blue-green

helm-ns:
	helm upgrade --install \
				 --create-namespace \
				 --namespace blue-deployment \
				 --set color=blue \
				 --set fullnameOverride=blue blue ./blue-green
	helm upgrade --install \
				 --create-namespace \
				 --namespace green-deployment \
				 --set color=green \
				 --set fullnameOverride=green green ./blue-green

# Switch ingress to point to the blue service in the same namespace
blue:
	./blue.sh

# Switch ingress to point to the green service in the same namespace
green:
	./green.sh

build-and-push:
	docker build -t davidbour/minikube-blue-green:latest ./fastapi-app && \
	docker push davidbour/minikube-blue-green:latest

clean:
	helm uninstall blue || true && \
	helm uninstall green || true && \
	kubectl delete ingress ingress-blue-green || true && \
	helm uninstall blue --namespace blue-deployment && \
	helm uninstall green --namespace green-deployment
