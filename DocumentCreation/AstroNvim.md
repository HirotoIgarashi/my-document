# AstroNvim入門

[Neovim]: https://neovim.io/
[AstroNvim]: https://astronvim.com/

## AstroNvimとは

AstroNvimとはパソコン用の無料で提供されるエディターです。

## パソコン用のエディター

パソコンのエディターで無料で提供されるものは多数あります。

Windowsではnotepad

UNIXではmule,emacsや、viがよく使われていると思います。

viの後継としてvimが開発されました。そのvimの後継としてNeovimが開発されました。
[Neovim]の公式ホームページによるとNeovimは「超拡張可能なVimベースのテキストエディター」と説明されています。
[AstroNvim]は[Neovim]を優れたプラグインのセットで拡張可能で使いやすい、美しく、機能が豊富にする構成です。とあります。

## Neovimのインストール

[Neovim]のインストールについてLinux mint、とMX Linuxで確認した方法を説明します。
[Neovim]のリリースページには、ほとんどのLinuxシステムで実行できるAppImageが提供されます。
インストールは必要なく、nvim.appimageをダウンロードして実行するだけです。
(Linuxディストリビューションが 4 年以上古い場合は動作しない可能性があります。)

### appimageのダウンロード

ブラウザからappiamgeをダウンロードする場合はneovimのホームページ(https://neovim.io)のInstall Nowのボタンをクリックしてインストールの説明ページ(https://github.com/neovim/neovim/blob/master/INSTALL.md)に遷移します。Install from downloadのLatest stable releaseから自分の環境にあったappimageをダウンロードします。

ファイル名はnvim-linux-x86_64.appimageです。以下のコマンドで実行権限を与えます。

```bash
chmod u+x nvim-linux-x86_64.appimage
./nvim-linux-x86_64.appimage
```

### 現在ログインしているユーザーにだけ設定する場合

#### bashを使用している場合

~/.bashrcに以下の行を追加します。

```bashrc
alias nvim='~/nvim-linux-x86_64.appimage'
```

編集した.bashrcを以下のコマンドで反映します。

```bash
. .bashrc
```

#### fishを使用している場合

```fish
alias nvim='~/nvim-linux-x86_64.appimage'
```

### Linuxのエディターとして設定する場合

Linuxのエディターとして設定するにはupdate-alternativesシステムを使用します。
現在のnvimコマンドの設定を確認します。

::: tip

> シェルに別名で登録しても機能するので update-alternatives することもないかな

```bash
sudo update-alternatives --display nvim
update-alternatives: エラー: nvimのalternativesがありません
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
パスはリンク元を指定します。

```bash
sudo update-alternatives --remove nvim /home/hiroto/nvim.appimage
```

### neovimのバージョンを確認する

```bash
nvim --version
NVIM v0.9.1
Build type: Release
LuaJIT 2.1.0-beta3

      システム vimrc: "$VIM/sysinit.vim"
       省略時の $VIM: "/__w/neovim/neovim/build/nvim.AppDir/usr/share/nvim"

Run :checkhealth for more info
```

## GettingStarted - AstroNvimを始めよう

### AstroNvimのインストール

[AstroNvim]は、優れたプラグインのセットで拡張可能で使いやすい、美的で機能が
豊富な neovim 構成です。

### AstroNvimの特徴

- [Heirline](https://github.com/rebelot/heirline.nvim)を使った
  ステータスライン、ウインドウズバー及びタブライン
- [Lazy.nvim](https://github.com/folke/lazy.nvim)を使った プラグイン管理
- [mason.nvim](https://github.com/williamboman/mason.nvim)を使った
  パッケージ管理
- [Neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim)を使った
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

### AstroNvimのインストール

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

githubで自分の環境を管理している場合はgithubから管理しているリポジトリをコピーします。

```bash
gh repo clone <githubのユーザ名>/<リポジトリ名> ~/.config/nvim/
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

#### デバッガ(language parser)のイントール

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
login`の手順を終わらせておく必要があります。またGithubのユーザ名とEメールアドレスの設定が必要になります。

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

## AstroCommunity - AstroCommunityを使おう

## Mappings - キーマッピング

### Opening LSP symbols

To toggle symbols outline you need to press `Space + lS`

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

### 標準のマッピング

| アクション                     | アクション（日本語）                | マッピング     |
| ------------------------------ | ----------------------------------- | -------------- |
| Leader key                     | リーダーキー                        | `Space`        |
| Local Leader key               | ローカルのリーダーキー              | `,             |
| Resize up                      | 上方向に縮小する                    | `Ctrl + Up`    |
| Resize Down                    | 下方向に拡大する                    | `Ctrl + Down`  |
| Resize Left                    | 左方向に縮小する                    | `Ctrl + Left`  |
| Resize Right                   | 右方向に拡大する                    | `Ctrl + Right` |
| Up Window                      | ウインドウを上方向に移動する        | `Ctrl + k`     |
| Down Window                    | ウインドウを下方向に移動する        | `Ctrl + j`     |
| Left Window                    | ウインドウを左方向に移動する        | `Ctrl + h`     |
| Right Window                   | ウインドウを左方向に移動する        | `Ctrl + l`     |
| Force write                    | 強制的に書き込む                    | `Ctrl + s`     |
| Force Quit                     | 強制的に終了する                    | `Ctrl + q`     |
| New File                       | 新しいファイルを作成する            | `Leader + n`   |
| Close Buffer                   | バッファーをクローズする            | `Leader + c`   |
| Next Tab<br>(real vim tab)     | 次のタブ<br>(real vim tab)          | `]t`           |
| Previous Tab<br>(real vim tab) | 前のタブ<br>(read vim tab)          | `[t`           |
| Comment                        | 1つもしくは複数の行をコメントにする | `Leawer + /`   |
| Horizontal Split               | 垂直に分割する                      | `\`            |
| Vertical Split                 | 水平に分割する                      | `\|`           |

### バッファー

| アクション                                                                    | アクション（日本語）                     | マッピング     |
| ----------------------------------------------------------------------------- | ---------------------------------------- | -------------- |
| Nex Buffer<br>                                                                | 次のバッファー                           | `]b`           |
| Previous Buffer                                                               | 前のバッファー                           | `[b`           |
| Move Buffer Right                                                             | バッファーを右に移動する                 | `>b`           |
| Move Buffer Left                                                              | バッファーを左に移動する                 | `<b`           |
| Navigate to <br> buffer tab with <br> interactive picker                      | 選択されたバッファータブにナビゲートする | `Leawer + bb`  |
| Close all <br> buffers except the <br> current                                | 今のバッファー以外のバッファーを閉じる   | `Leader + bc`  |
| Close all buffers                                                             | 全てのバッファーを閉じる                 | `Leader + bC`  |
| Delete a buffer <br> tab with <br> interactive picker                         | 選択されたバッファータブを削除する       | `Leader + bd`  |
| Close all <br> buffers to the left <br> of the current                        | 左にある全てのバッファーをクローズする   | `Leader + bl`  |
| Go to the previous <br> buffer                                                | 前のバッファーに移動する                 | `Leader + bp`  |
| Close all buffers <br> to the right of the current                            | 右にある全てのバッファーをクローズする   | `Leader + br`  |
| Sort buffers by <br> extension                                                | バッファーをextensionでソートする        | `Leader + bse` |
| Sort buffers by <br> buffer number                                            | バッファーをバッファー番号でソートする   | `Leader + bsi` |
| Sort buffers by <br> last modification                                        | バッファーを最終更新日でソートする       | `Leader + bsm` |
| Sort buffers by <br> full path                                                | バッファーをフルパスでソートする         | `Leader + bsp` |
| Sort buffers by <br> relative path                                            | バッファーをrelative pathでソートする    | `Leader + bsr` |
| Open a buffer tab <br> in a new horizontal <br> split with interactive picker | 水平方向に新しいタブをオープンする       | `Leader + b\`  |
| Open a buffer tab <br> in a new vertical <br> split with interactive picker   | 垂直方向に新しいタブをオープンする       | `Leader + b`   |

### Better Escape

この設定を有効にするには`~/.config/nvim/lua/plugins/user.lua`の
{ "max397574/better-escape.nvim", enabled = false },
をtrueに変更する必要があります。

| アクション     | マッピング |
| -------------- | ---------- |
| エスケープキー | `jj`、`jk` |

### 補完（Completion）

| アクション                       | アクション（日本語）           | Mappings                                    |
| -------------------------------- | ------------------------------ | ------------------------------------------- |
| Open completion <br> menu        | 補完メニューをオープンする     | `Ctrl + Space`                              |
| Select completion                | 補完を選択する                 | `Enter`                                     |
| Next snippet <br> location       | 次のスニペットの場所           | `Tab`                                       |
| Previous snippet <br> location   | 前のスニペットの場所           | `Shift + Tab`                               |
| Next completion                  | 次の補完                       | `Down`, `Ctrl + n`, `Ctrl + j`, `Tab`       |
| Previous completion              | 次の補完                       | `Up`, `Ctrl + p`, `Ctrl + k`, `Shift + Tab` |
| Cancel completion                | 補完のキャンセル               | `Ctrl + e`                                  |
| Scroll up completion <br> docs   | 補完の説明文のスクロールアップ | `Ctrl + u`                                  |
| Scroll down completion <br> docs | 補完の説明文のスクロールダウン | `Ctrl + d`                                  |

### Neo-Tree

| Action         | アクション                              | Mappings     |
| -------------- | --------------------------------------- | ------------ |
| Neotree toggle | ファイルエクプローラーを表示/非表示する | `Leader + e` |
| Neotree focus  | ファイルエクプローラーにカーソルを移す  | `Leader + o` |

### Dashboard Mappings

| Action           | アクション               | Mappings     |
| ---------------- | ------------------------ | ------------ |
| Dashboard (Home) | ダッシュボードに移動する | `Leader + h` |

### Session Manager Mappings

| Action                         | アクション                               | Mappings      |
| ------------------------------ | ---------------------------------------- | ------------- |
| Save Session                   | セッションを保存する                     | `Leader + Ss` |
| Last Session                   | 前のセッション                           | `Leader + Sl` |
| Delete Session                 | セッションを削除する                     | `Leader + Sd` |
| Delete Directory Session       | ディレクトリセッションを削除する         | `Leader + SD` |
| Search Sessions                | セッションを検索する                     | `Leader + Sf` |
| Search Directory Sessions      | ディレクトリセッションを検索する         | `Leader + SF` |
| Load Current Directory Session | 現在のディレクトリセッションをロードする | `Leader + S.` |

### Package Management Mappings

| Action                    | アクション | Mappings    |
| ------------------------- | ---------- | ----------- |
| Update Lazy and Mason     |            | Leader + pa |
| Plugins Install           |            | Leader + pi |
| Mason Installer           |            | Leader + pm |
| Mason Updater             |            | Leader + pM |
| Plugins Status            |            | Leader + ps |
| Plugins Sync              |            | Leader + pS |
| Plugins Check for Updates |            | Leader + pu |
| Plugins Update            |            | Leader + pU |

### LSP Mappings

| Action                      | アクション    | Mappings                   |
| --------------------------- | ------------- | -------------------------- |
| LSP Info                    | LSPの情報     | Leader + li                |
| None-ls Info                | None-lsの情報 | Leader + lI                |
| Hover Document              |               | K                          |
| Format Document             |               | Leader + lf                |
| Symbols Outline             |               | Leader + lS                |
| Line Diagnostics            |               | gl, Leader + ld, <C-W> + d |
| All Diagnostics             |               | Leader + lD                |
| Code Actions                |               | gra, Leader + la           |
| Source Code Actions         |               | Leader + lA                |
| Signature Help              |               | Leader + lh                |
| Rename                      | リネーム      | grn, Leader + lr           |
| Document Symbols            |               | Leader + ls                |
| Workspace Symbols           |               | Leader + lG                |
| Diagnostic Next             |               | ]d                         |
| Diagnostics Previous        |               | [d                         |
| Diagnostic Error Next       |               | ]e                         |
| Diagnostic Error Previous   |               | [e                         |
| Diagnostic Warning Next     |               | ]w                         |
| Diagnostic Warning Previous |               | [w                         |
| Document Symbol Next        |               | ]y                         |
| Document Symbol Previous    |               | [y                         |
| Declaration                 |               | gD                         |
| Type Definition             |               | gy                         |
| Definition                  |               | gd                         |
| Implementation              |               | gI                         |
| References                  |               | grr, Leader + lR           |

### Debugger Mappings

| Action                  | アクション | Mappings               |
| ----------------------- | ---------- | ---------------------- |
| Start/Continue Debugger |            | Leader + dc or <F5>    |
| Pause Debugger          |            | Leader + dp or <F6>    |
| Restart Debugger        |            | Leader + dr or <C-F5>  |
| Run Debugger to Cursor  |            | Leader + ds            |
| Close Debugger Session  |            | Leader + dq            |
| Terminate Debugger      |            | Leader + dQ or <S-F5>  |
| Toggle Breakpoint       |            | Leader + db or <F9>    |
| Conditional Breakpoint  |            | Leader + dC or <S-F9>  |
| Clear Breakpoints       |            | Leader + dB            |
| Step Over               |            | Leader + do or <F10>   |
| Step Into               |            | Leader + di or <F11>   |
| Step Out                |            | Leader + dO or <S-F11> |
| Evaluate Expression     |            | Leader + dE            |
| Toggle REPL             |            | Leader + dR            |
| Toggle Debugger UI      |            | Leader + du            |
| Debugger Hover          |            | Leader + dh            |

### Telescope Mappings

| Action                            | アクション | Mappings           |
| --------------------------------- | ---------- | ------------------ |
| Resume previous search            |            | Leader + f + Enter |
| Marks                             |            | Leader + f'        |
| Buffers                           |            | Leader + fb        |
| Word at cursor                    |            | Leader + fc        |
| Commands                          |            | Leader + fC        |
| Find files                        |            | Leader + ff        |
| Find files (include hidden files) |            | Leader + fF        |
| Help Tags                         |            | Leader + fh        |
| Keymaps                           |            | Leader + fk        |
| Man Pages                         |            | Leader + fm        |
| Notifications                     |            | Leader + fn        |
| Old Files                         |            | Leader + fo        |
| Registers                         |            | Leader + fr        |
| Colorschemes                      |            | Leader + ft        |
| Live Grep                         |            | Leader + fw        |
| Live Grep (include hidden files)  |            | Leader + fW        |
| Git Branches                      |            | Leader + gb        |
| Git Commits (repository)          |            | Leader + gc        |
| Git Commits (current file)        |            | Leader + gC        |
| Git Status                        |            | Leader + gt        |
| LSP Symbols                       |            | Leader + ls        |
| LSP Workspace Symbols             |            | Leader + lG        |

### Terminal Mappings

| Action                   | アクション | Mappings            |
| ------------------------ | ---------- | ------------------- |
| Open Floating Terminal   |            | Leader + tf         |
| Open Horizontal Terminal |            | Leader + th or <F7> |
| Open Vertical Terminal   |            | Leader + tv         |
| Open Toggle Lazygit      |            | Leader + tl         |
| Open Toggle node         |            | Leader + tn         |
| Open Toggle Python       |            | Leader + tp         |
| Open Toggle btm          |            | Leader + tt         |

### UI/UX Mappings

| Action                                 |     | Mappings    |
| -------------------------------------- | --- | ----------- |
| Toggle autopairs                       |     | Leader + ua |
| Toggle automatic root detection        |     | Leader + uA |
| Toggle background                      |     | Leader + ub |
| Toggle autocompletion (buffer)         |     | Leader + uc |
| Toggle autocompletion (global)         |     | Leader + uC |
| Toggle diagnostics                     |     | Leader + ud |
| Dismiss notifications                  |     | Leader + uD |
| Toggle autoformatting (buffer)         |     | Leader + uf |
| Toggle autoformatting (global)         |     | Leader + uF |
| Toggle signcolumn                      |     | Leader + ug |
| Toggle foldcolumn                      |     | Leader + u> |
| Toggle LSP inlay hints (buffer)        |     | Leader + uh |
| Toggle LSP inlay hints (global)        |     | Leader + uH |
| Toggle indent setting                  |     | Leader + ui |
| Toggle indent guides                   |     | Leader + u  |
| Toggle statusline                      |     | Leader + ul |
| Toggle CodeLens                        |     | Leader + uL |
| Change line numbering                  |     | Leader + un |
| Toggle notifications                   |     | Leader + uN |
| Toggle paste mode                      |     | Leader + up |
| Toggle reference highlighting (buffer) |     | Leader + ur |
| Toggle reference highlighting (global) |     | Leader + uR |
| Toggle spellcheck                      |     | Leader + us |
| Toggle conceal                         |     | Leader + uS |
| Toggle tabline                         |     | Leader + ut |
| Toggle URL highlighting                |     | Leader + uu |
| Toggle wrap                            |     | Leader + uw |
| Toggle syntax highlighting (buffer)    |     | Leader + uy |
| Toggle LSP semantic tokens (buffer)    |     | Leader + uY |
| Toggle color highlighting              |     | Leader + uz |

## Using This Documentation - この文書を使う

AstroNvimは、lazy.nvimが提供するNeovimプラグインの設定で構成されます。
プラグインは通常、Neovim構成フォルダー`~/.config/nvim/`内のlua/plugins/フォルダーで構成されます。
このドキュメントには、ユーザーをガイドするためのコードスニペットが多数含まれています。
これは、lazy.nvimプラグインの仕様を返す完全なファイルです。
これらを使用する最も簡単な方法は、plugins/フォルダー内の新しいファイルにコンテンツをコピーすることです。
これにより、次回エディターを起動したときにAstroNvimに自動的に読み込まれます。
これらのコードブロックは、既に作成したファイルに追加することもできます。
必要なコンテンツを適切な場所に手動で移動する必要があります。

## configuration - 構成

### Core Plugins

- AstroCore

AstroCoreはvimオプション、ユーザコマンド、自動コマンド、グローバルマッピングの機能を提供します。gitワークツリー統合、セッション管理などAstroNvim固有の機能も含まれます。

- AstroUI

AstroUIは、AstroNvimが統一されたユーザーインターフェイスを持つのに役立つAPIと構成レベルを提供します。

    - アイコンの定義
    - ハイライト グループの構成
    - カスタム ステータスライン
    - ウィンバー
    - タブラインを構築するための広範なステータス API

これには、インターフェイス全体で使用されるアイコンの定義、ハイライト グループの構成、およびカスタム ステータスライン、ウィンバー、およびタブラインを構築するための広範なステータス API の構成が含まれます。これらのオプションの詳細については、関連するレシピ セクションの

    - 「ステータスラインのカスタマイズ」、
    - 「アイコンのカスタマイズ」、および
    - 「カスタム カラースキーム」

のページを確認してください。構成オプションの完全な表は、 AstroUI ドキュメントにあります。

- AstroLSP

AstroLSPは、LSPの構成とセットアップのメインエンジンです。これは、、、mason ユーティリティなどの多くのコア プラグインとの統合を提供しますnvim-lspconfig。AstroNvim内での LSP の構成に関する詳細な説明については、 Advanced LSP Setup ページ をnone-ls参照してください。構成オプションの完全な表は、AstroLSP Documentationにあります。

- AstroTheme

AstroThemeは、AstroNvim用に構築されたデフォルトのカラースキームです。
アクセシビリティとコントラストが最適化され、クリーンでモダンな美観が維持されています。
また、AstroNvimに組み込まれているすべてのプラグインに対するファーストクラスのサポートと、ユーザーが使用する多くの一般的なプラグインに対するサポートも備えています。

AstroTheme is the default colorscheme that has been built for AstroNvim. It has been optimized for accessibility and contrast, while maintaining a clean and modern aesthetic. It also has first class support for all of the plugins built into AstroNvim as well as support for many common plugins that our users use.

### Customizing Plugins

#### Defining Plugins

#### Configure AstroNvim Plugins

#### How opts Overriding Works

#### Extending Core Plugin Config Functions

#### Disabling Plugins

#### Lazy Loading

#### Lazy Loading with AstroCore

#### Lazy Load File Related Plugins

#### Lazy Load Git Plugins

### Lua language Server integration

### Managing User Configuration

## Recipes - レシピ

## リファレンス

### Alternative Installation

### Exposed Autocommands

### Contributing to AstroNvim

### Default Plugins

| プラグイン                                    | 目的                                         |
| --------------------------------------------- | -------------------------------------------- |
| [AstroNvim/astrocore]                         | コア機能                                     |
| [AstroNvim/astrolsp]                          | LSP統合                                      |
| [AstroNvim/astrotheme]                        | デフォルトのカラースキーム/テーマ            |
| [AstroNvim/astroui]                           | UI統合                                       |
| [JoosepAlviste/nvim-ts-context-commentstring] | Contextual commenting                        |
| [L3MON4D3/LuaSnip]                            | Snippet Engine                               |
| [MunifTanjim/nui.nvim]                        | UI Component Library (for Neo-Tree)          |
| [NMAC427/guess-indent.nvim]                   | Automatic Indentation Detection              |
| [NvChad/nvim-colorizer.lua]                   | Highlight Color Strings                      |
| [akinsho/toggleterm.nvim]                     | ターミナル管理                               |
| [echasnovski/mini.bufremove]                  | Buffer Removal                               |
| [folke/lazy.nvim]                             | プラクイン管理                               |
| [folke/neoconf.nvim]                          | Global and Project-local settings            |
| [folke/neodev.nvim]                           | Neovim Lua LSP Integration                   |
| [folke/which-key.nvim]                        | Keymap Popup/Help Window                     |
| [goolord/alpha-nvim]                          | ダッシュボード/ホームスクリーン              |
| [hrsh7th/cmp-buffer]                          | Completion of Buffer Words                   |
| [hrsh7th/cmp-nvim-lsp]                        | Completion of LSP                            |
| [hrsh7th/cmp-path]                            | Completion of Paths                          |
| [hrsh7th/nvim-cmp]                            | Completion Engine                            |
| [jay-babu/mason-null-ls.nvim]                 | Mason Null-LS (None-LS) Integtration         |
| [jay-babu/mason-nvim-dap.nvim]                | Mason Nvim-DAP Integration                   |
| [kevinhwang91/nvim-ufo]                       | Fold detection                               |
| [kevinhwang91/promise-async]                  | Asynchronous Library (helper)                |
| [lewis6991/gitsigns.nvim]                     | Buffer Git Integration                       |
| [lukas-reineke/indent-blankline.nvim]         | Indent-level Indicators                      |
| [max397574/better-escape.nvim]                | 簡単なエスケープ(jj, jk)                     |
| [mfussenegger/nvim-dap]                       | Debugger Adapter Protocol                    |
| [mrjones2014/smart-splits.nvim]               | Split Navigation and Multiplexer Integration |
| [neovim/nvim-lspconfig]                       | Language Server Configurations               |
| [numToStr/Comment.nvim]                       | Comment Vim Operators                        |
| [nvim-lua/plenary.nvim]                       | Lua Helper Functions (helper)                |
| [nvim-neo-tree/neo-tree.nvim]                 | File Explorer                                |
| [nvim-telescope/telescope-fzf-native.nvim ]   | Fast Telescope Sorter                        |
| [nvim-telescope/telescope.nvim]               | General Finder/Picker                        |
| [nvim-tree/nvim-web-devicons]                 | Filetype Icons                               |
| [nvim-treesitter/nvim-treesitter-textobjects] | Treesitter Vim Text Objects                  |
| [nvim-treesitter/nvim-treesitter]             | Syntax Tree Based Highlighting               |
| [nvimtools/none-ls.nvim]                      | フォーマッターとLinter LSP統合               |
| [onsails/lspkind.nvim]                        | LSP Symbol Icons                             |
| [rafamadriz/friendly-snippets]                | General Purpose Snippet Collection           |
| [rcarriga/cmp-dap]                            | Completion in DAP REPL                       |
| [rcarriga/nvim-dap-ui]                        | DAPのユーザーインターフェイス                |
| [rcarriga/nvim-notify]                        | UI Notification Pop-ups                      |
| [rebelot/heirline.nvim]                       | Custom Statusline/Tabline/Winbar             |
| [s1n7ax/nvim-window-picker]                   | Window Picker (for Neo-tree)                 |
| [saadparwaiz1/cmp_luasnip]                    | Completion of Snippets                       |
| [stevearc/aerial.nvim]                        | Symbol Overview/Code Outline                 |
| [stevearc/dressing.nvim]                      | General vim.ui Improvements                  |
| [stevearc/resession.nvim]                     | セッション管理                               |
| [williamboman/mason-lspconfig.nvim]           | MasonのLSP統合                               |
| [williamboman/mason.nvim]                     | 外部のパッケージ管理                         |
| [windwp/nvim-autopairs]                       | Automatically Close Pairs                    |
| [windwp/nvim-ts-autotag]                      | Automatically Close/Rename Tags              |

[nvimtools/none-ls.nvim]: https://github.com/nvimtools/none-ls.nvim

### uninstall AstroNvim

## Acknowledgements - レシピ

## Code of Conduct

TODO:

### ユーザ構成の管理

### 公開された自動コマンド

### 設定メカニズム

### 利用可能なユーザーオプション
