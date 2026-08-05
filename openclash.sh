#!/bin/sh
action=$1

if [ "$action" = "on" ]; then
    # OpenClash
    uci set openclash.config.enable='1'
    uci commit openclash
    /etc/init.d/openclash start
    # LED
    /etc/init.d/gl_led turnon
elif [ "$action" = "off" ]; then
    # OpenClash
    uci set openclash.config.enable='0'
    uci commit openclash
    /etc/init.d/openclash stop
    # LED
    /etc/init.d/gl_led turnoff
fi

sleep 3