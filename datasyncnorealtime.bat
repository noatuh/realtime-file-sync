@echo off
title D:\Data Daily Backup

:: === Self-schedule this script to run daily at 12:00 AM ===
schtasks /Query /TN "DataBackup24hr" >nul 2>&1
if %errorlevel% NEQ 0 (
    echo [INFO] Creating scheduled task: DataBackup24hr
    schtasks /Create /SC DAILY /TN "DataBackup24hr" /TR "\"%~f0\"" /ST 00:00 /RL HIGHEST /F
) else (
    echo [INFO] Scheduled task already exists.
)

echo.
echo ===================================
echo     BACKING UP D:\Data NOW
echo ===================================

robocopy "D:\Data" "F:\Server PC\Server\Data" /MIR /Z /R:5 /W:5

echo.
echo Backup complete.
pause
