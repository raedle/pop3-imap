FROM python:alpine

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
CMD python -m aiopopd -b $HOSTNAME -H imap.au.dk -p 993 --imap-ssl -P 995 -n
# CMD python -m aiopopd -H imap.au.dk -p 993 --imap-ssl -P 9955 -n --ssl-key key.pem --ssl-cert fullchain.pem --ssl-generate