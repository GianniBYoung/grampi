# sudo podman pull quay.io/countmancy/grampi:latest
sudo podman -c podman-machine-default-root run \
    --rm \
    -it \
    --arch arm64 \
    --privileged \
    --pull=newer \
    --security-opt label=type:unconfined_t \
    -v ./config.toml:/config.toml:ro \
    -v ./output:/output \
    -v /var/lib/containers/storage:/var/lib/containers/storage \
    quay.io/centos-bootc/bootc-image-builder \
    --type raw \
    --rootfs=xfs \
    --target-arch arm64 \
    --use-librepo=True \
    quay.io/fedora/fedora-bootc:42-aarch64
