<div class="cover-page">
    <h1>タイトル: Linuxをインストールした後に行うこと</h1>
    <h2>サブタイトル: 文書作成のために</h2>
  <div class="info">2025年10月18日</div>
  <!-- <div class="info">この書き方で内容を適宜追加できます</div> -->
</div>
<br>

<!-- mtoc-start -->

* [1. Linuxをインストールした後に行うこと](#1-linuxをインストールした後に行うこと)
  * [1.1. タッチパッドの有効/無効の切替をショートカットキーに割り当てる](#11-タッチパッドの有効無効の切替をショートカットキーに割り当てる)
  * [1.2. シェルを変更する](#12-シェルを変更する)
    * [1.2.1. fishのインストール](#121-fishのインストール)
    * [1.2.2. ログインシェルをfishに変更する](#122-ログインシェルをfishに変更する)
  * [1.3. ターミナルを変更する](#13-ターミナルを変更する)
    * [weztermのインストール](#weztermのインストール)
    * [weztermの使い方](#weztermの使い方)
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

ノートPCでキータッチする時にタッチパッドを触ってしまい予期せぬ動作になってしまうことがあると思います。そうならないようにタッチパッドの動作を管理する必要があります。２つの方法があります。１つはtouchpad-indicatorを使います。もう１つは有効/無効を設定するコマンドを作成します。このコマンドにキーボードショートカット Ctrl + ALT + @ に割り当てます。

MX Linux15ではtouchpad-indicatorをインストールすることにより、 タッチパッドを管理することが可能になっています。
インストールされたfishは/usr/bin/fishにあります。

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

[fish]:https://fishshell.com/
シェルをbashから[fish]に変更します。

### 1.2.1. fishのインストール

[fish]のホームページからfish_4.3.3-2_amd64.debをダウンロードします。debアプリでシステムにインストールします。
/usr/bin/にインストールされます。

### 1.2.2. ログインシェルをfishに変更する

ログインシェルを変更するには、chshコマンドを使用します。
chshコマンドに/usr/bin/fishと答えます。システムを再起動します。

タッチパッドの有効/無効を切り替えるコマンドする場合は以下に従います。

## 1.3. ターミナルを変更する

[wezterm]:https://wezterm.org/index.html

### weztermのインストール

weztermはAppImage形式で提供されています。

~~~shell
curl -LO https://github.com/wezterm/wezterm/releases/download/20240203-110809-5046fc22/WezTerm-20240203-110809-5046fc22-Ubuntu20.04.AppImage
chmod +x WezTerm-20240203-110809-5046fc22-Ubuntu20.04.AppImage
~~~

ダウンロードされたAppImageを実行して正常にダウンロードされたことを確認します。

~~~shell
./WezTerm-20240203-110809-5046fc22-Ubuntu20.04.AppImage
~~~

~/local/binの下にweztermの実行ファイルを移動する。

~~~shell
mkdir ~/.local/bin
mv ./WezTerm-20240203-110809-5046fc22-Ubuntu20.04.AppImage ~/.local/bin/wezterm
~/.local/bin/wezterm
~~~

Ctrl + Alt + t で起動するターミナルをXfce端末から[wezterm]に変更します。

MX Linuxの場合は設定-> キーボード ->
アプリケーションショートカットキーを使用します。

インストールした[wezterm]のバージョンを確認します。

~~~shell
wezterm --version
wezterm 20240203-110809-5046fc22
~~~

weztermの設定は~/.config/wezterm/にあるwezterm.luaに記述します。

### weztermの使い方

| Modifiers  | Key   | Action                   |
| ---------- | ----- | ------------------------ |
| CTRL+SHIFT | c     | コピー                   |
| CTRL+SHIFT | v     | ペースト                 |
| ALT        | Enter | フルスクリーンの切り替え |
| CTRL       | -     | フォントを小さく         |
| CTRL       | =     | フォントを大きく         |
| CTRL+SHIFT | w     | カレントタブを閉じる     |
| CTRL+SHIFT | t     | タブを開く              |

## 1.4. PATHの設定

PATHに~/.local/binを追加します。

シェルをfishに変更したので~/.config/fish/config.fishに~/local/binにPATHを通します。

~~~fish
set -x PATH ~/.local/bin $PATH
~~~

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
