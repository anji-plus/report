#!/bin/bash
#该脚本为私有化脚本，打包成内含网页的product-report-starter放在内网私服

#判断node.js mvn是否存在
command -v npm >/dev/null 2>&1 || { echo >&2 "I require node.js v14.16.0+ but it's not installed.  Aborting."; sleep 5; exit 1; }
command -v mvn >/dev/null 2>&1 || { echo >&2 "I require maven 3.5 + but it's not installed.  Aborting."; sleep 5; exit 1; }

cd `dirname $0`
BuildDir=`pwd` #工程根目录

#重置pom和index.js
cat $BuildDir/build/index.js > $BuildDir/report-ui/config/index.js
cat $BuildDir/build/pom.xml > $BuildDir/report-core/pom.xml

echo "build web"
cd $BuildDir/report-ui
rm -rf dist
npm install >/dev/null 2>&1
npm run build:prod

echo "publish web to springboot src/main/resources/static"
rm -rf $BuildDir/report-core/src/main/resources/db/migration
rm -rf $BuildDir/report-core/src/main/resources/static
mkdir -p $BuildDir/report-core/src/main/resources/static
mv $BuildDir/report-ui/dist/* $BuildDir/report-core/src/main/resources/static/


echo "build springboot"
cd $BuildDir/report-core

mvn clean deploy -DskipTests 

rm -rf $BuildDir/report-core/src/main/resources/static
git reset --hard