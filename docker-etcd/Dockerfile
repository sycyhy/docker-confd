FROM        alpine:3.4

ADD 		https://github.com/coreos/etcd/releases/download/v2.3.7/etcd-v2.3.7-linux-amd64.tar.gz /home/

RUN 		cd /home && \
			tar -xvzf etcd-v2.3.7-linux-amd64.tar.gz && \
			cd etcd-v2.3.7-linux-amd64 && \
			mv etcd /bin/ && \ 
			mv etcdctl /bin/

RUN 		cd /home && \
			rm -rf *
			
VOLUME      /data

EXPOSE      2379 2380 4001 7001

ENTRYPOINT ["/bin/etcd"]
CMD ["-data-dir=/data"]