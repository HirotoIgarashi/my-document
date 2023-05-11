# Neovim入門

[Neovim]について簡単に説明します。
[Neovim]の公式ホームページには「超拡張可能な Vim ベースのテキストエディター」という説明があります。

[Neovim]: https://neovim.io/

## Neovimのインストール

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
