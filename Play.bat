@echo off
cd /d "%~dp0"
if exist "game\Fromville.exe" goto run
echo Setting up Fromville for the first time. This takes about a minute...
copy /b "data\game.part00"+"data\game.part01"+"data\game.part02"+"data\game.part03"+"data\game.part04"+"data\game.part05"+"data\game.part06"+"data\game.part07" "Fromville-Windows.zip" >nul
if errorlevel 1 goto fail
mkdir game 2>nul
tar -xf "Fromville-Windows.zip" -C game
if errorlevel 1 goto fail
del "Fromville-Windows.zip"
:run
start "" "game\Fromville.exe"
exit /b 0
:fail
echo Something went wrong while setting up. Make sure you unzipped the whole folder first.
pause
