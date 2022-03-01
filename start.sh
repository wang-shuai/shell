#!/bin/sh
BASE_PATH=`cd $(dirname $0); pwd -P`
APP=timed-tasks
APP_NAME=${APP}-1.0-SNAPSHOT.jar
APP_LOG=${BASE_PATH}/${APP}.log
APP_PATH=${BASE_PATH}/${APP_NAME}
#检查进程是否已经在运行，如果在运行则返回1，否则返回0
is_exist()
{
    pid=`ps -ef | grep -w "${APP_NAME}" | grep -v "grep" | awk '{print $2}'`
	if [ -z "${pid}" ]
		then return 1
	else
		return 0
	fi
}

# 打印进程的状态信息
status()
{
	is_exist
	if [ $? -eq "0" ]
	  then echo "${APP_NAME} is running. pid=${pid} ."
	else
	  echo "${APP_NAME} is not running"
	fi
}

# 启动进程
start()
{
	is_exist
	if [ $? -eq "0" ]
		then echo "${APP_NAME} is already running. pid=${pid} ."
		return 0
	else
		echo "try to start ${APP_NAME} ... "
		nohup java -jar ${APP_PATH}  > ${APP_LOG} 2>&1 &
#    nohup java -javaagent:/usr/local/skywalking-apm/agent/skywalking-agent.jar -Dskywalking.agent.service_name=${APP} -jar ${APP_PATH}  > ${APP_LOG} 2>&1 &
		# 程序的启动需要一定的时间，这里设置暂停时间(3秒)，单位是秒
		sleep 3
		is_exist
		if [ $? -eq "0" ]
		then
			echo "${APP_NAME} is running now. pid=${pid}."
			return 0
		else
			echo "failed to start ${APP_NAME}! see ${APP_LOG} for more details."
			return 1
		fi
	fi
}

# 停止HelloWorld进程
stop()
{
	is_exist
	if [ $? -eq 0 ]
		then  echo "try to stop ${APP_NAME} ..."
		kill -9  ${pid}
		if [ $? -ne 0 ]
			then echo "failed to stop ${APP_NAME}!"
			return 1
		else
			echo "${APP_NAME} stopped."
			return 0
		fi
	else
	  echo "${APP_NAME} is not running!"
	  return 1
	fi
}

# 重启HelloWorld进程
restart()
{
	stop
	start
}

# 显示帮助信息
help()
{
	echo "status                   show the status of ${APP_NAME} server."
	echo "start                    start the ${APP_NAME} server."
	echo "stop                     stop the ${APP_NAME} server."
	echo "restart                  restart the ${APP_NAME} server."
}

# 主函数
main()
{
	case "$1" in
	status)  
		status;;
	start)    
		start;;
	stop)    
		stop;;
	restart)  
		restart;;
	help)  
		help;;
	*)        
		echo "command param error ! see follow help "; 
		help;;
	esac
}

# 执行主函数 $1表示选择第一个字符串为参数，比如终端命令是：./run.sh start status，则选择start为输入参数
main $1


### 原文链接：https://blog.csdn.net/sinat_24044957/java/article/details/106240729
