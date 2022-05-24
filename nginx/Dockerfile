FROM nginx

USER root
COPY apache /etc/nginx/

COPY 30-set-hostserver-ip.sh /docker-entrypoint.d/
RUN chmod +x /docker-entrypoint.d/30-set-hostserver-ip.sh
