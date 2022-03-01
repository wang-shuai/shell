
echo '下载服务文件压缩包' $1
remote_file=$1
#echo $remote_file
curl -O $remote_file

filename=${remote_file##*/}

echo '解压文件'
update_dir='/data-sas/apps'
if [ ! -d $update_dir ]
then
    mkdir -p $update_dir
fi

tar -zxvf $filename -C $update_dir  # --strip-components 1

echo 进入目录遍历启动程序
cd $update_dir
path=`pwd`
dirs=`ls $path`
for dir in $dirs;
do
        if [ -d $dir ]  &&  [ $dir != 'target' ] && [ $dir != 'log' ] && [ $dir != 'logs' ] ;then
                echo $dir
                chmod +x  $dir/start.sh
                
### 进入目录启动 才会在当前目录创建日志
                cd $dir
                sh ./start.sh restart
                cd -
        fi
done
echo 'deployment finished successfully'




