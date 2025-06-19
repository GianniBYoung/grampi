default:
    @just --list

build:
    sudo podman build -t grampi:latest .
