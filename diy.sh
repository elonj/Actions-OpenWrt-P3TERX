#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=================================================
#1. Modify default IP
sed -i 's/192.168.1.1/192.168.5.1/g' package/base-files/files/bin/config_generate

#2. Set default timezone to Los Angeles. Time zone info can be found in https://oldwiki.archive.openwrt.org/doc/uci/system
#uci set system.@system[0].timezone=PST8PDT,M3.2.0,M11.1.0
#uci set system.@system[0].zonename=America/Los Angeles
sed -i 's/CST-8/PST8PDT,M3.2.0,M11.1.0/g' package/lean/default-settings/files/zzz-default-settings
sed -i 's/Asia/America/g' package/lean/default-settings/files/zzz-default-settings
sed -i 's/Shanghai/Los Angeles/g' package/lean/default-settings/files/zzz-default-settings

# Modify timezone (not sure useful or not)
sed -i 's/UTC/PST8PDT,M3.2.0,M11.1.0/g' package/base-files/files/bin/config_generate

# Modify timezone (not sure useful or not)
#sed -i 's/UTC/PST8PDT,M3.2.0,M11.1.0/g' package/base-files/files/etc/init.d/system

# Make luci-app-ssr-plus available
sed -i 's/#src-git helloworld/src-git helloworld/g'feeds.conf.default
