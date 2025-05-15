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
