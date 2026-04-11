# nvim入門

[Neovim]: https://neovim.io/

## nvimとは

viの後継としてvimが開発されました。そのvimの後継としてNeovimが開発されました。
[Neovim]の公式ホームページによるとNeovimは「超拡張可能なVimベースのテキストエディター」と説明されています。

## Neovim(nvim)のインストール

[Neovim]のインストールについてLinux mint、とMX Linuxで確認した方法を説明します。
[Neovim]のリリースページには、ほとんどのLinuxシステムで実行できるAppImageが提供されます。
インストールは必要なく、nvim.appimageをダウンロードして実行するだけです。
(Linuxディストリビューションが 4 年以上古い場合は動作しない可能性があります。)

### appimageのダウンロードとインストール

ブラウザからappiamgeをダウンロードする場合はneovimのホームページ(<https://neovim.io)のInstall> Nowのボタンをクリックしてインストールの説明ページ(<https://neovim.io/doc/install/)に遷移します。Linux> -> AppImage (“universal” Linux package)に従ってダウンロードします。

現状のPATHを確認します。

~~~bash
echo $PATH
~~~

~/.local/binにPATHが通るようにします。fishを使っている場合は、~/.config/fish/config.fishを編集します。

```fish
set -x PATH ~/.local/bin $PATH
```

appimageをダウンロードします。

```bash
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
chmod u+x nvim-linux-x86_64.appimage
./nvim-linux-x86_64.appimage
```

ファイル名をnvim-linux-x86_64.appimageからnvimに変更し、かつPATHが通っているディレクトリ~/.local/bin/に移動します。

~~~bash
mkdir -p ~/.local/bin
mv nvim-linux-x86_64.appimage ~/.local/bin/nvim
nvim
~~~

### neovimのバージョンを確認する

```bash
```

### :checkhealthを実行する

nvimを実行する環境について表示されます。

~~~fish
mkdir -p ~/.config/nvim
touch ~/.config/nvim/init.lua
# or touch ~/.config/nvim/init.vim if using Vimscript
sudo apt install ripgrep

nvm use latest
npm install -g neovim

curl -L https://cpanmin.us | sudo perl - App::cpanminus
sudo cpanm -n Neovim::Ext
# Neovim::Extのメッセージはシステムのバグであるらしく無視してもよい
# WARNINGが鬱陶しい時は~/.config/nvim/init.luaに
# vim.g.loaded_perl_provider = 0
# の１行を追加する
python3 -m venv ~/.config/nvim/venv
source ~/.config/nvim/venv/activate.fish
pip install --upgrade pynvim
# init.luaに
# vim.g.python3_host_prog = vim.fn.expand('~/.config/nvim/venv/bin/python')
# を追加する
# not found prettier
# :lazyExtraでprettierをインストールします。
~~~

## Markdown関連の設定

### markdownPreview

#### エラーに対処する

Cannot find module 'tslib' -> npm install -g tslib
~/.local/share/nvim/lazy/markdown-preview.nvim/ディレクトリでnpm installを実行する。
