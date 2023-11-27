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

# steps to do on droplet

## ssl for domains

```
certbot --nginx
```

## private key for git

```
touch id_rsa in ~/.ssh folder
copy key into file with nano id_rsa
chmod 400 ~/.ssh/id_rsa
```

## allow large file upload

https://nginx.org/en/docs/http/ngx_http_core_module.html#client_max_body_size

```
client_max_body_size 0;
```

in server block to not check for any body size
