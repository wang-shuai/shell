path=`pwd`
dirs=`ls $path`
for dir in $dirs;
do
	if [ -d $dir ]  && [ $dir != log ]  && [ $dir != logs ] && [ $dir != target ] && [ $dir != message-processor ]; then
		echo $dir
		targetDir="/e/published/$dir"
		echo $targetDir

		if [ ! -d  $targetDir/lib ]; then
			mkdir -p $targetDir/lib
		fi

    cp $dir/target/lib/utility-1.0-SNAPSHOT.jar  $targetDir/lib
    cp $dir/target/lib/kbase*.jar  $targetDir/lib
    cp $dir/target/lib/slf4j-api-1.7.25.jar  $targetDir/lib
    cp $dir/target/lib/*log*.jar  $targetDir/lib
		cp $dir/target/lib/idss-api-1.0-SNAPSHOT.jar  $targetDir/lib
		cp $dir/target/lib/message-processor-1.0-SNAPSHOT.jar  $targetDir/lib
		cp $dir/target/$dir-1.0-SNAPSHOT.jar $targetDir/
    cp -r $dir/target/resources $targetDir/
    
	fi
done
