## Wingetと.NET SDK 9のインストール

- ラボ内部のWindowsスタートボタンを右クリックし「Windows ターミナル（管理者）」をクリック
- 「このアプリがデバイスに変更を加えることを許可しますか？」→「はい」
- 以下をコピーし、ターミナルに貼り付けてエンター

```pwsh
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/hiryamada/ai-102-lab/refs/heads/main/install-winget-dotnet.ps1'))
```

## VSCodeへの拡張機能の導入

- ラボ内部のWindowsスタートボタンを右クリックし「Windows ターミナル」をクリック
- 以下をコピーし、ターミナルに貼り付けてエンター

```pwsh
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/hiryamada/ai-102-lab/refs/heads/main/install.ps1'))
```

## .NET SDK 9 の導入

```pwsh
$ProgressPreference = 'SilentlyContinue'; iwr -UseBasicParsing -Uri 'https://builds.dotnet.microsoft.com/dotnet/Sdk/9.0.300/dotnet-sdk-9.0.300-win-x64.exe' -OutFile 'dotnet-sdk-9.0.300-win-x64.exe'; ./dotnet-sdk-9.0.300-win-x64.exe /install /quiet /norestart
```
