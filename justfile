default:
    @just --list

build:
    sudo podman build -t grampi:latest .

convert-image:
	sudo podman run --rm -it --privileged --pull=newer \
	    --security-opt label=type:unconfined_t \
	    -v ./config.toml:/config.toml:ro \
	    -v ./output:/output \
	    -v /var/lib/containers/storage:/var/lib/containers/storage \
	    quay.io/centos-bootc/bootc-image-builder \
	    --type raw \
	    --rootfs=xfs \
	    --use-librepo=true \
	    localhost/grampi:v1
