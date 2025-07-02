@echo off
title ALL DRIVES BACKUP

:loop
echo.
echo ================================
echo       ALL BACKUPS STARTING
echo ================================
echo.

rem 1) Root drive (no spaces → no quotes around C:\)
echo -- C: Drive Backup --
robocopy C:\ "F:\Server PC\Root" /MIR /Z /W:1 /R:2 /XJ /XA:SH /XD Windows "$Recycle.Bin" "System Volume Information"
echo -- Removing hidden/system attributes from Root directory --
attrib -h -s "F:\Server PC\Root"

rem 2) Data drive (no spaces in D:\ either)
echo.
echo -- D: Drive Backup --
robocopy D:\ "F:\Server PC\Server" /MIR /Z /W:1 /R:2 /XJ
echo -- Removing hidden/system attributes from Server directory --
attrib -h -s "F:\Server PC\Server"

echo.
echo [INFO] Waiting 24 hours before next run...
timeout /t 86400 >nul
goto loop