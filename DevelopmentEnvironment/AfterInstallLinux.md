<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ドキュメントタイトル</title>
    <style>
        body, html {
            height: 100%;
            margin: 0;
            font-family: 'Helvetica Neue', Arial, 'Hiragino Kaku Gothic ProN', 'Hiragino Sans', Meiryo, sans-serif;
        }
        .cover-container {
            /* 背景画像を設定する場合 */
            /* background-image: url('cover-image.jpg'); */
            background-color: #333; /* 背景色 */
            background-size: cover;
            background-position: center;
            height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center; /* 上下中央 */
            align-items: center; /* 左右中央 */
            color: white; /* 文字色 */
            text-align: center;
            padding: 20px;
        }
        .cover-title {
            font-size: 3rem;
            margin-bottom: 10px;
            font-weight: bold;
        }
        .cover-subtitle {
            font-size: 1.5rem;
            margin-bottom: 40px;
            font-weight: normal;
        }
        .cover-author {
            font-size: 1rem;
            position: absolute;
            bottom: 40px;
        }
    </style>
</head>
<body>
    <div class="cover-container">
        <h1 class="cover-title">Linuxをインストールした後に行うこと</h1>
        <p class="cover-subtitle">文書作成のために</p>
        <p class="cover-author">著者名 / 作成者</p>
        <!-- 作成日を表示するエリア -->
        <p>作成日: 
            <time datetime="2026-04-7">2026年4月7日</time>
        </p>
    </div>
</body>
</html>

<!-- mtoc-start -->

* [1. Linuxをインストールした後に行うこと](#1-linuxをインストールした後に行うこと)
  * [1.1. ソフトウェアの更新](#11-ソフトウェアの更新)
  * [1.2. タッチパッドの有効/無効の切替をショートカットキーに割り当てる](#12-タッチパッドの有効無効の切替をショートカットキーに割り当てる)
  * [1.3. シェルを変更する](#13-シェルを変更する)
    * [1.3.1. fishのインストール](#131-fishのインストール)
    * [1.3.2. ログインシェルをfishに変更する](#132-ログインシェルをfishに変更する)
  * [1.4. ターミナルを変更する](#14-ターミナルを変更する)
    * [1.4.1. weztermのインストール](#141-weztermのインストール)
    * [1.4.2. weztermの使い方](#142-weztermの使い方)
  * [1.5. PATHの設定](#15-pathの設定)
  * [1.6. キーボードの設定](#16-キーボードの設定)
    * [1.6.1. CapsLockをCtrlにする](#161-capslockをctrlにする)
  * [1.7. 開発環境の設定](#17-開発環境の設定)
    * [1.7.1. node](#171-node)
    * [1.7.2. python3](#172-python3)
  * [1.8. git関連の設定](#18-git関連の設定)
    * [1.8.1. gitコマンド](#181-gitコマンド)
    * [gh(GitHub CLI)コマンド](#ghgithub-cliコマンド)
    * [1.8.2. lazygitコマンド](#182-lazygitコマンド)
  * [1.9. エディターの設定](#19-エディターの設定)

<!-- mtoc-end -->
# 1. Linuxをインストールした後に行うこと

## 1.1. ソフトウェアの更新

~~~bash
sudo apt update
sudo apt install curl
~~~

## 1.2. タッチパッドの有効/無効の切替をショートカットキーに割り当てる

ノートPCでタイピングする時にタッチパッドを触ってしまい予期せぬ動作になってしまうことがあると思います。そうならないようにタッチパッドの動作を管理する必要があります。２つの方法があります。１つはtouchpad-indicatorを使います。
MX Linux15ではtouchpad-indicatorをインストールすることにより、 タッチパッドを管理することが可能になっています。

~~~bash
sudo apt install input-touchpad
~~~

もう１つは有効/無効を設定するコマンドを作成します。このコマンドにキーボードショートカット Ctrl + ALT + @ に割り当てます。

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

## 1.3. シェルを変更する

[fish]:https://fishshell.com/
シェルをbashから[fish]に変更します。

### 1.3.1. fishのインストール

[fish]のホームページからfish_4.3.3-2_amd64.debをダウンロードします。debアプリでシステムにインストールします。
/usr/bin/にインストールされます。

[fisher]:https://github.com/jorgebucaran/fisher
fishのためのプラグインマネージャである[fisher]をインストールします。

~~~bash
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
~~~

2026年4月現在、fishはバージョン4.6.0が最新です。

インストールされたfishは/usr/bin/fishにあります。

### 1.3.2. ログインシェルをfishに変更する

ログインシェルを変更するには、chshコマンドを使用します。
chshコマンドに/usr/bin/fishと答えます。システムを再起動します。

タッチパッドの有効/無効を切り替えるコマンドする場合は以下に従います。

## 1.4. ターミナルを変更する

[wezterm]:https://wezterm.org/index.html

### 1.4.1. weztermのインストール

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

### 1.4.2. weztermの使い方

| Modifiers  | Key   | Action                   |
| ---------- | ----- | ------------------------ |
| CTRL+SHIFT | c     | コピー                   |
| CTRL+SHIFT | v     | ペースト                 |
| ALT        | Enter | フルスクリーンの切り替え |
| CTRL       | -     | フォントを小さく         |
| CTRL       | =     | フォントを大きく         |
| CTRL+SHIFT | w     | カレントタブを閉じる     |
| CTRL+SHIFT | t     | タブを開く               |

## 1.5. PATHの設定

PATHに~/.local/binを追加します。

シェルをfishに変更したので~/.config/fish/config.fishに~/local/binにPATHを通します。

~~~fish
set -x PATH ~/.local/bin $PATH
~~~

## 1.6. キーボードの設定

### 1.6.1. CapsLockをCtrlにする

## 1.7. 開発環境の設定

### 1.7.1. node

nvmでnodeをインストールしてnpmコマンドを使えるようにします。

shellとしてfishを使用している場合は

~~~bash
fisher install jorgebucaran/nvm.fish
~~~

### 1.7.2. python3

## 1.8. git関連の設定

### 1.8.1. gitコマンド

~~~bash
sudo apt install git-all
~~~

gitにユーザ名とEmailアドレスを設定します。

~~~bash
git config --global user.name "John Doe"
git config --global user.email johndoe@example.com
~~~

git設定の確認

~~~bash
git config --list
~~~

gitで利用するディレクトリを~/Projects/とします。

~~~bash
mkdir -p ~/Projects
cd ~/Projects/
git init
~~~

### gh(GitHub CLI)コマンド

GitHub CLI は、すべての作業を 1 か所で行うことができるように、pull request、issues、GitHub Actions などの GitHub 機能をターミナルに集めたコマンドライン ツールです。

インストール

~~~bash
(type -p wget >/dev/null || (sudo apt update && sudo apt install wget -y)) \
	&& sudo mkdir -p -m 755 /etc/apt/keyrings \
	&& out=$(mktemp) && wget -nv -O$out https://cli.github.com/packages/githubcli-archive-keyring.gpg \
	&& cat $out | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
	&& sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
	&& sudo mkdir -p -m 755 /etc/apt/sources.list.d \
	&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
	&& sudo apt update \
	&& sudo apt install gh -y
~~~

アップグレード

~~~bash
sudo apt update
sudo apt install gh
~~~

### 1.8.2. lazygitコマンド

## 1.9. エディターの設定

エディターの設定はnvimの設定、AstroNvimの設定を参照のこと
