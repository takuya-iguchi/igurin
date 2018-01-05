#!/bin/bash

no_option() {
 echo "$0: invalid option -- $OPTARG"
 echo "Usage: $0 " 1>&2
 echo "Usage: $0 [-o mddd] " 1>&2
 echo "Usage: $0 [-n mmdd] [-o mddd] " 1>&2
 exit 1
}

while getopts :n:o: OPT
do
  case $OPT in
      n) FLG_N="true"; VALUE_N="$OPTARG";;
      o) FLG_O="true"; VALUE_O="$OPTARG";;
      \?) no_option;;
  esac
done

# 初期変数の設定
DATE=`date +%Y%m%d`
TIME=`date +%H%M%S`
LOGDIR=/tmp/${DATE}

os_check() {
  # ログ格納ディレクトリ作成
  [ ! -d ${LOGDIR} ] && mkdir ${LOGDIR}

  # ログ出力
  netstat -rn > ${LOGDIR}/netstat-rn_${TIME}
  ps aux > ${LOGDIR}/ps-aux_${TIME}
  ps auxf > ${LOGDIR}/ps-auxf_${TIME}
  ss -an | grep LISTEN > ${LOGDIR}/ss-an_${TIME}
  ip a > ${LOGDIR}/ip-a_${TIME}
  df -h > ${LOGDIR}/df-h_${TIME}

  # ps結果はdiff用にsortとプロセス名だけ抜粋する
  FILE=${LOGDIR}/ps-aux_${TIME}
  awk '{for(i=11;i<NF;i++){printf("%s%s",$i,OFS=" ")}print $NF}' $FILE |sort > ${FILE}_sort
}

os_diff() {
  if [ `ls ${LOGDIR}/netstat* | wc -l` -ge 2 ];then
    LASTTIME=`ls -tr ${LOGDIR}/netstat* | head -n 1 | awk -F_ '{print $2}'`

    for FILE in netstat-rn ss-an ip-a df-h
    do
      cmd="diff ${LOGDIR}/${FILE}_${LASTTIME} ${LOGDIR}/${FILE}_${TIME}"
      echo " # ${cmd}"
      eval $cmd
    done

    cmd="diff ${LOGDIR}/ps-aux_${LASTTIME}_sort ${LOGDIR}/ps-aux_${TIME}_sort"
    echo " # ${cmd}"
    eval $cmd
  fi
}

if [ "$FLG_N" = "true" ] && [ "$FLG_O" = "true" ]; then
echo a
fi


if [ -z "$FLG_N" ] && [ "$FLG_O" = "true" ]; then
echo b
fi


if [ "$FLG_N" = "true" ] && [ -z "$FLG_O" ]; then
echo c
fi

if [ -z "$FLG_N" ] && [ -z "$FLG_O" ]; then
  os_check
  os_diff
fi
