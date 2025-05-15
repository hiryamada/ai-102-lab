- ラボ内部のWindowsスタートボタンを右クリックし「Windows ターミナル(管理者)」をクリック
- 「このアプリがデバイスに変更を加えることを許可しますか？」→「はい」
- 以下をコピーし、ターミナルに貼り付けてエンター

```pwsh
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/hiryamada/ai-102-lab/refs/heads/main/setup.ps1'))
```

