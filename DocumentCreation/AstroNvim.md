# AstroNvim入門

このドキュメントは[AstroNvim]についての説明です。[AstroNvim]は、
優れたプラグインのセットで拡張可能で使いやすい、美しく、機能が豊富な
[Neovim]の構成です。[Neovim]の公式ホームページによるとNeovimは 「超拡張可能な
Vim ベースのテキストエディター」とのことです。

[AstroNvim]: https://astronvim.com/
[Neovim]: https://neovim.io/

## Neovimのインストール

NeovimのインストールについてLinux mint、とMX Linuxで確認した方法を説明します。
リリースページには、ほとんどのLinux システムで実行できるAppImageが提供されます。
インストールは必要なく、nvim.appimageをダウンロードして実行するだけです。
(Linuxディストリビューションが 4 年以上古い場合は動作しない可能性があります。)

```bash
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage
```

### 現在ログインしているユーザーにだけ設定する場合

#### bashを使用している場合

~/.bashrcに以下の行を追加します。

```bashrc
alias nvim='~/nvim.appimage'
```

編集した.bashrcを以下のコマンドで反映します。

```bash
. .bashrc
```

#### fishを使用している場合

```fish
alias nvim='~/nvim.appimage'
```

### Linuxのエディターとして設定する場合

Linuxのエディターとして設定するにはupdate-alternativesシステムを使用します。
現在のnvimコマンドの設定を確認します。

::: tip

> シェルに別名で登録しても機能するので update-alternatives することもないかな

```bash
sudo update-alternatives --display nvim
update-alternatives: エラー: nvim の alternatives がありません
```

nvimコマンドはLinuxには登録されていないことがわかります。

ダウンロードしたnvim.appimageを/usr/bin/nvimにシンボリックリンクをはりnvim
コマンドとして使用できるように以下のコマンドを実行します。

```bash
sudo update-alternatives --install /usr/bin/nvim nvim ~/nvim.appimage 60
sudo update-alternatives --config nvim
```

Linuxのエディターである/usr/bin/editorに/usr/bin/nvimを登録する。
以下のコマンドを実行するとエディターの一覧が表示されます。 デフォルトが
/usr/bin/nvimであればそのままEnterキーを押すことで登録が完了します。

```bash
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
sudo update-alternatives --config editor
```

変更後のnvimコマンドの設定を確認します。

```bash
sudo update-alternatives --display nvim
nvim - 自動モード
  最適なリンクのバージョンは '/home/hiroto/nvim.appimage' です。
  リンクは現在 /home/hiroto/nvim.appimage を指しています
  リンク nvim は /usr/bin/nvim です
/home/hiroto/nvim.appimage - 優先度 60
```

アンインストールするときは update-alternatives --remove <名前> <パス>
パスはリンクもとを指定します。

```bash
sudo update-alternatives --remove nvim /home/hiroto/nvim.appimage
```

### バージョンを確認する

```bash
nvim --version
NVIM v0.9.1
Build type: Release
LuaJIT 2.1.0-beta3

      システム vimrc: "$VIM/sysinit.vim"
       省略時の $VIM: "/__w/neovim/neovim/build/nvim.AppDir/usr/share/nvim"

Run :checkhealth for more info
```

## ターミナルの設定について

Linux mintのxfce Editionを利用している場合はターミナルの名称は Xfce Terminal になります。ターミナルを簡単に起動するにはキーボードで
`Ctrl + Alt + t`を押します。

### ターミナルの大きさを設定する

#### xfce4-terminalの場合

ターミナルの大きさを指定するときは、
~/.config/xfce4/terminal/terminalrcファイルを直接編集するかターミナルの
メニューバーから「編集」「設定」で「ターミナルの設定」を開き「外観」から設定
する方法があります。

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

## AstroNvimのインストール

[AstroNvim]は、優れたプラグインのセットで拡張可能で使いやすい、美的で機能が
豊富な neovim 構成です。

### AstroNvimの特徴

