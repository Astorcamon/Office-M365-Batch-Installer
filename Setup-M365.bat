@ECHO off
setlocal enabledelayedexpansion
mode con: cols=45 lines=40
powershell -command "& {$h=$host.ui.rawui;$b=$h.buffersize;$w=$h.windowsize;$b.height=999;$h.buffersize=$b}"

:: Force BAT path
cd /d "%~dp0"

:: Request Administrator permissions
net session >nul 2>&1
IF %errorlevel% neq 0 (
	ECHO  ====================================================
    ECHO  ADMINISTRATOR PERMISSIONS WILL BE REQUESTED.
    ECHO  IF PERMISSION IS NOT GRANTED, THE CONSOLE WILL CLOSE. 
	ECHO  ====================================================
	PAUSE
    powershell -NoProfile -ExecutionPolicy Bypass ^
        -Command "Start-Process '%~f0' -Verb RunAs"
    EXIT /B
)

:: Check setup.exe
IF not EXIST "%~dp0setup.exe" (
    ECHO ERROR: setup.exe not found in the BAT folder.
	ECHO Download from https://www.microsoft.com/en-us/download/details.aspx?id=49117
	START https://www.microsoft.com/en-us/download/details.aspx?id=49117
    PAUSE
    EXIT /b
)

:: ===== APPLICATION LIST =====
:: 1 = enabled (NOT excluded)
:: 0 = disabled (excluded with ExcludeApp)
SET Word=1
SET Excel=1
SET PowerPoint=0
SET Outlook=0
SET Access=0
SET OneNote=0
SET Teams=0
SET Publisher=0
SET Project=0
SET Visio=0

:MENU
CLS
ECHO ############################################
ECHO   Setup - Microsoft 365 (Run as admin)
ECHO ############################################
ECHO.
ECHO ============================================
ECHO   Select the applications to install
ECHO   (1 = enabled / 0 = disabled)
ECHO ============================================
ECHO.
ECHO  1. Word.............. !Word!
ECHO  2. Excel............. !Excel!
ECHO  3. PowerPoint........ !PowerPoint!
ECHO  4. Outlook........... !Outlook!
ECHO  5. Access............ !Access!
ECHO  6. OneNote........... !OneNote!
ECHO  7. Teams............. !Teams!
ECHO  8. Publisher......... !Publisher!
ECHO  9. Project........... !Project!
ECHO 10. Visio............. !Visio!
ECHO.
ECHO  I. Install
ECHO  X. Exit
ECHO.
SET /p opt=Choose an option: 

IF "%opt%"=="1"  (IF !Word!==1       (SET Word=0)       ELSE (SET Word=1))       & GOTO MENU
IF "%opt%"=="2"  (IF !Excel!==1      (SET Excel=0)      ELSE (SET Excel=1))      & GOTO MENU
IF "%opt%"=="3"  (IF !PowerPoint!==1 (SET PowerPoint=0) ELSE (SET PowerPoint=1)) & GOTO MENU
IF "%opt%"=="4"  (IF !Outlook!==1    (SET Outlook=0)    ELSE (SET Outlook=1))    & GOTO MENU
IF "%opt%"=="5"  (IF !Access!==1     (SET Access=0)     ELSE (SET Access=1))     & GOTO MENU
IF "%opt%"=="6"  (IF !OneNote!==1    (SET OneNote=0)    ELSE (SET OneNote=1))    & GOTO MENU
IF "%opt%"=="7"  (IF !Teams!==1      (SET Teams=0)      ELSE (SET Teams=1))      & GOTO MENU
IF "%opt%"=="8"  (IF !Publisher!==1  (SET Publisher=0)  ELSE (SET Publisher=1))  & GOTO MENU
IF "%opt%"=="9"  (IF !Project!==1    (SET Project=0)    ELSE (SET Project=1))    & GOTO MENU
IF "%opt%"=="10" (IF !Visio!==1      (SET Visio=0)      ELSE (SET Visio=1))      & GOTO MENU

