#!/bin/bash

cd elasticsearch
docker build -t elasticsearch .

cd ..
cd kibana
docker build -t kibana .

cd ..
cd logstash
docker build -t logstash .