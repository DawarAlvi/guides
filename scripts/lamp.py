#!/usr/bin/python3

import tkinter as tk
import os

def updateText(n):
    t = displayText.get()
    tArray = t.split("\n")
    
    if(tArray[-1]==''):
        tArray.pop()

    if(len(tArray) > 2):
        tArray.pop(0)
        tArray.append(n)
        t = "\n".join(tArray)
        displayText.set(t)
    else:
        displayText.set(t + n + "\n")


def startServer():
    updateText("Starting Server...")
    os.system("systemctl start apache2.service")
    
def stopServer():
    updateText("Stopping Server...")
    os.system("systemctl stop apache2.service")

def startDb():
    updateText("Starting MySQL...")
    os.system("systemctl start mysql.service")

def stopDb():
    updateText("Stopping MySQL...")
    os.system("systemctl stop mysql.service")



#create main window
winMain =  tk.Tk(className="lamp_gui")
winMain.title('LAMPtk')
winMain.resizable(False,False)
winMain.configure(background='white')

#create display text and label
displayText = tk.StringVar()
display = tk.Label(winMain, textvariable=displayText, bg="black",fg="white",width=46,height=4)
display.configure(font='{monospace} 10 normal')

#create frames
frameServer = tk.Frame(winMain)
frameDb = tk.Frame(winMain)

#create buttons
btnServerStart = tk.Button(frameServer, text="Start Server", bg="white",relief='flat', borderwidth='0', width=20, command=startServer)
btnServerStop = tk.Button(frameServer, text="Stop Server", bg="white",relief='flat', borderwidth='0', width=20, command=stopServer)

btnDbStart = tk.Button(frameDb, text="Start MySQL", bg="white",relief='flat', borderwidth='0', width=20, command=startDb)
btnDbStop = tk.Button(frameDb, text="Stop MySQL", bg="white",relief='flat', borderwidth='0', width=20, command=stopDb)

#pack buttons
btnServerStart.pack(side="left")
btnServerStop.pack(side="left")

btnDbStart.pack(side="left")
btnDbStop.pack(side="left")

#pack frames
frameServer.pack()
frameDb.pack()

#display
display.pack()

displayText.set("Welcome to LAMPtk.\n")

#call main window loop
winMain.mainloop()
