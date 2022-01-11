#! /bin/bash
bar(){
    VPN="$(ip a | grep tun0 | grep inet | wc -l)"
    if [ $VPN -gt 0 ]
        then
            VPN="vpn detected"
        else
            VPN=" "
    fi
}

INTERVAL=1000 # interval in ms
FACTOR=$(awk -v var1=$INTERVAL ' BEGIN { print (1000 / var1) } ')
PREVDW=$(cat /sys/class/net/eth0/statistics/rx_bytes)
while true; do
    CURRENTDW=$(cat /sys/class/net/eth0/statistics/rx_bytes)
    DWINTERVAL=$(($CURRENTDW - $PREVDW))
    PREVDW=$CURRENTDW
    DWS=$(($DWINTERVAL * $FACTOR))
    DWS=$(numfmt --format=%6.1f --to=si $DWS)
    VOL=$(pamixer --get-volume-human)
    MEM=$(free -h --kilo | awk '/^Mem:/ {print $3 "/" $2}')
    FREEHOME=$(df -Ph | grep "/dev/sda5" | awk {'print "home " $4'})
    FREEROOT=$(df -Ph | grep "/dev/sda4" | awk {'print "root " $4'})
    xsetroot -name "$(echo ⬇️"$DWS"B/s "$VOL" "$MEM" "$FREEHOME" "$FREEROOT" "$(date +"%a %d %b %H:%M:%S %Y")")"
    sleep $(($INTERVAL / 1000))
done
