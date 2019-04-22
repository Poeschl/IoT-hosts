#!/bin/sh
set -e

buildDir='tmp'
distFolder='dist'
buildHostFile='hosts'

echo 'Update of iot host files'
if [ ! -f $buildDir ]; then
    mkdir $buildDir
fi
cd $buildDir
cat > $buildHostFile <<EOL
#Poeschl IoT device blocking list
#It should be blocking not intended outgoing traffic from my running IoT devices.
#Build date: $(date)

EOL

echo 'Add valetudo hosts'
echo '#Valetudo' >> $buildHostFile
wget -O valetudo.hosts https://raw.githubusercontent.com/Hypfer/Valetudo/master/deployment/etc/hosts
sed '/^#/d; s/203.0.113.1/127.0.0.1/g; s/2001:db8::1/::1/g' valetudo.hosts >> $buildHostFile
echo >> $buildHostFile

echo 'Add tuya hosts'
cat >> $buildHostFile <<EOL
# Alfawise power plugs + App (Tuya cloud)

127.0.0.1  a1.tuyacn.com
127.0.0.1  a1.tuyaeu.com
127.0.0.1  a1.tuyaus.com
::1  a1.tuyacn.com
::1  a1.tuyaeu.com
::1  a1.tuyaus.com
127.0.0.1  a.gw.tuyacn.com
127.0.0.1  a.gw.tuyaeu.com
127.0.0.1  a.gw.tuyaus.com
::1  a.gw.tuyacn.com
::1  a.gw.tuyaeu.com
::1  a.gw.tuyaus.com
127.0.0.1  mq.mb.tuyacn.com
127.0.0.1  mq.mb.tuyaeu.com
127.0.0.1  mq.mb.tuyaus.com
::1  mq.mb.tuyacn.com
::1  mq.mb.tuyaeu.com
::1  mq.mb.tuyaus.com
127.0.0.1  a.gw.tuyacn.com
127.0.0.1  a.gw.tuyaeu.com
127.0.0.1  a.gw.tuyaus.com
::1  a.gw.tuyacn.com
::1  a.gw.tuyaeu.com
::1  a.gw.tuyaus.com
127.0.0.1  api.tuya.com
::1  api.tuya.com
EOL

cd ..
mkdir $distFolder
mv "$buildDir/$buildHostFile" "$distFolder/hosts"
rm -r $buildDir
