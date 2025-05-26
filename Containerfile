FROM quay.io/fedora/fedora-bootc:42-aarch64
RUN --mount=type=cache,dst=/var/cache/libdnf5 \
--mount=type=cache,dst=/var/cache/rpm-ostree \
dnf install -y zsh
COPY quadlets/*.container /usr/share/containers/systemd
COPY quadlets/volumes/*.volume /usr/share/containers/systemd
RUN systemctl enable podman-auto-update.timer
# RUN bootc lint
