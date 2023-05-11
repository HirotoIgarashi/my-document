# Neovim入門

[Neovim]のホームページによると[Neovim]とは超拡張可能な Vim ベースのテキストエディターとのことです。

[Neovim]: https://neovim.io/

## Neovimのインストール

Linux mintでのインストールする例を記述します。

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

