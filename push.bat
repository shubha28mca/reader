@echo off
:loop
REM Replace this with your actual command
echo Running command at %time%

git add .
git commit -am "Modify File."
git push

REM Wait for 10 seconds
timeout /t 10 >nul

goto loop
