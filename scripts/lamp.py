#!/usr/bin/python3

import tkinter as tk
import os

def startServer():
    os.system("systemctl start apache2.service")

def stopServer():
    os.system("systemctl stop apache2.service")

def startDb():
    os.system("systemctl start mysql.service")

def stopDb():
    os.system("systemctl stop mysql.service")

#create main window
winMain =  tk.Tk()
winMain.title('LAMP')

#create frames
frameServer = tk.Frame(winMain)
frameDb = tk.Frame(winMain)

#create buttons
btnServerStart = tk.Button(frameServer, text="Start Server", width=20, command=startServer)
btnServerStop = tk.Button(frameServer, text="Stop Server", width=20, command=stopServer)

btnDbStart = tk.Button(frameDb, text="Start MySQL", width=20, command=startDb)
btnDbStop = tk.Button(frameDb, text="Stop MySQL", width=20, command=stopDb)

#pack buttons
btnServerStart.pack(side="left")
btnServerStop.pack(side="left")

btnDbStart.pack(side="left")
btnDbStop.pack(side="left")

#pack frames
frameServer.pack()
frameDb.pack()

#call main window loop
winMain.mainloop()

