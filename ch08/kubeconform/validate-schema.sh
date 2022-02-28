#! /bin/sh

helm dependency update traefik-umbrella 
helm template traefik-umbrella –include-crds --values traefik-umbrella/values.yaml --namespace traefik --output-dir out 

# validating 1.21 with apiextensions.k8s.io/v1beta1
docker run -v $(pwd)/out:/templates ghcr.io/yannh/kubeconform:v0.4.12-amd64 -kubernetes-version 1.21.0 -skip IngressRoute -schema-location default -schema-location 'https://jenkins-x.github.io/jenkins-x-schemas/apiextensions.k8s.io/v1beta1/customresourcedefinition.json' /templates


# validating 1.22 apiextensions.k8s.io/v1
docker run -v $(pwd)/out:/templates ghcr.io/yannh/kubeconform:v0.4.12-amd64 -kubernetes-version 1.22.0 -skip IngressRoute -schema-location default -schema-location 'https://jenkins-x.github.io/jenkins-x-schemas/apiextensions.k8s.io/v1/customresourcedefinition.json' /templates
