from alpine:3.10

RUN apk add --no-cache curl nginx
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./start.sh /start.sh

RUN chmod +x /start.sh

EXPOSE 80

ENTRYPOINT ["/start.sh"]
