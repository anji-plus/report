#!/bin/bash
cd `dirname $0`
BuildDir=`pwd` #工程根目录

echo "build web"
cd $BuildDir/report-ui
npm install >/dev/null 2>&1
npm run build:prod >/dev/null 2>&1

echo "publish web to springboot src/main/resources/static"
mv $BuildDir/report-ui/dist $BuildDir/report-core/src/main/resources/static


echo "build springboot"
cd $BuildDir/report-core
mvn clean >/dev/null 2>&1
mvn package -Dmaven.test.skip=true >/dev/null 2>&1

echo "zip finish in build dir"
mkdir $BuildDir/build
mv $BuildDir/report-core/target/report-core-1.0.0-SNAPSHOT-assembly.zip $BuildDir/build/

cd $BuildDir/
rm -rf $BuildDir/report-core/src/main/resources/static
git reset --hard >/dev/null 2>&1