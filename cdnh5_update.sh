#!/bin/bash

#SRC_PATH=/home/development/front
SRC_PATH=/home/development/new_h5/replace_prod
PRD_PATH=/home/nginx/web/replace
PKG_NAME=distcdn.zip
SRC_NAME=distcdn
tartime=`date "+%Y%m%d_%H%M%S"`

#check backup dir
if [ ! -d "$SRC_PATH/backup" ]; then
  mkdir $SRC_PATH/backup
fi

#check nginx dir
if [ ! -d "$PRD_PATH" ]; then
  mkdir $PRD_PATH
fi

#copy && backup
\cp -rf $SRC_PATH/$PKG_NAME $PRD_PATH
\cp -rf $SRC_PATH/$PKG_NAME $SRC_PATH/backup/$PKG_NAME\_$tartime

#rollbackneed && update
cd $PRD_PATH

rm -rf bk-assets
\mv -f assets bk-assets
unzip $PKG_NAME
\mv -f $SRC_NAME front
rm -rf  front/index.html
mv front/assets $PRD_PATH
rm -rf  front/

#rm -rf bk-front
#\mv -f front bk-front
#unzip $PKG_NAME
#\mv -f $SRC_NAME front
#rm -rf  front/index.html

