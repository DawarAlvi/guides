# Guides, Reference and Links

## Packages

```
unrar
exfat-fuse exfat-utils
```

<br>

## App Projects
- [i3 Lock Fancy Rapid](https://github.com/yvbbrjdr/i3lock-fancy-rapid)

- [Picom Jonaburg Fix](https://github.com/Arian8j2/picom-jonaburg-fix)

<br>

## Themes
- [Adapta Project](https://github.com/adapta-project)

- [Victory Themes](https://gitlab.com/newhoa)

<br>

## Environment variables:

**Place at the end of your ~/.profile or ~/.bashrc file:**

```export PATH=$PATH:~/path/to/folder/```

<br>

## Format USB:

>**fat32:**
>
>```mkfs.vfat -n 'NAME' -I /dev/sdb```
    
>**exfat:**
>
>```mkfs.exfat /dev/sdb```

<br>

## Write iso to flashdrive

```sudo dd bs=4M if=path/to/linux.iso of=/dev/sdX status=progress oflag=sync```

<br>

## Pacman

>**List explicitly installed programs:**
>
>```pacman -Qei | awk '/^Name/ { name=$3 } /^Groups/ { if ( $3 != "base" && $3 != "base-devel" ) { print name } }'```

>**Remove unnecessaray packages:**
>
>```pacman -Rsn $(pacman -Qdtq)```

<br>

## Touchpad:

>- **Enable Tap to click**
>
>```sudo nvim /etc/X11/xorg.conf.d/30-touchpad.conf```
>
>**Paste**
>```
>Section "InputClass"
>    Identifier "MyTouchpad"
>    MatchIsTouchpad "on"
>    Driver "libinput"
>    Option "Tapping" "on"
>EndSection
>```

<br>

## Templates
**For KDE make a .desktop file in ~/.local/share/templates with content:**

    [Desktop Entry]
    Type=Link
    Name=<NAME>
    URL=/home/dawar/Templates/<FILENAME>
    Icon=<ICON>
    
**Place the file in ~/Templates**

<br>

## Replace open-jdk with oracle jdk: 
>**list**
>
>```
>update-alternatives --list java
>update-alternatives --list javac
>```
    
>**install**
>
>```
>update-alternatives --install /usr/bin/java java /opt/jdk-13.0.2/bin/java 100
>update-alternatives --install /usr/bin/javac javac /opt/jdk-13.0.2/bin/javac 100
>```
    
>**set**
>
>```
>update-alternatives --set java /opt/java/jdk-13.0.2/bin/java
>update-alternatives --set javac /opt/java/jdk-13.0.2/bin/javac
>```
    
>**display**
>
>```
>update-alternatives --display java
>update-alternatives --display javac
>```
    
>**check**
>
>```
>java --version
>javac --version
>```

<br>

## To change between UTC and local time:

>**to utc:**
>
>```timedatectl set-local-rtc 1```
    
>**to local time:**
>
>```timedatectl set-local-rtc 0```
    
>**To check status:**
>
>```timedatectl status```

<br>

## Add 32-bit support to Ubuntu based distros
    sudo dpkg --add-architecture i386
    sudo apt install libc6:i386 libncurses5:i386 libstdc++6:i386

<br>

## REISUB - the gentle Linux restart

**Holding down Alt and SysRq (which is the Print Screen key) while slowly typing REISUB will get you safely restarted. REISUO will do a shutdown rather than a restart.**

* R: Switch the keyboard from raw mode to XLATE mode
* E: Send the SIGTERM signal to all processes except init
* I: Send the SIGKILL signal to all processes except init
* S: Sync all mounted filesystems
* U: Remount all mounted filesystems in read-only mode
* B: Immediately reboot the system, without unmounting partitions or syncing

>**Mnemonic: R**aising **E**lephants **I**s **S**o **U**tterly **B**oring
