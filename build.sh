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
mvn clean & package -Dmaven.test.skip=true >/dev/null 2>&1
