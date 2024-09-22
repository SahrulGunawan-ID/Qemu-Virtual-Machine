# Base "Clear Terminal"
clear

# Author : Sahrul Gunawan Cyber
# Lincense : Free
# Made In : Indonesia
# Target : Linux System

# "Qemu System Machine"
system1=qemu-system-i386
system2=qemu-system-x86_64


# "Base Cpu List"
cpu1=core2duo-v1
cpu2=core2duo
cpu3=coreduo-v1
cpu4=coreduo
cpu5=max

# "Base VGA System"
vga1=std
vga2=cirrus
vga3=vmware
vga4=qxl
vga5=virtio

# "Base Core Cpu"
no1=1
no2=2
no3=4
no4=8

# "Base Slot Ram"
slot1=1450M
slot2=1500M

echo "            Information Qemu Machine"
echo "--------------------------------------------"
echo " User      : $system2"
echo " CPU       : $cpu2"
echo " CORE      : $no2"
echo " VGA       : $vga1"
echo " RAM SLOT1 : $slot1"
echo " RAM SLOT1 : $slot2"
echo "-------------------------------------------"

# "Starting Shell"
$system2 \
-cpu $cpu2 \
-smp $no2 \
-m $slot1,slots=2,maxmem=$slot2 \
-vga $vga1 \
-M pc \
-name "Virtual Qemu Server" \
-rtc base=localtime \
-net user \
-net nic,model=rtl8139 \
-net nic,model=virtio \
-netdev user,id=n1,hostfwd=tcp::2222-:22 \
-device virtio-net,netdev=n1 \
-device sb16 \
-device e1000,netdev=n0 \
-netdev user,id=n0,dns=8.8.8.8 \
-device virtio-balloon-pci \
-device virtio-serial-pci \
-device virtio-rng-pci \
-device virtio-gpu-pci \
-accel tcg,thread=single,tb-size=1095 \
-full-screen \
-hda storage100G.img \
-hdb storage250G.img \
-hdd storage500G.img \
-cdrom windows11pro.iso \
-boot d \
-k en-us \
-vnc :1
