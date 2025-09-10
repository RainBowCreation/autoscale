#!/bin/bash

# resync plugin folder to only download
echo "syncing plugin.."
rm -rf plugins
echo "syncing world.."
rm -rf world*

if [ "$AWS" != true ] ; then
    # Fetch IMDSv2 token and query once
    TOKEN=$(curl -fsS -X PUT "http://169.254.169.254/latest/api/token" \
    -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")

    REGION=$(curl -fsS -H "X-aws-ec2-metadata-token: $TOKEN" \
    http://169.254.169.254/latest/meta-data/placement/region) 

    INSTANCE_ID=$(curl -fsS -H "X-aws-ec2-metadata-token: $TOKEN" \
    http://169.254.169.254/latest/meta-data/instance-id)

    unset TOKEN

    REGION=$(echo $REGION | cut -d'-' -f1)
    INSTANCE_ID=$(echo $INSTANCE_ID | cut -d'-' -f2-)
    export REGION INSTANCE_ID
fi

MULTIPAPER_NODE_NAME=${REGION}-${INSTANCE_ID}
echo "node uuid set to $MULTIPAPER_NODE_NAME"

# start multipaper node

STATIC_ARGS="-Dproperties.server-port=$PORT -Dmultipaper.master-connection.master-address=$MASTER_ADDRESS -Dmultipaper.master-connection.my-name=$MULTIPAPER_NODE_NAME -Dproperties.online-mode=${ONLINE_MODE} -Dproperties.max-players=${MAX_PLAYERS}"
if [ "$MOTD_OVERRIDE" = "true" ]; then
    STATIC_ARGS="$STATIC_ARGS -Dproperties.motd=${MOTD}"
fi
java ${NODE_ARGS} ${STATIC_ARGS} ${JAVA_OPTS} --add-modules=jdk.incubator.vector -jar node.jar