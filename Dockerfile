FROM bitnami/kubectl:latest as kubectl
FROM alpine/helm:latest as helm

FROM summerwind/actions-runner:latest

COPY --from=kubectl /opt/bitnami/kubectl/bin/kubectl /usr/local/bin/
COPY --from=helm /usr/bin/helm /usr/local/bin/

RUN sudo apt-get update && \
    sudo apt-get install -y gettext && \
    sudo apt-get clean && sudo rm -rf /var/cache/apt/* && sudo rm -rf /var/lib/apt/lists/* && sudo rm -rf /tmp/*