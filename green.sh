#!/bin/bash

yq eval --inplace '.spec.rules[].http.paths[].backend.service.name |= sub("blue"; "green")' main-ingress.yaml && \
kubectl apply -f main-ingress.yaml