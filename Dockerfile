FROM python:alpine

ENV EF_IMAP_SERVER=EF_IMAP_SERVER \
    EF_SSL_KEY=EF_SSL_KEY \
    EF_SSL_CERT=EF_SSL_CERT

# Run on port 995 -> supported by Google Mail
EXPOSE 995

# Install pipenv
RUN pip install pipenv

# Install openssl, certbot, and bash
RUN apk add --no-cache openssl certbot bash

# Copy app files to app directory and make it workdir
COPY . /app
WORKDIR /app

# Install dependencies:
RUN pipenv install --deploy --system

# Run app
CMD python -m aiopopd -b $HOSTNAME -H ${EF_IMAP_SERVER} -p 993 --imap-ssl -P 995 -n --ssl-key ${EF_SSL_KEY} --ssl-cert ${EF_SSL_CERT}