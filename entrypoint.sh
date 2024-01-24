#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail
# set -o xtrace # Uncomment this line for debugging purposes

# update game
"$STEAMCMDDIR/steamcmd.sh" +force_install_dir /opt/data +login anonymous +app_update 2394010 validate +quit

PALSERVER="/opt/data/PalServer.sh"
PALSERVERARGS=""

#region SERVERARGS
if [ -n "${SERVER_COMMUNITY}" ]; then
    PALSERVERARGS="${PALSERVERARGS} EpicApp=PalServer"
fi

if [ -n "${PUBLIC_IP}" ]; then
    PALSERVERARGS="${PALSERVERARGS} -publicip=${PUBLIC_IP}"
fi

if [ -n "${PORT}" ]; then
    PALSERVERARGS="${PALSERVERARGS} -port=${PORT}"
fi

if [ -n "${PUBLIC_PORT}" ]; then
    PALSERVERARGS="${PALSERVERARGS} -publicport=${PUBLIC_PORT}"
fi

if [ -n "${PLAYERS}" ]; then
    PALSERVERARGS="${PALSERVERARGS} -players=${PLAYERS}"
fi

if [ -n "${SERVER_NAME}" ]; then
    PALSERVERARGS="${PALSERVERARGS} -servername=${SERVER_NAME}"
fi

if [ -n "${SERVER_DESCRIPTION}" ]; then
    PALSERVERARGS="${PALSERVERARGS} -serverdescription=${SERVER_DESCRIPTION}"
fi

if [ -n "${SERVER_PASSWORD}" ]; then
    PALSERVERARGS="${PALSERVERARGS} -serverpassword=${SERVER_PASSWORD}"
fi

if [ -n "${ADMIN_PASSWORD}" ]; then
    PALSERVERARGS="${PALSERVERARGS} -adminpassword=${ADMIN_PASSWORD}"
fi

if [ -n "${MULTITHREAD}" ]; then
    PALSERVERARGS="${PALSERVERARGS} -useperfthreads -NoAsyncLoadingThread -UseMultithreadForDS"
fi
#endregion

$PALSERVER "$PALSERVERARGS"
