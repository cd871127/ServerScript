#!/bin/bash

if [ ! -n "$1" ] ;then
    echo "useage: ./deploy.sh [project_name]"
	exit
fi


project_name=$1
build_dir=/home/cdistc/build/$project_name
deploy_dir=/home/cdistc/app/$project_name
shell_dir=/home/cdistc/app/shell
datetime=date +%s

cd $build_dir
git pull origin master

gradle clean
gradle bootRepackage

#shutdown the service
./close_process.sh java

#backup
mv $deploy_dir/$project_name.jar $deploy_dir/$project_name.jar.$datetime

cp build/libs/*.jar $deploy_dir/$project_name.jar

java -jar $deploy_dir/$project_name.jar >> $deploy_dir/$project_name.log > 2>&1 &


