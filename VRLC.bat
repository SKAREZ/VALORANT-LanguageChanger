:: ===========================================================================================================================
:: Uploaded on: https://github.com/SKAREZ/VALORANT-LanguageChanger/
::
:: /!\ For advanced users: Use VSCode to read this code (Recommended)
:: 
:: ==============================================
:: Copyright © 2022 SKAREZ - All rights reserved
:: ==============================================
::  
:: MIT License
::  
:: Permission is hereby granted, free of charge, to any person obtaining a copy
:: of this software and associated documentation files (the "Software"), to deal
:: in the Software without restriction, including without limitation the rights
:: to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
:: copies of the Software, and to permit persons to whom the Software is
:: furnished to do so, subject to the following conditions:
::  
:: The above copyright notice and this permission notice shall be included in all
:: copies or substantial portions of the Software.
::  
:: THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
:: IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
:: FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
:: AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
:: LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
:: OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
:: SOFTWARE.
::  
:: If you want to edit, republish, or even rewrote this code, ask the permission to the original creator of this code!
:: 
:: ===========================================================================================================================



:: ::::: ::
:: START ::
:: ::::: ::



REM #region START
:Start
@echo off
cls
:: Versions
set version=1.1.5.10
set gameversion=5.10
:: Dirs
set scriptpath=%~dp0
set hdL=%~d0
:: Programs
set valorant=VALORANT-Win64-Shipping.exe
set valolnk=VALORANT.lnk
set riotclient=RiotClientServices.exe
:: Script Languages
set language=English
:: Auto-Lang
set ar_AE=ar_AE_Audio-WindowsClient.pak
set de_DE=de_DE_Audio-WindowsClient.pak
set en_US=en_US_Audio-WindowsClient.pak
set es_ES=es_ES_Audio-WindowsClient.pak
set es_MX=es_MX_Audio-WindowsClient.pak
set fr_FR=fr_FR_Audio-WindowsClient.pak
set id_ID=id_ID_Audio-WindowsClient.pak
set it_IT=it_IT_Audio-WindowsClient.pak
set ja_JP=ja_JP_Audio-WindowsClient.pak
set ko_KR=ko_KR_Audio-WindowsClient.pak
set pl_PL=pl_PL_Audio-WindowsClient.pak
set pt_BR=pt_BR_Audio-WindowsClient.pak
set ru_RU=ru_RU_Audio-WindowsClient.pak
set th_TH=th_TH_Audio-WindowsClient.pak
set tr_TR=tr_TR_Audio-WindowsClient.pak
set vi_VN=vi_VN_Audio-WindowsClient.pak
set zh_TW=zh_TW_Audio-WindowsClient.pak
:: GitHub
set repo=VALORANT-LanguageChanger
set user=SKAREZ
set branch=vrlc
:: Copyright
set cr=Copyright (c) 2022 SKAREZ - All rights reserved
:: Misc
cd %scriptpath% >nul
chcp 65001 >nul
cls
goto Init
REM #endregion



:: :::: ::
:: INIT ::
:: :::: ::



REM #region INIT
:Init
cls
title VALORANT Language Changer - %version% (Initialization)
color B
echo Starting initialization...
echo.
ping -n 2 localhost >nul
cls
echo Checking for administrator permissions...
echo.
ping -n 2 localhost >nul
cls
net session >nul 2>&1
if %errorLevel% == 0 (
    color A
    echo [Success] Administrator permission active.
    echo.
    ping -n 2 localhost >nul
    cls
    goto Check_Valorant
) else (
    color 04
    echo [Error] Administrator permission inactive, restart VRLC as administrator.
    echo.
    ping -n 3 localhost >nul
    goto Script_Exit
)
REM #endregion INIT



:: :::::::::::::: ::
:: CHECK VALORANT ::
:: :::::::::::::: ::



REM #region VALORANT
:Check_Valorant
cls
title VALORANT Language Changer - %version% (Initialization)
color B
echo Checking if VALORANT is running...
echo.
ping -n 2 localhost >nul
cls
goto CheckV_Search

::

:CheckV_Search
echo %valorant% >nul
tasklist /fi "imagename eq %valorant%" |find ":" >nul
if %errorLevel% == 1  (
    cls
    color 04
    echo [Error] VALORANT is running, trying to shut it down...
    echo.
    ping -n 2 localhost >nul
    goto CheckV_Close
) else (
    color A
    echo [Success] VALORANT is already closed.
    echo.
    ping -n 2 localhost >nul
    goto First_Launch_Check
)

::

:CheckV_Close
color A
taskkill /im %valorant% /f >nul
cls
echo [Success] VALORANT as been closed successfully.
echo.
ping -n 2 localhost >nul
goto First_Launch_Check
REM #endregion VALORANT



:: :::::::::::::::::: ::
:: FIRST LAUNCH CHECK ::
:: :::::::::::::::::: ::



REM #region FLC
:First_Launch_Check
if not exist "%scriptpath%data\script\path.txt" goto Paths
set /p gamepath=<"%scriptpath%data\script\path.txt"
goto Paths_ConfirmCheck
REM #endregion FLC



:: ::::: ::
:: PATHS ::
:: ::::: ::



REM #region PATHS
:Paths
cls
color B
echo Setting up paths...
ping -n 2 localhost >nul
goto Paths_Set

::

