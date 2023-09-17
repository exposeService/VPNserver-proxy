FROM nginx:mainline-alpine

RUN apk add -U --no-cache\
  wireguard-tools

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
