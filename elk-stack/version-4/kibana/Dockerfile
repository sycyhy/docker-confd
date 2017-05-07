FROM docker-registry.voicepin.com/alpine-base

ENV KIBANA_VERSION 4.6.1

RUN apk update && apk upgrade && apk add bash && apk add --no-cache ca-certificates openssl && update-ca-certificates && apk add wget && \
	apk add --update  nodejs \
    && cd /tmp \
    && curl -O https://download.elastic.co/kibana/kibana/kibana-${KIBANA_VERSION}-linux-x86_64.tar.gz \
    && tar -xvzf kibana*.tar.gz \
    && rm -rf kibana-*.tar.gz \
    && mv kibana* /home/kibana \
    && rm -rf /home/kibana/node && \
    mkdir -p /home/kibana/node/bin && \
    ln -sf /usr/bin/node /home/kibana/node/bin/node

ENV PATH /home/kibana/bin:$PATH

VOLUME ["/data"]

EXPOSE 5601

ENTRYPOINT ["kibana"]

