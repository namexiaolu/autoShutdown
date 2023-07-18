@echo off

:loop
set response=
for /f "delims=" %%a in ('curl -s "http://baidu.com"') do set response=%%a

echo "%response%"

if "%response%"=="</html>" (
    echo after 30 shutdown ...if need cancle cmd input "shutdown /a"
start cmd /k "cancle.bat"
     ping -n 3 127.0.0.1 > nul
    shutdown /s /t 30
    exit
)
echo Waiting for 1 minute...
ping -n 61 127.0.0.1 > nul
goto loop