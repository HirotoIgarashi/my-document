
<!-- mtoc-start -->

* [1. Linuxをインストールした後に行うこと](#1-linuxをインストールした後に行うこと)
  * [1.1. タッチパッドの有効/無効の切替をショートカットキーに割り当てる](#11-タッチパッドの有効無効の切替をショートカットキーに割り当てる)
  * [1.2. シェルを変更する](#12-シェルを変更する)
  * [1.3. ターミナルを変更する](#13-ターミナルを変更する)
  * [1.4. PATHの設定](#14-pathの設定)
  * [1.5. キーボードの設定](#15-キーボードの設定)
    * [1.5.1. CapsLockをCtrlにする](#151-capslockをctrlにする)
  * [1.6. 開発環境の設定](#16-開発環境の設定)
    * [1.6.1. node](#161-node)
    * [1.6.2. python3](#162-python3)
  * [1.7. git関連の設定](#17-git関連の設定)
    * [1.7.1. gitコマンド](#171-gitコマンド)
    * [1.7.2. repoコマンド](#172-repoコマンド)
    * [1.7.3. lazygitコマンド](#173-lazygitコマンド)
  * [1.8. エディターの設定](#18-エディターの設定)
    * [1.8.1. Neovimを使う場合](#181-neovimを使う場合)
    * [1.8.2. Visual Studio Codeを使う場合](#182-visual-studio-codeを使う場合)
    * [1.8.3. emacsを使う場合](#183-emacsを使う場合)
  * [1.9. Markdown関連の設定](#19-markdown関連の設定)
    * [1.9.1. markdownPreviw](#191-markdownpreviw)
      * [1.9.1.1. エラーに対処する](#1911-エラーに対処する)

<!-- mtoc-end -->


# 1. Linuxをインストールした後に行うこと

## 1.1. タッチパッドの有効/無効の切替をショートカットキーに割り当てる

タッチパッドの有効/無効を設定するコマンドを作成してキーボードショートカット Ctrl + ALT + @ に割り当てます。

準備としてxinputコマンドをインストールします。

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

## 1.2. シェルを変更する

シェルをbashからfishに変更します。

## 1.3. ターミナルを変更する

Ctrl + Alt + t で起動するターミナルをXfce 端末からweztermに変更します。

## 1.4. PATHの設定

PATHに~/.local/binを追加します。

## 1.5. キーボードの設定

### 1.5.1. CapsLockをCtrlにする

## 1.6. 開発環境の設定

### 1.6.1. node

nvmでnodeをインストールしてnpmコマンドを使えるようにします。

### 1.6.2. python3

## 1.7. git関連の設定

### 1.7.1. gitコマンド

### 1.7.2. repoコマンド

### 1.7.3. lazygitコマンド

## 1.8. エディターの設定

### 1.8.1. Neovimを使う場合

### 1.8.2. Visual Studio Codeを使う場合

### 1.8.3. emacsを使う場合

## 1.9. Markdown関連の設定

### 1.9.1. markdownPreviw

#### 1.9.1.1. エラーに対処する

Cannot find module 'tslib' -> npm install -g tslib
~/.local/share/nvim/lazy/markdown-preview.nvim/ディレクトリでnpm installを実行する。
