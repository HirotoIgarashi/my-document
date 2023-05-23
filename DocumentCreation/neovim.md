# Neovim入門

[Neovim]について簡単に説明します。
[Neovim]の公式ホームページによるとNeovimは
「超拡張可能な Vim ベースのテキストエディター」です。

[Neovim]: https://neovim.io/

## Neovimのインストール

### Linux mintの場合

Linux mintでインストールする例になります。

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

## ターミナルの設定について

Linux mintのxfce Editionを利用している場合はターミナルの名称は
Xfce Terminalになります。キーボードでCtrl + Alt + tで起動します。

### ターミナルの大きさを設定する

ターミナルの大きさを指定するときは、
~/.config/xfce4/terminal/terminalrcファイルを直接編集するか
ターミナルのメニューバーから「編集」「設定」で「ターミナルの設定」を開き
「外観」から設定する方法があります。

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

### AstroNvimの特徴

- [Heirline](https://github.com/rebelot/heirline.nvim)を使った
ステータスライン、ウインドウズバー及びタブライン
- [Lazy.nvim](https://github.com/folke/lazy.nvim)を使った
プラグイン管理
- [mason.nvim](https://github.com/williamboman/mason.nvim)を使った
パッケージ管理
- [Neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim)を使った
ファイルエクスプローラー
- [Cmp](https://github.com/hrsh7th/nvim-cmp)を使ったオートコンプリート
- [Gitsigns](https://github.com/lewis6991/gitsigns.nvim)を使ったGitの統合
- [Toggleterm](https://github.com/akinsho/toggleterm.nvim)を備えた
ターミナル
- [Telescope](https://github.com/nvim-telescope/telescope.nvim)を使った
あいまい検索
- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)を
使った構文の強調表示
- [Null-ls](https://github.com/jose-elias-alvarez/null-ls.nvim)を
使ったフォーマットとリンティング
- [Native LSP](https://github.com/neovim/nvim-lspconfig)を使った
言語サーバープロトコル

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
クリップボードツールがインストールされているかを確認します。

~~~
:echo has('clipboard')
~~~

結果が0だったらクリップボードツールがインストールされていないので

~~~
sudo apt install xclip
~~~

でxclipをインストールします。

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

LSPとはlanguage Server Protocolのことです。
Microsoftが2016年6月に仕様を公開しました。

```:help lspconfig-all ```でLSPの一覧を見ることができます。

~~~
:LspInstall html css pyright quick_lint_js
~~~

#### 言語パーサー(language parser)のイントール

~~~
:TSInstall python
~~~

#### デバッガlanguage parser)のイントール

~~~
:DapInstall python
~~~

#### プラグインの管理

プラグインの更新をチェックするときは ```:Lazy check```を実行します。

保留しているプラグインを更新するときは ```:Lazy update```を実行します。

有効化していないまたは使っていないプラグインを削除するときは
```:Lazy clean```を実行します。 

プラグインの更新と削除をおこなうときは ```:Lazy sync```を実行します。

#### AstroNvimの更新

AstroNvimのリポジトリから最新のアップデートを入手するには
```:AstroUpdate``` を実行するか<leader>pA 

#### AstroNvimパッケージの更新

Neovim プラグインと Masonのパッケージの両方を更新するときは
```:AstroUpdatePackages```を実行するか<leader>pa 

#### Reload AstroNvim (EXPERIMENTAL)
Run :AstroReload to reload the AstroNvim configuration and any new user configuration changes without restarting. This is currently an experimental feature and may lead to instability until the next restart.


### コンフィグレーション

カスタムユーザー構成の作成を開始するには、user/フォルダーを作成する必要が
あります。

~~~
cd ~/.config/nvim/lua
mkdir user
~~~

ユーザー設定ファイルを簡単に作成するためのテンプレートリポジトリを
作成しました:
[Astronvim/user_example]

[Astronvim/user_example]で提供されたテンプレートリポジトリを使用して、GitHubアカウントに新しい
ユーザー構成リポジトリを作成します。

- ブラウザで[Astronvim/user_example]を開きます
- ログインされていなければログインします
- もう一度[Astronvim/user_example]を開きます
- Use this templateをクリックしてCreate a new repositoryを選択します
- Repository nameにastronvim_confなどとします

[Astronvim/user_example]: (https://github.com/AstroNvim/user_example)

直接クローンを作成したりできます。
テンプレートから新しいリポジトリを作成した後、次を実行できます。

~~~
git clone https://github.com/<username>/<config_repo> ~/.config/nvim/lua/user
~~~

