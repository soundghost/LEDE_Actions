#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

#更改默认地址为192.168.9.1
sed -i 's/192.168.1.1/192.168.9.1/g' package/base-files/files/bin/config_generate

# Add a feed source
git clone https://github.com/zzsj0928/luci-app-pushbot package/luci-app-pushbot
git clone https://github.com/sbwml/luci-app-airconnect.git  package/luci-app-airconnect
git clone https://github.com/EasyTier/luci-app-easytier.git package/luci-app-easytier
# echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
# echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default

#添加360T7 108M 512M-Ram USB支持
echo '&xhci {' >> target/linux/mediatek/dts/mt7981b-qihoo-360t7.dts
echo '        mediatek,u3p-dis-msk = <0x0>;' >> target/linux/mediatek/dts/mt7981b-qihoo-360t7.dts
echo '        phys = <&u2port0 PHY_TYPE_USB2>,' >> target/linux/mediatek/dts/mt7981b-qihoo-360t7.dts
echo '                   <&u3port0 PHY_TYPE_USB3>;' >> target/linux/mediatek/dts/mt7981b-qihoo-360t7.dts
echo '        status = "okay";' >> target/linux/mediatek/dts/mt7981b-qihoo-360t7.dts
echo '};' >> target/linux/mediatek/dts/mt7981b-qihoo-360t7.dts

#添加K2P 32M nand USB支持
sed -i 's/15744k/32448k/g' target/linux/ramips/image/mt7621.mk
sed -i 's/"Phicomm K2P";/"Phicomm K2P (32M USB)";/g' target/linux/ramips/dts/mt7621_phicomm_k2p.dts
sed -i '/spi-max-frequency/a\\t\tbroken-flash-reset;' target/linux/ramips/dts/mt7621_phicomm_k2p.dts
sed -i 's/<0xa0000 0xf60000>/<0xa0000 0x1fb0000>/g' target/linux/ramips/dts/mt7621_phicomm_k2p.dts