- [Heirline](https://github.com/rebelot/heirline.nvim)を使った
  ステータスライン、ウインドウズバー及びタブライン
- [Lazy.nvim](https://github.com/folke/lazy.nvim)を使った プラグイン管理
- [mason.nvim](https://github.com/williamboman/mason.nvim)を使った
  パッケージ管理
- [Neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvgh repo clone HirotoIgarashi/my-documentim)を使った
  ファイルエクスプローラー
- [Cmp](https://github.com/hrsh7th/nvim-cmp)を使ったオートコンプリート
- [Gitsigns](https://github.com/lewis6991/gitsigns.nvim)を使ったGitの統合
- [Toggleterm](https://github.com/akinsho/toggleterm.nvim)を備えた ターミナル

  あいまい検索

- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)を
  使った構文の強調表示
- [Null-ls](https://github.com/jose-elias-alvarez/null-ls.nvim)を
  使ったフォーマットとリンティング
- [Native LSP](https://github.com/neovim/nvim-lspconfig)を使った
  言語サーバープロトコル

### AstroNvimの要件

- Nerd Fonts (Optional with manual intervention: See Recipes/Customizing Icons)

[Nerd Fonts]はアイコニックフォントのアグリゲーター、コレクション、
パッチャーです。 例としてJetBrainsMono Nerd Fontをインストールしてみます。

[Nerd Fonts]のホームページからJetBrainsMono.zipをダウンロードして解凍します。

```bash
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip
unzip JetBrainsMono.zip -d ~/.local/share/fonts/
fc-cache -fv ~/.local/share/fonts/
```

[Nerd Fonts]: https://www.nerdfonts.com/

- Neovim v0.8+ (Not including nightly)
- Tree-sitter CLI (Note: This is only necessary if you want to use auto_install
  feature with Treesitter)

Tree-sitter CLIをインストールするコマンドです。

```bash
npm install -g tree-sitter-cli
```

- A clipboard tool is necessary for the integration with the system clipboard
  (see :help clipboard-tool for supported solutions)
  システムクリップボードとの統合にはクリップボードツールが必要です
  クリップボードツールがインストールされているかを確認します。

```Vim script
:echo has('clipboard')
```

結果が0だったらクリップボードツールがインストールされていないのでxclipやxselなどをインストールします。

```bash
sudo apt install xclip
```

でxclipをインストールします。

- Terminal with true color support (for the default theme, otherwise it is
  dependent on the theme you are using)
- オプションの要件

  - [ripgrep](https://github.com/BurntSushi/ripgrep) - live grep telescope
    search ( \<leader>fw)

  インストールされていない場合は`sudo apt install ripgrep`を実行します。

  - [lazygit](https://github.com/jesseduffield/lazygit) - git uiターミナルを
    起動するときに必要です。(\<leader>tlまたは\<leader>gg)

    インストールされていない場合は[lazygitのgithubページ]\
    (<https://github.com/jesseduffield/lazygit>)を参考にしてインストールします。

  - [go DiskUsage()](https://github.com/dundee/gdu) - ディスク使用量ターミナル
    を起動するときに必要です。( \<leader>tu)

    インストールされていない場合は[gduのgithubページ]\
    (<https://github.com/dundee/gdu>)を参考にしてインストールします。

  - [bottom](https://github.com/ClementTsang/bottom) -
    プロセスビューアのターミナルを起動するときに必要です。( \<leader>tt)

    インストールされていない場合は[bottomのgithubページ]\
    (<https://github.com/ClementTsang/bottom>)を参考にしてインストールします。

  - [Python](https://www.python.org/) - Python repl
    ターミナルを起動するときに必要です。 ( \<leader>tp)
  - [Node](https://nodejs.org/ja) - Nodeは多くのLSPとnode repl
    ターミナルを起動するときに必要です。( \<leader>tn)に必要です。

### インストール

現在のnvimファルダーのバックアップを取ります。

```bash
mv ~/.config/nvim ~/.config/nvim.bak
```

neovimのフォルダーのバックアップを取ります。

```bash
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```

githubからAstroNvimのリポジトリをコピーします。

```bash
git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim
nvim
```

### Astronvimのセットアップ

#### LSPのイントール

LSPとはlanguage Server Protocolのことです。
Microsoftが2016年6月に仕様を公開しました。

```vim
:help lspconfig-all
```

でLSPの一覧を見ることができます。

(注:lspconfigの設定をしないとこのコマンドは失敗します)

```vim
:LspInstall html css pyright quick_lint_js
```

#### 言語パーサー(language parser)のイントール

```vim
:TSInstall python
```

#### デバッガlanguage parser)のイントール

```vim
:DapInstall python
```

#### プラグインの管理

プラグインの更新をチェックするときは `:Lazy check`を実行します。

保留しているプラグインを更新するときは `:Lazy update`を実行します。

有効化していないまたは使っていないプラグインを削除するときは
`:Lazy clean`を実行します。

プラグインの更新と削除をおこなうときは `:Lazy sync`を実行します。

#### AstroNvimの更新

AstroNvimのリポジトリから最新のアップデートを入手するには
`:AstroUpdate`を実行するか\<leader>pA

#### AstroNvimパッケージの更新

Neovim プラグインと Masonのパッケージの両方を更新するときは
`:AstroUpdatePackages`を実行するか\<leader>pa

#### Reload AstroNvim (EXPERIMENTAL)

Run :AstroReload to reload the AstroNvim configuration and any new user
configuration changes without restarting. This is currently an experimental
feature and may lead to instability until the next restart.

### コンフィグレーション

ユーザー設定ファイルを簡単に作成するためのテンプレートリポジトリを紹介します。
[Astronvim/user_example]

[Astronvim/user_example]で提供されたテンプレートリポジトリを使用して、
自分のGitHubアカウントに新しいユーザー構成リポジトリを作成します。

- ブラウザで[Astronvim/user_example]を開きます
- ログインされていなければログインします
- もう一度[Astronvim/user_example]を開きます
- Use this templateをクリックしてCreate a new repositoryを選択します
- Repository nameにastronvim_confなどとします

[Astronvim/user_example]: https://github.com/AstroNvim/user_example

直接クローンを作成したりできます。
テンプレートから新しいリポジトリを作成した後、次を実行できます。
なお<your_github_user_name>はあなたのgithubのユーザ名です。

```bash
git clone https://github.com/<your_github_user_name>/<your_repository>\
~/.config/nvim
```

次のghコマンドを使う場合は`gh auth
login`の手順を終わらせておく必要があります。まGithubのユーザ名とEメールアドレスの設定が必要になります。

```bash
gh repo clone <your_github_user_name>/astronvim_conf ~/.config/nvim/lua/user
```

## :checkhealthで動作環境をチェックする

nvimを起動させ動作環境をチェックします。

```vim
:checkhealth
```

Warningがでた場合はpynvimをインストールすることで対応します。

```bash
python3 -m pip install --user --upgrade pynvim
```

## Astronvimの基本的なチュートリアル

### ファイルエクプローラーを表示/非表示する

ファイルエクプローラーを表示したり非表示したりするには `Space + e`を押します。

### ターミナルを表示/非表示する

ターミナルを表示/非表示するには`F7`を押します。

### Opening LSP symbols

To toggle symbols outline you need to press `Space + lS`

### バッファーをクローズする

現在のバッファーをクローズするには`Space + c`を押します。

### コメントにする

1つもしくは複数の行をコメントにするには`Space + /`を押します。

### 行の診断結果を確認する

行の診断結果を確認するには`g + l`を押します。

### Hover document

To hover over a document you need to press `Shift + k`

### Open rename prompt

To open rename prompt you need to press `Space + lr`

### Go to definition

To go to the definition you need to press `g + d`

### Code actions

To use code actions you need to press `Space + la`

### デバッギング

デバッガーを使うときは`Space + D`を押します。 to see the available bindings and
options

### Telescope search

To find files you need to press `Space + ff`

### Telescope grep

To grep files you need to press `Space + fw`

### Telescope git status

To get git status you need to press `Space + gt`

### Telescope old files

To find old files you need to press `Space + fo`

### Which key

You can use which key plugin to get a menu of some helpful key bindings by
pressing Space

### バッファーをナビゲイトする

To switch to the left buffer you need to press `[b`

To switch to the right buffer you need to press `]b`

### ウィンドウをナビゲイトする

To switch to the left window you need to press `Ctrl + h`

To switch to the right window you need to press `Ctrl + l`

To switch to the top window you need to press `Ctrl + k`

To switch to the bottom window you need to press `Ctrl + j`

### Resizing buffers

To resize buffer to the left you need to press Ctrl + left key

To resize buffer to the right you need to press Ctrl + right key

To resize buffer to the top you need to press Ctrl + up key

To resize buffer to the bottom you need to press Ctrl + down key

### デフォルトのマッピング

#### 標準のマッピング

| アクション               | マッピング     |
| ------------------------ | -------------- |
| リーダーキー             | `Space`        |
| ローカルのリーダーキー   | `,`            |
| 上方向に縮小する         | `Ctrl + Up`    |
| 下方向に拡大する         | `Ctrl + Down`  |
| 左方向に縮小する         | `Ctrl + Left`  |
| 右方向に拡大する         | `Ctrl + Right` |
| Up Window                | `Ctrl + k`     |
| Down Window              | `Ctrl + j`     |
| Left Window              | `Ctrl + h`     |
| Right Window             | `Ctrl + l`     |
| 強制的に書き込む         | `Ctrl + s`     |
| 強制的に終了する         | `Ctrl + q`     |
| 新しいファイルを作成する | `Leader + n`   |
| バッファーをクローズする | `Leader + c`   |
| 次のタブ (real vim tab)  | `]t`           |
| 前のタブ (read vim tab)  | `[t`           |
| コメント                 | `Leader + /`   |
| 垂直に分割する           | `\`            |
| 水平に分割する           | `\|`           |

#### バッファー

| アクション            | アクション（日本語）  | マッピング  |
| --------------------- | --------------------- | ----------- |
| Nex Buffer            | 次のバッファー        | ]b          |
| Previous Buffer       | 前のバッファー        | [b          |     
| Move Buffer Right     |                       | >b          |
| Move Buffer Left      |                       | <b          |
| Navigate to <br>
buffer tab with  <br> interactive picker      |                       | Leader + bb |
| Cdose all <br>
buffers except the <br>
current                 |                       | Leader + bc |
| Close all buffers     |                       | Leader + bC |
| Delete a buffer  <br>
tab with  <br>
interactivepicker       |                       | Leader + bd |
| Close all  <br>
buffersto the left  <br>
of the current          |                       | Leader + bl |
|Go to the previous <br> buffer                                           |           |  Leader + bp          |
| Close all buffers <br> to the right of the current                       |           | Leader + br |
| Sort buffers by <br>
extension |          | Leader + bse |
| Sort buffers by <br>
buffer number |          | Leader + bsi           |
| Sort buffers by <br>
last modification |          | Leader + bsm           |
| Sort buffers by <br>
full path |          | Leader + bsp           |
| Sort buffers by <br>
relative path |          | Leader + bsr           |
| Open a buffer tab <br>
in a new horizontal split with interactive picker |          | Leader + b\            |
| Open a buffer tab <br>
in a new vertical split with interactive picker   |            | Leader + b           |

#### Better Escape

|

#### Neo-Tree

#### Dashboard Mappings

#### Session Manager Mappings

#### Package Management Mappings

#### LSP Mappings

#### Debugger Mappings

#### Telescope Mappings

#### Toggle Terminal Mappings

#### Git Mappings

#### UI Mappings

## 構成

TODO:

### ユーザ構成の管理

### 公開された自動コマンド

### 設定メカニズム

### 利用可能なユーザーオプション
