
<!-- mtoc-start -->

* [1. フォントについて](#1-フォントについて)
  * [1.1. フォントの5要素](#11-フォントの5要素)
    * [1.1.1. エンコーディング(encoding)](#111-エンコーディングencoding)
    * [1.1.2. ファミリ(family)](#112-ファミリfamily)
    * [1.1.3. シリーズ(series)](#113-シリーズseries)
    * [1.1.4. シェープ(shape)](#114-シェープshape)
    * [1.1.5. サイズ(size)](#115-サイズsize)
* [2. 日本語フォント](#2-日本語フォント)
  * [2.1. 日本語フォント一覧](#21-日本語フォント一覧)
    * [2.1.1. 定番・汎用フォント](#211-定番・汎用フォント)
    * [2.1.2. プログラミング・開発者向けフォント](#212-プログラミング・開発者向けフォント)
    * [2.1.3. 等幅フォント](#213-等幅フォント)
  * [2.2. フォントの追加](#22-フォントの追加)
    * [2.2.1. ディストリビューションが提供するフォントを追加する](#221-ディストリビューションが提供するフォントを追加する)
    * [2.2.2. 手動でフォントをユーザディレクトリに追加する](#222-手動でフォントをユーザディレクトリに追加する)
    * [2.2.3. 手動でフォントをシステムディレクトリに追加する](#223-手動でフォントをシステムディレクトリに追加する)

<!-- mtoc-end -->

# 1. フォントについて

## 1.1. フォントの5要素

フォントの5要素として以下の5要素があります。

- エンコーディング(encoding)
- ファミリ(family)

    フォントファミリ名を確認するにはfc-listコマンドを使用します。特定のフォント、例えばTakaoフォントに関するものだけ抽出する場合はfc-list
    | grep "Takao"とします。

- シリーズ(series)
- シェープ(shape)
- サイズ(size)

### 1.1.1. エンコーディング(encoding)

### 1.1.2. ファミリ(family)

### 1.1.3. シリーズ(series)

### 1.1.4. シェープ(shape)

### 1.1.5. サイズ(size)

# 2. 日本語フォント

## 2.1. 日本語フォント一覧

### 2.1.1. 定番・汎用フォント

- IPAフォント
- IPSexフォント
- Noto Sans CJK JP(源ノ角ゴシック)フォント
- Noto Serif CJK JP(源ノ明朝)フォント
- Takaoフォント
- VL Gothicフォント
- さざなみゴシック
- さざなみ明朝

### 2.1.2. プログラミング・開発者向けフォント

[Cica(シカ)]:https://github.com/miiton/Cica

- [Cica(シカ)]
- UDEV Gothic / 白源(HackGen)
- M+ FONTS


### 2.1.3. 等幅フォント

[MoralerSpace]:https://github.com/yuru7/moralerspace
[Maple]:https://github.com/subframe7536/maple-font

- MSゴシック
- MeiryoKe_Console
- BIZ UDゴシック
- UDデジタル教科書体
- Cascadia Code/Cascadia Mono
- Consolas
- Courier New
- IPAゴシック
- Source Han Code JP
- Cascadia Next JP
- 源真ゴシック等幅
- 源柔ゴシック等幅
- NasuM
- Mgen+ 1mn
- Rouned Mgen+ 1mn/2mn
- VLゴシック
- Migu 1M
- Myrica M
- MyricaM M
- 源暎モノコード
- Momiage Mono
- Cica
- HackGen(白源)
- PlemolJP
- UDEV Gothic
- SOROEMONO
- Firge
- [MoralerSpace]
- Juisee
- Pending Mono
- Bizin Gothic
- Utatane
- Explex
- NOTONOTO
- Mint Mono
- Guguru Sans Code
- [Maple]

## 2.2. フォントの追加

### 2.2.1. ディストリビューションが提供するフォントを追加する

aptコマンドを使用する。

### 2.2.2. 手動でフォントをユーザディレクトリに追加する

- フォントフォルダを~/.local/share/fonts/にコピーします。

~~~shell
cp xxx.ttf ~/.local/share/fonts/
~~~


- フォントキャッシュを更新します。

~~~shell
fc-cache -fv

~~~
### 2.2.3. 手動でフォントをシステムディレクトリに追加する

フォントフォルダを/usr/share/fonts/にコピーします。

