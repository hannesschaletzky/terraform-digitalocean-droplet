# test cloud-init locally with multipass

[documentation cloud-init](https://multipass.run/docs/create-an-instance#heading--create-an-instance-with-a-specific-image)

[example cloud-config](https://github.com/ecoinomist/cloud-init-config-docker-letsencrypt-nginx/blob/master/cloud-config.yml)

## install multipass

```
brew install multipass
```

## start vm with ubuntu 23.04 image

```
multipass launch lunar --name test-vm --cloud-init cloud-init.yaml
```

> see available images with multipass find

## shell into vm

```
multipass shell test-vm
```

## delete vm

```
multipass stop test-vm
multipass delete test-vm
multipass purge
multipass list
```

## check status after creation

```
sudo cloud-init status
sudo cat /var/log/cloud-init.log
sudo cat /var/log/cloud-init-output.log

```

# certbot installation on vm

```
apt install certbot
apt install python3-certbot-nginx
```

OR

```
snap install --classic certbot
```
