# Packages:

**Add rar file support:**

    apt install rar unrar

**Add ExFat format support:**

    apt install exfat-fuse exfat-utils

**Update youtube-dl:**

    pip install --upgrade youtube-dl

# PPA's:

**Rofi**

    sudo add-apt-repository ppa:jasonpleau/rofi


# List block devices:
    lsblk

Example output:

    NAME     RM   SIZE   TYPE  MOUNTPOINT
    sda       0   800G   disk 
    ├─sda1    0   300G   part  /
    └─sda2    0   500G   part  /mnt/data
    sdb       1    32G   disk 
    └─sdb1    1    32G   part  /media/usrnm/hp




# Format USB:

**fat32:**

    mkfs.vfat -n 'NAME' -I /dev/sdb
    
**exfat:**

    mkfs.exfat /dev/sdb



# Replace open-jdk with oracle jdk: 
**list**

    update-alternatives --list java
    update-alternatives --list javac
    
**install**

    update-alternatives --install /usr/bin/java java /opt/jdk-13.0.2/bin/java 100
    update-alternatives --install /usr/bin/javac javac /opt/jdk-13.0.2/bin/javac 100
    
**set**

    update-alternatives --set java /opt/java/jdk-13.0.2/bin/java
    update-alternatives --set javac /opt/java/jdk-13.0.2/bin/javac
    
**display**

    update-alternatives --display java
    update-alternatives --display javac
    
**check**

    java --version
    javac --version



# To change between UTC and local time:

**to utc:**

    timedatectl set-local-rtc 1
    
**to local time:**

    timedatectl set-local-rtc 0
    
**To check status:**

    timedatectl status

# Environmental vars:

**Place at the end of your ~/.profile or ~/.bashrc file:**

    export PATH=$PATH:~/.scripts/

# Templates
**For KDE make a .desktop file in ~/.local/share/templates with content:**

    [Desktop Entry]
    Type=Link
    Name=<NAME>
    URL=/home/dawar/Templates/<FILENAME>
    Icon=<ICON>
    
**Place the file in ~/Templates**

# REISUB - the gentle Linux restart

**Holding down Alt and SysRq (which is the Print Screen key) while slowly typing REISUB will get you safely restarted. REISUO will do a shutdown rather than a restart.**

* R: Switch the keyboard from raw mode to XLATE mode
* E: Send the SIGTERM signal to all processes except init
* I: Send the SIGKILL signal to all processes except init
* S: Sync all mounted filesystems
* U: Remount all mounted filesystems in read-only mode
* B: Immediately reboot the system, without unmounting partitions or syncing

**Mnemonic: R**aising **E**lephants **I**s **S**o **U**tterly **B**oring


