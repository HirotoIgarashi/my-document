# Linuxをインストールした後に行うこと

## タッチパッドの有効/無効の切替をショートカットキーに割り当てる

タッチパッドの有効/無効を設定するコマンドを作成してキーボードショートカット Ctrl + ALT + @ に割り当てます。

準備として必要になるプログラムをインストールします。

```bash
sudo apt install xinput
```

- タッチパッドのデバイス名を調べる

  ```bash
  xinput list
  ```

- タッチパッドを有効にする、または無効にするコマンドを調べる

- タッチパッドの有効/無効にするスクリプトを作成する

```bash
#!/bin/bash

declare -i ID
# ID=$(xinput list | grep -Eio '(touchpad|glidepoint)\s*id=[0-9]{1,2}' | grep -Eo '[0-9]{1,2}')
id=11
declare -i STATE
STATE=$(xinput list-props "$ID" | grep 'Device Enabled' | awk '{print $4}')
if [ "$STATE" -eq 1 ]
then
    xinput disable "$ID"
    echo "Touchpad disabled."
    notify-send -a 'Touchpad' 'Touchpad Disabled' -i input-touchpad
else
    xinput enable "$ID"
    echo "Touchpad enabled."
    notify-send -a 'Touchpad' 'Touchpad Enabled' -i input-touchpad
fi
```

## シェルを変更する

シェルをbashからfishに変更します。

## ターミナルを変更する

Ctrl + Alt + t で起動するターミナルをXfce 端末からweztermに変更します。

## PATHの設定

PATHに~/.local/binを追加します。

## キーボードの設定

### CapsLockをCtrlにする

## 開発環境の設定

### node

nvmでnodeをインストールしてnpmコマンドを使えるようにします。

### python3

## git関連の設定

### gitコマンド

### repoコマンド

### lazygitコマンド

## エディターの設定

### Neovimを使う場合

### Visual Studio Codeを使う場合

### emacsを使う場合

## Markdown関連の設定

### markdownPreviw

#### エラーに対処する

Cannot find module 'tslib' -> npm install -g tslib
~/.local/share/nvim/lazy/markdown-preview.nvim/ディレクトリでnpm installを実行する。
