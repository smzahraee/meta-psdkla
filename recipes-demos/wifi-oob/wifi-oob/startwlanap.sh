#!/bin/sh

get_cfg ()
{
configfile=$1
section=$2
param=$3

python3 -c "
import configparser;
config = configparser.ConfigParser();
config.read('$configfile');
print (config.get('$section','$param'));
"
}

filename=/usr/share/intel9260/wificfg
defapname=J7SK-AP

interfaceState=$(ip a s | grep -nr "wlp1s0")

if [ -z "$interfaceState" ]; then
 exit
fi

ENABLE=`get_cfg $filename Wifi-STA sta_enable`

if [ $ENABLE != "no" ]; then
    exit
fi

echo -n "Starting WLAN AP setup"
cd /usr/share/intel9260

./load_wlcore.sh
sleep 1

a3=$(iw wlp1s0 info | grep "addr" | awk '{split($0,a,":"); print a[3]}')

a4=$(iw wlp1s0 info | grep "addr" | awk '{split($0,a,":"); print a[4]}')

a5=$(iw wlp1s0 info | grep "addr" | awk '{split($0,a,":"); print a[5]}')

apname="${defapname}_${a3}${a4}${a5}"

sed -i "s/ssid=.*/ssid=${apname}/g" /usr/share/intel9260/hostapd.conf

./ap_start.sh
sleep 1

iperf3 -B 192.168.43.1 -p 6001 -s -i 5 &
