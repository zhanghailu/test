#!/usr/bin/env bash

dir=$1
help()
{
cat << EOF
    $0 USAGE
example: $0 ./ 
EOF
}
if [ $# = 0 ];then
    help
    exit 3
fi

list=`ls  | sort -n `
firname=`ls |sort -n|head -n1 |awk -F '[_.]+' '{print $3}'`
firname=`expr $firname - 1`

for nameall in $list;do
    name=`echo $nameall | awk -F '[_.]+' '{print $3}'`
    norname=`expr $firname + 1`
    if [ ! -z $name ];then
        if [ $name -eq $norname ];then
            firname=$norname
        else
            echo $nameall
            firname=$name
        fi
    else
        continue
    fi
done
