#!/bin/bash

#This is a custom launcher script for apps that dont automatically use the specified theme.
#replace the path with the gtkrc of choice for the app to use that theme.

#Usage:
#themer.sh <app_name>

theme="/home/dawar/.local/share/themes/Adapta-Red-Nokto-Eta/gtk-2.0/gtkrc"
GTK2_RC_FILES=$theme $1