IF /i "%opt%"=="X" (
    IF EXIST "%~dp0config_auto.xml" DEL /f /q "%~dp0config_auto.xml"
    EXIT /b
)

IF /i NOT "%opt%"=="I" GOTO MENU


:: NOTE
:: Will install Enterprise Edition using Current Channel.
:: The user's Microsoft 365 subscription automatically determines
:: the final edition (Personal, Family, Student, Business, Enterprise)
:: and may switch the update channel after activation if required.
:: The following commented lines are not requeired

REM :: Edition Select
REM :Edition
REM CLS
REM ECHO ============================================
REM ECHO   Select Microsoft 365 Edition
REM ECHO ============================================
REM ECHO  1. Enterprise (O365ProPlusRetail)
REM ECHO  2. Business  (O365BusinessRetail)
REM ECHO.
REM SET /p type=Choose an option: 

REM IF "%type%"=="1" SET "M365ProductID=O365ProPlusRetail"
REM IF "%type%"=="2" SET "M365ProductID=O365BusinessRetail"

REM IF NOT DEFINED M365ProductID (
	REM ECHO.
	REM ECHO Edition not found
	REM ECHO.
	REM PAUSE
	REM GOTO MENU
REM )	

REM :: Channel Select
REM :CHANNEL
REM CLS
REM ECHO ============================================
REM ECHO   Select Update Channel
REM ECHO ============================================
REM ECHO  1. Current
REM ECHO  2. MonthlyEnterprise
REM ECHO.
REM SET /p chan=Choose an option: 

REM IF "%chan%"=="1" SET "M365Channel=Current"
REM IF "%chan%"=="2" SET "M365Channel=MonthlyEnterprise"

REM IF NOT DEFINED M365Channel (
	REM ECHO.
	REM ECHO Channel not found
	REM ECHO.
	REM PAUSE
	REM GOTO MENU
REM )	

:: Language Select
CLS
:LANGUAGE
ECHO ============================================
ECHO   Select the language to install
ECHO ============================================
ECHO.
ECHO  1. English (en-us)
ECHO  2. English UK (en-gb)
ECHO  3. Spanish (es-es)
ECHO  4. Spanish LATAM (es-mx)
ECHO  5. French (fr-fr)
ECHO  6. German (de-de)
ECHO  7. Italian (it-it)
ECHO  8. Portuguese BR (pt-br)
ECHO  9. Portuguese PT (pt-pt)
ECHO 10. Japanese (ja-jp)
ECHO 11. Korean (ko-kr)
ECHO 12. Chinese SimplIFied (zh-cn)
ECHO 13. Chinese Traditional (zh-tw)
ECHO 14. Russian (ru-ru)
ECHO 15. Arabic (ar-sa)
ECHO 16. Dutch (nl-nl)
ECHO 17. Swedish (sv-se)
ECHO 18. Norwegian (nb-no)
ECHO 19. Danish (da-dk)
ECHO 20. Finnish (fi-fi)
ECHO 21. Polish (pl-pl)
ECHO 22. Czech (cs-cz)
ECHO 23. Hungarian (hu-hu)
ECHO 24. Turkish (tr-tr)
ECHO 25. Greek (el-gr)
ECHO 26. Romanian (ro-ro)
ECHO 27. Ukrainian (uk-ua)
ECHO 28. Indonesian (id-id)
ECHO 29. Vietnamese (vi-vn)
ECHO 30. Thai (th-th)
ECHO 31. Hebrew (he-il)
ECHO 32. Hindi (hi-in)
ECHO.

SET /p lang=Choose an option: 

