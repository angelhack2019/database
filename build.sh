#!/usr/bin/env bash

# combine all *.up.sql files into one sql file for docker build to consume
cat migrations/*.up.sql > dough_you_schema.sql

# build an image from a docker file, -t = name and optionally a tag in the 'name:tag' format
# docker build [OPTIONS] PATH
docker build \
--build-arg user=default \
--build-arg password=default \
--build-arg db_name=dough_you \
-t doughyou/db:latest .


# push an image or a repo to a registry
# docker push [OPTIONS] NAME[:TAG]
docker push doughyou/db:latest