#!/bin/bash

yq eval --inplace '.spec.externalName = "blue.blue-deployment.svc.cluster.local"' cross-namespace-svc.yaml && \
kubectl apply -f cross-namespace-svc.yaml
