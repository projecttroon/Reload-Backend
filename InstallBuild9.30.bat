@echo off
title Installing 9.30
color 0C

echo
echo        Installing 9.30
echo 
echo.

mkdir C:\RebootBuilds 2>nul
cd C:\RebootBuilds

echo Downloading aria2...
powershell -Command "Invoke-WebRequest https://github.com/aria2/aria2/releases/download/release-1.37.0/aria2-1.37.0-win-64bit-build1.zip -OutFile aria2.zip"

echo Extracting aria2...
powershell -Command "Expand-Archive aria2.zip -DestinationPath aria2 -Force"

cd aria2\aria2-1.37.0-win-64bit-build1

echo.
echo Starting download...
echo.

aria2c.exe ^
-x 32 ^
-s 32 ^
-k 4M ^
--file-allocation=none ^
--continue=true ^
--summary-interval=1 ^
-d C:\RebootBuilds ^
-o 9.30.zip ^
https://builds.rebootfn.org/9.30.zip

echo.
echo 
echo     DOWNLOAD COMPLETE
echo File: C:\RebootBuilds\9.30.zip
echo 
pause
