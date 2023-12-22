#!/bin/bash
sdk use java ${JAVA_VERSION}
java -Xmx2G -jar master.jar 35353 $PORT
