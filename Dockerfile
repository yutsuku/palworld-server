FROM cm2network/steamcmd:root as base

LABEL maintainer="moh@yutsuku.net"

COPY ./entrypoint.sh /entrypoint.sh
RUN mkdir -p /opt/data && \
    chown steam:steam /opt/data
USER steam
RUN pwd && ls -lah
RUN ./steamcmd.sh +force_install_dir /opt/data +login anonymous +app_update 2394010 validate +quit

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