:Paths_Set
cls
color C
echo Riot Games apps path is missing...
echo.
echo ▸ Script data path: "%scriptpath%"
echo ▸ Game and Riot installation path: Unknown
echo.
echo Please, enter the path where the Riot Games apps (Riot Client and VALORANT) are installed (Default: '%hdL%\Riot Games\')
set /P gamepath=» 
echo %gamepath%>"%scriptpath%data\script\path.txt"
if not defined gamepath goto Paths_InputError
goto Paths_FileCheck

::

:Paths_FileCheck
cls
color B
echo Checking if the gamepath is correct...
echo.
ping -n 2 localhost >nul
cls
if exist "%gamepath%\VALORANT\live\VALORANT.exe" (
  cls
  color A
  echo [Success] Gamepath correct!
  echo.
  ping -n 2 localhost >nul
  goto Paths_ConfirmCheck
) else (
  cls
  color 04
  echo [Error] Invalid gamepath: "%gamepath%"
  echo.
  ping -n 2 localhost >nul
  goto Paths
)

::

:Paths_FileCheck2
cls
color B
echo Checking if the gamepath is correct...
echo.
ping -n 2 localhost >nul
cls
if exist "%gamepath%\VALORANT\live\VALORANT.exe" (
  cls
  color A
  echo [Success] Gamepath correct!
  echo.
  ping -n 2 localhost >nul
  goto Main
) else (
  cls
  color 04
  echo [Error] Invalid gamepath: "%gamepath%"
  echo.
  ping -n 2 localhost >nul
  goto Paths_ReSet
)

::

:Paths_ConfirmCheck
if exist "%scriptpath%data\script\path.txt" (
    goto Check_Riot
) else (
    goto Paths
)

::

:Paths_Confirm
cls
color C
echo ▸ Script data path: "%scriptpath%"
echo ▸ Game and Riot installation path: "%gamepath%"
echo.
echo Theses paths are correct for you? (Y/N)
set /P paths_confirm=» 
if /I "%paths_confirm%" EQU "Y" goto Paths_ConfirmCheck
if /I "%paths_confirm%" EQU "N" goto Paths
goto Paths_InputError2

::

:Paths_ReSet
cls
color C
echo.
echo ▸ Script data path: "%scriptpath%"
echo ▸ Set game and Riot installation path: "%gamepath%"
echo.
echo Please, enter the new path where the Riot Games apps (Riot Client and VALORANT) are installed (Default: '%hdL%\Riot Games\')
set /P gamepath=» 
echo "%gamepath%>%scriptpath%data\script\path.txt"
if not defined gamepath goto Paths_InputError3
goto Paths_FileCheck2
REM #endregion PATHS



:: :::::::::: ::
:: CHECK RIOT ::
:: :::::::::: ::



REM #region RIOT
:Check_Riot
cls
color B
echo Checking if Riot Client is opened...
echo.
ping -n 2 localhost >nul
cls
goto CheckR_Search

::

:CheckR_Search
echo %riotclient% >nul
tasklist /fi "imagename eq %riotclient%" |find ":" >nul
if %errorLevel% == 0  (
    cls
    color 04
    echo [Error] Riot Client is not opened, launching it...
    echo.
    ping -n 2 localhost >nul
    goto CheckR_Open
) else (
    cls
    color A
    echo [Success] Riot Client is already opened.
    echo.
    ping -n 2 localhost >nul
    goto Init_End
)

::

:CheckR_Open
cd "%gamepath%\Riot Client\"
start %riotclient% >nul
goto CheckR_SearchSILENT

::

:CheckR_Open2
cls
color B
echo Launching Riot Client...
echo.
ping -n 8 localhost >nul
goto CheckR_SearchSILENT

::

:CheckR_SearchSILENT
echo %riotclient% >nul
tasklist /fi "imagename eq %riotclient%" |find ":" >nul
if %errorLevel% == 0  (
    goto CheckR_Open2
) else (
    goto Init_End
)

::

:Init_End
cls
color B
echo Finishing initialization...
echo.
cd %scriptpath% >nul
copy /y "%scriptpath%data\script\shortcut\*.*" "%gamepath%\Riot Client" >nul
ping -n 2 localhost >nul
cls
echo Loading...
echo.
ping -n 4 localhost >nul
goto AutoLang
REM #endregion RIOT



:: :::: ::
:: MAIN ::
:: :::: ::



REM #region MAIN
:Main
title VALORANT Language Changer - %version% (Main Menu)
cls
color C
echo.
echo  ---------------------------
echo   VALORANT Language Changer
echo      Game Version: %gameversion%
echo    Made with ‹3 by SKAREZ
echo  ---------------------------
echo.
echo ▸ Script data path: "%scriptpath%"
echo ▸ Game installation path: "%gamepath%"
echo.
echo.
echo           Choose your actual game language
echo.
echo         1. Arabic              10. Polish
echo         2. Chinese             11. Portuguese
echo         3. Deutsch             12. Russian
echo         4. English             13. Spanish (ES)
echo         5. French              14. Spanish (LATAM)
echo         6. Indonesian          15. Thai
echo         7. Italian             16. Turkish
echo         8. Japanese            17. Vietnamese
echo         9. Korean              20. Change Paths
echo                 A. Automatic Mode
echo.
echo (i) Type "H" to see the Help page
echo /!\ Type "D" to see the Disclaimer page
echo.
set /P main=Input » 
if not defined main goto Main_InputError
if /I "%main%" EQU "1" goto ar_AE
if /I "%main%" EQU "2" goto zh_TW
if /I "%main%" EQU "3" goto de_DE
if /I "%main%" EQU "4" goto en_US
if /I "%main%" EQU "5" goto fr_FR
if /I "%main%" EQU "6" goto id_ID
if /I "%main%" EQU "7" goto it_IT
if /I "%main%" EQU "8" goto ja_JP
if /I "%main%" EQU "9" goto ko_KR
if /I "%main%" EQU "10" goto pl_PL
if /I "%main%" EQU "11" goto pt_BR
if /I "%main%" EQU "12" goto ru_RU
if /I "%main%" EQU "13" goto es_ES
if /I "%main%" EQU "14" goto es_MX
if /I "%main%" EQU "15" goto th_TH
if /I "%main%" EQU "16" goto tr_TR
if /I "%main%" EQU "17" goto vi_VN
if /I "%main%" EQU "A" goto AutoLang
if /I "%main%" EQU "20" goto Paths_ReSet
if /I "%main%" EQU "H" goto Main_Help
if /I "%main%" EQU "D" goto Main_Disclaimer
goto Main_InputError

::

:Main_Help
title VALORANT Language Changer - %version% (Help Page)
cls
color A
echo.
echo Welcome to the Help page, if you have some issues, this maybe gonna help you!
echo If you can't resolve your problems or questions, maybe try to read the FAQ on
echo the GitHub page or try to contact SKAREZ#9416 on Discord!
echo.
echo Script issues solutions:
echo - The script is obsolete due to a new VALORANT patch
echo - The game installation path is not correct or invalid
echo - This version of the script is obsolete, try to check if a newest version
echo   is avalaible
echo - Your Riot Client was not opened before the injection, so VALORANT as been
echo   automatically updated
echo.
echo Addicionnal info:
echo - This script is only for changing VALORANT's game text language, if you
echo   want to change the audio language, change your default game language to
echo   the language you want for the audio in game, or, with the Riot Client.
echo.
echo.
echo Script version: %version%
echo Version caption: "Main script version"."Additionnal Version to Main script version"."Main Game version"."Additionnal Version to Game version"
echo Compatible game version: %gameversion%
echo.
echo %cr%
echo.
pause >nul
goto Main

::

:Main_Disclaimer
title VALORANT Language Changer - %version% (Disclaimer Page)
cls
color 04
echo.
echo Welcome to the Disclaimer page, this is some informations you may need to read before
echo starting using VRLC, to avoid problems during the injections!
echo.
echo Stuff to know before using VRLC:
echo - Don't forget to have VALORANT up to date and closed before the injection!
echo - Make sure to still have your Riot Client opened before the injection to avoid
echo   an auto-update of the language text files, obviously, after a restart of the game
echo   you need to re-inject the language text files that you want to have!
echo - You need to redo the injection after a game/Riot Client restart or after a game update
echo   (Not recommended to reinject the files after a major/bugfix game update)
echo.
echo Stuff that can cause you issues:
echo - Edit this code or touch to the data files of it (Same for your game installation files)
echo   (May affect the injection program, or even make crash your game!)
echo.
echo Important to know:
echo - Using this script is technically illegal from Riot, you may can get banned from VALORANT
echo   (It's still rare to get banned for changing language files) but if Riot's Vanguard Anti-Cheat detects
echo   that theses files were 'modified', you could get banned for 'Cheat', 'Illegal copy of the game'
echo   or 'Edited game files'. Read more about Riot Games VALORANT's TOS: https://www.riotgames.com/en/terms-of-service
echo - Iv'e not tested all of the languages of the game with this script! If some tricks doesn't work, it's probably
echo   because VALORANT don't reconize the 'Charset' (UTF...) with your current selectionned game language, so maybe
echo   the game will crash or don't show texts in-game or even don't play the audios... I appreciate if you can
echo   tell me about a bug like this for certains combinaisons of text/audio language in Discord or GitHub! Thanks a lot!
echo - If you have spotted a bug or something esle like that, don't forget to report this to the developper on Discord or GitHub!
echo.
pause >nul
goto Main
REM #endregion MAIN



:: :::::::: ::
:: AUTOLANG ::
:: :::::::: ::


REM #region AUTOLANG
:AutoLang
title VALORANT Language Changer - %version% (Automatic Mode)
cls
color C
echo.
echo [Automatic Mode] Selecting the default game language automatically...
echo.
ping -n 2 localhost >nul
goto AutoLang-Switch

::

:AutoLang-Switch
if exist "%gamepath%VALORANT\live\ShooterGame\Content\Paks\%ar_AE%" (
    goto AutoLang-Arabic 
) else (
    goto AutoLang-Switch_1
    )
:AutoLang-Switch_1
if exist "%gamepath%VALORANT\live\ShooterGame\Content\Paks\%de_DE%" (
    goto AutoLang-Deutsch 
) else (
    goto AutoLang-Switch_2
    )
:AutoLang-Switch_2
if exist "%gamepath%VALORANT\live\ShooterGame\Content\Paks\%en_US%" (
    goto AutoLang-English
) else (
    goto AutoLang-Switch_3
)
:AutoLang-Switch_3
if exist "%gamepath%VALORANT\live\ShooterGame\Content\Paks\%es_ES%" (
    goto AutoLang-SpanishES
) else (
    goto AutoLang-Switch_4
)
:AutoLang-Switch_4
if exist "%gamepath%VALORANT\live\ShooterGame\Content\Paks\%es_MX%" (
    goto AutoLang-SpanishMX
) else (
    goto AutoLang-Switch_5
)
:AutoLang-Switch_5
if exist "%gamepath%VALORANT\live\ShooterGame\Content\Paks\%fr_FR%" (
    goto AutoLang-French
) else (
    goto AutoLang-Switch_6
)
:AutoLang-Switch_6
if exist "%gamepath%VALORANT\live\ShooterGame\Content\Paks\%id_ID%" (
    goto AutoLang-Indonesian
) else (
    goto AutoLang-Switch_7
)
:AutoLang-Switch_7
if exist "%gamepath%VALORANT\live\ShooterGame\Content\Paks\%it_IT%" (
    goto AutoLang-Italian
) else (
    goto AutoLang-Switch_8
)
:AutoLang-Switch_8
if exist "%gamepath%VALORANT\live\ShooterGame\Content\Paks\%ja_JP%" (
    goto AutoLang-Japanese
) else (
    goto AutoLang-Switch_9
)
:AutoLang-Switch_9
if exist "%gamepath%VALORANT\live\ShooterGame\Content\Paks\%ko_KR%" (
    goto AutoLang-Korean
) else (
    goto AutoLang-Switch_10
)
:AutoLang-Switch_10
if exist "%gamepath%VALORANT\live\ShooterGame\Content\Paks\%pl_PL%" (
    goto AutoLang-Polish
) else (
    goto AutoLang-Switch_11
)
:AutoLang-Switch_11
if exist "%gamepath%VALORANT\live\ShooterGame\Content\Paks\%pt_BR%" (
    goto AutoLang-Portuguese
) else (
    goto AutoLang-Switch_12
)
:AutoLang-Switch_12
if exist "%gamepath%VALORANT\live\ShooterGame\Content\Paks\%ru_RU%" (
    goto AutoLang-Russian
) else (
    goto AutoLang-Switch_13
)
:AutoLang-Switch_13
if exist "%gamepath%VALORANT\live\ShooterGame\Content\Paks\%th_TH%" (
    goto AutoLang-Thai
) else (
    goto AutoLang-Switch_14
)
:AutoLang-Switch_14
if exist "%gamepath%VALORANT\live\ShooterGame\Content\Paks\%tr_TR%" (
    goto AutoLang-Turkish
) else (
    goto AutoLang-Switch_15
)
:AutoLang-Switch_15
if exist "%gamepath%VALORANT\live\ShooterGame\Content\Paks\%vi_VN%" (
    goto AutoLang-Vietnamese
) else (
    goto AutoLang-Switch_16
)
:AutoLang-Switch_16
if exist "%gamepath%VALORANT\live\ShooterGame\Content\Paks\%zh_TW%" (
    goto AutoLang-Chinese
) else (
    goto AutoLang_Error
)

::

:AutoLang-Arabic
title VALORANT Language Changer - %version% (Automatic Mode)
cls
color A
echo.
echo [Success] Default game language auto-selected: Arabic
echo.
ping -n 2 localhost >nul
goto AutoLang-Arabic_Valid

:AutoLang-Arabic_Valid
cls
color C
echo.
echo Do you want to continue with 'Arabic' default game language? (Y/N)
set /P input=» 
if /I "%input%" EQU "Y" goto ar_AE
if /I "%input%" EQU "N" goto Main
goto AL-ar_AE_InputError

::

:AutoLang-Deutsch
title VALORANT Language Changer - %version% (Automatic Mode)
cls
color A
echo.
echo [Success] Default game language auto-selected: Deutsch
echo.
ping -n 2 localhost >nul
goto AutoLang-Deutsch_Valid

:AutoLang-Deutsch_Valid
cls
color C
echo.
echo Do you want to continue with 'Deutsch' default game language? (Y/N)
set /P input=» 
if /I "%input%" EQU "Y" goto de_DE
if /I "%input%" EQU "N" goto Main
goto AL-de_DE_InputError

::

:AutoLang-English
title VALORANT Language Changer - %version% (Automatic Mode)
cls
color A
echo.
echo [Success] Default game language auto-selected: English
echo.
ping -n 2 localhost >nul
goto AutoLang-English_Valid

:AutoLang-English_Valid
cls
color C
echo.
echo Do you want to continue with 'English' default game language? (Y/N)
set /P input=» 
if /I "%input%" EQU "Y" goto en_US
if /I "%input%" EQU "N" goto Main
goto AL-en_US_InputError

::

:AutoLang-SpanishES
title VALORANT Language Changer - %version% (Automatic Mode)
cls
color A
echo.
echo [Success] Default game language auto-selected: Spanish (ES)
echo.
ping -n 2 localhost >nul
goto AutoLang-SpanishES_Valid

:AutoLang-SpanishES_Valid
cls
color C
echo.
echo Do you want to continue with 'Spanish (ES)' default game language? (Y/N)
set /P input=» 
if /I "%input%" EQU "Y" goto es_ES
if /I "%input%" EQU "N" goto Main
goto AL-es_ES_InputError

::

:AutoLang-SpanishMX
title VALORANT Language Changer - %version% (Automatic Mode)
cls
color A
echo.
echo [Success] Default game language auto-selected: Spanish (LATAM)
echo.
ping -n 2 localhost >nul
goto AutoLang-SpanishMX_Valid

:AutoLang-SpanishMX_Valid
cls
color C
echo.
echo Do you want to continue with 'Spanish (LATAM)' default game language? (Y/N)
set /P input=» 
if /I "%input%" EQU "Y" goto es_MX
if /I "%input%" EQU "N" goto Main
goto AL-es_MX_InputError

::

:AutoLang-French
title VALORANT Language Changer - %version% (Automatic Mode)
cls
color A
echo.
echo [Success] Default game language auto-selected: French
echo.
ping -n 2 localhost >nul
goto AutoLang-French_Valid

:AutoLang-French_Valid
cls
color C
echo.
echo Do you want to continue with 'French' default game language? (Y/N)
set /P input=» 
if /I "%input%" EQU "Y" goto fr_FR
if /I "%input%" EQU "N" goto Main
goto AL-fr_FR_InputError

::

:AutoLang-id_ID
title VALORANT Language Changer - %version% (Automatic Mode)
cls
color A
echo.
echo [Success] Default game language auto-selected: Indonesian
echo.
ping -n 2 localhost >nul
goto AutoLang-Indonesian_Valid

:AutoLang-Indonesian_Valid
cls
color C
echo.
echo Do you want to continue with 'Indonesian' default game language? (Y/N)
set /P input=» 
if /I "%input%" EQU "Y" goto id_ID
if /I "%input%" EQU "N" goto Main
goto AL-id_ID_InputError

::

:AutoLang-it_IT
title VALORANT Language Changer - %version% (Automatic Mode)
cls
color A
echo.
echo [Success] Default game language auto-selected: Italian
echo.
ping -n 2 localhost >nul
goto AutoLang-Italian_Valid

:AutoLang-Italian_Valid
cls
color C
echo.
echo Do you want to continue with 'Italian' default game language? (Y/N)
set /P input=» 
if /I "%input%" EQU "Y" goto it_IT
if /I "%input%" EQU "N" goto Main
goto AL-it_IT_InputError

::

:AutoLang-ja_JP
title VALORANT Language Changer - %version% (Automatic Mode)
cls
color A
echo.
echo [Success] Default game language auto-selected: Japanese
echo.
ping -n 2 localhost >nul
goto AutoLang-Japanese_Valid

:AutoLang-Japanese_Valid
cls
color C
echo.
echo Do you want to continue with 'Japanese' default game language? (Y/N)
set /P input=» 
if /I "%input%" EQU "Y" goto ja_JP
if /I "%input%" EQU "N" goto Main
goto AL-ja_JP_InputError

::

:AutoLang-ko_KR
title VALORANT Language Changer - %version% (Automatic Mode)
cls
color A
echo.
echo [Success] Default game language auto-selected: Korean
echo.
ping -n 2 localhost >nul
goto AutoLang-Korean_Valid

:AutoLang-Korean_Valid
cls
color C
echo.
echo Do you want to continue with 'Korean' default game language? (Y/N)
set /P input=» 
if /I "%input%" EQU "Y" goto ko_KR
if /I "%input%" EQU "N" goto Main
goto AL-ko_KR_InputError

::

:AutoLang-pl_PL
title VALORANT Language Changer - %version% (Automatic Mode)
cls
color A
echo.
echo [Success] Default game language auto-selected: Polish
echo.
ping -n 2 localhost >nul
goto AutoLang-Polish_Valid

:AutoLang-Polish_Valid
cls
color C
echo.
echo Do you want to continue with 'Polish' default game language? (Y/N)
set /P input=» 
if /I "%input%" EQU "Y" goto pl_PL
if /I "%input%" EQU "N" goto Main
goto AL-pl_PL_InputError

::

:AutoLang-pt_BR
title VALORANT Language Changer - %version% (Automatic Mode)
cls
color A
echo.
echo [Success] Default game language auto-selected: Portuguese
echo.
ping -n 2 localhost >nul
goto AutoLang-Portuguese_Valid

:AutoLang-Portuguese_Valid
cls
color C
echo.
echo Do you want to continue with 'Portuguese' default game language? (Y/N)
set /P input=» 
if /I "%input%" EQU "Y" goto pt_BR
if /I "%input%" EQU "N" goto Main
goto AL-pt_BR_InputError

::

:AutoLang-ru_RU
title VALORANT Language Changer - %version% (Automatic Mode)
cls
color A
echo.
echo [Success] Default game language auto-selected: Russian
echo.
ping -n 2 localhost >nul
goto AutoLang-Russian_Valid

:AutoLang-Russian_Valid
cls
color C
echo.
echo Do you want to continue with 'Russian' default game language? (Y/N)
set /P input=» 
if /I "%input%" EQU "Y" goto ru_RU
if /I "%input%" EQU "N" goto Main
goto AL-ru_RU_InputError

::

:AutoLang-th_TH
title VALORANT Language Changer - %version% (Automatic Mode)
cls
color A
echo.
echo [Success] Default game language auto-selected: Thai
echo.
ping -n 2 localhost >nul
goto AutoLang-Thai_Valid

:AutoLang-Thai_Valid
cls
color C
echo.
echo Do you want to continue with 'Thai' default game language? (Y/N)
set /P input=» 
if /I "%input%" EQU "Y" goto th_TH
if /I "%input%" EQU "N" goto Main
goto AL-th_TH_InputError

::

:AutoLang-tr_TR
title VALORANT Language Changer - %version% (Automatic Mode)
cls
color A
echo.
echo [Success] Default game language auto-selected: Turkish
echo.
ping -n 2 localhost >nul
goto AutoLang-Turkish_Valid

:AutoLang-Turkish_Valid
cls
color C
echo.
echo Do you want to continue with 'Turkish' default game language? (Y/N)
set /P input=» 
if /I "%input%" EQU "Y" goto tr_TR
if /I "%input%" EQU "N" goto Main
goto AL-tr_TR_InputError

::

:AutoLang-vi_VN
title VALORANT Language Changer - %version% (Automatic Mode)
cls
color A
echo.
echo [Success] Default game language auto-selected: Vietnamese
echo.
ping -n 2 localhost >nul
goto AutoLang-Vietnamese_Valid

:AutoLang-Vietnamese_Valid
cls
color C
echo.
echo Do you want to continue with 'Vietnamese' default game language? (Y/N)
set /P input=» 
if /I "%input%" EQU "Y" goto vi_VN
if /I "%input%" EQU "N" goto Main
goto AL-vi_VN_InputError

::

:AutoLang-zh_TW
title VALORANT Language Changer - %version% (Automatic Mode)
cls
color A
echo.
echo [Success] Default game language auto-selected: Chinese
echo.
ping -n 2 localhost >nul
goto AutoLang-Chinese_Valid

:AutoLang-Chinese_Valid
cls
color C
echo.
echo Do you want to continue with 'Chinese' default game language? (Y/N)
set /P input=» 
if /I "%input%" EQU "Y" goto zh_TW
if /I "%input%" EQU "N" goto Main
goto AL-zh_TW_InputError

::

:AutoLang_Error
cls
color 04
echo.
echo [Error] The Automatic Mode wasn't able to select the default game language, moving on Main Menu...
echo.
ping -n 4 localhost >nul
goto Main
REM #endregion AUTOLANG



:: ::::::::: ::
:: LANGUAGES ::
:: ::::::::: ::



REM #region LANGUAGES

REM #region ARABIC



:: :::::: ::
:: ARABIC ::
:: :::::: ::



:ar_AE
cls
color C
title VALORANT Language Changer - %version% (Arabic)
echo.
echo Select the text language you want to have with the Arabic (AUE) audio!
echo.
echo         1. Arabic              10. Polish
echo         2. Chinese             11. Portuguese
echo         3. Deutsch             12. Russian
echo         4. English             13. Spanish (ES)
echo         5. French              14. Spanish (LATAM)
echo         6. Indonesian          15. Thai
echo         7. Italian             16. Turkish
echo         8. Japanese            17. Vietnamese
echo         9. Korean              20. Main Menu
echo.
set /P input=» 
if /I "%input%" EQU "1" goto ar_AE_Arabic
if /I "%input%" EQU "2" goto ar_AE_Chinese
if /I "%input%" EQU "3" goto ar_AE_Deutsch
if /I "%input%" EQU "4" goto ar_AE_English
if /I "%input%" EQU "5" goto ar_AE_French
if /I "%input%" EQU "6" goto ar_AE_Indonesian
if /I "%input%" EQU "7" goto ar_AE_Italian
if /I "%input%" EQU "8" goto ar_AE_Japanese
if /I "%input%" EQU "9" goto ar_AE_Korean
if /I "%input%" EQU "10" goto ar_AE_Polish
if /I "%input%" EQU "11" goto ar_AE_Portuguese
if /I "%input%" EQU "12" goto ar_AE_Russian
if /I "%input%" EQU "13" goto ar_AE_SpanishES
if /I "%input%" EQU "14" goto ar_AE_SpanishLATAM
if /I "%input%" EQU "15" goto ar_AE_Thai
if /I "%input%" EQU "16" goto ar_AE_Turkish
if /I "%input%" EQU "17" goto ar_AE_Vietnamese
if /I "%input%" EQU "20" goto Main
goto ar_AE_InputError

::

:ar_AE_Arabic
cls
color B
echo.
echo Injecting the files... (Arabic ∙ Arabic)
echo.
copy /y "%scriptpath%data\ar_AE\Arabic\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:ar_AE_Indonesian
cls
color B
echo.
echo Injecting the files... (Indonesian ∙ Arabic)
echo.
copy /y "%scriptpath%data\ar_AE\Indonesian\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:ar_AE_Chinese
cls
color B
echo.
echo Injecting the files... (Chinese ∙ Arabic)
echo.
copy /y "%scriptpath%data\ar_AE\Chinese\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:ar_AE_Deutsch
cls
color B
echo.
echo Injecting the files... (Deutsch ∙ Arabic)
echo.
copy /y "%scriptpath%data\ar_AE\Deutsch\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:ar_AE_English
cls
color B
echo.
echo Injecting the files... (English ∙ Arabic)
echo.
copy /y "%scriptpath%data\ar_AE\English\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:ar_AE_SpanishES
cls
color B
echo.
echo Injecting the files... (Spanish (ES) ∙ Arabic)
echo.
copy /y "%scriptpath%data\ar_AE\SpanishES\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:ar_AE_SpanishLATAM
cls
color B
echo.
echo Injecting the files... (Spanish (LATAM) ∙ Arabic)
echo.
copy /y "%scriptpath%data\ar_AE\SpanishLATAM\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:ar_AE_French
cls
color B
echo.
echo Injecting the files... (French ∙ Arabic)
echo.
copy /y "%scriptpath%data\ar_AE\French\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:ar_AE_Italian
cls
color B
echo.
echo Injecting the files... (Italian ∙ Arabic)
echo.
copy /y "%scriptpath%data\ar_AE\Italian\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:ar_AE_Japanese
cls
color B
echo.
echo Injecting the files... (Japanese ∙ Arabic)
echo.
copy /y "%scriptpath%data\ar_AE\Japanese\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:ar_AE_Korean
cls
color B
echo.
echo Injecting the files... (Korean ∙ Arabic)
echo.
copy /y "%scriptpath%data\ar_AE\Korean\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:ar_AE_Polish
cls
color B
echo.
echo Injecting the files... (Polish ∙ Arabic)
echo.
copy /y "%scriptpath%data\ar_AE\Polish\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:ar_AE_Portuguese
cls
color B
echo.
echo Injecting the files... (Portuguese ∙ Arabic)
echo.
copy /y "%scriptpath%data\ar_AE\Portuguese\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:ar_AE_Russian
cls
color B
echo.
echo Injecting the files... (Russian ∙ Arabic)
echo.
copy /y "%scriptpath%data\ar_AE\Russian\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:ar_AE_Thai
cls
color B
echo.
echo Injecting the files... (Thai ∙ Arabic)
echo.
copy /y "%scriptpath%data\ar_AE\Thai\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:ar_AE_Turkish
cls
color B
echo.
echo Injecting the files... (Turkish ∙ Arabic)
echo.
copy /y "%scriptpath%data\ar_AE\Turkish\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:ar_AE_Vietnamese
cls
color B
echo.
echo Injecting the files... (Vietnamese∙ Arabic)
echo.
copy /y "%scriptpath%data\ar_AE\Vietnamese\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End
REM #endregion ARABIC
REM #region INDONESIAN



:: :::::::::: ::
:: INDONESIAN ::
:: :::::::::: ::



:id_ID
cls
color C
title VALORANT Language Changer - %version% (Indonesian)
echo.
echo Select the text language you want to have to have with the Indonesian audio!
echo.
echo         1. Arabic              10. Polish
echo         2. Chinese             11. Portuguese
echo         3. Deutsch             12. Russian
echo         4. English             13. Spanish (ES)
echo         5. French              14. Spanish (LATAM)
echo         6. Indonesian          15. Thai
echo         7. Italian             16. Turkish
echo         8. Japanese            17. Vietnamese
echo         9. Korean              20. Main Menu
echo.
set /P input=» 
if /I "%input%" EQU "1" goto id_ID_Arabic
if /I "%input%" EQU "2" goto id_ID_Chinese
if /I "%input%" EQU "3" goto id_ID_Deutsch
if /I "%input%" EQU "4" goto id_ID_English
if /I "%input%" EQU "5" goto id_ID_French
if /I "%input%" EQU "6" goto id_ID_Indonesian
if /I "%input%" EQU "7" goto id_ID_Italian
if /I "%input%" EQU "8" goto id_ID_Japanese
if /I "%input%" EQU "9" goto id_ID_Korean
if /I "%input%" EQU "10" goto id_ID_Polish
if /I "%input%" EQU "11" goto id_ID_Portuguese
if /I "%input%" EQU "12" goto id_ID_Russian
if /I "%input%" EQU "13" goto id_ID_SpanishES
if /I "%input%" EQU "14" goto id_ID_SpanishLATAM
if /I "%input%" EQU "15" goto id_ID_Thai
if /I "%input%" EQU "16" goto id_ID_Turkish
if /I "%input%" EQU "17" goto id_ID_Vietnamese
if /I "%input%" EQU "20" goto Main
goto id_ID_InputError

::

:id_ID_Arabic
cls
color B
echo.
echo Injecting the files... (Arabic ∙ Indonesian)
echo.
copy /y "%scriptpath%data\id_ID\Arabic\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:id_ID_Indonesian
cls
color B
echo.
echo Injecting the files... (Indonesian ∙ Indonesian)
echo.
copy /y "%scriptpath%data\id_ID\Indonesian\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:id_ID_Chinese
cls
color B
echo.
echo Injecting the files... (Chinese ∙ Indonesian)
echo.
copy /y "%scriptpath%data\id_ID\Arabic\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:id_ID_Deutsch
cls
color B
echo.
echo Injecting the files... (Deutsch ∙ Indonesian)
echo.
copy /y "%scriptpath%data\id_ID\Deutsch\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:id_ID_English
cls
color B
echo.
echo Injecting the files... (English ∙ Indonesian)
echo.
copy /y "%scriptpath%data\id_ID\English\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:id_ID_SpanishES
cls
color B
echo.
echo Injecting the files... (Spanish (ES) ∙ Indonesian)
echo.
copy /y "%scriptpath%data\id_ID\SpanishES\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:id_ID_SpanishLATAM
cls
color B
echo.
echo Injecting the files... (Spanish (LATAM) ∙ Indonesian)
echo.
copy /y "%scriptpath%data\id_ID\SpanishLATAM\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:id_ID_French
cls
color B
echo.
echo Injecting the files... (French ∙ Indonesian)
echo.
copy /y "%scriptpath%data\id_ID\French\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:id_ID_Italian
cls
color B
echo.
echo Injecting the files... (Italian ∙ Indonesian)
echo.
copy /y "%scriptpath%data\id_ID\Italian\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:id_ID_Japanese
cls
color B
echo.
echo Injecting the files... (Japanese ∙ Indonesian)
echo.
copy /y "%scriptpath%data\id_ID\Japanese\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:id_ID_Korean
cls
color B
echo.
echo Injecting the files... (Korean ∙ Indonesian)
echo.
copy /y "%scriptpath%data\id_ID\Korean\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:id_ID_Polish
cls
color B
echo.
echo Injecting the files... (Polish ∙ Indonesian)
echo.
copy /y "%scriptpath%data\id_ID\Polish\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:id_ID_Portuguese
cls
color B
echo.
echo Injecting the files... (Portuguese ∙ Indonesian)
echo.
copy /y "%scriptpath%data\id_ID\Portuguese\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:id_ID_Russian
cls
color B
echo.
echo Injecting the files... (Russian ∙ Indonesian)
echo.
copy /y "%scriptpath%data\id_ID\Russian\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:id_ID_Thai
cls
color B
echo.
echo Injecting the files... (Thai ∙ Indonesian)
echo.
copy /y "%scriptpath%data\id_ID\Thai\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:id_ID_Turkish
cls
color B
echo.
echo Injecting the files... (Turkish ∙ Indonesian)
echo.
copy /y "%scriptpath%data\id_ID\Turkish\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:id_ID_Vietnamese
cls
color B
echo.
echo Injecting the files... (Vietnamese ∙ Indonesian)
echo.
copy /y "%scriptpath%data\id_ID\Vietnamese\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End
REM #endregion INDONESIAN
REM #region CHINESE



:: ::::::: ::
:: CHINESE ::
:: ::::::: ::



:zh_TW
cls
color C
title VALORANT Language Changer - %version% (Chinese)
echo.
echo Select the text language you want to have with the Chinese audio!
echo.
echo         1. Arabic              10. Polish
echo         2. Chinese             11. Portuguese
echo         3. Deutsch             12. Russian
echo         4. English             13. Spanish (ES)
echo         5. French              14. Spanish (LATAM)
echo         6. Indonesian          15. Thai
echo         7. Italian             16. Turkish
echo         8. Japanese            17. Vietnamese
echo         9. Korean              20. Main Menu
echo.
set /P input=» 
if /I "%input%" EQU "1" goto zh_TW_Arabic
if /I "%input%" EQU "2" goto zh_TW_Chinese
if /I "%input%" EQU "3" goto zh_TW_Deutsch
if /I "%input%" EQU "4" goto zh_TW_English
if /I "%input%" EQU "5" goto zh_TW_French
if /I "%input%" EQU "6" goto zh_TW_Indonesian
if /I "%input%" EQU "7" goto zh_TW_Italian
if /I "%input%" EQU "8" goto zh_TW_Japanese
if /I "%input%" EQU "9" goto zh_TW_Korean
if /I "%input%" EQU "10" goto zh_TW_Polish
if /I "%input%" EQU "11" goto zh_TW_Portuguese
if /I "%input%" EQU "12" goto zh_TW_Russian
if /I "%input%" EQU "13" goto zh_TW_SpanishES
if /I "%input%" EQU "14" goto zh_TW_SpanishLATAM
if /I "%input%" EQU "15" goto zh_TW_Thai
if /I "%input%" EQU "16" goto zh_TW_Turkish
if /I "%input%" EQU "17" goto zh_TW_Vietnamese
if /I "%input%" EQU "20" goto Main
goto zh_TW_InputError

::

:zh_TW_Arabic
cls
color B
echo.
echo Injecting the files... (Arabic ∙ Chinese)
echo.
copy /y "%scriptpath%data\zh_TW\Arabic\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:zh_TW_Indonesian
cls
color B
echo.
echo Injecting the files... (Indonesian ∙ Chinese)
echo.
copy /y "%scriptpath%data\zh_TW\Indonesian\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:zh_TW_Chinese
cls
color B
echo.
echo Injecting the files... (Chinese ∙ Chinese)
echo.
copy /y "%scriptpath%data\zh_TW\Chinese\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:zh_TW_Deutsch
cls
color B
echo.
echo Injecting the files... (Deutsch ∙ Chinese)
echo.
copy /y "%scriptpath%data\zh_TW\Deutsch\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:zh_TW_English
cls
color B
echo.
echo Injecting the files... (English ∙ Chinese)
echo.
copy /y "%scriptpath%data\zh_TW\English\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:zh_TW_SpanishES
cls
color B
echo.
echo Injecting the files... (Spanish (ES) ∙ Chinese)
echo.
copy /y "%scriptpath%data\zh_TW\SpanishES\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:zh_TW_SpanishLATAM
cls
color B
echo.
echo Injecting the files... (Spanish (LATAM) ∙ Chinese)
echo.
copy /y "%scriptpath%data\zh_TW\SpanishLATAM\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:zh_TW_French
cls
color B
echo.
echo Injecting the files... (French ∙ Chinese)
echo.
copy /y "%scriptpath%data\zh_TW\French\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:zh_TW_Italian
cls
color B
echo.
echo Injecting the files... (Italian ∙ Chinese)
echo.
copy /y "%scriptpath%data\zh_TW\Italian\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:zh_TW_Japanese
cls
color B
echo.
echo Injecting the files... (Japanese ∙ Chinese)
echo.
copy /y "%scriptpath%data\zh_TW\Japanese\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:zh_TW_Korean
cls
color B
echo.
echo Injecting the files... (Korean ∙ Chinese)
echo.
copy /y "%scriptpath%data\zh_TW\Korean\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:zh_TW_Polish
cls
color B
echo.
echo Injecting the files... (Polish ∙ Chinese)
echo.
copy /y "%scriptpath%data\zh_TW\Polish\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:zh_TW_Portuguese
cls
color B
echo.
echo Injecting the files... (Portuguese ∙ Chinese)
echo.
copy /y "%scriptpath%data\zh_TW\Portuguese\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:zh_TW_Russian
cls
color B
echo.
echo Injecting the files... (Russian ∙ Chinese)
echo.
copy /y "%scriptpath%data\zh_TW\Russian\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:zh_TW_Thai
cls
color B
echo.
echo Injecting the files... (Thai ∙ Chinese)
echo.
copy /y "%scriptpath%data\zh_TW\Thai\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:zh_TW_Turkish
cls
color B
echo.
echo Injecting the files... (Turkish ∙ Chinese)
echo.
copy /y "%scriptpath%data\zh_TW\Turkish\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:zh_TW_Vietnamese
cls
color B
echo.
echo Injecting the files... (Vietnamese ∙ Chinese)
echo.
copy /y "%scriptpath%data\zh_TW\Vietnamese\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End
REM #endregion CHINESE
REM #region DEUTSCH



:: ::::::: ::
:: DEUTSCH ::
:: ::::::: ::



:de_DE
cls
color C
title VALORANT Language Changer - %version% (Deutsch)
echo.
echo Select the text language you want to have with the Deutsch audio!
echo.
echo         1. Arabic              10. Polish
echo         2. Chinese             11. Portuguese
echo         3. Deutsch             12. Russian
echo         4. English             13. Spanish (ES)
echo         5. French              14. Spanish (LATAM)
echo         6. Indonesian          15. Thai
echo         7. Italian             16. Turkish
echo         8. Japanese            17. Vietnamese
echo         9. Korean              20. Main Menu
echo.
set /P input=» 
if /I "%input%" EQU "1" goto de_DE_Arabic
if /I "%input%" EQU "2" goto de_DE_Chinese
if /I "%input%" EQU "3" goto de_DE_Deutsch
if /I "%input%" EQU "4" goto de_DE_English
if /I "%input%" EQU "5" goto de_DE_French
if /I "%input%" EQU "6" goto de_DE_Indonesian
if /I "%input%" EQU "7" goto de_DE_Italian
if /I "%input%" EQU "8" goto de_DE_Japanese
if /I "%input%" EQU "9" goto de_DE_Korean
if /I "%input%" EQU "10" goto de_DE_Polish
if /I "%input%" EQU "11" goto de_DE_Portuguese
if /I "%input%" EQU "12" goto de_DE_Russian
if /I "%input%" EQU "13" goto de_DE_SpanishES
if /I "%input%" EQU "14" goto de_DE_SpanishLATAM
if /I "%input%" EQU "15" goto de_DE_Thai
if /I "%input%" EQU "16" goto de_DE_Turkish
if /I "%input%" EQU "17" goto de_DE_Vietnamese
if /I "%input%" EQU "20" goto Main
goto de_DE_InputError

::

:de_DE_Arabic
cls
color B
echo.
echo Injecting the files... (Arabic ∙ Deutsch)
echo.
copy /y "%scriptpath%data\de_DE\Arabic\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:de_DE_Indonesian
cls
color B
echo.
echo Injecting the files... (Indonesian ∙ Deutsch)
echo.
copy /y "%scriptpath%data\de_DE\Indonesian\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:de_DE_Chinese
cls
color B
echo.
echo Injecting the files... (Chinese ∙ Deutsch)
echo.
copy /y "%scriptpath%data\de_DE\Chinese\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:de_DE_Deutsch
cls
color B
echo.
echo Injecting the files... (Deutsch ∙ Deutsch)
echo.
copy /y "%scriptpath%data\de_DE\Deutsch\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:de_DE_English
cls
color B
echo.
echo Injecting the files... (English ∙ Deutsch)
echo.
copy /y "%scriptpath%data\de_DE\English\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:de_DE_SpanishES
cls
color B
echo.
echo Injecting the files... (Spanish (ES) ∙ Deutsch)
echo.
copy /y "%scriptpath%data\de_DE\SpanishES\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:de_DE_SpanishLATAM
cls
color B
echo.
echo Injecting the files... (Spanish (LATAM) ∙ Deutsch)
echo.
copy /y "%scriptpath%data\de_DE\SpanishLATAM\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:de_DE_French
cls
color B
echo.
echo Injecting the files... (French ∙ Deutsch)
echo.
copy /y "%scriptpath%data\de_DE\French\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:de_DE_Italian
cls
color B
echo.
echo Injecting the files... (Italian ∙ Deutsch)
echo.
copy /y "%scriptpath%data\de_DE\Italian\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:de_DE_Japanese
cls
color B
echo.
echo Injecting the files... (Japanese ∙ Deutsch)
echo.
copy /y "%scriptpath%data\de_DE\Japanese\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:de_DE_Korean
cls
color B
echo.
echo Injecting the files... (Korean ∙ Deutsch)
echo.
copy /y "%scriptpath%data\de_DE\Korean\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:de_DE_Polish
cls
color B
echo.
echo Injecting the files... (Polish ∙ Deutsch)
echo.
copy /y "%scriptpath%data\de_DE\Polish\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:de_DE_Portuguese
cls
color B
echo.
echo Injecting the files... (Portuguese ∙ Deutsch)
echo.
copy /y "%scriptpath%data\de_DE\Portuguese\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:de_DE_Russian
cls
color B
echo.
echo Injecting the files... (Russian ∙ Deutsch)
echo.
copy /y "%scriptpath%data\de_DE\Russian\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:de_DE_Thai
cls
color B
echo.
echo Injecting the files... (Thai ∙ Deutsch)
echo.
copy /y "%scriptpath%data\de_DE\Thai\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:de_DE_Turkish
cls
color B
echo.
echo Injecting the files... (Turkish ∙ Deutsch)
echo.
copy /y "%scriptpath%data\de_DE\Turkish\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:de_DE_Vietnamese
cls
color B
echo.
echo Injecting the files... (Vietnamese ∙ Deutsch)
echo.
copy /y "%scriptpath%data\de_DE\Vietnamese\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End
REM #endregion DEUTSCH
REM #region ENGLISH



:: ::::::: ::
:: ENGLISH ::
:: ::::::: ::



:en_US
cls
color C
title VALORANT Language Changer - %version% (English)
echo.
echo Select the text language you want to have with the English audio!
echo.
echo         1. Arabic              10. Polish
echo         2. Chinese             11. Portuguese
echo         3. Deutsch             12. Russian
echo         4. English             13. Spanish (ES)
echo         5. French              14. Spanish (LATAM)
echo         6. Indonesian          15. Thai
echo         7. Italian             16. Turkish
echo         8. Japanese            17. Vietnamese
echo         9. Korean              20. Main Menu
echo.
set /P input=» 
if /I "%input%" EQU "1" goto en_US_Arabic
if /I "%input%" EQU "2" goto en_US_Chinese
if /I "%input%" EQU "3" goto en_US_Deutsch
if /I "%input%" EQU "4" goto en_US_English
if /I "%input%" EQU "5" goto en_US_French
if /I "%input%" EQU "6" goto en_US_Indonesian
if /I "%input%" EQU "7" goto en_US_Italian
if /I "%input%" EQU "8" goto en_US_Japanese
if /I "%input%" EQU "9" goto en_US_Korean
if /I "%input%" EQU "10" goto en_US_Polish
if /I "%input%" EQU "11" goto en_US_Portuguese
if /I "%input%" EQU "12" goto en_US_Russian
if /I "%input%" EQU "13" goto en_US_SpanishES
if /I "%input%" EQU "14" goto en_US_SpanishLATAM
if /I "%input%" EQU "15" goto en_US_Thai
if /I "%input%" EQU "16" goto en_US_Turkish
if /I "%input%" EQU "17" goto en_US_Vietnamese
if /I "%input%" EQU "20" goto Main
goto en_US_InputError

::

:en_US_Arabic
cls
color B
echo.
echo Injecting the files... (Arabic ∙ English)
echo.
copy /y "%scriptpath%data\en_US\Arabic\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:en_US_Indonesian
cls
color B
echo.
echo Injecting the files... (Indonesian ∙ English)
echo.
copy /y "%scriptpath%data\en_US\Indonesian\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:en_US_Chinese
cls
color B
echo.
echo Injecting the files... (Chinese ∙ English)
echo.
copy /y "%scriptpath%data\en_US\Chinese\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:en_US_Deutsch
cls
color B
echo.
echo Injecting the files... (Deutsch ∙ English)
echo.
copy /y "%scriptpath%data\en_US\Deutsch\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:en_US_English
cls
color B
echo.
echo Injecting the files... (English ∙ English)
echo.
copy /y "%scriptpath%data\en_US\English\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:en_US_SpanishES
cls
color B
echo.
echo Injecting the files... (Spanish (ES) ∙ English)
echo.
copy /y "%scriptpath%data\en_US\SpanishES\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:en_US_SpanishLATAM
cls
color B
echo.
echo Injecting the files... (Spanish (LATAM) ∙ English)
echo.
copy /y "%scriptpath%data\en_US\SpanishLATAM\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:en_US_French
cls
color B
echo.
echo Injecting the files... (French ∙ English)
echo.
copy /y "%scriptpath%data\en_US\French\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:en_US_Italian
cls
color B
echo.
echo Injecting the files... (Italian ∙ English)
echo.
copy /y "%scriptpath%data\en_US\Italian\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:en_US_Japanese
cls
color B
echo.
echo Injecting the files... (Japanese ∙ English)
echo.
copy /y "%scriptpath%data\en_US\Japanese\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:en_US_Korean
cls
color B
echo.
echo Injecting the files... (Korean ∙ English)
echo.
copy /y "%scriptpath%data\en_US\Korean\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:en_US_Polish
cls
color B
echo.
echo Injecting the files... (Polish ∙ English)
echo.
copy /y "%scriptpath%data\en_US\Polish\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:en_US_Portuguese
cls
color B
echo.
echo Injecting the files... (Portuguese ∙ English)
echo.
copy /y "%scriptpath%data\en_US\Portuguese\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:en_US_Russian
cls
color B
echo.
echo Injecting the files... (Russian ∙ English)
echo.
copy /y "%scriptpath%data\en_US\Russian\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:en_US_Thai
cls
color B
echo.
echo Injecting the files... (Thai ∙ English)
echo.
copy /y "%scriptpath%data\en_US\Thai\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:en_US_Turkish
cls
color B
echo.
echo Injecting the files... (Turkish ∙ English)
echo.
copy /y "%scriptpath%data\en_US\Turkish\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:en_US_Vietnamese
cls
color B
echo.
echo Injecting the files... (Vietnamese ∙ English)
echo.
copy /y "%scriptpath%data\en_US\Vietnamese\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End
REM #endregion ENGLISH
REM #region SPANISH (ES)



:: :::::::::::: ::
:: SPANISH (ES) ::
:: :::::::::::: ::



:es_ES
cls
color C
title VALORANT Language Changer - %version% (Spanish (ES))
echo.
echo Select the text language you want to have with the Spanish (ES) audio!
echo.
echo         1. Arabic              10. Polish
echo         2. Chinese             11. Portuguese
echo         3. Deutsch             12. Russian
echo         4. English             13. Spanish (ES)
echo         5. French              14. Spanish (LATAM)
echo         6. Indonesian          15. Thai
echo         7. Italian             16. Turkish
echo         8. Japanese            17. Vietnamese
echo         9. Korean              20. Main Menu
echo.
set /P input=» 
if /I "%input%" EQU "1" goto es_ES_Arabic
if /I "%input%" EQU "2" goto es_ES_Chinese
if /I "%input%" EQU "3" goto es_ES_Deutsch
if /I "%input%" EQU "4" goto es_ES_English
if /I "%input%" EQU "5" goto es_ES_French
if /I "%input%" EQU "6" goto es_ES_Indonesian
if /I "%input%" EQU "7" goto es_ES_Italian
if /I "%input%" EQU "8" goto es_ES_Japanese
if /I "%input%" EQU "9" goto es_ES_Korean
if /I "%input%" EQU "10" goto es_ES_Polish
if /I "%input%" EQU "11" goto es_ES_Portuguese
if /I "%input%" EQU "12" goto es_ES_Russian
if /I "%input%" EQU "13" goto es_ES_SpanishES
if /I "%input%" EQU "14" goto es_ES_SpanishLATAM
if /I "%input%" EQU "15" goto es_ES_Thai
if /I "%input%" EQU "16" goto es_ES_Turkish
if /I "%input%" EQU "17" goto es_ES_Vietnamese
if /I "%input%" EQU "20" goto Main
goto es_ES_InputError

:es_ES_Arabic
cls
color B
echo.
echo Injecting the files... (Arabic ∙ Spanish (ES))
echo.
copy /y "%scriptpath%data\es_ES\Arabic\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:es_ES_Indonesian
cls
color B
echo.
echo Injecting the files... (Indonesian ∙ Spanish (ES))
echo.
copy /y "%scriptpath%data\es_ES\Indonesian\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:es_ES_Chinese
cls
color B
echo.
echo Injecting the files... (Chinese ∙ Spanish (ES))
echo.
copy /y "%scriptpath%data\es_ES\Chinese\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:es_ES_Deutsch
cls
color B
echo.
echo Injecting the files... (Deutsch ∙ Spanish (ES))
echo.
copy /y "%scriptpath%data\es_ES\Deutsch\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:es_ES_English
cls
color B
echo.
echo Injecting the files... (English ∙ Spanish (ES))
echo.
copy /y "%scriptpath%data\es_ES\English\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:es_ES_SpanishES
cls
color B
echo.
echo Injecting the files... (Spanish (ES) ∙ Spanish (ES))
echo.
copy /y "%scriptpath%data\es_ES\Arabic\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:es_ES_SpanishLATAM
cls
color B
echo.
echo Injecting the files... (Spanish (LATAM) ∙ Spanish (ES))
echo.
copy /y "%scriptpath%data\es_ES\Arabic\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:es_ES_French
cls
color B
echo.
echo Injecting the files... (French ∙ Spanish (ES))
echo.
copy /y "%scriptpath%data\es_ES\French\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:es_ES_Italian
cls
color B
echo.
echo Injecting the files... (Italian ∙ Spanish (ES))
echo.
copy /y "%scriptpath%data\es_ES\Italian\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:es_ES_Japanese
cls
color B
echo.
echo Injecting the files... (Japanese ∙ Spanish (ES))
echo.
copy /y "%scriptpath%data\es_ES\Japanese\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:es_ES_Korean
cls
color B
echo.
echo Injecting the files... (Korean ∙ Spanish (ES))
echo.
copy /y "%scriptpath%data\es_ES\Korean\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:es_ES_Polish
cls
color B
echo.
echo Injecting the files... (Polish ∙ Spanish (ES))
echo.
copy /y "%scriptpath%data\es_ES\Polish\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:es_ES_Portuguese
cls
color B
echo.
echo Injecting the files... (Portuguese ∙ Spanish (ES))
echo.
copy /y "%scriptpath%data\es_ES\Portuguese\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:es_ES_Russian
cls
color B
echo.
echo Injecting the files... (Russian ∙ Spanish (ES))
echo.
copy /y "%scriptpath%data\es_ES\Russian\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:es_ES_Thai
cls
color B
echo.
echo Injecting the files... (Thai ∙ Spanish (ES))
echo.
copy /y "%scriptpath%data\es_ES\Thai\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:es_ES_Turkish
cls
color B
echo.
echo Injecting the files... (Turkish ∙ Spanish (ES))
echo.
copy /y "%scriptpath%data\es_ES\Turkish\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:es_ES_Vietnamese
cls
color B
echo.
echo Injecting the files... (Vietnamese ∙ Spanish (ES))
echo.
copy /y "%scriptpath%data\es_ES\Vietnamese\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End
REM #endregion SPANISH (ES)
REM #region SPANISH (LATAM)



:: ::::::::::::::: ::
:: SPANISH (LATAM) ::
:: ::::::::::::::: ::



:es_MX
cls
color C
title VALORANT Language Changer - %version% (Spanish (LATAM))
echo.
echo Select the text language you want to have with the Spanish (LATAM) audio!
echo.
echo         1. Arabic              10. Polish
echo         2. Chinese             11. Portuguese
echo         3. Deutsch             12. Russian
echo         4. English             13. Spanish (ES)
echo         5. French              14. Spanish (LATAM)
echo         6. Indonesian          15. Thai
echo         7. Italian             16. Turkish
echo         8. Japanese            17. Vietnamese
echo         9. Korean              20. Main Menu
echo.
set /P input=» 
if /I "%input%" EQU "1" goto es_MX_Arabic
if /I "%input%" EQU "2" goto es_MX_Chinese
if /I "%input%" EQU "3" goto es_MX_Deutsch
if /I "%input%" EQU "4" goto es_MX_English
if /I "%input%" EQU "5" goto es_MX_French
if /I "%input%" EQU "6" goto es_MX_Indonesian
if /I "%input%" EQU "7" goto es_MX_Italian
if /I "%input%" EQU "8" goto es_MX_Japanese
if /I "%input%" EQU "9" goto es_MX_Korean
if /I "%input%" EQU "10" goto es_MX_Polish
if /I "%input%" EQU "11" goto es_MX_Portuguese
if /I "%input%" EQU "12" goto es_MX_Russian
if /I "%input%" EQU "13" goto es_MX_SpanishES
if /I "%input%" EQU "14" goto es_MX_SpanishLATAM
if /I "%input%" EQU "15" goto es_MX_Thai
if /I "%input%" EQU "16" goto es_MX_Turkish
if /I "%input%" EQU "17" goto es_MX_Vietnamese
if /I "%input%" EQU "20" goto Main
goto es_MX_InputError

:es_MX_Arabic
cls
color B
echo.
echo Injecting the files... (Arabic ∙ Spanish (LATAM))
echo.
copy /y "%scriptpath%data\es_MX\Arabic\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:es_MX_Indonesian
cls
color B
echo.
echo Injecting the files... (Indonesian ∙ Spanish (LATAM))
echo.
copy /y "%scriptpath%data\es_MX\Indonesian\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:es_MX_Chinese
cls
color B
echo.
echo Injecting the files... (Chinese ∙ Spanish (LATAM))
echo.
copy /y "%scriptpath%data\es_MX\Chinese\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:es_MX_Deutsch
cls
color B
echo.
echo Injecting the files... (Deutsch ∙ Spanish (LATAM))
echo.
copy /y "%scriptpath%data\es_MX\Deutsch\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:es_MX_English
cls
color B
echo.
echo Injecting the files... (English ∙ Spanish (LATAM))
echo.
copy /y "%scriptpath%data\es_MX\English\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:es_MX_SpanishES
cls
color B
echo.
echo Injecting the files... (Spanish (ES) ∙ Spanish (LATAM))
echo.
copy /y "%scriptpath%data\es_MX\SpanishES\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:es_MX_SpanishLATAM
cls
color B
echo.
echo Injecting the files... (Spanish (LATAM) ∙ Spanish (LATAM))
echo.
copy /y "%scriptpath%data\es_MX\SpanishLATAM\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:es_MX_French
cls
color B
echo.
echo Injecting the files... (French ∙ Spanish (LATAM))
echo.
copy /y "%scriptpath%data\es_MX\French\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:es_MX_Italian
cls
color B
echo.
echo Injecting the files... (Italian ∙ Spanish (LATAM))
echo.
copy /y "%scriptpath%data\es_MX\Italian\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:es_MX_Japanese
cls
color B
echo.
echo Injecting the files... (Japanese ∙ Spanish (LATAM))
echo.
copy /y "%scriptpath%data\es_MX\Japanese\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:es_MX_Korean
cls
color B
echo.
echo Injecting the files... (Korean ∙ Spanish (LATAM))
echo.
copy /y "%scriptpath%data\es_MX\Korean\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:es_MX_Polish
cls
color B
echo.
echo Injecting the files... (Polish ∙ Spanish (LATAM))
echo.
copy /y "%scriptpath%data\es_MX\Polish\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:es_MX_Portuguese
cls
color B
echo.
echo Injecting the files... (Portuguese ∙ Spanish (LATAM))
echo.
copy /y "%scriptpath%data\es_MX\Portuguese\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:es_MX_Russian
cls
color B
echo.
echo Injecting the files... (Russian ∙ Spanish (LATAM))
echo.
copy /y "%scriptpath%data\es_MX\Russian\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:es_MX_Thai
cls
color B
echo.
echo Injecting the files... (Thai ∙ Spanish (LATAM))
echo.
copy /y "%scriptpath%data\es_MX\Thai\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:es_MX_Turkish
cls
color B
echo.
echo Injecting the files... (Turkish ∙ Spanish (LATAM))
echo.
copy /y "%scriptpath%data\es_MX\Turkish\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:es_MX_Vietnamese
cls
color B
echo.
echo Injecting the files... (Vietnamese ∙ Spanish (LATAM))
echo.
copy /y "%scriptpath%data\es_MX\Vietnamese\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End
REM #endregion SPANISH (LATAM)
REM #region FRENCH



:: :::::: ::
:: FRENCH ::
:: :::::: ::



:fr_FR
cls
color C
title VALORANT Language Changer - %version% (French)
echo.
echo Select the text language you want to have with the French audio!
echo.
echo         1. Arabic              10. Polish
echo         2. Chinese             11. Portuguese
echo         3. Deutsch             12. Russian
echo         4. English             13. Spanish (ES)
echo         5. French              14. Spanish (LATAM)
echo         6. Indonesian          15. Thai
echo         7. Italian             16. Turkish
echo         8. Japanese            17. Vietnamese
echo         9. Korean              20. Main Menu
echo.
set /P input=» 
if /I "%input%" EQU "1" goto fr_FR_Arabic
if /I "%input%" EQU "2" goto fr_FR_Chinese
if /I "%input%" EQU "3" goto fr_FR_Deutsch
if /I "%input%" EQU "4" goto fr_FR_English
if /I "%input%" EQU "5" goto fr_FR_French
if /I "%input%" EQU "6" goto fr_FR_Indonesian
if /I "%input%" EQU "7" goto fr_FR_Italian
if /I "%input%" EQU "8" goto fr_FR_Japanese
if /I "%input%" EQU "9" goto fr_FR_Korean
if /I "%input%" EQU "10" goto fr_FR_Polish
if /I "%input%" EQU "11" goto fr_FR_Portuguese
if /I "%input%" EQU "12" goto fr_FR_Russian
if /I "%input%" EQU "13" goto fr_FR_SpanishES
if /I "%input%" EQU "14" goto fr_FR_SpanishLATAM
if /I "%input%" EQU "15" goto fr_FR_Thai
if /I "%input%" EQU "16" goto fr_FR_Turkish
if /I "%input%" EQU "17" goto fr_FR_Vietnamese
if /I "%input%" EQU "20" goto Main
goto fr_FR_InputError

:fr_FR_Arabic
cls
color B
echo.
echo Injecting the files... (Arabic ∙ French)
echo.
copy /y "%scriptpath%data\fr_FR\Arabic\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:fr_FR_Indonesian
cls
color B
echo.
echo Injecting the files... (Indonesian ∙ French)
echo.
copy /y "%scriptpath%data\fr_FR\Indonesian\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:fr_FR_Chinese
cls
color B
echo.
echo Injecting the files... (Chinese ∙ French)
echo.
copy /y "%scriptpath%data\fr_FR\Chinese\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:fr_FR_Deutsch
cls
color B
echo.
echo Injecting the files... (Deutsch ∙ French)
echo.
copy /y "%scriptpath%data\fr_FR\Deutsch\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:fr_FR_English
cls
color B
echo.
echo Injecting the files... (English ∙ French)
echo.
copy /y "%scriptpath%data\fr_FR\English\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:fr_FR_SpanishES
cls
color B
echo.
echo Injecting the files... (Spanish (ES) ∙ French)
echo.
copy /y "%scriptpath%data\fr_FR\SpanishES\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:fr_FR_SpanishLATAM
cls
color B
echo.
echo Injecting the files... (Spanish (LATAM) ∙ French)
echo.
copy /y "%scriptpath%data\fr_FR\SpanishLATAM\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:fr_FR_French
cls
color B
echo.
echo Injecting the files... (French ∙ French)
echo.
copy /y "%scriptpath%data\fr_FR\French\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:fr_FR_Italian
cls
color B
echo.
echo Injecting the files... (Italian ∙ French)
echo.
copy /y "%scriptpath%data\fr_FR\Italian\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:fr_FR_Japanese
cls
color B
echo.
echo Injecting the files... (Japanese ∙ French)
echo.
copy /y "%scriptpath%data\fr_FR\Japanese\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:fr_FR_Korean
cls
color B
echo.
echo Injecting the files... (Korean ∙ French)
echo.
copy /y "%scriptpath%data\fr_FR\Korean\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:fr_FR_Polish
cls
color B
echo.
echo Injecting the files... (Polish ∙ French)
echo.
copy /y "%scriptpath%data\fr_FR\Polish\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:fr_FR_Portuguese
cls
color B
echo.
echo Injecting the files... (Portuguese ∙ French)
echo.
copy /y "%scriptpath%data\fr_FR\Portuguese\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:fr_FR_Russian
cls
color B
echo.
echo Injecting the files... (Russian ∙ French)
echo.
copy /y "%scriptpath%data\fr_FR\Russian\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:fr_FR_Thai
cls
color B
echo.
echo Injecting the files... (Thai ∙ French)
echo.
copy /y "%scriptpath%data\fr_FR\Thai\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:fr_FR_Turkish
cls
color B
echo.
echo Injecting the files... (Turkish ∙ French)
echo.
copy /y "%scriptpath%data\fr_FR\Turkish\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:fr_FR_Vietnamese
cls
color B
echo.
echo Injecting the files... (Vietnamese ∙ French)
echo.
copy /y "%scriptpath%data\fr_FR\Vietnamese\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End
REM #endregion FRENCH
REM #region ITALIAN



:: ::::::: ::
:: ITALIAN ::
:: ::::::: ::



:it_IT
cls
color C
title VALORANT Language Changer - %version% (Italian)
echo.
echo Select the text language you want to have with the Italian audio!
echo.
echo         1. Arabic              10. Polish
echo         2. Chinese             11. Portuguese
echo         3. Deutsch             12. Russian
echo         4. English             13. Spanish (ES)
echo         5. French              14. Spanish (LATAM)
echo         6. Indonesian          15. Thai
echo         7. Italian             16. Turkish
echo         8. Japanese            17. Vietnamese
echo         9. Korean              20. Main Menu
echo.
set /P input=» 
if /I "%input%" EQU "1" goto it_IT_Arabic
if /I "%input%" EQU "2" goto it_IT_Chinese
if /I "%input%" EQU "3" goto it_IT_Deutsch
if /I "%input%" EQU "4" goto it_IT_English
if /I "%input%" EQU "5" goto it_IT_French
if /I "%input%" EQU "6" goto it_IT_Indonesian
if /I "%input%" EQU "7" goto it_IT_Italian
if /I "%input%" EQU "8" goto it_IT_Japanese
if /I "%input%" EQU "9" goto it_IT_Korean
if /I "%input%" EQU "10" goto it_IT_Polish
if /I "%input%" EQU "11" goto it_IT_Portuguese
if /I "%input%" EQU "12" goto it_IT_Russian
if /I "%input%" EQU "13" goto it_IT_SpanishES
if /I "%input%" EQU "14" goto it_IT_SpanishLATAM
if /I "%input%" EQU "15" goto it_IT_Thai
if /I "%input%" EQU "16" goto it_IT_Turkish
if /I "%input%" EQU "17" goto it_IT_Vietnamese
if /I "%input%" EQU "20" goto Main
goto it_IT_InputError

:it_IT_Arabic
cls
color B
echo.
echo Injecting the files... (Arabic ∙ Italian)
echo.
copy /y "%scriptpath%data\it_IT\Arabic\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:it_IT_Indonesian
cls
color B
echo.
echo Injecting the files... (Indonesian ∙ Italian)
echo.
copy /y "%scriptpath%data\it_IT\Indonesian\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:it_IT_Chinese
cls
color B
echo.
echo Injecting the files... (Chinese ∙ Italian)
echo.
copy /y "%scriptpath%data\it_IT\Chinese\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:it_IT_Deutsch
cls
color B
echo.
echo Injecting the files... (Deutsch ∙ Italian)
echo.
copy /y "%scriptpath%data\it_IT\Deutsch\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:it_IT_English
cls
color B
echo.
echo Injecting the files... (English ∙ Italian)
echo.
copy /y "%scriptpath%data\it_IT\English\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:it_IT_SpanishES
cls
color B
echo.
echo Injecting the files... (Spanish (ES) ∙ Italian)
echo.
copy /y "%scriptpath%data\it_IT\SpanishES\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:it_IT_SpanishLATAM
cls
color B
echo.
echo Injecting the files... (Spanish (LATAM) ∙ Italian)
echo.
copy /y "%scriptpath%data\it_IT\SpanishLATAM\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:it_IT_French
cls
color B
echo.
echo Injecting the files... (French ∙ Italian)
echo.
copy /y "%scriptpath%data\it_IT\French\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:it_IT_Italian
cls
color B
echo.
echo Injecting the files... (Italian ∙ Italian)
echo.
copy /y "%scriptpath%data\it_IT\Italian\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:it_IT_Japanese
cls
color B
echo.
echo Injecting the files... (Japanese ∙ Italian)
echo.
copy /y "%scriptpath%data\it_IT\Japanese\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:it_IT_Korean
cls
color B
echo.
echo Injecting the files... (Korean ∙ Italian)
echo.
copy /y "%scriptpath%data\it_IT\Korean\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:it_IT_Polish
cls
color B
echo.
echo Injecting the files... (Polish ∙ Italian)
echo.
copy /y "%scriptpath%data\it_IT\Polish\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:it_IT_Portuguese
cls
color B
echo.
echo Injecting the files... (Portuguese ∙ Italian)
echo.
copy /y "%scriptpath%data\it_IT\Portuguese\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:it_IT_Russian
cls
color B
echo.
echo Injecting the files... (Russian ∙ Italian)
echo.
copy /y "%scriptpath%data\it_IT\Russian\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:it_IT_Thai
cls
color B
echo.
echo Injecting the files... (Thai ∙ Italian)
echo.
copy /y "%scriptpath%data\it_IT\Thai\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:it_IT_Turkish
cls
color B
echo.
echo Injecting the files... (Turkish ∙ Italian)
echo.
copy /y "%scriptpath%data\it_IT\Turkish\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:it_IT_Vietnamese
cls
color B
echo.
echo Injecting the files... (Vietnamese ∙ Italian)
echo.
copy /y "%scriptpath%data\it_IT\Vietnamese\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End
REM #endregion ITALIAN
REM #region JAPANESE



:: :::::::: ::
:: JAPANESE ::
:: :::::::: ::



:ja_JP
cls
color C
title VALORANT Language Changer - %version% (Japanese)
echo.
echo Select the text language you want to have with the Japanese audio!
echo.
echo         1. Arabic              10. Polish
echo         2. Chinese             11. Portuguese
echo         3. Deutsch             12. Russian
echo         4. English             13. Spanish (ES)
echo         5. French              14. Spanish (LATAM)
echo         6. Indonesian          15. Thai
echo         7. Italian             16. Turkish
echo         8. Japanese            17. Vietnamese
echo         9. Korean              20. Main Menu
echo.
set /P input=» 
if /I "%input%" EQU "1" goto ja_JP_Arabic
if /I "%input%" EQU "2" goto ja_JP_Chinese
if /I "%input%" EQU "3" goto ja_JP_Deutsch
if /I "%input%" EQU "4" goto ja_JP_English
if /I "%input%" EQU "5" goto ja_JP_French
if /I "%input%" EQU "6" goto ja_JP_Indonesian
if /I "%input%" EQU "7" goto ja_JP_Italian
if /I "%input%" EQU "8" goto ja_JP_Japanese
if /I "%input%" EQU "9" goto ja_JP_Korean
if /I "%input%" EQU "10" goto ja_JP_Polish
if /I "%input%" EQU "11" goto ja_JP_Portuguese
if /I "%input%" EQU "12" goto ja_JP_Russian
if /I "%input%" EQU "13" goto ja_JP_SpanishES
if /I "%input%" EQU "14" goto ja_JP_SpanishLATAM
if /I "%input%" EQU "15" goto ja_JP_Thai
if /I "%input%" EQU "16" goto ja_JP_Turkish
if /I "%input%" EQU "17" goto ja_JP_Vietnamese
if /I "%input%" EQU "20" goto Main
goto ja_JP_InputError

:ja_JP_Arabic
cls
color B
echo.
echo Injecting the files... (Arabic ∙ Japanese)
echo.
copy /y "%scriptpath%data\ja_JP\Arabic\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:ja_JP_Indonesian
cls
color B
echo.
echo Injecting the files... (Indonesian ∙ Japanese)
echo.
copy /y "%scriptpath%data\ja_JP\Indonesian\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:ja_JP_Chinese
cls
color B
echo.
echo Injecting the files... (Chinese ∙ Japanese)
echo.
copy /y "%scriptpath%data\ja_JP\Chinese\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:ja_JP_Deutsch
cls
color B
echo.
echo Injecting the files... (Deutsch ∙ Japanese)
echo.
copy /y "%scriptpath%data\ja_JP\Deutsch\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:ja_JP_English
cls
color B
echo.
echo Injecting the files... (English ∙ Japanese)
echo.
copy /y "%scriptpath%data\ja_JP\English\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:ja_JP_SpanishES
cls
color B
echo.
echo Injecting the files... (Spanish (ES) ∙ Japanese)
echo.
copy /y "%scriptpath%data\ja_JP\SpanishES\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:ja_JP_SpanishLATAM
cls
color B
echo.
echo Injecting the files... (Spanish (LATAM) ∙ Japanese)
echo.
copy /y "%scriptpath%data\ja_JP\SpanishLATAM\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:ja_JP_French
cls
color B
echo.
echo Injecting the files... (French ∙ Japanese)
echo.
copy /y "%scriptpath%data\ja_JP\French\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:ja_JP_Italian
cls
color B
echo.
echo Injecting the files... (Italian ∙ Japanese)
echo.
copy /y "%scriptpath%data\ja_JP\Italian\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:ja_JP_Japanese
cls
color B
echo.
echo Injecting the files... (Japanese ∙ Japanese)
echo.
copy /y "%scriptpath%data\ja_JP\Japanese\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:ja_JP_Korean
cls
color B
echo.
echo Injecting the files... (Korean ∙ Japanese)
echo.
copy /y "%scriptpath%data\ja_JP\Korean\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:ja_JP_Polish
cls
color B
echo.
echo Injecting the files... (Polish ∙ Japanese)
echo.
copy /y "%scriptpath%data\ja_JP\Polish\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:ja_JP_Portuguese
cls
color B
echo.
echo Injecting the files... (Portuguese ∙ Japanese)
echo.
copy /y "%scriptpath%data\ja_JP\Portuguese\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:ja_JP_Russian
cls
color B
echo.
echo Injecting the files... (Russian ∙ Japanese)
echo.
copy /y "%scriptpath%data\ja_JP\Russian\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:ja_JP_Thai
cls
color B
echo.
echo Injecting the files... (Thai ∙ Japanese)
echo.
copy /y "%scriptpath%data\ja_JP\Thai\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:ja_JP_Turkish
cls
color B
echo.
echo Injecting the files... (Turkish ∙ Japanese)
echo.
copy /y "%scriptpath%data\ja_JP\Turkish\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:ja_JP_Vietnamese
cls
color B
echo.
echo Injecting the files... (Vietnamese ∙ Japanese)
echo.
copy /y "%scriptpath%data\ja_JP\Vietnamese\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End
REM #endregion JAPANESE
REM #region KOREAN



:: :::::: ::
:: KOREAN ::
:: :::::: ::



:ko_KR
cls
color C
title VALORANT Language Changer - %version% (Korean)
echo.
echo Select the text language you want to have with the Korean audio!
echo.
echo         1. Arabic              10. Polish
echo         2. Chinese             11. Portuguese
echo         3. Deutsch             12. Russian
echo         4. English             13. Spanish (ES)
echo         5. French              14. Spanish (LATAM)
echo         6. Indonesian          15. Thai
echo         7. Italian             16. Turkish
echo         8. Japanese            17. Vietnamese
echo         9. Korean              20. Main Menu
echo.
set /P input=» 
if /I "%input%" EQU "1" goto ko_KR_Arabic
if /I "%input%" EQU "2" goto ko_KR_Chinese
if /I "%input%" EQU "3" goto ko_KR_Deutsch
if /I "%input%" EQU "4" goto ko_KR_English
if /I "%input%" EQU "5" goto ko_KR_French
if /I "%input%" EQU "6" goto ko_KR_Indonesian
if /I "%input%" EQU "7" goto ko_KR_Italian
if /I "%input%" EQU "8" goto ko_KR_Japanese
if /I "%input%" EQU "9" goto ko_KR_Korean
if /I "%input%" EQU "10" goto ko_KR_Polish
if /I "%input%" EQU "11" goto ko_KR_Portuguese
if /I "%input%" EQU "12" goto ko_KR_Russian
if /I "%input%" EQU "13" goto ko_KR_SpanishES
if /I "%input%" EQU "14" goto ko_KR_SpanishLATAM
if /I "%input%" EQU "15" goto ko_KR_Thai
if /I "%input%" EQU "16" goto ko_KR_Turkish
if /I "%input%" EQU "17" goto ko_KR_Vietnamese
if /I "%input%" EQU "20" goto Main
goto ko_KR_InputError

:ko_KR_Arabic
cls
color B
echo.
echo Injecting the files... (Arabic ∙ Korean)
echo.
copy /y "%scriptpath%data\ko_KR\Arabic\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:ko_KR_Indonesian
cls
color B
echo.
echo Injecting the files... (Indonesian ∙ Korean)
echo.
copy /y "%scriptpath%data\ko_KR\Indonesian\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:ko_KR_Chinese
cls
color B
echo.
echo Injecting the files... (Chinese ∙ Korean)
echo.
copy /y "%scriptpath%data\ko_KR\Chinese\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:ko_KR_Deutsch
cls
color B
echo.
echo Injecting the files... (Deutsch ∙ Korean)
echo.
copy /y "%scriptpath%data\ko_KR\Deutsch\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:ko_KR_English
cls
color B
echo.
echo Injecting the files... (English ∙ Korean)
echo.
copy /y "%scriptpath%data\ko_KR\English\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:ko_KR_SpanishES
cls
color B
echo.
echo Injecting the files... (Spanish (ES) ∙ Korean)
echo.
copy /y "%scriptpath%data\ko_KR\SpanishES\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:ko_KR_SpanishLATAM
cls
color B
echo.
echo Injecting the files... (Spanish (LATAM) ∙ Korean)
echo.
copy /y "%scriptpath%data\ko_KR\SpanishLATAM\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:ko_KR_French
cls
color B
echo.
echo Injecting the files... (French ∙ Korean)
echo.
copy /y "%scriptpath%data\ko_KR\French\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:ko_KR_Italian
cls
color B
echo.
echo Injecting the files... (Italian ∙ Korean)
echo.
copy /y "%scriptpath%data\ko_KR\Italian\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:ko_KR_Japanese
cls
color B
echo.
echo Injecting the files... (Japanese ∙ Korean)
echo.
copy /y "%scriptpath%data\ko_KR\Japanese\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:ko_KR_Korean
cls
color B
echo.
echo Injecting the files... (Korean ∙ Korean)
echo.
copy /y "%scriptpath%data\ko_KR\Korean\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:ko_KR_Polish
cls
color B
echo.
echo Injecting the files... (Polish ∙ Korean)
echo.
copy /y "%scriptpath%data\ko_KR\Polish\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:ko_KR_Portuguese
cls
color B
echo.
echo Injecting the files... (Portuguese ∙ Korean)
echo.
copy /y "%scriptpath%data\ko_KR\Portuguese\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:ko_KR_Russian
cls
color B
echo.
echo Injecting the files... (Russian ∙ Korean)
echo.
copy /y "%scriptpath%data\ko_KR\Russian\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:ko_KR_Thai
cls
color B
echo.
echo Injecting the files... (Thai ∙ Korean)
echo.
copy /y "%scriptpath%data\ko_KR\Thai\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:ko_KR_Turkish
cls
color B
echo.
echo Injecting the files... (Turkish ∙ Korean)
echo.
copy /y "%scriptpath%data\ko_KR\Turkish\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:ko_KR_Vietnamese
cls
color B
echo.
echo Injecting the files... (Vietnamese ∙ Korean)
echo.
copy /y "%scriptpath%data\ko_KR\Vietnamese\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End
REM #endregion KOREAN
REM #region POLISH



:: :::::: ::
:: POLISH ::
:: :::::: ::



:pl_PL
cls
color C
title VALORANT Language Changer - %version% (Polish)
echo.
echo Select the text language you want to have with the Polish audio!
echo.
echo         1. Arabic              10. Polish
echo         2. Chinese             11. Portuguese
echo         3. Deutsch             12. Russian
echo         4. English             13. Spanish (ES)
echo         5. French              14. Spanish (LATAM)
echo         6. Indonesian          15. Thai
echo         7. Italian             16. Turkish
echo         8. Japanese            17. Vietnamese
echo         9. Korean              20. Main Menu
echo.
set /P input=» 
if /I "%input%" EQU "1" goto pl_PL_Arabic
if /I "%input%" EQU "2" goto pl_PL_Chinese
if /I "%input%" EQU "3" goto pl_PL_Deutsch
if /I "%input%" EQU "4" goto pl_PL_English
if /I "%input%" EQU "5" goto pl_PL_French
if /I "%input%" EQU "6" goto pl_PL_Indonesian
if /I "%input%" EQU "7" goto pl_PL_Italian
if /I "%input%" EQU "8" goto pl_PL_Japanese
if /I "%input%" EQU "9" goto pl_PL_Korean
if /I "%input%" EQU "10" goto pl_PL_Polish
if /I "%input%" EQU "11" goto pl_PL_Portuguese
if /I "%input%" EQU "12" goto pl_PL_Russian
if /I "%input%" EQU "13" goto pl_PL_SpanishES
if /I "%input%" EQU "14" goto pl_PL_SpanishLATAM
if /I "%input%" EQU "15" goto pl_PL_Thai
if /I "%input%" EQU "16" goto pl_PL_Turkish
if /I "%input%" EQU "17" goto pl_PL_Vietnamese
if /I "%input%" EQU "20" goto Main
goto pl_PL_InputError

:pl_PL_Arabic
cls
color B
echo.
echo Injecting the files... (Arabic ∙ Polish)
echo.
copy /y "%scriptpath%data\pl_PL\Arabic\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:pl_PL_Indonesian
cls
color B
echo.
echo Injecting the files... (Indonesian ∙ Polish)
echo.
copy /y "%scriptpath%data\pl_PL\Indonesian\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:pl_PL_Chinese
cls
color B
echo.
echo Injecting the files... (Chinese ∙ Polish)
echo.
copy /y "%scriptpath%data\pl_PL\Chinese\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:pl_PL_Deutsch
cls
color B
echo.
echo Injecting the files... (Deutsch ∙ Polish)
echo.
copy /y "%scriptpath%data\pl_PL\Deutsch\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:pl_PL_English
cls
color B
echo.
echo Injecting the files... (English ∙ Polish)
echo.
copy /y "%scriptpath%data\pl_PL\English\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:pl_PL_SpanishES
cls
color B
echo.
echo Injecting the files... (Spanish (ES) ∙ Polish)
echo.
copy /y "%scriptpath%data\pl_PL\SpanishES\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:pl_PL_SpanishLATAM
cls
color B
echo.
echo Injecting the files... (Spanish (LATAM) ∙ Polish)
echo.
copy /y "%scriptpath%data\pl_PL\SpanishLATAM\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:pl_PL_French
cls
color B
echo.
echo Injecting the files... (French ∙ Polish)
echo.
copy /y "%scriptpath%data\pl_PL\French\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:pl_PL_Italian
cls
color B
echo.
echo Injecting the files... (Italian ∙ Polish)
echo.
copy /y "%scriptpath%data\pl_PL\Italian\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:pl_PL_Japanese
cls
color B
echo.
echo Injecting the files... (Japanese ∙ Polish)
echo.
copy /y "%scriptpath%data\pl_PL\Japanese\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:pl_PL_Korean
cls
color B
echo.
echo Injecting the files... (Korean ∙ Polish)
echo.
copy /y "%scriptpath%data\pl_PL\Korean\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:pl_PL_Polish
cls
color B
echo.
echo Injecting the files... (Polish ∙ Polish)
echo.
copy /y "%scriptpath%data\pl_PL\Polish\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:pl_PL_Portuguese
cls
color B
echo.
echo Injecting the files... (Portuguese ∙ Polish)
echo.
copy /y "%scriptpath%data\pl_PL\Portuguese\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:pl_PL_Russian
cls
color B
echo.
echo Injecting the files... (Russian ∙ Polish)
echo.
copy /y "%scriptpath%data\pl_PL\Russian\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:pl_PL_Thai
cls
color B
echo.
echo Injecting the files... (Thai ∙ Polish)
echo.
copy /y "%scriptpath%data\pl_PL\Thai\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:pl_PL_Turkish
cls
color B
echo.
echo Injecting the files... (Turkish ∙ Polish)
echo.
copy /y "%scriptpath%data\pl_PL\Turkish\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:pl_PL_Vietnamese
cls
color B
echo.
echo Injecting the files... (Vietnamese ∙ Japanese)
echo.
copy /y "%scriptpath%data\pl_PL\Vietnamese\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End
REM #endregion POLISH
REM #region PORTUGUESE



:: :::::::::: ::
:: PORTUGUESE ::
:: :::::::::: ::



:pt_BR
cls
color C
title VALORANT Language Changer - %version% (Portuguese)
echo.
echo Select the text language you want to have with the Portuguese audio!
echo.
echo         1. Arabic              10. Polish
echo         2. Chinese             11. Portuguese
echo         3. Deutsch             12. Russian
echo         4. English             13. Spanish (ES)
echo         5. French              14. Spanish (LATAM)
echo         6. Indonesian          15. Thai
echo         7. Italian             16. Turkish
echo         8. Japanese            17. Vietnamese
echo         9. Korean              20. Main Menu
echo.
set /P input=» 
if /I "%input%" EQU "1" goto pt_BR_Arabic
if /I "%input%" EQU "2" goto pt_BR_Chinese
if /I "%input%" EQU "3" goto pt_BR_Deutsch
if /I "%input%" EQU "4" goto pt_BR_English
if /I "%input%" EQU "5" goto pt_BR_French
if /I "%input%" EQU "6" goto pt_BR_Indonesian
if /I "%input%" EQU "7" goto pt_BR_Italian
if /I "%input%" EQU "8" goto pt_BR_Japanese
if /I "%input%" EQU "9" goto pt_BR_Korean
if /I "%input%" EQU "10" goto pt_BR_Polish
if /I "%input%" EQU "11" goto pt_BR_Portuguese
if /I "%input%" EQU "12" goto pt_BR_Russian
if /I "%input%" EQU "13" goto pt_BR_SpanishES
if /I "%input%" EQU "14" goto pt_BR_SpanishLATAM
if /I "%input%" EQU "15" goto pt_BR_Thai
if /I "%input%" EQU "16" goto pt_BR_Turkish
if /I "%input%" EQU "17" goto pt_BR_Vietnamese
if /I "%input%" EQU "20" goto Main
goto pt_BR_InputError

:pt_BR_Arabic
cls
color B
echo.
echo Injecting the files... (Arabic ∙ Portuguese)
echo.
copy /y "%scriptpath%data\pt_BR\Arabic\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:pt_BR_Indonesian
cls
color B
echo.
echo Injecting the files... (Indonesian ∙ Portuguese)
echo.
copy /y "%scriptpath%data\pt_BR\Indonesian\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:pt_BR_Chinese
cls
color B
echo.
echo Injecting the files... (Chinese ∙ Portuguese)
echo.
copy /y "%scriptpath%data\pt_BR\Chinese\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:pt_BR_Deutsch
cls
color B
echo.
echo Injecting the files... (Deutsch ∙ Portuguese)
echo.
copy /y "%scriptpath%data\pt_BR\Deutsch\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:pt_BR_English
cls
color B
echo.
echo Injecting the files... (English ∙ Portuguese)
echo.
copy /y "%scriptpath%data\pt_BR\English\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:pt_BR_SpanishES
cls
color B
echo.
echo Injecting the files... (Spanish (ES) ∙ Portuguese)
echo.
copy /y "%scriptpath%data\pt_BR\SpanishES\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:pt_BR_SpanishLATAM
cls
color B
echo.
echo Injecting the files... (Spanish (LATAM) ∙ Portuguese)
echo.
copy /y "%scriptpath%data\pt_BR\SpanishLATAM\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:pt_BR_French
cls
color B
echo.
echo Injecting the files... (French ∙ Portuguese)
echo.
copy /y "%scriptpath%data\pt_BR\French\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:pt_BR_Italian
cls
color B
echo.
echo Injecting the files... (Italian ∙ Portuguese)
echo.
copy /y "%scriptpath%data\pt_BR\Italian\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:pt_BR_Japanese
cls
color B
echo.
echo Injecting the files... (Japanese ∙ Portuguese)
echo.
copy /y "%scriptpath%data\pt_BR\Japanese\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:pt_BR_Korean
cls
color B
echo.
echo Injecting the files... (Korean ∙ Portuguese)
echo.
copy /y "%scriptpath%data\pt_BR\Korean\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:pt_BR_Polish
cls
color B
echo.
echo Injecting the files... (Polish ∙ Portuguese)
echo.
copy /y "%scriptpath%data\pt_BR\Polish\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:pt_BR_Portuguese
cls
color B
echo.
echo Injecting the files... (Portuguese ∙ Portuguese)
echo.
copy /y "%scriptpath%data\pt_BR\Portuguese\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:pt_BR_Russian
cls
color B
echo.
echo Injecting the files... (Russian ∙ Portuguese)
echo.
copy /y "%scriptpath%data\pt_BR\Russian\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:pt_BR_Thai
cls
color B
echo.
echo Injecting the files... (Thai ∙ Portuguese)
echo.
copy /y "%scriptpath%data\pt_BR\Thai\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:pt_BR_Turkish
cls
color B
echo.
echo Injecting the files... (Turkish ∙ Portuguese)
echo.
copy /y "%scriptpath%data\pt_BR\Turkish\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:pt_BR_Vietnamese
cls
color B
echo.
echo Injecting the files... (Vietnamese ∙ Portuguese)
echo.
copy /y "%scriptpath%data\pt_BR\Vietnamese\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End
REM #endregion PORTUGUESE
REM #region RUSSIAN



:: ::::::: ::
:: RUSSIAN ::
:: ::::::: ::



:ru_RU
cls
color C
title VALORANT Language Changer - %version% (Russian)
echo.
echo Select the text language you want to have with the Russian audio!
echo.
echo         1. Arabic              10. Polish
echo         2. Chinese             11. Portuguese
echo         3. Deutsch             12. Russian
echo         4. English             13. Spanish (ES)
echo         5. French              14. Spanish (LATAM)
echo         6. Indonesian          15. Thai
echo         7. Italian             16. Turkish
echo         8. Japanese            17. Vietnamese
echo         9. Korean              20. Main Menu
echo.
set /P input=» 
if /I "%input%" EQU "1" goto ru_RU_Arabic
if /I "%input%" EQU "2" goto ru_RU_Chinese
if /I "%input%" EQU "3" goto ru_RU_Deutsch
if /I "%input%" EQU "4" goto ru_RU_English
if /I "%input%" EQU "5" goto ru_RU_French
if /I "%input%" EQU "6" goto ru_RU_Indonesian
if /I "%input%" EQU "7" goto ru_RU_Italian
if /I "%input%" EQU "8" goto ru_RU_Japanese
if /I "%input%" EQU "9" goto ru_RU_Korean
if /I "%input%" EQU "10" goto ru_RU_Polish
if /I "%input%" EQU "11" goto ru_RU_Portuguese
if /I "%input%" EQU "12" goto ru_RU_Russian
if /I "%input%" EQU "13" goto ru_RU_SpanishES
if /I "%input%" EQU "14" goto ru_RU_SpanishLATAM
if /I "%input%" EQU "15" goto ru_RU_Thai
if /I "%input%" EQU "16" goto ru_RU_Turkish
if /I "%input%" EQU "17" goto ru_RU_Vietnamese
if /I "%input%" EQU "20" goto Main
goto ru_RU_InputError

:ru_RU_Arabic
cls
color B
echo.
echo Injecting the files... (Arabic ∙ Russian)
echo.
copy /y "%scriptpath%data\ru_RU\Arabic\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:ru_RU_Indonesian
cls
color B
echo.
echo Injecting the files... (Indonesian ∙ Russian)
echo.
copy /y "%scriptpath%data\ru_RU\Indonesian\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:ru_RU_Chinese
cls
color B
echo.
echo Injecting the files... (Chinese ∙ Russian)
echo.
copy /y "%scriptpath%data\ru_RU\Chinese\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:ru_RU_Deutsch
cls
color B
echo.
echo Injecting the files... (Deutsch ∙ Russian)
echo.
copy /y "%scriptpath%data\ru_RU\Deutsch\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:ru_RU_English
cls
color B
echo.
echo Injecting the files... (English ∙ Russian)
echo.
copy /y "%scriptpath%data\ru_RU\English\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:ru_RU_SpanishES
cls
color B
echo.
echo Injecting the files... (Spanish (ES) ∙ Russian)
echo.
copy /y "%scriptpath%data\ru_RU\SpanishES\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:ru_RU_SpanishLATAM
cls
color B
echo.
echo Injecting the files... (Spanish (LATAM) ∙ Russian)
echo.
copy /y "%scriptpath%data\ru_RU\SpanishLATAM\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:ru_RU_French
cls
color B
echo.
echo Injecting the files... (French ∙ Russian)
echo.
copy /y "%scriptpath%data\ru_RU\French\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:ru_RU_Italian
cls
color B
echo.
echo Injecting the files... (Italian ∙ Russian)
echo.
copy /y "%scriptpath%data\ru_RU\Italian\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:ru_RU_Japanese
cls
color B
echo.
echo Injecting the files... (Japanese ∙ Russian)
echo.
copy /y "%scriptpath%data\ru_RU\Japanese\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:ru_RU_Korean
cls
color B
echo.
echo Injecting the files... (Korean ∙ Russian)
echo.
copy /y "%scriptpath%data\ru_RU\Korean\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:ru_RU_Polish
cls
color B
echo.
echo Injecting the files... (Polish ∙ Russian)
echo.
copy /y "%scriptpath%data\ru_RU\Polish\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:ru_RU_Portuguese
cls
color B
echo.
echo Injecting the files... (Portuguese ∙ Russian)
echo.
copy /y "%scriptpath%data\ru_RU\Portuguese\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:ru_RU_Russian
cls
color B
echo.
echo Injecting the files... (Russian ∙ Russian)
echo.
copy /y "%scriptpath%data\ru_RU\Russian\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:ru_RU_Thai
cls
color B
echo.
echo Injecting the files... (Thai ∙ Russian)
echo.
copy /y "%scriptpath%data\ru_RU\Thai\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:ru_RU_Turkish
cls
color B
echo.
echo Injecting the files... (Turkish ∙ Russian)
echo.
copy /y "%scriptpath%data\ru_RU\Turkish\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:ru_RU_Vietnamese
cls
color B
echo.
echo Injecting the files... (Vietnamese ∙ Russian)
echo.
copy /y "%scriptpath%data\ru_RU\Vietnamese\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End
REM #endregion RUSSIAN
REM #region THAI



:: :::: ::
:: THAI ::
:: :::: ::



:th_TH
cls
color C
title VALORANT Language Changer - %version% (Thai)
echo.
echo Select the text language you want to have with the Thai audio!
echo.
echo         1. Arabic              10. Polish
echo         2. Chinese             11. Portuguese
echo         3. Deutsch             12. Russian
echo         4. English             13. Spanish (ES)
echo         5. French              14. Spanish (LATAM)
echo         6. Indonesian          15. Thai
echo         7. Italian             16. Turkish
echo         8. Japanese            17. Vietnamese
echo         9. Korean              20. Main Menu
echo.
set /P input=» 
if /I "%input%" EQU "1" goto th_TH_Arabic
if /I "%input%" EQU "2" goto th_TH_Chinese
if /I "%input%" EQU "3" goto th_TH_Deutsch
if /I "%input%" EQU "4" goto th_TH_English
if /I "%input%" EQU "5" goto th_TH_French
if /I "%input%" EQU "6" goto th_TH_Indonesian
if /I "%input%" EQU "7" goto th_TH_Italian
if /I "%input%" EQU "8" goto th_TH_Japanese
if /I "%input%" EQU "9" goto th_TH_Korean
if /I "%input%" EQU "10" goto th_TH_Polish
if /I "%input%" EQU "11" goto th_TH_Portuguese
if /I "%input%" EQU "12" goto th_TH_Russian
if /I "%input%" EQU "13" goto th_TH_SpanishES
if /I "%input%" EQU "14" goto th_TH_SpanishLATAM
if /I "%input%" EQU "15" goto th_TH_Thai
if /I "%input%" EQU "16" goto th_TH_Turkish
if /I "%input%" EQU "17" goto th_TH_Vietnamese
if /I "%input%" EQU "20" goto Main
goto th_TH_InputError

:th_TH_Arabic
cls
color B
echo.
echo Injecting the files... (Arabic ∙ Thai)
echo.
copy /y "%scriptpath%data\th_TH\Arabic\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:th_TH_Indonesian
cls
color B
echo.
echo Injecting the files... (Indonesian ∙ Thai)
echo.
copy /y "%scriptpath%data\th_TH\Indonesian\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:th_TH_Chinese
cls
color B
echo.
echo Injecting the files... (Chinese ∙ Thai)
echo.
copy /y "%scriptpath%data\th_TH\Chinese\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:th_TH_Deutsch
cls
color B
echo.
echo Injecting the files... (Deutsch ∙ Thai)
echo.
copy /y "%scriptpath%data\th_TH\Deutsch\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:th_TH_English
cls
color B
echo.
echo Injecting the files... (English ∙ Thai)
echo.
copy /y "%scriptpath%data\th_TH\English\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:th_TH_SpanishES
cls
color B
echo.
echo Injecting the files... (Spanish (ES) ∙ Thai)
echo.
copy /y "%scriptpath%data\th_TH\SpanishES\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:th_TH_SpanishLATAM
cls
color B
echo.
echo Injecting the files... (Spanish (LATAM) ∙ Thai)
echo.
copy /y "%scriptpath%data\th_TH\SpanishLATAM\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:th_TH_French
cls
color B
echo.
echo Injecting the files... (French ∙ Thai)
echo.
copy /y "%scriptpath%data\th_TH\French\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:th_TH_Italian
cls
color B
echo.
echo Injecting the files... (Italian ∙ Thai)
echo.
copy /y "%scriptpath%data\th_TH\Italian\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:th_TH_Japanese
cls
color B
echo.
echo Injecting the files... (Japanese ∙ Thai)
echo.
copy /y "%scriptpath%data\th_TH\Japanese\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:th_TH_Korean
cls
color B
echo.
echo Injecting the files... (Korean ∙ Thai)
echo.
copy /y "%scriptpath%data\th_TH\Korean\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:th_TH_Polish
cls
color B
echo.
echo Injecting the files... (Polish ∙ Thai)
echo.
copy /y "%scriptpath%data\th_TH\Polish\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:th_TH_Portuguese
cls
color B
echo.
echo Injecting the files... (Portuguese ∙ Thai)
echo.
copy /y "%scriptpath%data\th_TH\Portuguese\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:th_TH_Russian
cls
color B
echo.
echo Injecting the files... (Russian ∙ Thai)
echo.
copy /y "%scriptpath%data\th_TH\Russian\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:th_TH_Thai
cls
color B
echo.
echo Injecting the files... (Thai ∙ Thai)
echo.
copy /y "%scriptpath%data\th_TH\Thai\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:th_TH_Turkish
cls
color B
echo.
echo Injecting the files... (Turkish ∙ Thai)
echo.
copy /y "%scriptpath%data\th_TH\Turkish\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:th_TH_Vietnamese
cls
color B
echo.
echo Injecting the files... (Vietnamese ∙ Thai)
echo.
copy /y "%scriptpath%data\th_TH\Vietnamese\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End
REM #endregion THAI
REM #region TURKISH



:: ::::::: ::
:: TURKISH ::
:: ::::::: ::



:tr_TR
cls
color C
title VALORANT Language Changer - %version% (Turkish)
echo.
echo Select the text language you want to have with the Turkish audio!
echo.
echo         1. Arabic              10. Polish
echo         2. Chinese             11. Portuguese
echo         3. Deutsch             12. Russian
echo         4. English             13. Spanish (ES)
echo         5. French              14. Spanish (LATAM)
echo         6. Indonesian          15. Thai
echo         7. Italian             16. Turkish
echo         8. Japanese            17. Vietnamese
echo         9. Korean              20. Main Menu
echo.
set /P input=» 
if /I "%input%" EQU "1" goto tr_TR_Arabic
if /I "%input%" EQU "2" goto tr_TR_Chinese
if /I "%input%" EQU "3" goto tr_TR_Deutsch
if /I "%input%" EQU "4" goto tr_TR_English
if /I "%input%" EQU "5" goto tr_TR_French
if /I "%input%" EQU "6" goto tr_TR_Indonesian
if /I "%input%" EQU "7" goto tr_TR_Italian
if /I "%input%" EQU "8" goto tr_TR_Japanese
if /I "%input%" EQU "9" goto tr_TR_Korean
if /I "%input%" EQU "10" goto tr_TR_Polish
if /I "%input%" EQU "11" goto tr_TR_Portuguese
if /I "%input%" EQU "12" goto tr_TR_Russian
if /I "%input%" EQU "13" goto tr_TR_SpanishES
if /I "%input%" EQU "14" goto tr_TR_SpanishLATAM
if /I "%input%" EQU "15" goto tr_TR_Thai
if /I "%input%" EQU "16" goto tr_TR_Turkish
if /I "%input%" EQU "17" goto tr_TR_Vietnamese
if /I "%input%" EQU "20" goto Main
goto tr_TR_InputError

:tr_TR_Arabic
cls
color B
echo.
echo Injecting the files... (Arabic ∙ Turkish)
echo.
copy /y "%scriptpath%data\tr_TR\Arabic\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:tr_TR_Indonesian
cls
color B
echo.
echo Injecting the files... (Indonesian ∙ Turkish)
echo.
copy /y "%scriptpath%data\tr_TR\Indonesian\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:tr_TR_Chinese
cls
color B
echo.
echo Injecting the files... (Chinese ∙ Turkish)
echo.
copy /y "%scriptpath%data\tr_TR\Chinese\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:tr_TR_Deutsch
cls
color B
echo.
echo Injecting the files... (Deutsch ∙ Turkish)
echo.
copy /y "%scriptpath%data\tr_TR\Deutsch\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:tr_TR_English
cls
color B
echo.
echo Injecting the files... (English ∙ Turkish)
echo.
copy /y "%scriptpath%data\tr_TR\English\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:tr_TR_SpanishES
cls
color B
echo.
echo Injecting the files... (Spanish (ES) ∙ Turkish)
echo.
copy /y "%scriptpath%data\tr_TR\SpanishES\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:tr_TR_SpanishLATAM
cls
color B
echo.
echo Injecting the files... (Spanish (LATAM) ∙ Turkish)
echo.
copy /y "%scriptpath%data\tr_TR\SpanishLATAM\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:tr_TR_French
cls
color B
echo.
echo Injecting the files... (French ∙ Turkish)
echo.
copy /y "%scriptpath%data\tr_TR\French\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:tr_TR_Italian
cls
color B
echo.
echo Injecting the files... (Italian ∙ Turkish)
echo.
copy /y "%scriptpath%data\tr_TR\Italian\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:tr_TR_Japanese
cls
color B
echo.
echo Injecting the files... (Japanese ∙ Turkish)
echo.
copy /y "%scriptpath%data\tr_TR\Japanese\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:tr_TR_Korean
cls
color B
echo.
echo Injecting the files... (Korean ∙ Turkish)
echo.
copy /y "%scriptpath%data\tr_TR\Korean\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:tr_TR_Polish
cls
color B
echo.
echo Injecting the files... (Polish ∙ Turkish)
echo.
copy /y "%scriptpath%data\tr_TR\Polish\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:tr_TR_Portuguese
cls
color B
echo.
echo Injecting the files... (Portuguese ∙ Turkish)
echo.
copy /y "%scriptpath%data\tr_TR\Portuguese\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:tr_TR_Russian
cls
color B
echo.
echo Injecting the files... (Russian ∙ Turkish)
echo.
copy /y "%scriptpath%data\tr_TR\Russian\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:tr_TR_Thai
cls
color B
echo.
echo Injecting the files... (Thai ∙ Turkish)
echo.
copy /y "%scriptpath%data\tr_TR\Thai\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:tr_TR_Turkish
cls
color B
echo.
echo Injecting the files... (Turkish ∙ Turkish)
echo.
copy /y "%scriptpath%data\tr_TR\Turkish\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:tr_TR_Vietnamese
cls
color B
echo.
echo Injecting the files... (Vietnamese ∙ Turkish)
echo.
copy /y "%scriptpath%data\tr_TR\Vietnamese\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End
REM #endregion TURKISH
REM #region VIETNAMESE



:: :::::::::: ::
:: VIETNAMESE ::
:: :::::::::: ::



:vi_VN
cls
color C
title VALORANT Language Changer - %version% (Vietnamese)
echo.
echo Select the text language you want to have with the Vietnamese audio!
echo.
echo         1. Arabic              10. Polish
echo         2. Chinese             11. Portuguese
echo         3. Deutsch             12. Russian
echo         4. English             13. Spanish (ES)
echo         5. French              14. Spanish (LATAM)
echo         6. Indonesian          15. Thai
echo         7. Italian             16. Turkish
echo         8. Japanese            17. Vietnamese
echo         9. Korean              20. Main Menu
echo.
set /P input=» 
if /I "%input%" EQU "1" goto vi_VN_Arabic
if /I "%input%" EQU "2" goto vi_VN_Chinese
if /I "%input%" EQU "3" goto vi_VN_Deutsch
if /I "%input%" EQU "4" goto vi_VN_English
if /I "%input%" EQU "5" goto vi_VN_French
if /I "%input%" EQU "6" goto vi_VN_Indonesian
if /I "%input%" EQU "7" goto vi_VN_Italian
if /I "%input%" EQU "8" goto vi_VN_Japanese
if /I "%input%" EQU "9" goto vi_VN_Korean
if /I "%input%" EQU "10" goto vi_VN_Polish
if /I "%input%" EQU "11" goto vi_VN_Portuguese
if /I "%input%" EQU "12" goto vi_VN_Russian
if /I "%input%" EQU "13" goto vi_VN_SpanishES
if /I "%input%" EQU "14" goto vi_VN_SpanishLATAM
if /I "%input%" EQU "15" goto vi_VN_Thai
if /I "%input%" EQU "16" goto vi_VN_Turkish
if /I "%input%" EQU "17" goto vi_VN_Vietnamese
if /I "%input%" EQU "20" goto Main
goto vi_VN_InputError

:vi_VN_Arabic
cls
color B
echo.
echo Injecting the files... (Arabic ∙ Vietnamese)
echo.
copy /y "%scriptpath%data\vi_VN\Arabic\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:vi_VN_Indonesian
cls
color B
echo.
echo Injecting the files... (Indonesian ∙ Vietnamese)
echo.
copy /y "%scriptpath%data\vi_VN\Indonesian\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:vi_VN_Chinese
cls
color B
echo.
echo Injecting the files... (Chinese ∙ Vietnamese)
echo.
copy /y "%scriptpath%data\vi_VN\Chinese\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:vi_VN_Deutsch
cls
color B
echo.
echo Injecting the files... (Deutsch ∙ Vietnamese)
echo.
copy /y "%scriptpath%data\vi_VN\Deutsch\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:vi_VN_English
cls
color B
echo.
echo Injecting the files... (English ∙ Vietnamese)
echo.
copy /y "%scriptpath%data\vi_VN\English\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:vi_VN_SpanishES
cls
color B
echo.
echo Injecting the files... (Spanish (ES) ∙ Vietnamese)
echo.
copy /y "%scriptpath%data\vi_VN\SpanishES\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:vi_VN_SpanishLATAM
cls
color B
echo.
echo Injecting the files... (Spanish (LATAM) ∙ Vietnamese)
echo.
copy /y "%scriptpath%data\vi_VN\SpanishLATAM\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:vi_VN_French
cls
color B
echo.
echo Injecting the files... (French ∙ Vietnamese)
echo.
copy /y "%scriptpath%data\vi_VN\French\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:vi_VN_Italian
cls
color B
echo.
echo Injecting the files... (Italian ∙ Vietnamese)
echo.
copy /y "%scriptpath%data\vi_VN\Italian\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:vi_VN_Japanese
cls
color B
echo.
echo Injecting the files... (Japanese ∙ Vietnamese)
echo.
copy /y "%scriptpath%data\vi_VN\Japanese\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:vi_VN_Korean
cls
color B
echo.
echo Injecting the files... (Korean ∙ Vietnamese)
echo.
copy /y "%scriptpath%data\vi_VN\Korean\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:vi_VN_Polish
cls
color B
echo.
echo Injecting the files... (Polish ∙ Vietnamese)
echo.
copy /y "%scriptpath%data\vi_VN\Polish\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:vi_VN_Portuguese
cls
color B
echo.
echo Injecting the files... (Portuguese ∙ Vietnamese)
echo.
copy /y "%scriptpath%data\vi_VN\Portuguese\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:vi_VN_Russian
cls
color B
echo.
echo Injecting the files... (Russian ∙ Vietnamese)
echo.
copy /y "%scriptpath%data\vi_VN\Russian\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:vi_VN_Thai
cls
color B
echo.
echo Injecting the files... (Thai ∙ Vietnamese)
echo.
copy /y "%scriptpath%data\vi_VN\Thai\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:vi_VN_Turkish
cls
color B
echo.
echo Injecting the files... (Turkish ∙ Vietnamese)
echo.
copy /y "%scriptpath%data\vi_VN\Turkish\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End

::

:vi_VN_Vietnamese
cls
color B
echo.
echo Injecting the files... (Vietnamese ∙ Vietnamese)
echo.
copy /y "%scriptpath%data\vi_VN\Vietnamese\*.*" "%gamepath%\VALORANT\live\ShooterGame\Content\Paks" >nul
ping -n 3 localhost >nul
goto End
REM #endregion VIETNAMESE

REM #endregion LANGUAGES



:: ::: ::
:: MSG ::
:: ::: ::



REM #region MSG
:Paths_InputError
color 04
cls
echo.
echo [Error] Invalid input! Please enter a correct input.
echo.
ping -n 3 localhost >nul
goto Paths

:: 

:Paths_InputError2
color 04
cls
echo [Error] Invalid input given! Please enter a correct input.
echo         - Error 1
echo.
ping -n 3 localhost >nul
goto Paths_Confirm

::

:Paths_InputError3
color 04
cls
echo.
echo [Error] Invalid input given! Please enter a correct input.
echo.
ping -n 3 localhost >nul
goto Paths_ReSet

::

:Main_InputError
color 04
cls
echo [Error] Invalid input given! Please enter a correct input.
echo         - Error 1
echo.
ping -n 3 localhost >nul
goto Main

::

:End_InputError
color 04
cls
echo [Error] Invalid input given! Please enter a correct input.
echo         - Error 1
echo.
ping -n 3 localhost >nul
goto End

::

:Git_InputError
color 04
cls
echo [Error] Invalid input given! Please enter a correct input.
echo         - Error 1
echo.
ping -n 3 localhost >nul
goto Git_NotInstalled

:ar_AE_InputError
color 04
cls
echo [Error] Invalid input given! Please enter a correct input.
echo         - Error 1
echo.
ping -n 3 localhost >nul
goto ar_AE

::

:de_DE_InputError
color 04
cls
echo [Error] Invalid input given! Please enter a correct input.
echo         - Error 1
echo.
ping -n 3 localhost >nul
goto de_DE

::

:en_US_InputError
color 04
cls
echo [Error] Invalid input given! Please enter a correct input.
echo         - Error 1
echo.
ping -n 3 localhost >nul
goto en_US

::

:es_ES_InputError
color 04
cls
echo [Error] Invalid input given! Please enter a correct input.
echo         - Error 1
echo.
ping -n 3 localhost >nul
goto es_ES

::

:es_MX_InputError
color 04
cls
echo [Error] Invalid input given! Please enter a correct input.
echo         - Error 1
echo.
ping -n 3 localhost >nul
goto es_MX

::

:fr_FR_InputError
color 04
cls
echo [Error] Invalid input given! Please enter a correct input.
echo         - Error 1
echo.
ping -n 3 localhost >nul
goto fr_FR

::

:id_ID_InputError
color 04
cls
echo [Error] Invalid input given! Please enter a correct input.
echo         - Error 1
echo.
ping -n 3 localhost >nul
goto id_ID

::

:it_IT_InputError
color 04
cls
echo [Error] Invalid input given! Please enter a correct input.
echo         - Error 1
echo.
ping -n 3 localhost >nul
goto it_IT

::

:ja_JP_InputError
color 04
cls
echo [Error] Invalid input given! Please enter a correct input.
echo         - Error 1
echo.
ping -n 3 localhost >nul
goto ja_JP

::

:ko_KR_InputError
color 04
cls
echo [Error] Invalid input given! Please enter a correct input.
echo         - Error 1
echo.
ping -n 3 localhost >nul
goto ko_KR

::

:pl_PL_InputError
color 04
cls
echo [Error] Invalid input given! Please enter a correct input.
echo         - Error 1
echo.
ping -n 3 localhost >nul
goto pl_PL

::

:pt_BR_InputError
color 04
cls
echo [Error] Invalid input given! Please enter a correct input.
echo         - Error 1
echo.
ping -n 3 localhost >nul
goto pt_BR

::

:ru_RU_InputError
color 04
cls
echo [Error] Invalid input given! Please enter a correct input.
echo         - Error 1
echo.
ping -n 3 localhost >nul
goto ru_RU

::

:th_TH_InputError
color 04
cls
echo [Error] Invalid input given! Please enter a correct input.
echo         - Error 1
echo.
ping -n 3 localhost >nul
goto th_TH

::

:tr_TR_InputError
color 04
cls
echo [Error] Invalid input given! Please enter a correct input.
echo         - Error 1
echo.
ping -n 3 localhost >nul
goto tr_TR

::

:vi_VN_InputError
color 04
cls
echo [Error] Invalid input given! Please enter a correct input.
echo         - Error 1
echo.
ping -n 3 localhost >nul
goto vi_VN

::

:zh_TW_InputError
color 04
cls
echo [Error] Invalid input given! Please enter a correct input.
echo         - Error 1
echo.
ping -n 3 localhost >nul
goto zh_TW

::

:AL-ar_AE_InputError
color 04
cls
echo [Error] Invalid input given! Please enter a correct input.
echo         - Error 1
echo.
ping -n 3 localhost >nul
goto AutoLang-Arabic_Valid

::

:AL-de_DE_InputError
color 04
cls
echo [Error] Invalid input given! Please enter a correct input.
echo         - Error 1
echo.
ping -n 3 localhost >nul
goto AutoLang-Deutsch_Valid

::

:AL-en_US_InputError
color 04
cls
echo [Error] Invalid input given! Please enter a correct input.
echo         - Error 1
echo.
ping -n 3 localhost >nul
goto AutoLang-English_Valid

::

:AL-es_ES_InputError
color 04
cls
echo [Error] Invalid input given! Please enter a correct input.
echo         - Error 1
echo.
ping -n 3 localhost >nul
goto AutoLang-SpanishES_Valid

::

:AL-es_MX_InputError
color 04
cls
echo [Error] Invalid input given! Please enter a correct input.
echo         - Error 1
echo.
ping -n 3 localhost >nul
goto AutoLang-SpanishMX_Valid

::

:AL-fr_FR_InputError
color 04
cls
echo [Error] Invalid input given! Please enter a correct input.
echo         - Error 1
echo.
ping -n 3 localhost >nul
goto AutoLang-French_Valid

::

:AL-id_ID_InputError
color 04
cls
echo [Error] Invalid input given! Please enter a correct input.
echo         - Error 1
echo.
ping -n 3 localhost >nul
goto AutoLang-Indonesian_Valid

::

:AL-it_IT_InputError
color 04
cls
echo [Error] Invalid input given! Please enter a correct input.
echo         - Error 1
echo.
ping -n 3 localhost >nul
goto AutoLang-Italian_Valid

::

:AL-ja_JP_InputError
color 04
cls
echo [Error] Invalid input given! Please enter a correct input.
echo         - Error 1
echo.
ping -n 3 localhost >nul
goto AutoLang-Japanese_Valid

::

:AL-ko_KR_InputError
color 04
cls
echo [Error] Invalid input given! Please enter a correct input.
echo         - Error 1
echo.
ping -n 3 localhost >nul
goto AutoLang-Korean_Valid

::

:AL-pl_PL_InputError
color 04
cls
echo [Error] Invalid input given! Please enter a correct input.
echo         - Error 1
echo.
ping -n 3 localhost >nul
goto AutoLang-Polish_Valid

::

:AL-pt_BR_InputError
color 04
cls
echo [Error] Invalid input given! Please enter a correct input.
echo         - Error 1
echo.
ping -n 3 localhost >nul
goto AutoLang-Portuguese_Valid


::

:AL-ru_RU_InputError
color 04
cls
echo [Error] Invalid input given! Please enter a correct input.
echo         - Error 1
echo.
ping -n 3 localhost >nul
goto AutoLang-Russian_Valid

::

:AL-th_TH_InputError
color 04
cls
echo [Error] Invalid input given! Please enter a correct input.
echo         - Error 1
echo.
ping -n 3 localhost >nul
goto AutoLang-Thai_Valid

::

:AL-tr_TR_InputError
color 04
cls
echo [Error] Invalid input given! Please enter a correct input.
echo         - Error 1
echo.
ping -n 3 localhost >nul
goto AutoLang-Turkish_Valid

::

:AL-vi_VN_InputError
color 04
cls
echo [Error] Invalid input given! Please enter a correct input.
echo         - Error 1
echo.
ping -n 3 localhost >nul
goto AutoLang-Vietnamese_Valid

::

:AL-zh_TW_InputError
color 04
cls
echo [Error] Invalid input given! Please enter a correct input.
echo         - Error 1
echo.
ping -n 3 localhost >nul
goto AutoLang-Chinese_Valid
REM #endregion MSG



:: ::: ::
:: END ::
:: ::: ::


REM #region END
:End
color A
title VALORANT Language Changer - %version% (Finished)
cls
echo [Success] All of the files of the game language injected succesfully!
echo           Thanks for using VRLC!
echo.
echo Do you want to open VALORANT? (Y/N)
set /P input=» 
if /I "%input%" EQU "Y" goto End_OpenValorant
if /I "%input%" EQU "N" goto Script_Exit
goto End_InputError

::

:End_OpenValorant
color B
cls
cd "%gamepath%\Riot Client" >nul
start %valolnk% >nul
cls
echo Launching VALORANT...
echo.
ping -n 2 localhost >nul
goto End_OpenValorant_Check

::

:End_OpenValorant_Check
echo %valorant% >nul
tasklist /fi "imagename eq %valorant%" |find ":" >nul
if %errorLevel% == 0  (
    goto End_OpenValorant2
) else (
    goto End_OpenValorant_Done
)

::

:End_OpenValorant2
color B
cls
echo Launching VALORANT...
echo.
ping -n 2 localhost >nul
goto End_OpenValorant_Check

::

:End_OpenValorant_Done
color A
cls
cd %scriptpath% >nul
echo.
echo [Success] VALORANT openned successfully! Thanks for use! Closing VRLC...
echo.
ping -n 3 localhost >nul
goto Script_Exit
REM #endregion END



:: :::: ::
:: EXIT ::
:: :::: ::



:Script_Exit
exit
