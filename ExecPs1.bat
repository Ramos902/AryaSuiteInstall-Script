@echo off
set "desktopPath=%USERPROFILE%\Desktop"
set "targetFile=Arya.lnk"
set "scriptDir=%~dp0"

if exist "%desktopPath%\%targetFile%" (
    echo O arquivo "%targetFile%" já existe. Nenhuma ação será executada.
) else (
    echo O arquivo "%targetFile%" não foi encontrado. Executando o script...
    powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "Invoke-Expression (Get-Content -Raw '%scriptDir%AryaInstall.ps1')"
)

pause
