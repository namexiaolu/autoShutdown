@echo off

:loop
set response=
for /f "delims=" %%a in ('curl -s "http://baidu.com"') do set response=%%a

echo "%response%"

if "%response%"=="</html>" (
    echo Shutting down the machine...
    shutdown /s /t 0
    exit
)
echo Waiting for 1 minute...
ping -n 61 127.0.0.1 > nul
goto loop