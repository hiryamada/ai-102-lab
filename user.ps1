code --install-extension ms-dotnettools.csharp --force
code --install-extension ms-dotnettools.csdevkit --force
code --install-extension ms-dotnettools.dotnet-interactive-vscode --force

cd $HOME\Desktop
git clone https://github.com/hiryamada/ai-102-lab
cd ai-102-lab
code . -g steps.dib
