#! /bin/sh

helm dependency update traefik-umbrella 

helm template traefik-umbrella –include-crds --values traefik-umbrella/values.yaml --namespace traefik --output-dir out 

git checkout main 

helm dependency update traefik-umbrella 

helm template traefik-umbrella –include-crds --values traefik-umbrella /values.yaml --namespace traefik --output-dir out-default-branch 

diff -r out-default-branch out || true
