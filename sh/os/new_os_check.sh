#!/bin/bash

N=0
FLG_N=0
FLG_O=0

# 初期変数の設定
DATE=`date +%Y%m%d`
TIME=`date +%H%M%S`
DEFAULT_LOGDIR=/tmp/proclogs
LOGDIR=${DEFAULT_LOGDIR}/${DATE}
command_list="netstat -rn
              ss -an
              ip a
              df -h
              ps aux"
host_list="mhflogin001"

# オプション指定が間違っている場合のエラー文言
no_option() {
  echo "$0: invalid option -- $OPTARG"
  echo "Usage Case one: $0 " 1>&2
  echo "Usage Case two: $0 [-o mmddHH] " 1>&2
  echo "Usage Case three: $0 [-n mmddHH] [-o mmddHH ] " 1>&2
  exit 1
}

# OSの稼働状況確認及び保存
os_check() {
  # ログ格納ディレクトリ作成
  [ ! -d ${LOGDIR} ] && mkdir -p ${LOGDIR}
  # ログ出力
echo "$command_list" | while read line;
do
  FILE=`echo $line | awk '{print $1,$2}'|sed "s/ /-/g;s/--/-/g"`
  ssh $line > ${LOGDIR}/${FILE}_${TIME}

  if [ "$line" = "ps aux" ]; then
    awk '{for(i=11;i<NF;i++){printf("%s%s",$i,OFS=" ")}print $NF}' ${LOGDIR}/${FILE}_${TIME} |sort > ${LOGDIR}/${FILE}_${TIME}_sort
    rm -f ${LOGDIR}/${FILE}_${TIME}
  elif [ "$line" = "ss -an" ]; then
    grep "LISTEN" ${LOGDIR}/${FILE}_${TIME} > ${LOGDIR}/${FILE}_${TIME}_sort
    rm -f ${LOGDIR}/${FILE}_${TIME}
  fi
done
}

# 指定 or 前回取得分との比較
os_diff() {
  if [ $N = 0 ];then
    OLD_LOGDIR=${LOGDIR}
    NEW_LOGDIR=${LOGDIR}
    LASTTIME=`ls -t ${LOGDIR}/netstat-rn* | head -n 2 | tail -n 1 | awk -F_ '{print $2}'`
  elif [ $N = 2 ]; then
    OLD_LOGDIR=${DEFAULT_LOGDIR}/`date +%Y``echo ${VALUE_O} | cut -c 1-4`
    NEW_LOGDIR=${LOGDIR}
    VALUE_O=`echo ${VALUE_O} | cut -c 5-6`
    LASTTIME=`ls -t ${OLD_LOGDIR}/netstat-rn_${VALUE_O}* | head -n 2 | tail -n 1 | awk -F_ '{print $2}'`
  elif [ $N = 3 ]; then
    OLD_LOGDIR=${DEFAULT_LOGDIR}/`date +%Y``echo ${VALUE_O} | cut -c 1-4`
    NEW_LOGDIR=${DEFAULT_LOGDIR}/`date +%Y``echo ${VALUE_N} | cut -c 1-4`
    VALUE_O=`echo ${VALUE_O} | cut -c 5-6`
    VALUE_N=`echo ${VALUE_N} | cut -c 5-6`
    LASTTIME=`ls -t ${OLD_LOGDIR}/netstat-rn_${VALUE_O}* | head -n 2 | tail -n 1 | awk -F_ '{print $2}'`
    TIME=`ls -t ${NEW_LOGDIR}/netstat-rn_${VALUE_N}* | head -n 2 | tail -n 1 | awk -F_ '{print $2}'`
  fi

  echo "$command_list" | while read line;
  do
    FILE=`echo $line | awk '{print $1,$2}'|sed "s/ /-/g;s/--/-/g"`
    cmd="diff ${OLD_LOGDIR}/${FILE}_${LASTTIME}* ${NEW_LOGDIR}/${FILE}_${TIME}* "
    echo " # ${cmd}"
    eval $cmd
  done
}

# スクリプトオプション
while getopts :n:o: OPT
do
  case $OPT in
    n) FLG_N=1; VALUE_N="$OPTARG";;
    o) FLG_O=2; VALUE_O="$OPTARG";;
    \?) no_option;;
  esac
done

N=`expr $FLG_N + $FLG_O`
case "$N" in
  0) os_check; os_diff;;
  1) no_option;;
  2) os_check; os_diff;;
  3) os_diff;;
  *) echo "Unknown Error"; exit 1;;
esac
