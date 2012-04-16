#!/bin/sh

SRCIMG=winpvsources.img
ISOIMG=winpvdrivers.iso
MNT=mnt
ISODIR=iso/

OUTPUT=`sudo kpartx -a -v $SRCIMG`
# sample output: add map loop0p1 (253:1): 0 2095104 linear /dev/loop0 2048
DEV=/dev/mapper/`echo $OUTPUT | cut -f 3 -d ' '`
sudo mount $DEV $MNT

cp $MNT/winpvdrivers/gplpv*.msi $ISODIR/
if [ $? -ne 0 ]; then
    echo "No installation files found! Have you built the drivers?"
    sudo umount  $MNT 
    sudo kpartx -d $SRCIMG
    exit 1
fi
    
sudo umount  $MNT
sudo kpartx -d $SRCIMG
genisoimage -o $ISOIMG -JR $ISODIR
