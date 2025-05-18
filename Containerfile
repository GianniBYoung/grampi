FROM quay.io/fedora/fedora-bootc:42-aarch64
RUN dnf install -y zsh
RUN bootc lint
