# Neovim入門

[Neovim]について簡単に説明します。
[Neovim]の公式ホームページには「超拡張可能な Vim ベースのテキストエディター」という説明があります。

[Neovim]: https://neovim.io/

## Neovimのインストール

### Linux mintの場合

Linux mintでインストールする例を記述します。

aptのリポジトリを追加するために以下のコマンドを実行します。

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

## ちょと脱線してターミナルの設定について

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

## AstroNvimのインストール

[AstroNvim]は、優れたプラグインのセットで拡張可能で使いやすい、美的で機能が豊富な neovim 構成です。

[AstroNvim]: https://astronvim.com/

### AstroNvimをインストールする前の準備

#### Nerd Fonts (Optional with manual intervention: See Recipes/Customizing Icons)

[Nerd Fonts]はフォントにアイコンを追加した感じです。

[Nerd Fonts]: https://www.nerdfonts.com/

#### Neovim v0.8+ (Not including nightly)
#### Tree-sitter CLI (Note: This is only necessary if you want to use auto_install feature with Treesitter)
#### A clipboard tool is necessary for the integration with the system clipboard (see :help clipboard-tool for supported solutions)
#### Terminal with true color support (for the default theme, otherwise it is dependent on the theme you are using)
#### Optional Requirements:
##### ripgrep - live grep telescope search (<leader>fw)
##### lazygit - git ui toggle terminal (<leader>tl or <leader>gg)
##### go DiskUsage() - disk usage toggle terminal (<leader>tu)
##### bottom - process viewer toggle terminal (<leader>tt)
##### Python - python repl toggle terminal (<leader>tp)
##### Node - Node is needed for a lot of the LSPs, and for the node repl toggle terminal (<leader>tn)
