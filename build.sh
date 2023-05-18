#!/bin/bash

echo "判断node.js mvn是否存在"
command -v npm || { echo >&2 "I require node.js v14.16.0+ but it's not installed.  Aborting."; sleep 5; exit 1; }
command -v mvn || { echo >&2 "I require maven 3.5 + but it's not installed.  Aborting."; sleep 5; exit 1; }

cd `dirname $0`
BuildDir=`pwd` #工程根目录

echo "build web"
cd $BuildDir/report-ui
echo "npm install"
npm install
echo ""
echo "npm run build"
npm run build:prod

echo "publish web to springboot src/main/resources/static"

mkdir -p $BuildDir/report-core/src/main/resources/static
mv $BuildDir/report-ui/dist/* $BuildDir/report-core/src/main/resources/static/

echo ""
echo "build springboot"
cd $BuildDir/report-core
echo "mvn clean"
mvn clean
echo ""
echo "mvn package"
mvn package -Dmaven.test.skip=true

echo "zip finish in build dir"
if [ ! -d "$BuildDir/build" ]; then
    mkdir $BuildDir/build
fi
mv $BuildDir/report-core/target/aj-report-*.zip $BuildDir/build/
rm -rf $BuildDir/report-core/src/main/resources/static/*
echo "Finish"
