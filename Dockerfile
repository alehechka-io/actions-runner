FROM bitnami/kubectl:latest as kubectl
FROM alpine/helm:latest as helm

FROM summerwind/actions-runner:latest

COPY --from=kubectl /opt/bitnami/kubectl/bin/kubectl /usr/local/bin/
COPY --from=helm /usr/bin/helm /usr/local/bin/

# Add GitHub CLI repository
RUN curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
RUN sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null

# Add yq repository
RUN sudo add-apt-repository ppa:rmescandon/yq

# Install tools
RUN sudo apt-get update
RUN sudo apt-get install -y \
        gettext \
        gh \
        yq
    
# Cleanup after install
RUN sudo apt-get clean && sudo rm -rf /var/cache/apt/* && sudo rm -rf /var/lib/apt/lists/* && sudo rm -rf /tmp/*