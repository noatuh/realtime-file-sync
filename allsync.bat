@echo off
title ALL DRIVES BACKUP

:loop
echo.
echo ================================
echo       ALL BACKUPS STARTING
echo ================================

echo.
echo -- D: Drive Backup --
robocopy "D:\Data" "F:\Server PC\Server\Data" /MIR /Z /R:5 /W:5

echo.
echo -- Network Drives Backup --
rem A: (\\rtxpc\c) to F:\Main PC\Main I
if exist "\\rtxpc\c\" (
    robocopy "\\rtxpc\c" "F:\Main PC\Main I" /MIR /Z /W:1 /R:2 /XA:SH /A-:SH /XJ /XD "Windows" "$Recycle.Bin" "System Volume Information" "Users\Mark\AppData"
) else (
    echo [WARNING] \\rtxpc\c is not available — skipping Main I.
)

rem B: (\\rtxpc\e) to F:\Main PC\Main II
if exist "\\rtxpc\e\" (
    robocopy "\\rtxpc\e" "F:\Main PC\Main II" /MIR /Z /W:1 /R:2 /XA:SH /A-:SH /XJ /XD "Windows" "$Recycle.Bin" "System Volume Information" "Users\Mark\AppData"
) else (
    echo [WARNING] \\rtxpc\e is not available — skipping Main II.
)

rem E: (\\rtxpc\b) to F:\Main PC\Main III
if exist "\\rtxpc\b\" (
    robocopy "\\rtxpc\b" "F:\Main PC\Main III" /MIR /Z /W:1 /R:2 /XA:SH /A-:SH /XJ
) else (
    echo [WARNING] \\rtxpc\b is not available — skipping Main III.
)

echo.
echo -- C: Drive Backup --
robocopy "C:\" "F:\Server PC\Root" /MIR /Z /W:1 /R:2 /XJ /A+:-H /XD "Windows" "$Recycle.Bin" "System Volume Information" "Users\Mark\AppData"

echo.
echo [INFO] Waiting 24 hours before next run...
timeout /t 86400 >nul
goto loop
