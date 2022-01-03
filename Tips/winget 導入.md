# winget

新しい Windows 10 には、Microsoft Store でアプリインストーラーを更新すれば入るはずです。
また、Windows 11 にはデフォルトで入っているはずです。

## コマンドラインでインストール

自動で最新版（latest release）の実行ファイルを取得しますので、新規インストールもアップデートも下記コマンドで実行できるかと思います。

```PowerShell
Invoke-WebRequest -Uri https://github.com/microsoft/winget-cli/releases/latest/download/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle -OutFile winget.msixbundle -UseBasicParsing
Add-AppxPackage -Path winget.msixbundle
rm winget.msixbundle
```

もし winget のインストール時にエラーが発生したら、必要なランタイムが足りていないので追加でインストールしてください。
下記は x86 64bit 用のコマンドです。

```PowerShell
Invoke-WebRequest -Uri https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx -OutFile vclibs.appx -UseBasicParsing
Add-AppxPackage -Path vclibs.appx
rm vclibs.appx
```

https://docs.microsoft.com/en-us/troubleshoot/cpp/c-runtime-packages-desktop-bridge#how-to-install-and-update-desktop-framework-packages