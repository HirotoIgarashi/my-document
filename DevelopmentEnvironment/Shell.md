# Linuxのシェルとターミナルについて

## Linuxのシェルとは

UNIXでは、ユーザとの対話を受け持つプログラムをシェルと呼びます。シェル（殻）と いう名前はUNIXの一番外側をくるむ部分というイメージから付いたものといわれています。

## 使っているシェルを変更する

Linuxでシェルを変更するときは、chshコマンドを使います。chshによるログインシェルの変更が有効になるのはシステムの再起動が必要です。

```bash
$ sudo chsh
[sudo] <ユーザ名> のパスワード:
root のログインシェルを変更中
新しい値を入力してください。標準設定値を使うならリターンを押してください
  ログインシェル [/bin/bash]:
```

## 使っているシェルを確認する

使っているシェルを確認するときは`echo $SHELL`コマンドを使います。

<!-- 使っているシェルを確認するときは`readlink "/proc/$$/exe"`コマンドを使います。 -->

```bash
echo $SHELL
/usr/bin/fish
```

```bash
$ readlink "/proc/$$/exe"
/usr/bin/bash
```

## いろいろなシェル

- sh (Bourneシェル)

  UNIX普及の最初期から存在したシェルです。対話的な機能が貧弱なため、
  現在では対話的に使われることはあまりありません。ただ、バッチ機能は強力で
  あるため、現在でもシェルスクリプトを記述するために広く使われています。

- csh (Cシェル)

  BSDに起源を持つ対話機能重視型のシェルで、代替シェルの草分けです。
  上位互換のtcshが現れたため、このシェルを使う人は減っています。

- ksh (Kornシェル)

  Bourneシェル上位互換のシェルです。
  csh風のジョブコントロールを取り入れるなど各種の機能強化が図られていますが、
  特にコマンドライン編集機能の便利さを世に知らしめたのはこのシェルであったと
  いってよいでしょう。

- bash (Bourne Againシェル)

  GNUのシェルです。Bourneシェルをベースにcshゃkshの機能を取り入れ、
  コマンドライン編集や履歴検索機能などの拡張を行っています。
  Linuxではtcshと人気を二分しているようです。

- tcsh

  cshを基本に、コマンドライン編集、強力な補完とスペル補正、ビジュアルな 履歴検索などの機能拡張を行ったものです。ログインシェルとしての完成度は非常に高く、cshに代わって広く使われています。

- zsh (Zシェル)

  bash、ksh、tcshからそれぞれの便利な機能を取り入れ、 さらに独自の機能を加えた超高機能シェルです。構文の基本はshですが、 cshの構文の一部と独立の構文を加えて機能強化を図っています。 対話利用のための機能も非常に強力で、より正規表現に近い便利な ファイル名パターン、簡単に定義してコマンドラインからも利用できる関数、 補完候補の制御のほか、複数行に渡るコマンドラインの編集も極めて容易に なっています。

- [fish]

  [fish]: https://fishshell.com/

  fishとは**F**riendly **i**nteractive **sh**ellの略です。

  設定ファイルは~/.config/fish/config.fishです。

  - パッケージマネージャーの[fisher]をインストールする
    [fisher]: <https://github.com/jorgebucaran/fisher>

    - インストール
      curl -sL <https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish> | source && fisher install jorgebucaran/fisher

    - nvimのインストール
      fisher install FabioAntunes/fish-nvm edc/bass
      nvim install latest

## シェルプロンプト

シェルはユーザにコマンドの入力を促すために"$"、"#"、">"などの記号を表示します。この記号をシェルプロンプトといいます。

### いろいろなシェルプロンプト

- [Powerline]

- [Starship]

[Starship]: https://starship.rs/ja-JP/

設定ファイルは~/.config/starship.tomlです。

## ターミナル

### 使っているターミナルを変更する

chshコマンドを使います。

ターミナルエミュレータとたどり、使用したいターミナルエミュレータを選択します。今回はweztermを選択します。

### いろいろなターミナル

- [WezTerm]

  [WezTerm]: https://wezfurlong.org/wezterm/install/linux.html

  - weztermのインストール

  ```bash
  curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /usr/share/keyrings/wezterm-fury.gpg
  echo 'deb [signed-by=/usr/share/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list
  ```

  ```bash
  sudo apt update
  ```

  ```bash
  sudo apt install wezterm
  ```

  Ctrl + Alt + Tで起動するようにするには[設定] -> [キーボード]でキーボードメニューを開き[アプリケーションショートカットキー]でショートカットCtrl + Alt + Tにコマンド /usr/bin/weztermを登録します。

設定ファイルは~/.wezterm.luaです。

```lua
-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "AdventureTime"

config.font = wezterm.font(
  "Cica",
  {
    weight = "Bold",
    stretch = "Normal",
    style = "Normal"
  }
)
config.font_size = 15

-- and finally, return the configuration to wezterm
```

- [alacritty]

  [alacritty]: https://alacritty.org/

- [kitty]

  [kitty]: https://sw.kovidgoyal.net/kitty/

  kittyはフォントによって表示が崩れるというが記事があったので導入は見送っている。

- xfce terminal

## ターミナルの設定について

Linux mintのxfce Editionを利用している場合はターミナルの名称は Xfce Terminal になります。ターミナルを簡単に起動するにはキーボードで`Ctrl + Alt + t`を押します。

### ターミナルの大きさを設定する

#### xfce4-terminalの場合

ターミナルの大きさを指定するときは、
~/.config/xfce4/terminal/terminalrcファイルを直接編集するかターミナルの
メニューバーから「編集」「設定」で「ターミナルの設定」を開き「外観」から設定 する方法があります。

#### ~/.config/xfce4/terminal/terminalrcファイルを編集する方法

```bash
[Configuration]
...
MiscDefaultGeometry=142x38+10+60
```

#### 「ターミナルの設定」を開き「外観」から設定する方法

ターミナルを起動します。メニューバーの「編集」をクリックして「設定」を選択して
「ターミナルの設定」画面を開きます。「外観」タブを表示します。
デフォルトジオメトリの項目の数値を変更します。

#### weztermの場合

### ターミナルフォント

NERD FONTSについて。

Cicaフォント

## neovim

### 動作環境を確認する

$ checkhealth

- fisher install jorgebucaran/nvm.fish
- Missing "neovim" npm (or yarn, pnpm) package.
  Run in shell: npm install -g neovim
