@echo off
title D: BACKUP
:loop
echo.
echo ================================
echo       D: BACKUP STARTING
echo ================================

robocopy "D:\Data" "F:\Server PC\Server\Data" /MIR /Z /R:5 /W:5

echo.
echo [INFO] Waiting 24 hours before next run...
timeout /t 86400 >nul
goto loop
