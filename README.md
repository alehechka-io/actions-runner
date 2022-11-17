# actions-runner

Custom implementation of the `actions-runner` image from [actions-runner-controller](https://github.com/actions-runner-controller/actions-runner-controller).

This repo provides the custom [Dockerfile](Dockerfile) which acts as a wrapper to the default `summerwind/actions-runner` image and adds some useful tools to make GHA faster and not need to setup extra tools.

Currently includes:

- kubectl
- helm
- gettext
  - envsubst

### Helm Deployment

```bash
helm repo add actions-runner-controller https://actions-runner-controller.github.io/actions-runner-controller

helm upgrade --install --wait \
    --namespace actions-runner-system --create-namespace \
    -f https://raw.githubusercontent.com/lockerstock/actions-runner/main/actions-runner.values.yaml \
    actions-runner-controller actions-runner-controller/actions-runner-controller
```
