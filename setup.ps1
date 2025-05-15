if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
  Write-Host "install winget ..."
  Install-PackageProvider -Name NuGet -Force | Out-Null
  Install-Module -Name Microsoft.WinGet.Client -Force -Repository PSGallery | Out-Null
  Repair-WinGetPackageManager -Force -Latest
  Write-Host "install winget ... done"
}

Write-Host "install .NET SDK 9 ..."
winget install -e -h --accept-package-agreements --accept-source-agreements --no-upgrade --id Microsoft.DotNet.SDK.9
Write-Host "install .NET SDK 9 ... done"

Write-Host "install dotnet-interactive ..."
dotnet tool install -g Microsoft.dotnet-interactive
Write-Host "install dotnet-interactive ...done"

# create user.ps1
Write-Output @'
#code --install-extension ms-dotnettools.csharp --force
#code --install-extension ms-dotnettools.csdevkit --force

code --install-extension ms-dotnettools.dotnet-interactive-vscode --force

Set-Location $HOME\Desktop
git clone https://github.com/hiryamada/ai-102-lab
Set-Location ai-102-lab
code . -g steps.dib
'@ | Out-File -FilePath $env:USERPROFILE\user.ps1 -Encoding UTF8 -Force

Write-Host "Run user.ps1 as normal user ..."

$psi = New-Object System.Diagnostics.ProcessStartInfo
$psi.FileName = "powershell.exe"
$psi.Arguments = "-File `"$env:USERPROFILE\user.ps1`""
$psi.UseShellExecute = $true
$psi.Verb = "open"
[System.Diagnostics.Process]::Start($psi)

Write-Host "Run user.ps1 as normal user ... done"
