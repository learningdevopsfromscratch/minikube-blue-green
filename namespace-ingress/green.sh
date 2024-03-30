#!/bin/bash

yq eval --inplace '.spec.externalName = "green.green-deployment.svc.cluster.local"' cross-namespace-svc.yaml && \
kubectl apply -f cross-namespace-svc.yaml