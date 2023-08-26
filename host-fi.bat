@echo off
title Host-fi ( Your Friend to built your own network . . . . . . )
for /l %%i in ('1, 1, 3') do (

    echo.
    echo        Loading ........... /
    ping localhost -n 2 > nul
    cls
    echo.
    echo        Loading ........... --
    ping localhost -n 2 > nul
    cls
    echo.
    echo        Loading ........... \
    ping localhost -n 2 > nul
    cls
  
) 
echo.
echo        Starting . . . . . . .
ping localhost -n 4 > nul

cls

color 0A
:hash
color 0A
echo      ----------------------------------------------------------------------------------------  
echo      "                                       .~.                                            "   
echo      "                                        @@?                                           "   
echo      "                                   &#.   P@P                                          "   
echo      "                             5?     @@^   P@J                                         "   
echo      "                             Y@G     @&    @&                                         "   
echo      "                              @@     @@    @@                                         " 
echo      "             .@@.    .@@.    &@^    5@5   !@B                                         "   
echo      "             .@@.    .@@.          B@P    @@                                          "   
echo      "             .@@.    .@@.          ?^   ?@&                                           "   
echo      "             .@@.    .@@.              ~&Y                                            "   
echo      "             .@@.    .@@.                                                             "   
echo      "             .@@.    .@@.                                                             "   
echo      "              @@      @@                                                              "   
echo      "         .JBBB@@BBBBBB@@BBBBBBBBBBBBBBBBBBBBBBBBBJ.                                   "   
echo      "         &@   :.:  :.:  :.:  :.:  :.:            @&                                   "   
echo      "         @@                                      @@                                   "   
echo      "         @@   (O)  (O)  (O)  (O)  (O)            @@                                   "     
echo      "         7&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&7                                   "   
echo      "                                                                                      "
echo      "                   _______   _______  _________            _______  _________         "
echo      "        |\     /| (  ___  ) (  ____ \ \__   __/           (  ____ \ \__   __/         "
echo      "        | )   ( | | (   ) | | (    \/    ) (              | (    \/    ) (            "
echo      "        | (___) | | |   | | | (_____     | |      _____   | (__        | |            "
echo      "        |  ___  | | |   | | (_____  )    | |     (_____)  |  __)       | |            "
echo      "        | (   ) | | |   | |       ) |    | |              | (          | |            "
echo      "        | )   ( | | (___) | /\____) |    | |              | )       ___) (___         "
echo      "        |/     \| (_______) \_______)    )_(              |/        \_______/         "
echo      "                                                                                      "
echo      "                 +----------(+) Tool- Name : Host-Fi (+)----------+                   "
echo      "                    +--------(+) Author : Its-Jerry (+)---------+                     "
echo      "             +------(+) Github : https://github.com/Its-Jerry (+)------+              "
echo      "                                                                                      "
echo      ----------------------------------------------------------------------------------------
echo.
echo.
echo.
echo           \ ================= Operation ==================== /
echo.
echo               (1)  Create a new Hosted network.
echo               (2)  Start the Hosted network.
echo               (3)  Set/Change password for Hosted network.
echo               (4)  Stop the Hosted network.
echo               (5)  Details about Hosted network.
echo               (6)  Help for the tool.
echo.
echo               (7)  Clear the screen.
echo               (99) Exit.
echo.

:backtrack
color 0A
 set /p factor=  ^|      Enter the operation no. :-  
      
        if not defined factor goto masg2
             if %factor% equ 1 ( goto previous
      ) else if %factor% equ 2 ( 
      
          color 0d
          echo.
          echo        Starting ..........
          ping localhost -n 4 > nul
          echo.
          netsh wlan start hostednetwork
          echo.
          set factor=
          goto backtrack

      ) else if %factor% equ 3 ( goto keylock
      ) else if %factor% equ 4 ( 
         
                color 09
               echo.
               echo        Stopping ...........
               ping localhost -n 4 > nul
               echo.
               netsh wlan stop hostednetwork
               echo.
               ping localhost -n 2 > nul
               set factor=
               goto backtrack

      ) else if %factor% equ 5 ( 
   
                     echo.
                     echo    \ ================ Details ================ /
                     echo.
                     netsh wlan show hostednetwork 
                     echo Hosted network Password
                     echo -----------------------
                     netsh wlan show hostednetwork security | findstr User
                     echo. 
                     set factor=
                     goto backtrack

      ) else if %factor% equ 6 ( goto helpsec
      ) else if %factor% equ 7 (

         cls
         set factor=
         goto hash

      ) else if %factor% equ 99 ( 
         
         color 09
        echo.
        echo        Exiting ...........
        echo.
        ping localhost -n 4 > nul
        exit /B 0


      ) else ( 
      
       color 0C
       echo.
       echo     ! Invalid operation.
       echo.
       ping localhost -n 4 > nul
       set factor=
       goto backtrack 

      )

                 :previous
                 echo.
                 set /p hotspot= ^|      Enter the name for Hosted network :- 
                 echo.
                 netsh wlan set hostednetwork mode=allow ssid=%hotspot%
                 echo.
                 echo  Press Enter to start the hosted network . . . . .
                 pause > nul
                 echo.
                 color 0d
                 echo  Starting ...........
                 ping localhost -n 4 > nul
                 echo.
                 netsh wlan start hostednetwork
                 echo.
                 echo \ ================== Detail ================== /
                 echo.
                  netsh wlan show hostednetwork | findstr SSID 
                  echo.
                  netsh wlan show hostednetwork security | findstr User
                 echo.
                 set factor=
                 goto backtrack


:masg2
color 07
echo.
echo     Please select any operation to continue.
echo.
ping localhost -n 4 > nul
set factor=
goto backtrack


:keylock
echo.
set /p pass= ^|      Enter password for the hosted network :- 
echo.
netsh wlan set hostednetwork key=%pass%
echo.
set factor=
goto backtrack

:helpsec
:ddlp
color 06
echo.
echo         \ ========== HELP TYPE ========== /
echo.
echo             ^+-------------------------^+
echo             ^|    {1} Text based.      ^|
echo             ^|    {2} Web based.       ^|
echo             ^|                         ^|
echo             ^|    {3} Clear screen.    ^|
echo             ^|    {4} Back.            ^|
echo             ^+-------------------------^+
echo.
set /p helpmanu= ^|      Your choices :-  

if not defined helpmanu goto Emspc
if %helpmanu% equ 1 ( 

       echo.
       echo        Wait .........
       ping localhost -n 3 > nul
       type %~dp0\Help\README.txt
       echo.
       pause
       cls
       set helpmanu=
       goto ddlp


) else if %helpmanu% equ 2 ( 

               echo.
               echo        Wait .........
               ping localhost -n 3 > nul
               start %~dp0\Help\help_web.html
               echo.
               echo        Done!
               echo.
               pause
               cls
               set helpmanu=
               goto ddlp

) else if %helpmanu% equ 3 (
          cls
          set helpmanu=
          goto ddlp

) else if %helpmanu% equ 4 ( 

                 set helpmanu=
                 cls
                 goto hash

) else ( 
             
            color 0C
            echo.
            echo     ! Invalid operation.
            echo.
            ping localhost -n 4 > nul
            set helpmanu=
            goto ddlp 
)

:Emspc 
color 07
echo.
echo     Please select any operation to continue.
echo.
ping localhost -n 4 > nul
set helpmanu=
goto ddlp 

echo.
set factor=
goto backtrack

