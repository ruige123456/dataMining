#!/bin/sh
ps aux|grep slave|grep -v grep|awk '{print$2}' |xargs kill -9
echo starting
echo start to update script
svn up
python2.7 setup.py install
rm -rf build
cd tag/fetch_cluster/
rm -f nohup.out
nohup python2.7 slave_async_db.py &
ps aux|grep python