IF "%lang%"=="1"  SET "language=en-us"
IF "%lang%"=="2"  SET "language=en-gb"
IF "%lang%"=="3"  SET "language=es-es"
IF "%lang%"=="4"  SET "language=es-mx"
IF "%lang%"=="5"  SET "language=fr-fr"
IF "%lang%"=="6"  SET "language=de-de"
IF "%lang%"=="7"  SET "language=it-it"
IF "%lang%"=="8"  SET "language=pt-br"
IF "%lang%"=="9"  SET "language=pt-pt"
IF "%lang%"=="10" SET "language=ja-jp"
IF "%lang%"=="11" SET "language=ko-kr"
IF "%lang%"=="12" SET "language=zh-cn"
IF "%lang%"=="13" SET "language=zh-tw"
IF "%lang%"=="14" SET "language=ru-ru"
IF "%lang%"=="15" SET "language=ar-sa"
IF "%lang%"=="16" SET "language=nl-nl"
IF "%lang%"=="17" SET "language=sv-se"
IF "%lang%"=="18" SET "language=nb-no"
IF "%lang%"=="19" SET "language=da-dk"
IF "%lang%"=="20" SET "language=fi-fi"
IF "%lang%"=="21" SET "language=pl-pl"
IF "%lang%"=="22" SET "language=cs-cz"
IF "%lang%"=="23" SET "language=hu-hu"
IF "%lang%"=="24" SET "language=tr-tr"
IF "%lang%"=="25" SET "language=el-gr"
IF "%lang%"=="26" SET "language=ro-ro"
IF "%lang%"=="27" SET "language=uk-ua"
IF "%lang%"=="28" SET "language=id-id"
IF "%lang%"=="29" SET "language=vi-vn"
IF "%lang%"=="30" SET "language=th-th"
IF "%lang%"=="31" SET "language=he-il"
IF "%lang%"=="32" SET "language=hi-in"

IF NOT DEFINED language (
	ECHO.
	ECHO Language not found
	ECHO.
	PAUSE
	GOTO MENU
)

:: ===== GENERATE XML =====
ECHO.
ECHO Generating XML...
ECHO.

(
ECHO ^<Configuration ID="b53935ac-439f-4c47-ab4b-48899f68c2c2"^>
ECHO   ^<Add OfficeClientEdition="64" Channel="Current"^>
ECHO     ^<Product ID="O365ProPlusRetail"^>
ECHO       ^<Language ID="%language%" /^>

IF %Word%==0        ECHO       ^<ExcludeApp ID="Word" /^>
IF %Excel%==0       ECHO       ^<ExcludeApp ID="Excel" /^>
IF %PowerPoint%==0  ECHO       ^<ExcludeApp ID="PowerPoint" /^>
IF %Outlook%==0     ECHO       ^<ExcludeApp ID="Outlook" /^>
IF %Access%==0      ECHO       ^<ExcludeApp ID="Access" /^>
IF %OneNote%==0     ECHO       ^<ExcludeApp ID="OneNote" /^>
IF %Teams%==0       ECHO       ^<ExcludeApp ID="Teams" /^>
IF %Publisher%==0   ECHO       ^<ExcludeApp ID="Publisher" /^>
IF %Project%==0     ECHO       ^<ExcludeApp ID="Project" /^>
IF %Visio%==0       ECHO       ^<ExcludeApp ID="Visio" /^>

ECHO     ^</Product^>
ECHO   ^</Add^>

ECHO   ^<Property Name="SharedComputerLicensing" Value="0" /^>
ECHO   ^<Property Name="FORCEAPPSHUTDOWN" Value="TRUE" /^>
ECHO   ^<Property Name="DeviceBasedLicensing" Value="0" /^>
ECHO   ^<Property Name="SCLCacheOverride" Value="0" /^>
ECHO   ^<Property Name="AUTOACTIVATE" Value="1" /^>

ECHO   ^<Updates Enabled="TRUE" /^>
ECHO   ^<RemoveMSI /^>
ECHO   ^<Display Level="Full" AcceptEULA="TRUE" /^>

ECHO ^</Configuration^>
) > "%~dp0config_auto.xml"

ECHO.
ECHO XML generated: config_auto.xml
ECHO.

:: ===== INSTALL =====
ECHO Starting installation...
ECHO Please wait while the process completes...
setup.exe /configure config_auto.xml

:: ===== DELETE XML =====
IF EXIST "%~dp0config_auto.xml" DEL /f /q "%~dp0config_auto.xml"

ECHO.
ECHO Process completed.
PAUSE

endlocal