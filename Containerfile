FROM quay.io/fedora/fedora-bootc:42-aarch64
RUN dnf install -y zsh raspberrypi-firmware kernel
COPY quadlets/*.container /usr/share/containers/systemd
COPY quadlets/volumes/*.volume /usr/share/containers/systemd
RUN systemctl enable podman-auto-update.timer
RUN bootc lint
