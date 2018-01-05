#!/bin/bash

SLONIN_DIR="/usr/local/sloninIII/"
SLONIN_LOG_DIR="/var/log/sloninIII/"
REPLICATE_NAME="\
            svr-1-new
            svr-4-new
            svr-9-new"

DATE=`date +%y%m%d`
SDATE=`date +%H%M%S`
CHECK_COUNT=0

echo "$REPLICATE_NAME" | while read line;
do
  if [ -e ${SLONIN_LOG_DIR}${line}/slo${DATE}.log.gz ]; then
    mv ${SLONIN_LOG_DIR}${line}/slo${DATE}.log.gz ${SLONIN_LOG_DIR}${line}/slo${DATE}.log.gz.${SDATE}
  fi

  echo 'replicating'
  su - mhfmin -c "${SLONIN_DIR}${line}/sloninIII --replicate"

  echo 'compresing'
  su - mhfmin -c "gzip ${SLONIN_LOG_DIR}${line}/*log"

  echo 'log checking'
  CHECK_COUNT=`zcat ${SLONIN_LOG_DIR}${line}/slo${DATE}.log.gz | grep "__slo_sys_table" | wc -l`

  if [ ${CHECK_COUNT} -lt 6 ]; then
    exit 1
  fi
done
