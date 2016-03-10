### under construction ###


### base ###

mount /dev/sda1 /mnt

pacstrap /mnt base base-devel


### pre-config ###

arch-chroot /mnt

# hostname
echo ARCH-BOX > /etc/hostname

# timezone
ln -s /usr/share/zoneinfo/Europe/Moscow /etc/localtime


### syslinux ###

mkdir /boot/syslinux
cp -r /usr/lib/syslinux/bios/*.c32 /boot/syslinux/
extlinux --install /boot/syslinux

dd bs=440 count=1 conv=notrunc if=/usr/lib/syslinux/bios/mbr.bin of=/dev/sda

