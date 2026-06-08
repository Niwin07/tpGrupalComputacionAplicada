#!/bin/bash

if [ "$1" == "-help" ]; then
    echo "Uso: backup_full.sh <origen> <destino>"
    exit 0
fi

ORIGEN=$1
DESTINO=$2
FECHA=$(date +%Y%m%d)
NOMBRE=$(basename $ORIGEN)

if [ ! -d "$ORIGEN" ]; then
    echo "Error: origen no disponible"
    exit 1
fi

if [ ! -d "$DESTINO" ]; then
    echo "Error: destino no disponible"
    exit 1
fi

tar -czf "$DESTINO/${NOMBRE}_bkp_${FECHA}.tar.gz" "$ORIGEN"
echo "Backup exitoso"
