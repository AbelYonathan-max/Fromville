@echo off
cd /d "%~dp0"
if not exist "game\Fromville.exe" goto setup
if not exist "game\version.txt" goto setup
fc /b "data\version.txt" "game\version.txt" >nul 2>&1
if errorlevel 1 goto setup
goto run
:setup
echo Setting up Fromville. This takes about a minute...
copy /b "data\game.part00"+"data\game.part01"+"data\game.part02"+"data\game.part03"+"data\game.part04"+"data\game.part05"+"data\game.part06"+"data\game.part07" "Fromville-Windows.zip" >nul
if errorlevel 1 goto fail
mkdir game 2>nul
tar -xf "Fromville-Windows.zip" -C game
if errorlevel 1 goto fail
del "Fromville-Windows.zip"
copy /y "data\version.txt" "game\version.txt" >nul
:run
start "" "game\Fromville.exe" %*
exit /b 0
:fail
echo Something went wrong while setting up. Make sure you unzipped the whole folder first.
pause
