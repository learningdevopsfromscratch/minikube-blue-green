#!/bin/bash

yq eval --inplace '.spec.rules[].http.paths[].backend.service.name |= sub("green"; "blue")' main-ingress.yaml && \
kubectl apply -f main-ingress.yaml