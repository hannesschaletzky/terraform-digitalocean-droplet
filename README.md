# test cloud-init locally with multipass

[docs](https://multipass.run/docs/create-an-instance#heading--create-an-instance-with-a-specific-image)

## install multipass

brew install multipass

## start vm with ubuntu 23.04 image

multipass launch lunar --name test-vm --cloud-init cloud-init.yaml

> see available images with multipass find

## shell into vm

multipass shell test-vm

## delete vm

multipass stop test-vm\
multipass delete test-vm\
multipass purge\
multipass list
