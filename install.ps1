Install-PackageProvider -Name NuGet -Force | Out-Null
Install-Module -Name Microsoft.WinGet.Client -Force -Repository PSGallery | Out-Null
Repair-WinGetPackageManager -Force -Latest
#winget install -e -h --accept-package-agreements --accept-source-agreements --no-upgrade --id Git.Git
#winget install -e -h --accept-package-agreements --accept-source-agreements --no-upgrade --scope machine --id Microsoft.VisualStudioCode
winget install -e -h --accept-package-agreements --accept-source-agreements --no-upgrade --id Microsoft.DotNet.SDK.9
#winget install -e -h --accept-package-agreements --accept-source-agreements --no-upgrade --id Microsoft.PowerShell
#winget install -e -h --accept-package-agreements --accept-source-agreements --no-upgrade --id Microsoft.AzureCLI
code --install-extension --force ms-dotnettools.csharp
code --install-extension --force ms-dotnettools.csdevkit
code --install-extension --force ms-dotnettools.dotnet-interactive-vscode
git clone https://github.com/hiryamada/ai-102-lab
code ai-102-lab
