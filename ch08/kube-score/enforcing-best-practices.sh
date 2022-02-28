#! /bin/sh

helm dependency update traefik-umbrella

helm template traefik-umbrella –include-crds --values traefik-umbrella/values.yaml --namespace traefik --output-dir out

docker run -v $(pwd)/out:/out -w / zegl/kube-score:v1.14.0 score out/traefik-umbrella/charts/traefik/**/*.yaml
