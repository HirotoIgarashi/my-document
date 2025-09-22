# Linuxをインストールした後に行うこと

## シェルを変更する

シェルをbashからfishに変更します。

## ターミナルを変更する

Ctrl + Alt + t で起動するターミナルをXfce 端末からweztermに変更します。

## PATHの設定

PATHに~/.local/binを追加します。

## タッチパッドの有効/無効

タッチパッドの有効/無効を設定するコマンドを作成してキーボードショートカット Ctrl + ALT + @ に割り当てます。

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
