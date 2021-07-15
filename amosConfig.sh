#!/bin/bash
#Date 20200712
#Author Y

clear
alias rm="rm" >/dev/null 2>&1
######################################README##############################################
echo -e "\t\t\t\t\t\t\tREADME"
echo -e "\e[32m"
echo "*****将该程序放在/user/bin/目录下，执行chmod a+x amosConfig命令"
echo "*****在使用该程序修改后端服务ip等配置信息时，请在jar包文件目录下执行该脚本"“
read -n 1 -p  "按任意键继续。。。"
echo -e "\e[0m;"
clear
######################################函数模块#################################################
function CONFIG_GET {
	echo "*****************输入配置文件初始化配置..."                            ######直接回车将使用默认配置
	while : ;do
		read -p "********************* 输入消防自动化系统服务器你IP：" SERVICE_IP
		echo "$SERVICE_IP" | grep -E '([0-9]{1,3}\.){3}[0-9]{1,3}' >/dev/null 2>&1 && break ||  echo "错误的IP格式。。再来"
	done
	read -p "********************* 输入MYSQL数据库端口/用户名/密码(ex：3306 root Yeejoin_1234): " SQL_PORT SQL_USER SQL_PASSWD
	#echo "请确认数据库名称一致性："
	#echo -e "\tautosys_amos_project \tautosys_amos_studio  \tautosys_amos_workflow\tautosys_business_analysis\tautosys_business "
	#echo -e "\tautosys_exam         \tautosys_iot_platform    \tautosys_knowledge   \tautosys_mass_mdm         \tautosys_person "
	#read -n 1 "按任意键继续。。。"
	#read -p "输入REDIS数据库编号/端口/密码(ex：1 6379  1234560): " REDIS_NUM REDIS_PORT REDIS_PASSWD
	#read -p "输入EMQX服务tcp端口/用户名/密码(ex：1883 admin  public)：" EMQX_PORT EMQX_USER EMQX_PASSWD
	#read -p "输入FDFS文件服务端口(ex：8888)：" FDFS_PORT
	#read -p "输入infuxDB动态数据库的/http端口/用户名/密码/数据库名称(ex：8086 root 123456  iot-platform )：" INFLUXDB_PORT INFLUXDB_USER INFLUXDB_PASSWD INFLUXDB_SQL
	#read -p "输入消防自动化系统服务器你IP：" 
}


#######后端服务IP修改
function CONFIG_UPDATE {
	###########初始化数据#######
	if [ -d update/file ];then
		sleep 1
	else
		mkdir update/file
	fi

	rm  -rf update/file/*

	rm  -rf update/*
	WORKDIR=`echo $PWD`

	#############################
	echo "确认后端服务端口及基础服务端口:"

	AMOS_APP=`ls *.jar`
	for i in $AMOS_APP
	do
		echo "配置${i}文件，请稍后。。。"
		unzip -d update/file $i >/dev/null 2>&1  && cd update/file/BOOT-INF/classes
		ls  *.properties >Config.conf
		while read j
		do
			sed -r -i   "s/([0-9]{1,3}\.){3}[0-9]{1,3}/$SERVICE_IP/g" $j && sed  -r -i  "s/localhost/$SERVICE_IP/g"  $j  && echo "${i}配置文件服务器IP配置完成"
		done <Config.conf
		cd $WORKDIR/update/file
		jar -cfM0  $i ./*  &&  mv $i ${WORKDIR}/update/$i && rm -rf BOOT-INF  META-INF  org && echo "${i}更新文件打包至$WORKDIR/update/目录下"
		cd $WORKDIR
	done


}


########HYBRID_APP_PAGE表数据库IP修改
function HYBRID_IP {
	read -p "输入studio数据库名称" STUDIO_SQL
	mysqldump -h $SERVICE_IP -P $SQL_PORT  -u $SQL_USER -p$SQL_PASSWD $STUDIO_SQL hybrid_app_page > /tmp/hybrid_app_page.sql
	echo "hybrid_app_page数据表中的IP有： "
	grep -Eo  '([0-9]{1,3}\.){3}[0-9]{1,3}' /tmp/hybrid_app_page.sql |sort -rn| uniq
	read -n 1 -p "按任意键继续。。"
	sed  -r -i "s/([0-9]{1,3}\.){3}[0-9]{1,3}/$SERVICE_IP/g" /tmp/hybrid_app_page.sql
	echo "数据库表已配置，请确认服务器IP: "
	grep -Eo  '([0-9]{1,3}\.){3}[0-9]{1,3}' /tmp/hybrid_app_page.sql  |sort -rn| uniq 
	read -p "请确认继续[y|n]" ANSWER
	case $ANSWER in 
			y|Y)
				echo "确认配置正确，开始数据库导入。。"
				mysql -h $SERVICE_IP -P 30306  -u $SQL_USER -p$SQL_PASSWD $STUDIO_SQL  < /tmp/hybrid_app_page.sql
				if [ $? -eq 0 ];then
					echo "数据库导入成功。。"
				else
					echo "数据库导入失败，请重试。。"
					exit 1
				fi		
				;;
				
			n|N)
				echo "配置错误，请检查输入服务器IP正确。。。"
				;;
			*)
				echo "错误"
				;;
	esac

}

CONFIG_GET
#############################################################################
while true
do
	PS3="*****请选择你要部署系统的选项： "
	OPERATE=("SERVICE-IP" "HYBRID-IP" "QUIT" )
	select OPTION in ${OPERATE[@]}
	do
		case $OPTION in
			SERVICE-IP) CONFIG_UPDATE ;;
			 HYBRID-IP) HYBRID_IP ;;
			      QUIT) exit 0 ;;
		esac
	done
done


alias rm= "rm -i"
