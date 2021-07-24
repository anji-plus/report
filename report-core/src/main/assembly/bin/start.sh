#!/bin/bash
cd `dirname $0`
BIN_DIR=`pwd` #安装目录
cd ..
DEPLOY_DIR=`pwd`
LIB_DIR=$DEPLOY_DIR/lib #jar目录
CONF_DIR=$DEPLOY_DIR/conf #conf目录
LOGS_DIR=$DEPLOY_DIR/logs #log目录

LIB_JARS=`ls $LIB_DIR|grep .jar|awk '{print "'$LIB_DIR'/"$0}'|tr "\n" ":"`

JAVA_OPTS=" -server -Xmx2g -Xms2g -Xmn256m -XX:PermSize=128m -Xss256k "

echo "$DEPLOY_DIR"
echo "$LIB_JARS"


PIDS=`ps -f | grep java | grep "aj-report" |awk '{print $2}'`
if [ -n "$PIDS" ]; then
    echo "ERROR: The AJ-Report already started!"
    echo "PID: $PIDS"
    exit 1
fi


nohup java $JAVA_OPTS -jar -Dspring.config.location=$CONF_DIR/bootstrap.yml $LIB_DIR/aj-report-*.jar -Xbootclasspath/a:$LIB_JARS >/dev/null 2>&1 &

echo "The AJ-Report started!"