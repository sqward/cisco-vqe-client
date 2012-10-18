#!/bin/bash

DESTINATION=`pwd`
SOURCE=`dirname $0`

if [[ "${DESTINATION}" -ef "${SOURCE}" ]]; then
    echo VQEC configure will be run within source folder
else
    echo VQEC copying source tree into build folder before configure
    cp -a ${SOURCE}/* ${DESTINATION} || exit -1
fi

autoreconf --force --install && ./configure "$@"

exit $?

