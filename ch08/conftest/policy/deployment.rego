package main

deny[msg] {
	input.kind == "Deployment"
    container_registry_image := input.spec.template.spec.containers[_].image
    output = split(container_registry_image, "/")
    not valid_container_registry(output)
    msg = "invalid container registry in the deployment"
}

valid_container_registry(imageArr) = true {
	count(imageArr) == 1
}

valid_container_registry(imageArr) = true {
	count(imageArr) > 2
    imageArr[0] == "ghcr.io"
    imageArr[1] == "_my_company_"
}
