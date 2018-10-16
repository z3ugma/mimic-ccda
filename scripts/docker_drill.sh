# !/bin/bash
docker run \
--name drill \
-p 8047:8047 \
-v $PWD/fhir/data:/data \
-d -t drill/apache-drill:1.14.0
