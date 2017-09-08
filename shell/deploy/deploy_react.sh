#!/bin/bash

if [ ! -n "$1" ] ;then
    echo "useage: ./deploy.sh [project_name]"
	exit
fi


project_name=$1
build_dir=/home/cdistc/build/$project_name
deploy_dir=/home/cdistc/app/$project_name
shell_dir=/home/cdistc/app/shell
datetime=`date +%s`

cd $build_dir
git pull origin master

rm -rf build/
npm run build

#shutdown the service
$shell_dir/close_process.sh node

#backup
mv $deploy_dir/$project_name/ $deploy_dir/$project_name.$datetime/

mv build $deploy_dir/$project_name

`serve -s $deploy_dir/$project_name >> $deploy_dir/$project_name.log 2>&1 &`





