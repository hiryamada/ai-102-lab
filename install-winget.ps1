if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
  Write-Host "install winget ..."
  Install-PackageProvider -Name NuGet -Force | Out-Null
  Install-Module -Name Microsoft.WinGet.Client -Force -Repository PSGallery | Out-Null
  Repair-WinGetPackageManager -Force -Latest
  Write-Host "install winget ... done"
}
