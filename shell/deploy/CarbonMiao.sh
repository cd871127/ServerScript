#!/bin/bash

#if [ ! -n "$1" ] ;then
#    echo "useage: ./deploy.sh [project_name]"
#	exit
#fi

#echo 1

project_name=CarbonMiao
build_dir=/home/cdistc/build/$project_name
deploy_dir=/home/cdistc/app/$project_name

cd $build_dir
git pull origin master

gradle clean
gradle bootRepackage

cp libs/*.jar $deploy_dir


