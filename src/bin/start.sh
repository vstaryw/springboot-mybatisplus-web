#!/bin/sh
echo -------------------------------------------
echo start server
echo -------------------------------------------
# 设置项目代码路径
export CODE_HOME="/usr/local/deploy/springboot"
#日志路径
export LOG_PATH="/usr/local/logs/springboot"

export STDOUT_FILE="$LOG_PATH/stdout.log"

mkdir -p $LOG_PATH
# 设置依赖路径
export CLASSPATH="$CODE_HOME/classes:$CODE_HOME/lib/*"
# java可执行文件位置
export _EXECJAVA="$JAVA_HOME/bin/java"
# JVM启动参数
export JAVA_OPTS="-server -Xms128m -Xmx256m"
# 启动类
export MAIN_CLASS=com.vstaryw.web.WebApplication

$_EXECJAVA $JAVA_OPTS -classpath $CLASSPATH $MAIN_CLASS >$STDOUT_FILE 2>&1 &

echo STDOUT:$STDOUT_FILE