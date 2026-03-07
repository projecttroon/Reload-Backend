@echo off
echo Enabling Discord Developer Mode...


taskkill /F /IM discord.exe >nul 2>&1
taskkill /F /IM discordcanary.exe >nul 2>&1
taskkill /F /IM discordptb.exe >nul 2>&1

set "config=%APPDATA%\discord\settings.json"

if not exist "%config%" (
echo { "developerMode": true } > "%config%"
) else (
powershell -Command "(Get-Content '%config%') -replace '\"developerMode\": false','\"developerMode\": true' | Set-Content '%config%'"
)

echo Developer Mode enabled.
echo Launching Discord...

start "" "%LOCALAPPDATA%\Discord\Update.exe" --processStart Discord.exe

pause
