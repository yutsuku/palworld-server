FROM cm2network/steamcmd:latest as base

LABEL maintainer="moh@yutsuku.net"

RUN mkdir -p /opt/data && \
    steamcmd.sh +force_install_dir /opt/data +login anonymous +app_update 2394010 validate +quit

COPY ./entrypoint.sh /entrypoint.sh

ENV PUBLIC_IP= \
    PORT=8211 \
    PUBLIC_PORT=8211 \
    PLAYERS=32 \
    SERVER_NAME="Palworld" \
    SERVER_DESCRIPTION="" \
    SERVER_PASSWORD="" \
    SERVER_COMMUNITY="true" \
    ADMIN_PASSWORD="" \
    MULTITHREAD="true"

EXPOSE ${PORT} ${PUBLIC_PORT}
