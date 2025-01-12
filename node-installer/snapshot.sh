#!/bin/bash

set -e

RED="\033[31m"
YELLOW="\033[33m"
GREEN="\033[32m"
NORMAL="\033[0m"
SNAP_BINARIES="akashnet-2,sifchain-1,sentinelhub-2,desmos-mainnet,osmosis-1,bitcanna-1,oasis-node,impacthub-3,panacea-3,juno-1,comdex-1,kichain-2,Test-Denali,SanfordNetwork"

function line {
echo "-------------------------------------------------------------------"
}

function greeting {
line
echo -e "$YELLOW Using the Snapshot Services from:$NORMAL"
echo -e "$GREEN c29r3:$NORMAL$RED https://github.com/c29r3/cosmos-snapshots$NORMAL"
line
echo -e "$GREEN Bambarello:$NORMAL$RED http://snapshots.alexvalidator.com:8081/$NORMAL"
line
echo -e "$GREEN Staketab:$NORMAL$RED https://github.com/Staketab/nginx-cosmos-snap$NORMAL"
line
echo -e "$GREEN Alex Novy:$NORMAL$RED https://snapshots.stakecraft.com/$NORMAL"
line
}

function snapStart {
if [[ "${CHAIN}" == "akashnet-2" ]]; then
    cd $HOME/.${CONFIG_FOLDER}/data
    SNAP_NAME=$(curl -s http://135.181.60.250/akash/ | egrep -o ">akashnet-2.*tar" | tr -d ">")
    wget -O - http://135.181.60.250/akash/${SNAP_NAME} | tar xf -
elif [[ "${CHAIN}" == "sifchain-1" ]]; then
    cd $HOME/.${CONFIG_FOLDER}/data
    SNAP_NAME=$(curl -s http://135.181.60.250:8081/sifchain/ | egrep -o ">sifchain.*tar" | tail -n 1 | tr -d '>')
    wget -O - http://135.181.60.250:8081/sifchain/${SNAP_NAME} | tar xf -
elif [[ "${CHAIN}" == "sentinelhub-2" ]]; then
    cd $HOME/.${CONFIG_FOLDER}/data
    SNAP_NAME=$(curl -s http://135.181.60.250:8083/sentinel/ | egrep -o ">sentinelhub-2.*tar" | tr -d ">")
    wget -O - http://135.181.60.250:8083/sentinel/${SNAP_NAME} | tar xf -
elif [[ "${CHAIN}" == "desmos-mainnet" ]]; then
    cd $HOME/.${CONFIG_FOLDER}/data
    SNAP_NAME=$(curl -s http://135.181.60.250:8084/desmos/ | egrep -o ">desmos.*tar" | tr -d ">")
    wget -O - http://135.181.60.250:8084/desmos/${SNAP_NAME} | tar xf -
elif [[ "${CHAIN}" == "osmosis-1" ]]; then
    cd $HOME/.${CONFIG_FOLDER}/data
    SNAP_NAME=$(curl -s http://135.181.60.250:8085/osmosis/ | egrep -o ">osmosis.*tar" | tr -d ">")
    wget -O - http://135.181.60.250:8085/osmosis/${SNAP_NAME} | tar xf -
elif [[ "${CHAIN}" == "bitcanna-1" ]]; then
    cd $HOME/.${CONFIG_FOLDER}/data
    SNAP_NAME=$(curl -s http://135.181.60.250:8086/bitcanna/ | egrep -o ">bitcanna.*tar" | tr -d ">")
    wget -O - http://135.181.60.250:8086/bitcanna/${SNAP_NAME} | tar xf -
elif [[ "${CHAIN}" == "oasis-node" ]]; then
    cd $HOME/.${CONFIG_FOLDER}/data
    SNAP_NAME=$(curl -s http://95.216.45.250:8081/ | egrep -o ">oasis.*tar" | tr -d ">")
    wget -O - http://95.216.45.250:8081/${SNAP_NAME} | tar xzf -
elif [[ "${CHAIN}" == "impacthub-3" ]]; then
    cd $HOME/.${CONFIG_FOLDER}/data
    SNAP_NAME=$(curl -s http://cosmos-snap.staketab.com/ixo/ | egrep -o ">impacthub-3.*tar" | tr -d ">")
    wget -O - http://cosmos-snap.staketab.com/ixo/${SNAP_NAME} | tar xf -
elif [[ "${CHAIN}" == "panacea-3" ]]; then
    cd $HOME/.${CONFIG_FOLDER}/data
    SNAP_NAME=$(curl -s http://cosmos-snap.staketab.com/medibloc/ | egrep -o ">panacea-3.*tar" | tr -d ">")
    wget -O - http://cosmos-snap.staketab.com/medibloc/${SNAP_NAME} | tar xf -
elif [[ "${CHAIN}" == "juno-1" ]]; then
    cd $HOME/.${CONFIG_FOLDER}/data
    SNAP_NAME=$(curl -s https://snapshots.stakecraft.com/ | egrep -o ">juno-1.*tar" | tr -d ">")
    wget -O - https://snapshots.stakecraft.com/${SNAP_NAME} | tar xf -
elif [[ "${CHAIN}" == "comdex-1" ]]; then
    cd $HOME/.${CONFIG_FOLDER}/data
    SNAP_NAME=$(curl -s http://cosmos-snap.staketab.com/comdex/ | egrep -o ">comdex-1.*tar" | tr -d ">")
    wget -O - http://cosmos-snap.staketab.com/comdex/${SNAP_NAME} | tar xf -
elif [[ "${CHAIN}" == "kichain-2" ]]; then
    cd $HOME/.${CONFIG_FOLDER}/data
    SNAP_NAME=$(curl -s https://mercury-nodes.net/kichain-snaps/ | egrep -o ">kichain-2.*tar" | tr -d ">")
    wget -O - https://mercury-nodes.net/kichain-snaps/${SNAP_NAME} | tar xf -
elif [[ "${CHAIN}" == "Test-Denali" ]]; then
    cd $HOME/.${CONFIG_FOLDER}/data
    SNAP_NAME=$(curl -s http://cosmos-snap.staketab.com/idep/ | egrep -o ">Test-Denali.*tar" | tr -d ">")
    wget -O - http://cosmos-snap.staketab.com/idep/${SNAP_NAME} | tar xf -
elif [[ "${CHAIN}" == "SanfordNetwork" ]]; then
    cd $HOME/.${CONFIG_FOLDER}/data
    SNAP_NAME=$(curl -s http://cosmos-snap.staketab.com/idep/ | egrep -o ">SanfordNetwork.*tar" | tr -d ">")
    wget -O - http://cosmos-snap.staketab.com/idep/${SNAP_NAME} | tar xf -
else
    line
    echo -e "$RED Something went wrong ... Snapshot not found ...$NORMAL"
    line
fi
line
echo -e "$GREEN Snapshot for ${CHAIN} installed.$NORMAL"
line
sleep 2
}

greeting
snapStart
