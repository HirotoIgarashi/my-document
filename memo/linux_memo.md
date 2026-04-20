# Linuxに関するメモ

## Epic Games Launcher Installer

- Manual Wine Method:
  - Create a 64-bit Wine prefix: WINEPREFIX=~/.wine64Epic wineboot -i.
  - Install required components: winetricks d3dx9 corefonts dotnet20.
  - Run the installer: wine EpicGamesLauncherInstaller.msi.

  うまく動かない
