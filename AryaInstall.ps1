# Caminho temporário do instalador
$tempInstaller = "$env:TEMP\setup.exe"

# 1. Baixar o instalador do servidor
Invoke-WebRequest -Uri "http://IP-SERVIDOR-PIXEON/apps/trebuchet/setup.exe" -OutFile $tempInstaller

# 2. Executar o instalador silenciosamente
$installerProcess = Start-Process -FilePath $tempInstaller -ArgumentList "/silent" -WindowStyle Hidden -PassThru
$installerProcess.WaitForExit()  # Aguarda a conclusão do instalador

# 3. Executar o protocolo customizado para iniciar o arya.exe
Start-Process "com.pixeon.launch://IP-SERVIDOR-PIXEON/arya?protocol=http"

# 4. Aguarda o arya.exe ser iniciado
$aryaRunning = $false
while (-not $aryaRunning) {
    # Verifica se o processo arya.exe está em execução
    $aryaRunning = Get-Process -Name "arya" -ErrorAction SilentlyContinue
    if (-not $aryaRunning) {
        Start-Sleep -Seconds 1  # Aguarda 1 segundo antes de verificar novamente
    }
}

# 5. Agora que o arya.exe está em execução, executar o segundo protocolo para iniciar o suite.exe
Start-Process "com.pixeon.launch://IP-SERVIDOR-PIXEON/suite?protocol=http" -Wait

# 6. Remover o instalador baixado
Remove-Item -Path $tempInstaller -Force
