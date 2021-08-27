# How To ![Arch](assets/arch_logo.png)

## Basically a condensed version of the [arch wiki installation guide](https://wiki.archlinux.org/title/Installation_guide).<br/>Tailored to my needs :penguin:

<br/>

> ### [Download the Arch Linux iso](https://archlinux.org/download/)

<br/>

> ### Write iso file to flash drive

    dd bs=4M if=path/to/linux.iso of=/dev/sdX status=progress oflag=sync

<br/>

> :warning: Make sure secure boot is disabled in the bios.

<br/>

> ### Boot into the live environment

<br/>

> ### Connect to wifi
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
> dhclient <device>
> ```
> :link: [Reference](https://www.linuxbabe.com/command-line/ubuntu-server-16-04-wifi-wpa-supplicant)

