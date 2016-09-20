FROM alpine:3.4

# Install bash
RUN apk add --update bash && rm -rf /var/cache/apk/*

ENV HOME_DIRECTORY /home/app

# Download confd 
ADD https://github.com/kelseyhightower/confd/releases/download/v0.11.0/confd-0.11.0-linux-amd64 /bin/confd
RUN chmod +x /bin/confd
COPY confd /etc/confd

RUN mkdir -p /home/app/conf

ADD start.sh /
RUN chmod +x /start.sh

ENTRYPOINT ["/start.sh"]

