Install-PackageProvider -Name NuGet -Force | Out-Null
Install-Module -Name Microsoft.WinGet.Client -Force -Repository PSGallery | Out-Null
Repair-WinGetPackageManager -Force -Latest
winget install -e -h --accept-package-agreements --accept-source-agreements --force --id Git.Git
winget install -e -h --accept-package-agreements --accept-source-agreements --force --id Microsoft.VisualStudioCode
winget install -e -h --accept-package-agreements --accept-source-agreements --force --id Microsoft.DotNet.SDK.9
winget install -e -h --accept-package-agreements --accept-source-agreements --force --id Microsoft.PowerShell
winget install -e -h --accept-package-agreements --accept-source-agreements --force --id Microsoft.AzureCLI
code --install-extension ms-dotnettools.csharp
code --install-extension ms-dotnettools.csdevkit
code --install-extension ms-dotnettools.dotnet-interactive-vscode
code
