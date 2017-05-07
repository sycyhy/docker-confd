FROM docker-registry.voicepin.com/java-base-app:latest

ENV ELASTICSEARCH_VERSION 2.4.1

RUN \
  cd /tmp && \
  wget http://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-$ELASTICSEARCH_VERSION.tar.gz && \
  tar -xvzf elasticsearch-$ELASTICSEARCH_VERSION.tar.gz && \
  rm -rf elasticsearch-$ELASTICSEARCH_VERSION.tar.gz && \
  mv elasticsearch-$ELASTICSEARCH_VERSION /home/elasticsearch && \
  chmod +x /home/elasticsearch/bin/elasticsearch && \
  addgroup elasticsearch && mkdir /data && adduser -s /bin/bash -D -G elasticsearch elasticsearch && \
  chown -R elasticsearch:elasticsearch /data && \
  chown -R elasticsearch:elasticsearch /home/elasticsearch

ADD ./elasticsearch.yml /home/elasticsearch/config/elasticsearch.yml
ADD ./logging.yml /home/elasticsearch/config/logging.yml

VOLUME ["/data"]

USER elasticsearch

EXPOSE 9200
EXPOSE 9300

ENTRYPOINT ["/home/elasticsearch/bin/elasticsearch"]
