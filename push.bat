@echo off
setlocal enabledelayedexpansion

:loop

REM Replace this with your actual command
echo Running command at %time%

set "file=secure_input.txt"
set "hashfile=last_hash.txt"
set "currentHash="
set "lastHash="

:: Calculate current file hash
for /f "skip=1 tokens=* delims=" %%A in ('certutil -hashfile "%file%" MD5 ^| find /v "certutil"') do (
    set "currentHash=%%A"
    goto doneHash
)
:doneHash

:: Remove spaces from hash
set "currentHash=!currentHash: =!"

:: Read previous hash if exists
if exist "%hashfile%" (
    set /p lastHash=<"%hashfile%"
)

:: Compare hashes
if /i "!currentHash!"=="!lastHash!" (
    echo No change in file.
) else (
    echo File has changed!
    echo !currentHash! > "%hashfile%"

    :: Put your custom commands here
    echo Running update commands...
    git add .
    git commit -am "Modify File."
    git push
)

REM Wait for 10 seconds
timeout /t 10 >nul

goto loop
