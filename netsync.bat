@echo off
title NETWORK BACKUP
:loop
echo.
echo ================================
echo       NETWORK BACKUP STARTING
echo ================================

REM -- \\rtxpc\c (A:) to F:\Main PC\Main I
if exist "\\rtxpc\c\" (
    robocopy "\\rtxpc\c" "F:\Main PC\Main I" /MIR /Z /W:1 /R:2 /XA:SH /A-:SH /XJ /XD "Windows" "Program Files" "Program Files (x86)" "ProgramData" "$Recycle.Bin" "System Volume Information" "Users\Mark\AppData"
) else (
    echo [WARNING] \\rtxpc\c is not available — skipping Main I.
)

REM -- \\rtxpc\e (B:) to F:\Main PC\Main II
if exist "\\rtxpc\e\" (
    robocopy "\\rtxpc\e" "F:\Main PC\Main II" /MIR /Z /W:1 /R:2 /XA:SH /A-:SH /XJ
) else (
    echo [WARNING] \\rtxpc\e is not available — skipping Main II.
)

REM -- \\rtxpc\b (E:) to F:\Main PC\Main III
if exist "\\rtxpc\b\" (
    robocopy "\\rtxpc\b" "F:\Main PC\Main III" /MIR /Z /W:1 /R:2 /XA:SH /A-:SH /XJ
) else (
    echo [WARNING] \\rtxpc\b is not available — skipping Main III.
)

echo.
echo [INFO] Waiting 24 hours before next run...
timeout /t 604800 >nul
goto loop
