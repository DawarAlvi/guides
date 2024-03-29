# How To ![Arch](assets/arch_logo.png)

### Basically a condensed version of the [arch wiki installation guide](https://wiki.archlinux.org/title/Installation_guide).<br/>Tailored to my needs :penguin:

<br/>

> ## :rocket: [Download the Arch Linux iso](https://archlinux.org/download/)

<br/>

> ## Write iso file to flash drive

    dd bs=4M if=path/to/linux.iso of=/dev/sdY status=progress oflag=sync

<br/>

> :warning: Make sure secure boot is disabled in the bios.

<br/>

> ## :rocket: Boot into the live environment

<br/>

> ## :rocket: Connect to wifi
    iwctl
    device list
    station <device> scan
    station <device> get-networks
    station <device> connect <ssid>

<br/>

> :warning: If `get-networks` shows `No networks available`, use `wpa-supplicant` in the following manner and try again.
> ```
> wpa_passphrase <ssid> <passphrase> | tee /etc/wpa_supplicant.conf
> wpa_supplicant -B -c /etc/wpa_supplicant.conf -i <device>
> ```
> :link: [Reference](https://www.linuxbabe.com/command-line/ubuntu-server-16-04-wifi-wpa-supplicant)

<br/>
    
> ## :rocket: Update the system clock
    timedatectl set-ntp true
    timedatectl status
 
<br/>

> ## :rocket: Partition the disks
    fdisk -l
> :warning: **Required partitions:**
>
> - EFI system partition (fat32)
> - root directory / (ext4)


Use `fdisk` or `cfidsk` to partition the disk.

#### Format the partitions
    mkfs.fat -F32 /dev/sdXY
    mkfs.ext4 /dev/sdXZ
    
    mkswap /dev/sdXW
    swapon /dev/sdXW
    
#### Mount the root partition
    mount /dev/sdXZ /mnt

<br/>

> ## :rocket: Install essential packages
    pacstrap /mnt base base-devel linux linux-firmware neovim

<br/>

> ## :hourglass_flowing_sand: Get a cup of :tea: or :coffee:

<br/>

> ## :rocket: Fstab
    genfstab -U /mnt >> /mnt/etc/fstab

<br/>


> ## :rocket: Chroot
    arch-chroot /mnt

<br/>

> ## :rocket: Set Timezone
    ln -sf /usr/share/zoneinfo/Region/City /etc/localtime
    
<br/>

> ## :rocket: Hwclock
    hwclock --systohc

<br/>

> ## :rocket: Localization
    
- Edit `/etc/locale.gen` and uncomment `en_US.UTF-8 UTF-8`
    
    ```
    locale-gen
    echo LANG=en_US.UTF-8 > /etc/locale.conf
    ```
    
<br/>

> ## :rocket: Network configuration
    echo <hostname> > /etc/hostname
        
- Add the following entries to `/etc/hosts`:
    ```
    127.0.0.1   localhost
    ::1         localhost
    127.0.1.1   myhostname.localdomain   myhostname
     ```
<br/>

> ## :rocket: Users
        passwd
        *****
        
        useradd -mG wheel,audio,video,optical,storage <username>
        passwd <username>
        *****
    
        pacman -S sudo
        
        EDITOR=nvim visudo

- Uncomment the line `%wheel ALL=(ALL:ALL)ALL`


> ## :rocket: Bootloader
            
        mkdir /boot/efi
        mount /dev/sdX# /boot/efi
        pacman -S grub efibootmgr dosfstools os-prober mtools
        grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootoader-id=grub_uefi --recheck
        grub-mkconfig -o /boot/grub/grub.cfg
        
    
    
> ## :rocket: Useful Programs
        pacman -S networkmanager git
        systemctl enable NetworkManager
    
    
    
> ## :rocket: yay AUR helper
        git clone https://aur.archlinux.org/yay-git.git
        cd yay-git
        makepkg -si

  
> ## :rocket: GUI
        pacman -S xorg xorg-xinit alacritty awesome ttf-dejavu neofetch htop [xf86-video-fbdev | xf86-video-intel | xf86-video-amdgpu |  xf86-video-nouveau]
        
> :link: [GPU Driver Reference](https://wiki.archlinux.org/title/Category:Graphics)
    
    
    
> ## :rocket: Setup Xinitrc
        cp /etc/x11/xinit/xinitrc ~/.xinitrc
        nvim .xinitrc
        # delete last 5 lines the add:
        exec awesome

    
> ## :rocket: Awesome Config
        cp /etc/xdg/awesome/rc.lua ~/.config/awesome
        
    
> ## :tada: Done
        umount /boot/efi
        exit
        umount /mnt
        reboot
        
