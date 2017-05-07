FROM docker-registry.voicepin.com/java-base-app:latest

ENV LOGSTASH 2.4.0

RUN apk update && apk add --no-cache --virtual=build-dependencies && apk add bash gpgme libzmq \
	&& mkdir -p /usr/local/lib \
	&& ln -s /usr/lib/*/libzmq.so.3 /usr/local/lib/libzmq.so  \
	&& cd /tmp \
	&& curl -O https://download.elastic.co/logstash/logstash/logstash-$LOGSTASH.tar.gz \
  	&& tar -xzf logstash-$LOGSTASH.tar.gz \
  	&& mv logstash-$LOGSTASH /home/logstash \
  	&& adduser -DH -s /sbin/nologin logstash \
  	&& rm -rf /tmp/* \
  	&& rm -rf /var/cache/apk/*

ADD ./start.sh /
RUN chmod +x /start.sh
ADD ./logstash_default.conf /home/logstash/logstash_default.conf

ENV PATH /home/logstash/bin:$PATH

VOLUME ["/data"]
VOLUME ["/home/logstash/conf"]

ENTRYPOINT ["/start.sh"]
