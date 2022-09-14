# Windows Guides and Tricks

## Customize PowerShell Prompt
[Ref](https://stackoverflow.com/questions/5725888/windows-powershell-changing-the-command-prompt)

If you only want to change for the current user or can't run as admin.
```
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Unrestricted
```

Create and edit the file.
```
new-item -itemtype file -path $profile -force
notepad $PROFILE
```

```
function prompt {
    write-host "$pwd $" -NoNewline -ForegroundColor Green
    return " "
}
```
