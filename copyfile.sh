path=`pwd`
dirs=`ls $path`
for dir in $dirs;
do 
	if [ -d $dir ]  && [ $dir != log ]  && [ $dir != logs ] && [ $dir != target ] && [ $dir != message-processor ]; then
		echo $dir
		targetDir="/e/published/$dir"
		echo $targetDir

		if [ ! -d  $targetDir ]; then
			mkdir -p $targetDir 
		fi

		cp -r $dir/target/lib  $targetDir/
		cp -r $dir/target/resources $targetDir/
		cp $dir/target/$dir-1.0-SNAPSHOT.jar $targetDir/
		cp $dir/target/start.sh $targetDir/

	fi
done
