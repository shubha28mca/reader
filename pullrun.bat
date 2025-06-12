@echo off
:loop
REM Replace this with your actual command
echo Running command at %time%

git pull

REM Wait for 10 seconds
timeout /t 10 >nul

goto loop
