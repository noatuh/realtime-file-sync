@echo off
title C: DRIVE BACKUP
:loop
echo.
echo ================================
echo        C:\ BACKUP STARTING
echo ================================

robocopy C:\ "F:\Server PC\Root" /MIR /Z /W:1 /R:2 /XJ /A+:-H ^
/XD "Windows" "$Recycle.Bin" "System Volume Information" "Users\Mark\AppData"

echo.
echo [INFO] Waiting 24 hours before next run...
timeout /t 86400 >nul
goto loop
