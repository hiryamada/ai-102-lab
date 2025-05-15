code --install-extension ms-dotnettools.csharp --force
code --install-extension ms-dotnettools.csdevkit --force
code --install-extension ms-dotnettools.dotnet-interactive-vscode --force

Set-Location $HOME\Desktop
git clone https://github.com/hiryamada/ai-102-lab
Set-Location ai-102-lab
code . -g steps.dib
