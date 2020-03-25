# packages:
  #Add rar file support:
    apt install rar unrar
  #Add ExFat format support:
    apt install exfat-fuse exfat-utils
  #update youtube-dl:
    pip install --upgrade youtube-dl



# List block devices:
  lsblk
    #(eg: /dev/sdb)



# Format USB:
  #fat32:
    mkfs.vfat -n 'NAME' -I /dev/sdb
  #exfat:
    mkfs.exfat /dev/sdb



# Replace open-jdk with oracle jdk: 
  #list
    update-alternatives --list java
    update-alternatives --list javac
  #install
    update-alternatives --install /usr/bin/java java /opt/jdk-13.0.2/bin/java 100
    update-alternatives --install /usr/bin/javac javac /opt/jdk-13.0.2/bin/javac 100
  #set
    update-alternatives --set java /opt/java/jdk-13.0.2/bin/java
    update-alternatives --set javac /opt/java/jdk-13.0.2/bin/javac
  #display
    update-alternatives --display java
    update-alternatives --display javac
  #check
    java --version
    javac --version



# To change between UTC and local time:
  #to utc:
    timedatectl set-local-rtc 1
  #to local time:
    timedatectl set-local-rtc 0
  #To check status:
    timedatectl status


# Templates
  #For KDE make a .desktop file in $HOME/.local/share/templates with content:
    [Desktop Entry]
    Type=Link
    Name=<NAME>
    URL=/home/dawar/Templates/<NAME>
    Icon=<ICON>
  #Place the file in ~/Templates
