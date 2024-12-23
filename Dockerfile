FROM ghcr.io/nginxinc/nginx-unprivileged:bookworm@sha256:4cc7a90e2701c4e5c1695be4c99db435e2d7227b6039887f5ec1af9ecf9923e8

USER root
RUN useradd -u 1000 -ms /bin/bash www && \
    usermod -aG nginx www && \
    mkdir /sock && \
    chown -R www:www /sock /srv
USER www

COPY default.conf /etc/nginx/conf.d/default.conf
