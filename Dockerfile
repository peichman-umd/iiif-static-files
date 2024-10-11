# To build:
#
# docker build -t docker.lib.umd.edu/iiif-static-files:<VERSION> -f Dockerfile .
#
# where <VERSION> is the Docker image version to create.
FROM docker.lib.umd.edu/umd-web-static-files:1.0.0

COPY docker_config/nginx/ /etc/nginx/

COPY html /usr/share/nginx/html/

RUN ln -sd /usr/share/nginx/html/viewer /usr/share/nginx/html/viewer-pcb
