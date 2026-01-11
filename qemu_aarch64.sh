wget https://sgp1lxdmirror01.do.letsbuildthe.cloud/images/ubuntu/questing/arm64/cloud/20260110_07:42/rootfs.tar.xz

mkdir base
mv rootfs.tar.xz base
cd base
tar xvf rootfs.tar.xz
rm etc/resolv.conf
echo "nameserver 8.8.8.8" > etc/resolv.conf
rm rootfs.tar.xz
cd ..

proot -q qemu-aarch64 -0 --link2symlink --kill-on-exit \
-r base \
-w /root \
-b /proc \
-b /dev \
/usr/bin/env -i \
HOME=/root \
PREFIX=/usr \
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/xbin \
LANG=en_US.UTF-8 \
TERM=xterm-256color \
/bin/bash
