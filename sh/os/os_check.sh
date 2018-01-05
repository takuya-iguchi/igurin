#!/bin/bash

# 初期変数の設定
DATE=`date +%Y%m%d`
TIME=`date +%H%M%S`
LOGDIR=/tmp/${DATE}


# ログ格納ディレクトリ作成
[ ! -d ${LOGDIR} ] && mkdir ${LOGDIR}


# ログ出力
cd ${LOGDIR}
netstat -rn > netstat-rn_${TIME}
ps aux > ps-aux_${TIME}
ps auxf > ps-auxf_${TIME}
ss -an | grep LISTEN > ss-an_${TIME}
ip a > ip-a_${TIME}
df -h > df-h_${TIME}


# ps結果はdiff用にsortとプロセス名だけ抜粋する
FILE=ps-aux_${TIME}
awk '{for(i=11;i<NF;i++){printf("%s%s",$i,OFS=" ")}print $NF}' $FILE |sort > ${FILE}_sort

# ２回目以降の場合は、一番古いファイルと最新ファイルをの差分を出力させる
if [ `ls netstat* | wc -l` -ge 2 ];then
  LASTTIME=`ls -tr netstat* | head -n 1 | awk -F_ '{print $2}'`

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
