FROM nginx:latest

COPY wg0.conf /etc/wireguard/wg0.conf
COPY boringtun-cli /usr/local/bin/boringtun
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

RUN apt update && apt install -y wireguard-tools iproute2 wireguard

ENTRYPOINT ["/entrypoint.sh"]
