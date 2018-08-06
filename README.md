# pop3-imap
Docker image that maps pop3 requests to imap

Run container `docker run -ti -p 995:995 --name pop3-imap-instance -e "VIRTUAL_HOST=<POP3_IMAP_SERVER_URL>" -e "LETSENCRYPT_HOST=<POP3_IMAP_SERVER_URL>" -e "LETSENCRYPT_EMAIL=<CONTACT_EMAIL>" --rm raedle/pop3-imap`