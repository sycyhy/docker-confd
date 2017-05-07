FROM logstash:5.1.1

RUN logstash-plugin install logstash-filter-multiline

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["-e", ""]
