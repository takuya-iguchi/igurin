#!/bin/bash

COMMAND_PATH="/usr/local/postgres/bin/psql"
DB_HOST="mhfwebdb100.master"
DB_NAME="\
        server0
        server3
        server8"
DATE=`date +%Y-%m-%d' -d '1 day ago'`

QUERY="select count(*) from __slo_sys_table where ctm > '${DATE} 00:00:00'"

echo "${DB_NAME}" | while read line;
do
  CHECK_COUNT=0
  CHECK_COUNT=`${COMMAND_PATH} -h ${DB_HOST} -U webrole -d ${line} -t -A -c "${QUERY}"`
  if [ ${CHECK_COUNT} != 3 ]; then
    exit 1
  fi
done
