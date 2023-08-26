@echo off
title Configtion Host-fi . . . . . & mode 95, 25

set meto="%~dp0\host-fi.bat"
set road=%USERPROFILE%\Desktop

for /F "tokens=5 delims= " %%j in ('dir %road% ^| findstr Host-Fi.lnk') do ( 
   set exact=%%j 
  )

  cls
:setuploop
color 0A
echo.
echo           ^ ^ ^ ^ ^ ^ ^ ^ ^  ^ ^_^_^_^_^_^_^_^  ^ ^_^_^_^_^_^_^_^  ^_^_^_^_^_^_^_^_^_  ^ ^ ^ ^ ^ ^ ^   ^ ^_^_^_^_^_^_^_^  ^_^_^_^_^_^_^_^_^_         
echo           ^|^\^ ^ ^ ^ ^ ^/^| ^(^ ^ ^_^_^_^ ^ ^) ^(^ ^ ^_^_^_^_^ ^\ ^\^_^_^ ^ ^ ^_^_^/  ^ ^ ^ ^ ^ ^ ^   ^(^ ^ ^_^_^_^_^ ^\ ^\^_^_^ ^ ^ ^_^_^/         
echo           ^|^ ^)^ ^ ^ ^(^ ^| ^|^ ^(^ ^ ^ ^)^ ^| ^|^ ^(^ ^ ^ ^ ^\^/ ^ ^ ^ ^)^ ^(^ ^ ^   ^ ^ ^ ^ ^ ^ ^   ^|^ ^(^ ^ ^ ^ ^\^/ ^ ^ ^ ^)^ ^(^ ^ ^          
echo           ^|^ ^(^_^_^_^)^ ^| ^|^ ^|^ ^ ^ ^|^ ^| ^|^ ^(^_^_^_^_^_^  ^ ^ ^ ^|^ ^|^ ^ ^   ^ ^_^_^_^_^_^   ^|^ ^(^_^_^ ^ ^ ^  ^ ^ ^ ^|^ ^|^ ^ ^          
echo           ^|^ ^ ^_^_^_^ ^ ^| ^|^ ^|^ ^ ^ ^|^ ^| ^(^_^_^_^_^_^ ^ ^) ^ ^ ^ ^|^ ^|^ ^ ^   ^(^_^_^_^_^_^)  ^|^ ^ ^_^_^)^ ^ ^  ^ ^ ^ ^|^ ^|^ ^ ^          
echo           ^|^ ^(^ ^ ^ ^)^ ^| ^|^ ^|^ ^ ^ ^|^ ^| ^ ^ ^ ^ ^ ^ ^)^ ^| ^ ^ ^ ^|^ ^|^ ^ ^   ^ ^ ^ ^ ^ ^ ^   ^|^ ^(^ ^ ^ ^ ^ ^  ^ ^ ^ ^|^ ^|^ ^ ^          
echo           ^|^ ^)^ ^ ^ ^(^ ^| ^|^ ^(^_^_^_^)^ ^| ^/^\^_^_^_^_^)^ ^| ^ ^ ^ ^|^ ^|^ ^ ^   ^ ^ ^ ^ ^ ^ ^   ^|^ ^)^ ^ ^ ^ ^ ^  ^_^_^_^)^ ^(^_^_^_         
echo           ^|^/^ ^ ^ ^ ^ ^\^| ^(^_^_^_^_^_^_^_^) ^\^_^_^_^_^_^_^_^) ^ ^ ^ ^)^_^(^ ^ ^   ^ ^ ^ ^ ^ ^ ^   ^|^/^ ^ ^ ^ ^ ^ ^  ^\^_^_^_^_^_^_^_^/         
echo.
echo.
echo           \ ============ Configtion ============== /
echo.
echo           ^+----------------------------------------^+
echo           ^|                                        ^|
echo           ^|     Press (I) to Install the tool.     ^|
echo           ^|                                        ^|
echo           ^|     Press (U) to Uninstall the tool.   ^|
echo           ^|                                        ^|
echo           ^|     Press (Q) to Quit.                 ^|
echo           ^+----------------------------------------^+
echo.
  set /p config=^|         Enter your configtion (I/U/Q) :- 
   
    if not defined config goto Emsg
    if /i %config% equ i ( goto install
    ) else if /i %config% equ u ( goto uninstall
    ) else if /i %config% equ q ( exit /b
    ) else ( 
      color 0C
      echo.
      echo      !failed to do something.
      ping localhost -n 4 > nul
      set config=
      cls
      goto setuploop
    )

       :Emsg
       color 07
       echo.
       echo     Please select any type to continue.
       ping localhost -n 4 > nul
       set config=
       cls
       goto setuploop


:install
echo.
echo      Creating Desktop icon .........  
ping localhost -n 3 > nul
echo.
echo      Creating Shortcut key .........
ping localhost -n 4 > nul
echo.
Call :DesktopIcon "%~dp0/host-fi.bat" "Host-Fi" "%~dp0\Help\icon\myicon.ico" "ALT+S"
exit /B

      :DesktopIcon <ApplicationPath> <ShortcutName> <Icon> <HotKey>

      (

      	echo Call Shortcut("%~1","%~2","%~3","%~4"^)
      	echo Sub Shortcut(ApplicationPath,Name,Icon,HotKey^)
      	echo	Dim objShell,DesktopPath,objShortCut,MyTab
      	echo	Set objShell = CreateObject("WScript.Shell"^)
      	echo	MyTab = Split^(ApplicationPath,"\"^)
      	echo	If Name = "" Then
      	echo		Name = MyTab(UBound^(MyTab^)^)
      	echo	End if
      	echo	DesktopPath = objShell.SpecialFolders("Desktop"^)
      	echo	Set objShortCut = objShell.CreateShortcut(DesktopPath ^& "\" ^& Name ^& ".lnk"^)
      	echo	objShortCut.TargetPath = Chr(34^) ^& ApplicationPath ^& Chr^(34^)
      	echo	ObjShortCut.IconLocation = Icon
      	echo	ObjShortCut.WorkingDirectory = "%~dp0"
      	echo	objShortCut.HotKey = Hotkey
      	echo	objShortCut.Save
      	echo End Sub

      )>"%temp%\Shortcut.vbs"
        wscript "%temp%\Shortcut.vbs" & Del "%temp%\Shortcut.vbs"
        echo      !Done Your tool has installed sucessfully. Use desktop icon to start the tool.
        echo.  
        echo      Use shortcut key to start tool :- ALT+S
        echo.
        echo      Press any key to continue . . . . . . .
        pause > nul
        set config=
        cls
        goto setuploop


:uninstall
echo.
echo           Processing ..........
ping localhost -n 3 > nul
echo.
echo           Deleting configrations . . . . .
ping localhost -n 3 > nul
del %road%\Host-Fi.lnk
echo.
echo           !Done Your Tool is Uninstalled Sucessfully.
echo.
echo    Press any key to continue . . . . . 
pause > nul
set config=
cls
goto setuploop
