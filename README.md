# pop3-imap
Docker image that maps pop3 requests to imap

## Setup SSL

It is possible to set up the pop3-imap with SSL. For example, the `docker-letsencrypt-nginx-proxy-companion` offers support for letsencrypt certificates that automatically renew. Follow the instructions on [docker-letsencrypt-nginx-proxy-companion](https://github.com/JrCs/docker-letsencrypt-nginx-proxy-companion) on how to set up the `nginx` container as well as the `nginx-proxy-companion`.

## Run the container

When the `nginx-proxy-companion` is set up, run a `pop3-imap` docker container with the following command (adjust path accordingly).

```
docker run -dit \
    --name pop3-imap-instance \
    --restart=always \
    -p 995:995 \
    -e "VIRTUAL_HOST=pop3-imap.example.com" \
    -e "LETSENCRYPT_HOST=pop3-imap.example.com" \
    -e "LETSENCRYPT_EMAIL=contact@example.com" \
    -e "EF_IMAP_SERVER=imap.another-example.com" \
    -e "EF_SSL_KEY=/certs/key.pem" \
    -e "EF_SSL_CERT=/certs/fullchain.pem" \
    -v /path/to/certs:/certs:ro \
    raedle/pop3-imap
```