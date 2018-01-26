#!/bin/bash

# 初期変数の設定
DATE=`date +%Y%m%d`
OLD_DATE=`date -d '1 days ago' +%Y%m%d`
NOW_HOUR=`date +%H`
TIME=`date +%H%M%S`
DEFAULT_LOGDIR=/backup/proclogs
command_list="netstat -rn
              ss -an
              ip a
              df -h
              ps aux
              mount -v"

check_list="netstat -rn
            ip a
            mount -v"
error=0

# ログ保存ディレクトリ
LOGDIR=${DEFAULT_LOGDIR}/${DATE}

# ログ格納ディレクトリ作成
[ ! -d ${LOGDIR} ] && mkdir -p ${LOGDIR}

# 稼働状況を取得して保存
echo "$command_list" | while read list
do
  # ログ出力
  FILE=`echo $list | awk '{print $1,$2}'|sed "s/ /-/g;s/--/-/g"`
  $list > ${LOGDIR}/${FILE}_${TIME}

  # ps結果はdiff用にsortとプロセス名だけ抜粋する
  if [ "$list" = "ps aux" ]; then
    awk '{for(i=11;i<NF;i++){printf("%s%s",$i,OFS=" ")}print $NF}' ${LOGDIR}/${FILE}_${TIME} |sort > ${LOGDIR}/${FILE}_${TIME}_sort
    rm -f ${LOGDIR}/${FILE}_${TIME}
  # ss結果はLISTEN情報だけを抜粋
  elif [ "$list" = "ss -an" ]; then
    grep "LISTEN" ${LOGDIR}/${FILE}_${TIME} > ${LOGDIR}/${FILE}_${TIME}_sort
    rm -f ${LOGDIR}/${FILE}_${TIME}
  fi
done

# ファイル比較用の定義
case "${NOW_HOUR}" in
  00) OLD_LOGDIR=${DEFAULT_LOGDIR}/${OLD_DATE};;
  *)  OLD_LOGDIR=${LOGDIR};;
esac

NEW_LOGDIR=${LOGDIR}
LASTTIME=`ls -t ${OLD_LOGDIR}/netstat-rn* | head -n 2 | tail -n 1 | awk -F_ '{print $2}'`

# 前回取得したものと比較
echo "$check_list" | while read line;
do
  FILE=`echo $line | awk '{print $1,$2}'|sed "s/ /-/g;s/--/-/g"`
  cmd="diff ${OLD_LOGDIR}/${FILE}_${LASTTIME}* ${NEW_LOGDIR}/${FILE}_${TIME}* "
  eval $cmd > /dev/null

  if [ $? -ne 0 ]; then
    echo " # ${cmd}"
    eval $cmd
    error=1
  fi
done

case "${error}" in
  0) exit 0;;
  1) exit 1;;
esac
