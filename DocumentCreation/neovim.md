# Neovim入門

[Neovim]について簡単に説明します。
[Neovim]の公式ホームページによるとNeovimは「超拡張可能な Vim ベースのテキストエディター」です。

[Neovim]: https://neovim.io/

## Neovimのインストール

### Linux mintの場合

Linux mintでインストールする例を記述します。

aptのリポジトリを追加するための準備として以下のコマンドを実行します。

~~~
sudo apt-get install software-properties-common
~~~

実際にNeovimをインストールします。

~~~
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim
~~~

### MX Linuxの場合

appImageでインストールします。

## ターミナルの設定について

Linux mintのxfce Editionを利用している場合はターミナルの名称はXfce Terminalになります。キーボードでCtrl + Alt + tで起動します。

### ターミナルの大きさを設定する

ターミナルの大きさを指定するときは、~/.config/xfce4/terminal/terminalrcファイルを直接編集するかターミナルのメニューバーから「編集」「設定」で「ターミナルの設定」を開き「外観」から設定する方法があります。

####  ~/.config/xfce4/terminal/terminalrcファイルを編集する方法
~~~
[Configuration]
...
MiscDefaultGeometry=142x38+10+60
~~~

#### 「ターミナルの設定」を開き「外観」から設定する方法

ターミナルを起動します。メニューバーの「編集」をクリックして「設定」を選択して「ターミナルの設定」画面を開きます。
「外観」タブを表示します。

## AstroNvimのインストール

[AstroNvim]は、優れたプラグインのセットで拡張可能で使いやすい、美的で機能が豊富な neovim 構成です。

[AstroNvim]: https://astronvim.com/

### AstroNvimの要件

- Nerd Fonts (Optional with manual intervention: See Recipes/Customizing Icons)

[Nerd Fonts]はアイコニックフォントのアグリゲーター、コレクション、パッチャーです。
例としてJetBrainsMono Nerd Fontをインストールしてみます。

[Nerd Fonts]のホームページからJetBrainsMono.zipをダウンロードして解凍します。

~~~
unzip JetBrainsMono.zip -d ~/.local/share/fonts/
fc-cache -fv ~/.local/share/fonts/
~~~

[Nerd Fonts]: https://www.nerdfonts.com/

- Neovim v0.8+ (Not including nightly)
- Tree-sitter CLI (Note: This is only necessary if you want to use auto_install feature with Treesitter)

Tree-sitter CLIをインストールするコマンドです。

~~~
npm install tree-sitter-cli
~~~

- A clipboard tool is necessary for the integration with the system clipboard (see :help clipboard-tool for supported solutions)
システムクリップボードとの統合にはクリップボードツールが必要です

- Terminal with true color support (for the default theme, otherwise it is dependent on the theme you are using)

- オブションの要件
    + ripgrep - live grep telescope search (<leader>fw)
    + lazygit - git ui toggle terminal (<leader>tl or <leader>gg)
    + go DiskUsage() - disk usage toggle terminal (<leader>tu)
    + bottom - process viewer toggle terminal (<leader>tt)
    + Python - python repl toggle terminal (<leader>tp)
    + Node - Node is needed for a lot of the LSPs, and for the node repl toggle terminal (<leader>tn)

### インストール

現在のnvimファルダーのバックアップを取ります。

~~~
mv ~/.config/nvim ~/.config/nvim.bak
~~~

neovimのフォルダーのバックアップを取ります。

~~~
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
~~~

githubからAstroNvimのリポジトリをコピーします。

~~~
git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim
nvim
~~~

### セットアップ

#### LSPのイントール

~~~
:LspInstall pyright
~~~

#### 言語パーサー(language parser)のイントール

~~~
:TSInstall python
~~~

#### デバッガのイントール

~~~
:DapInstall python
~~~

#### プラグインの管理

プラグインの更新があるかをチェックするときは```:Lazy check```

プラグインを更新するときは```:Lazy update```

有効になっていないもしくは使っていないプラグインを削除するときは```:Lazy clean```

プラグインの更新と削除するときは```:Lazy sync```

#### AstroNvimの更新

#### AstroNvimパッケージの更新

#### AstroNvimパッケージのリロード

### 特徴

### コンフィグレーション

