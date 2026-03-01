@echo off
title Automatic Installer
color 0A

echo
echo Installing Required Programs...
echo 
echo.

:: Create temporary folder
mkdir C:\TempInstallers
cd C:\TempInstallers

echo Downloading Radmin VPN...
powershell -Command "Invoke-WebRequest https://download.radmin-vpn.com/download/files/Radmin_VPN_1.4.4642.1.exe -OutFile radmin.exe"

echo Downloading Node.js...
powershell -Command "Invoke-WebRequest https://nodejs.org/dist/v20.11.1/node-v20.11.1-x64.msi -OutFile node.msi"

echo Downloading MongoDB...
powershell -Command "Invoke-WebRequest https://fastdl.mongodb.org/windows/mongodb-windows-x86_64-7.0.5-signed.msi -OutFile mongodb.msi"

echo Downloading Visual Studio Code...
powershell -Command "Invoke-WebRequest https://update.code.visualstudio.com/latest/win32-x64-user/stable -OutFile vscode.exe"

echo Downloading Reboot Launcher...
powershell -Command "Invoke-WebRequest https://github.com/Auties00/Reboot-Launcher/releases/download/10.0.9/reboot_launcher-10.0.9-windows-setup.exe -OutFile reboot.exe"

echo.
echo Installing Radmin VPN...
start /wait radmin.exe /S

echo Installing Node.js...
msiexec /i node.msi /quiet

echo Installing MongoDB...
msiexec /i mongodb.msi /quiet

echo Installing Visual Studio Code...
start /wait vscode.exe /silent

echo Installing Reboot Launcher...
start /wait reboot.exe /S

echo.
echo 
echo Installation Finished!
echo 
pause
