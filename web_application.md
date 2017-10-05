% Webプログラミング
% 2017年3月24日
% 五十嵐 浩人

# HTML、CSS、JavaScript
Webプログラミングでよく言われるキーワードに関心の分離(separation of concerns)というのがあります。
関心とは次の3つのものです。

* HTML
    コンテンツ
* CSS
    ドキュメントの見え方を指定するCSSスタイル
* JavaScript
    ユーザ操作とドキュメントでの動的変更を処理するJavaScript

この3つが混在しないように設計することで段階的強化(propgessive enhancement)が容易になります。

具体的には次のことを意識して設計することになります。

* CSSを無効にしてもページが使用できるか、コンテンツが読めるか、テストする。
* JavaScriptを無効にしてもページの目的が達成されるか、リンクが動作するか(href="#"が存在しないか)、フォームが適切に送信されるか、テストする。
* イベントハンドラ(onclickなど)やstyle属性はコンテンツの層にあるべきではないのでインラインで使わない。
* ヘッダやリストなど意味的に正しいHTML要素を使う。

# HTML

## HTML5ボイラープレートをデフォルトスタータテンプレートとして組み込む
HTML5ボイラープレートのホームページには「webのもっとも有名なフロントエンドテンプレート」と書かれています。

[HTML5 BOILERPLATE](https://html5boilerplate.com/)
ここからHTML5 Boilerplateをダウンロードして使用します。

## フォーム

### フォームで使用される要素
フォームで使用される要素のうちデータを入力する要素には次のようなものがあります。

* input要素
* textarea要素
* checkbox要素
* radio要素
* select要素
* button要素

ユーザに対して情報を提供する要素には次のようなものがあります。

* progress要素
* meter要素
* output要素

### input要素のtype属性
次はtype属性にセットできる値です。

|値             |用途                                 |
|---------------|-------------------------------------|
|hidden         |不可視データ                         |
|text           |改行を含まないテキスト               |
|search         |検索用キーワード                     |
|tel            |電話番号                             |
|url            |http://から始まるURL                 |
|email          |メールアドレス                       |
|password       |パスワード                           |
|datetime       |年月日と時分秒                       |
|date           |年月日                               |
|month          |年月                                 |
|week           |年内の第何週か                       |
|time           |時分秒                               |
|datetime-local |年月日と時分秒                       |
|number         |数値                                 |
|range          |スライダー式の数値入力               |
|color          |色の選択                             |
|checkbox       |チェックボックス                     |
|radio          |ラジオボタン                         |
|file           |ファイルの選択                       |
|submit         |フォーム内容の送信(送信ボタン)       |
|image          |画像を使ったボタン                   |
|reset          |フォーム内容の全消去(リセットボタン) |
|button         |汎用ボタン                           |

### 新しい属性

### datalist要素

### ウィジェット

### ユーザへの情報表示

### クライアント側での値の検証

### Constraint Validation API

### フォームとCSS
HTML5ではUI element states pseudo-classと呼ばれるCSSの擬似クラスが追加されています。


|擬似クラス     |適用される条件                                           |
|---------------|---------------------------------------------------------|
|:required      |required属性がセットされている                           |
|:optional      |required属性がセットされていない                         |
|:valid         |検証結果が正当な値                                       |
|:invalid       |検証結果が不当な値                                       |
|:disable       |disable属性がセットされている                            |
|:enable        |enable属性がセットされている                             |
|:read-only     |readonly属性にtrueがセットされている                     |
|:read-write    |readonly属性にtrueがセットされていない                   |
|:indeterminate |radioタイプとcheckboxタイプでチェックも解除もしていない  |
|:checked       |radioタイプとcheckboxタイプでチェックした状態            |
|なし           |radioタイプとcheckboxタイプでチェックが解除された状態    |
|:in-range      |numberタイプとrangeタイプで指定可能な範囲であれば        |
|:out-of-range  |numberタイプとrangeタイプで指定可能な範囲でなければ      |

使用例は次になります。

~~~
input:required { border-color: black; }
input:optional { border-color: gray; }
input:valid { color: green; }
input:invalid { color: red; }
~~~

radioタイプとcheckboxタイプでチェックが解除された状態に対応する擬似クラスはないため次のように否定のセレクタを使います。

~~~
input[type='checkbox']:not(:checked) { ... }
~~~

## HTML5の新しい要素

## WAI-ARIA

## 意味に基づくマークアップ

## マイクロフォーマット

## RDFa

## マイクロデータ

## データ属性

## Webコンポーネント

# CSS

## CSSとは
CSS(Cascading Style Sheets)は、Webページの背景、フォント、色などの「見た目」を変えるために使用されます。
CSS1からCSS3までの簡単な歴史を示します。

* CSS1

    1996年、W3C(WWWコンソーシアム)勧告として公表されました。1999年に改訂され、2001年時点ですべてのプラウザでサポートされるようになりました。

* CSS2

    1998年に公表されました。CSS2の策定はその後CSS2.1に引き継がれ、現在このCSS2.1がWeb標準とみなされています。

* CSS3

    2000年にCSS3の仕様の策定が開始されました。

## スタイルシートのインポート

## 埋め込みによるスタイルの設定

## CSSルール

## スタイルのタイプ

## CSSセレクタ

## CSSのカスケード処理

## &lt;div>と&lt;span>の違い

## 計測単位

## CSSのカラー

## テキスト

### テキストのフォント
フォントのプロパティには、familyとstyle、size、weightの4つがあります。

#### font-family
font-familyプロパティには使用するフォントを設定します。

#### Webフォントによるfont-familyの設定

CSS3から、Webからフォントをロードして表示できるようになりました。これをWebフォントと呼びます。@font-faceプロパティを使ってfont-familyに設定するWebフォントの名称を宣言します。

~~~css
@font-face {
  font-family:FontName;
  src:url('FontName.otf');
}
~~~

##### GoogleのWebフォント
Webフォントを使用する方法の1つは、Googleのサーバーからロードする方法です。

[GoogleのWebフォントサイト](http://www.google.com/fonts)

フォントの使い方は、HTMLの&lt;link>タグを使って、使用するフォントをロードします。

~~~
<link href="http://fonts.googleapis.com/css?family=Lobster' />
~~~

CSSでロードしたフォントを次のように適用します。

~~~css
h1 {
  font-family: 'Lobster', arial, serif;
}
~~~

#### font-style
font-styleプロパティには使用するフォントのスタイルを設定します。設定できるスタイルは以下になります。

|スタイル |説明         |書式                     |
|---------|-------------|-------------------------|
|normal   |標準体       |{ font-style:normal; }   |
|italic   |イタリック体 |{ font-style:italic; }   |
|oblique  |斜体         |{ font-style:oblique; }  |

~~~css
.normal {
  font-style  : normal;
}
.italic {
  font-style  : italic;
}
.oblique {
  font-style  : oblique;
}
~~~

#### font-size
font-sizeプロパティの設定方法には固定と相対の2つがあります。

固定で設定する例は

~~~css
p {
  font-size : 14pt;
}
~~~

相対で設定する例は

~~~css
h1 {
  font-size : 240%;
}
h2 {
  font-size : 200%;
}
h3 {
  font-size : 160%;
}
h4 {
  font-size : 120%;
}
~~~

#### font-weight
font-weightプロパティは、フォントの重さを設定するときに使います。フォントの重さとはフォントの太さのことです。このプロパティには100から900までの100刻みの値などが設定できますが、通常使用されるのはnormalとboldです。

~~~css
.bold {
  font-weight : bold;
}
~~~

### テキストのスタイル

#### 装飾

#### 間隔

#### 整列

#### 大文字、小文字変換

#### インデント

#### カラー
CSSのカラーを参照して下さい。

### テキストエフェクト
CSS3からはテキストに影を表示したりやテキストを重ねたり、単語を折り返したりなど、さまざまなエフェクト可能になりました。

#### text-shadowプロパティ
テキストの影を表示します。
引数は以下の順に設定します。この例だと水平方向と垂直方向に3ピクセルだけ影を離し、4ピクセルのぼかし量で、ダークグレーの影を表示します。

1. 水平方向へのオフセット
1. 垂直方向へのオフセット
1. ぼかし量
1. 使用するカラー

~~~css
text-shadow : 3px 3px 4px #444;
~~~

#### text-overflowプロパティ
CSSのoverflowプロパティにhiddenを設定して使用するときには、text-overflowプロパティを使って、領域からはみ出て切り詰められたテキストがあることを示す省略記号(...)を、切り取りの直前に置くことができます(ellipsisは省略記号という意味です)。

~~~css
text-overflow : ellipsis;
~~~

これを動作させるには、次の3つの要件が必要になります。

1. 要素のoverflowプロパティにはoverflow:hiddenなど、visible以外の値を設定します。
1. 要素のwhite-spaceプロパティにはテキストに制約を与えるnowrapを設定します。
1. 要素の幅は切り詰めるテキストの幅よりも小さくします。

#### word-wrapプロパティ
テキストを切り詰める方法には、word-wrapプロパティにbreak-word値を指定して長い行を折り返すという方法もあります。

~~~css
word-swrap : break-word;
~~~

## ボックスモデル
HTML要素はすべて長方形のボックスの中に含まれると想定されます。HTML要素のまわりは「パディング」(詰め物)、「ボーダー」(境界領域)、「マージン」(余白領域)の3つのボックスが存在します。

![ボックス](image/css_box.png)

### ボックスの4つの線の指定
border-colorプロパティ、border-widthプロパティなどは上、下、右、左の4つの線を別々に設定できます。 
設定する値の数によりどの線の設定かを決めることができます。

### border-colorプロパティ
デフォルト値はHTML要素のcolorプロパティの値になります。

|値の数 |設定される線                                                 |
|-------|-------------------------------------------------------------|
|1      |上、下、右、左の全てに同じ値が設定される                     |
|2      |1番目は上と下の線。2番目は左と右の線。                       |
|3      |1番目は上の線。2番目は左と右の線。3番目は下の線。            |
|4      |1番目は上の線。2番目は右の線。3番目は左の線。4番目は下の線。 |

### border-widthプロパティ
1つから4つまでの値を指定することが出来ます。数値を使って指定することもできますし、「thin」(細い)「medium」(中間)「thick」(太い)を指定することもできます。デフォルト値は「medium」です。

## positionプロパティ
Webページ内の要素はドキュメントに記述された順番で配置されますが、要素のpositionプロパティをデフォルトのstatic(静的)からabsolute(絶対)やrelative(相対)またはfixed(固定)に変更することで、その位置を変えることができます。

positionプロパティに指定できる値の一覧

|値                 |説明     |
|-------------------|---------|
|static(デフォルト) |静的配置 |
|absolute           |絶対配置 |
|relative           |相対配置 |
|fixed              |固定配置 |

### 絶対配置
絶対配置に設定した要素はドキュメントから削除され、空いたスペースにはそのほかの要素が流し込まれます。絶対配置の要素はその後、topやright、bottom、leftプロパティを使ってドキュメントの好きな位置に持ってくることができます。この要素は他の要素の手前(または奥)に来ます。

たとえばobjectというIDのオブジェクトを、ドキュメントの上端から下に100ピクセル、左端から200ピクセルの絶対位置に移動するには、オブジェクトに次のルールを適用します。

~~~css
  /* ブラウザの表示領域の左上隅を基点に、下に100px、右に200px進んだ位置に配置 */
  #object {
    position  : absolute;
    top       : 100px;
    left      : 200px;
  }
~~~

### 相対配置
オブジェクトの本来の位置を基準に位置を指定する配置方法です。

たとえばobjectというIDのオブジェクトを、本来の位置から下に10ピクセル、左端から10ピクセル動かすには、オブジェクトに次のルールを適用します。

~~~css
  /* ブラウザの表示領域の左上隅を基点に、下に100px、右に200px進んだ位置に配置 */
  #object {
    position  : relative;
    top       : 10px;
    left      : 10px;
  }
~~~

### 固定配置
このプロパティを適用されたオブジェクトは絶対位置に移動します。ドキュメントをスクロールしても位置は変わりません。

~~~css
  /* ブラウザの表示領域の左上隅を基点に、下に100px、右に200px進んだ位置に配置 */
  #object {
    position  : fixed;
    top       : 0px;
    left      : 0px;
  }
~~~

## マルチカラムレイアウト

## Flexbox
Flexbox(Flexible Box)はUI上にボタンあるいはメニューなどのフォーム要素やインタラクティブな領域が多数含まれる場合に使われます。

### Flexboxコンテナの設定

Flexboxを利用するには、まずFlexコンテナ(flex container)を作成します。この要素の中に、すべての項目(flex items)が子要素として配置されます。以下のようにdisplay属性を指定するだけで、Flexコンテナは宣言できます。

~~~css
E {
  display : flex;
}
~~~

デフォルトでは子要素は同じ幅で左右に並びます。

### Flexboxアイテムの設定

|プロパティ   |説明                               |
|-------------|-----------------------------------|
|flex-grow    |空白ができたときの子要素間の比率   |
|flex-shrink  |空白が足りないときの子要素間の比率 |
|flex-basis   |widthプロパティと同等              |

## 擬似クラス

## 擬似要素

## ルールの省略要素

## CSS3の属性セレクタ

## box-sizingプロパティ

## CSS3の背景

### テキストエフェクト

## CSS3の境界

## ボックスシャドウ

## 要素のオーバーフロー

## カラーと不透明度

## 変換

## メディアクエリ
メディアクエリを使うとコンテンツを表示しているそれぞれのデバイスの能力に応じてスタイルを設定できるようにしてくれます。

メディアクエリではロジックに基づいてスタイルを指定できます。例えば、あるロジックがtrueと評価された場合に適用され、falseの場合には無視されるような規則を記述できます。このロジックに与えられるパラメーターはメディアフィーチャーと呼ばれ、中でも最もよく使われるのはデバイスやビューポート(表示領域)の大きさに関するものです。メディアクエリの詳細に踏み込む前に、利用例を紹介しましょう。

メディアクエリはCSS 2.1やHTML 4.01でのメディアタイプの構文に対する拡張です。メディアタイプとは、以下のようにメディアの種類ごとに異なるスタイル(外部のスタイルシート)を呼び出すための仕組みです。

~~~html
<link rel="stylesheet" href="foo.css" media="screen">
~~~

このコードでは(紙などではなく)スクリーン上に表示場合にのみfoo.cssというスタイルシートが読み込まれます。これを拡張するには、andというキーワードに続けてクエリ本体を括弧で囲んで記述します。

~~~html
<link rel="stylesheet" href="foo.css" media="screen and (クエリ)">
~~~

この新しいコードでは2つの条件が措定されています。メディアタイプがスクリーンかどうか、そしてクエリとして記述されたロジックがtrueを返すかどうかです。これらの条件がともに満たされた場合にのみ、foo.cssが適用されます。

@importという@規則を使えば、スタイルシートの中から別のスタイルシートを呼び出すこともできます。つきのコードは先ほどのものと同じロジックですが、styleタグや外部のスタイルシートの中で利用できます。

~~~
@import url('foo.css') screen and (クエリ);
~~~

上記のように@importを使うと、パフォーマンス上の問題が生じることがあります。利用には慎重な検討が必要です。詳しくは、Steve Soundersによるブログ記事[「Don't Use @import」](http://www.stevesouders.com/blog/2009/04/09/dont-use-import/)を参照して下さい。

### デバイスへの適用
小さいスクリーンでもよりよい表示を行えるよう、モバイルブラウザにはWebサイトの表示倍率を変更して表示する機能が用意されています。デフォルトではページ全体(または可能なかぎり多くの部分)をカバーするために表示が縮小されます。これはレイアウトビューポートと呼ばれます。レイアウトビューポートには、デスクトップでの表示に最適化されたサイトがとても小さく表示されてしまうという問題点があります。

この問題に対処するため、AppleはiPhone向けSafariの開発時にある新しいタグを提案しました。これはビューポートを表すmetaタグと呼ばれ、ドキュメントのheadセクションに記述します。このタグを使い、ブラウザ上のビューポートの大きさや表示倍率を指定します。例を1つ示します。

~~~
<meta name="viewport" content="width=deviece-width">
~~~

content属性にはさまざまな値を指定できますが、上記の例では「このドキュメントの横幅をデバイスの横幅に一致させてください」ということを意味しています。

# JavaScript

## データ型と変数

## 演算子と文

### JavaScriptの文の形式

### 代入文

### 条件文とプログラムの流れ

#### if ... else

#### switch文
switch文は、条件式のとり得る値が多いときに便利です。式の計算結果により、ひとつまたは複数の選択肢を処理します。次のような構文を持ちます。

~~~javascript
switch ( 式 ) {
  case ラベル1:
    コードブロック;
    break;
  case ラベル2:
    コードブロック;
    break;
  ... 
  case ラベルn:
    コードブロック;
    break;
  default:
    コードブロック;
}
~~~

### 条件式で使う演算子

### 論理演算子

### 繰り返し

#### whileループ

#### do ... whileループ

#### forループ
forループは2種類あります。forループとfor-inループです。配列にはforループを使い、オブジェクトにはfor-inループを使います。

forループは次の形式です。
~~~
for ( 初期値の設定; 条件の判定; 更新 ) {
  ...
}
~~~

for-inループは次の形式です。
~~~
for ( 変数名 in オブジェクト ) {
  ...
}
~~~


## JavaScriptオブジェクト

### 単純データ型とオブジェクト

### Boolean、Number、String

### 正規表現とRegExp

### Date
Dateオブジェクトは日時を扱うためのもので、このインスタンスを生成すると年、月、日、秒など、日時関連の情報を利用できます。引数を渡さずにDateのインスタンスを生成すると、利用しているコンピュータの日付と時刻に基づいた日時が生成されます。

Dateオブジェクトの静的(スタティック)メソッド:

|メソッド           |説明                                             |
|-------------------|-------------------------------------------------|
|parse(datestring)  |1970年1月1日午前0時からの時間をミリ秒単位で返す  |
|UTC(datestring)    |1970年1月1日午前0時からの時間をミリ秒単位で返す  |

Dateオブジェクトのインスタンスメソッド:

|メソッド           |説明                                 |
|-------------------|-------------------------------------|
|getFullYear        |「2010」など西暦の年(4桁)を返す      |
|getMonth           |月を0(1月)から11(12月)の数字で返す   |
|getDate            |日付を1から31の数字で返す            |
|getDay             |曜日を0(日曜)から6(土曜)の数字で返す |
|getHours           |時を返す                             |
|getMinutes         |分を返す                             |
|getSeconds         |秒を返す                             |
|getMilliseconds    |ミリ秒を返す                         |
|getTimezoneOffset  |ローカル時刻とUTCの差分を分を単位として返します  |

これらのgetメソッドには対応するsetメソッドがあります。setメソッドはDate内の要素値を設定します。ただし、曜日を返すgetDayに対応するsetメソッドはありません。

日付の内部的な表現を出力するためのメソッドもあります。

|メソッド           |説明                                         |
|-------------------|---------------------------------------------|
|toString           |現地時刻を表す文字列(英語)に変換             |
|toGMTString        |グリニッジ標準時を用いて文字列をフォーマット |
|toLocaleDateString |現在のロケールをフォーマット用いて日付を変換 |
|toLocaleTimeString |現在のロケールをフォーマット用いて時刻を変換 |
|toLocaleString     |現在のロケールを用いて文字列を変換           |
|toUTCString        |UTCで文字列をフォーマット                    |

~~~
var now = new Date();

now.toLocaleString();
// 2017/5/21 21:42:55が返ります
~~~

#### toISOString()
toISOString()メソッドは、簡潔な拡張表記のISO形式([ISO 8601](https://ja.wikipedia.org/wiki/ISO_8601))の文字列を返します。これは、常に24文字または27文字の長さになります(それぞれ、YYYY-MM-DDTHH:mm:ss.sssZまたは±YYYYYY-MM-DDTHH:mm:ss.sssZ)。タイムゾーンは常に0UTCオフセットになり、接尾辞"Z"で表記されます。

#### ISO8601
基本形式:
日本は協定世界時(UTC)より09時間00分早い地域。

~~~
YYYYMMDDThhmmss+0900
~~~

拡張形式
~~~
YYYY-MM-DDThh:mm:ss+0900
~~~
#### ゼロパディング
「5」を「05」のように桁を合わせるためにゼロを使うことを「ゼロ埋め」とか「ゼロパディング」と言います。

~~~javascript
var a = 0;
alert( ('0' + a ).slice(-2) );
~~~

「"0"+a」の部分で元の数値の左に「0」を付けます。「5」ならば「05」となります。
「slice(-2)」で右から2文字を切り出します。「05」となります。
「35」ならば「035」の右から2文字を切り出すので「35」となります。


### Math

### Array

## カスタムオブジェクト
オブジェクトは自作することができます。自作したオブジェクトはカスタムオブジェクトと呼ばれます。

### オブジェクトリテラルによる生成
オブジェクトリテラルを利用すると、新しいオブジェクトの生成を非常に簡潔に記述することが出来ます。オブジェクトリテラルは2つの中括弧で囲まれ、その中に名前と値のペアが列挙されたものです。オブジェクトリテラルは、式が記述可能であれば、どこにでも記述することができます。

また、リテラルによるオブジェクト生成はオブジェクト初期化子を使ったオブジェクトの生成と呼ばれることもあります。

~~~javascript
var empty_object = {};

var stooge = {
  "first-name": "Jerome",
  "last-name": "howard"
};
~~~

プロパティ名には、空文字を含む任意の文字列が記述できます。プロパティ名の前後に付けるクォート("")は、文字列が予約語ではなく、JavaScriptの名前に則っていれば、省略することができます。従って、"first-name"の場合はクォートは必要ですが、first_nameの場合は省略が可能です。プロパティの区切りにはカンマを利用します。

プロパティの値には任意の式を記述できます。他のオブジェクトリテラルを含むことも可能です。つまり、オブジェクトはリストすることができるということです。

~~~javascript
var flight = {
  airline: "Oceanic",
  number: 815,
  departure: {
    IATA: "SYD",
    time: "2004-09-22 14:55",
    city: "Sydney"
  },
  arrival: {
    IATA: "LAX",
    time: "2004-09-23 10:42",
    city: "Los Angeles"
  }
};
~~~

### プロトタイプパターンによる生成
プロトタイプパターンとは既存オブジェクトのコピーであるテンプレートをもとにオブジェクトを生成することです。

#### ファクトリ関数でのObject.createの使用

~~~javascript
var proto {
  sentence  : 4,
  probation : 2
};

var makePrisoner = function ( name, id ) {
  var prisoner = Object.create( proto );
  prisoner.name = name;
  prisoner.id = id;

  return prisoner;
};

var firstPrisoner = makePrisoner( 'Joe', '12A' );

var secondPrisoner = makePrisoner( 'Sam', '2BC' );
~~~

#### 古いブラウザのためのObject.create
Object.createはIE 9以降、FIrefox 4以降、Safari 5以降、Chrome 5以降で動作します。古いブラウザで互換性を保つためには、Object.createが存在しないときにはObject.createを定義し、すでに実装済みのブラウザではObject.createをそのままにする必要があります。

~~~
// Object.create()をサポートするための特定のブラウザに依存しない方法

var objectCreate = function ( arg ) {
  if ( ! arg ) {
    return {};
  }
  function obj() {};
  obj.prototype = arg;
  return new obj;
};

Object.create = Object.create || objectCreate;
~~~

#### オブジェクトコンストラクタにはファクトリパターンを使う
哺乳類(Mammal)コンストラクタを使って猫(Cat)プロトタイプを作成し、猫(Cat)プロトタイプを使って猫(Cat)コンストラクタを生成する例を示します。

~~~
var createObject, extendObject,
  sayHello, sayText, makeMammal,
  catPrototype, makeCat, garfieldCat;

// 継承を設定するユーティリティ関数
// Object.create()を継承するための特定のブラウザに依存しないメソッド
// 新しいjsエンジン(v1.8.5+)はネイティブにサポートする
var objectCreate = function ( arg ) {
  if ( ! arg ) {
    return {};
  }
  function obj() {};
  obj.prototype = arg;
  return new obj;
};

Object.create = Object.create || objectCreate;

// オブジェクトを拡張するためのユーティリティ関数
extendObject = function ( orig_obj, ext_obj ) {
  var key_name;

  for ( key_name in ext_obj ) {
    if ( ext_obj.hasOwnProperty( key_name ) ) {
      orig_obj[ key_name ] = ext_obj[ key_name ];
    }
  }
};

// オブジェクトメソッド
sayHello = function () {
  console.log( this.hello_text + ' says ' + this.name );
};

sayText = function ( text ) {
  console.warn( this.name + ' says ' + text );
};

// makeMammalコンストラクタ
makeMammal = function( arg_map ) {
  var mammal = {
    is_warn_blooded : true,
    has_fur         : true,
    leg_count       : 4,
    has_live_birth  : true,
    hello_text      : 'grunt',
    name            : 'anonymous',
    say_hello       : sayHello,
    say_text        : sayText
  };
  extendObject( mammal, arg_map );

  return mammal;

};

// makeMammalコンストラクタを使ってcatプロトタイプを作成する
catPrototype = makeMammal({
  has_whiskers  : true,
  hello_text    : 'meow'
});

// catコンストラクタ
makeCat = function ( arg_map ) {
  var cat = Object.create( catPrototype );
  extendObject( cat, arg_map );

  return cat;

};

// catインスタンス
garfieldCat = makeCat({
  name        : 'Garfield',
  weight_lbs  : 8.6
});

// catインスタンス呼び出し
garfieldCat.say_hello();
garfieldCat.say_text( 'Purr...' );

~~~

### プロパティの値の取得
文字列式を[]で囲んで指定することで、オブジェクトからプロパティの値を取り出すことができます。もし文字列式が文字列リテラルで、予約語ではないJavaScriptの名前のルールに則っているなら、[]の代わりに、.を利用することもできます。.を使うほうがお薦めです。[]を使うよりコンパクトで、読みやすいからです。

~~~javascript
flight.departure.IATA // "SYD"
~~~

存在しないメンバを取得しようとした場合には、undefinedが返されます。

~~~javascript
flight.status // undefined
~~~

undefinedに対して、さらにそのプロパティを取得しようとすると、TypeError例外が投げられてしまいます。&&演算子を利用することでそうした事態を避けることができます。

~~~javascript
flight.equipment                            // undefined
flight.equipment.model                      // "TypeError"が投げられる
flight.equipment && flight.equipment.model  // undefined
~~~

### プロパティの列挙

#### for in文を利用する
for in文を利用すると、オブジェクト内に存在するすべての名前を順に取り出すことができます。ただしそこには、関数やプロトタイプチェーン上のプロパティなど、おそらく取得する必要がないものが含まれてしまっているので、それら不要な値を取り除く必要があります。そのための方法として一般的なのは、HasOwnPropertyメソッドを使う方法と、typeofを用いて関数を取り除く方法です。

~~~javascript
var name;

for ( name in another_stooge ) {
  if ( typeof another_stooge[name] !== 'function' ) {
  document.writeln( name + ': ' + another_stooge[name] );
  }
}
~~~

#### プロトタイプのプロパティを列挙する
上記の方法だとObject.create()で生成されたオブジェクトのプロパティは取得できません。いったん取得したいオブジェクトのプロトタイプを取得してから、取得したプロトタイプのブロパティを取得します。取得したプロパティはリストで返されます。

~~~javascript
var proto;

proto = Object.getPrototypeOf( obj );

property_list = Object.getOwnPropertyNames( proto );
~~~

## 関数
関数はJavaScriptではオブジェクトです。

関数は変数や所定の属性に格納でき、関数呼び出しの引数として渡すこともできます。

関数を作成する3つの方法があります。

* 宣言型の関数(静的関数)
* 無名関数
* リテラル

### 宣言型の関数(静的関数)
functionというキーワードから始まり、関数名が続き、括弧に囲まれた引数(なくてもよい)、そして関数本体がきます。

~~~javascript
function 関数名 ( 引数1, 引数2, ..., 引数n ) {
  文の列
}
~~~

宣言型の関数(静的関数)は、ページがロードされる際に内容を分析して準備する「構文解釈」が行われます。そして解析された結果が、関数が呼び出されるたびに使われます。

変数に関数を格納する場合は以下のようになります。

~~~javascript
var foo = function foo () {};
~~~

ローカル変数に無名関数を格納する場合は以下のようになります。

~~~javascript
var foo = function () {};
~~~

関数は以下のように呼び出します。

~~~javascript
foo();
~~~

### 無名関数

### 関数リテラル

#### 再帰関数

#### クロージャ

#### コールバック関数
ある関数の実行が終了したあとで呼び出されるように設定された関数を、コールバック関数(callback function)と呼びます。この名前は、設定される関数が(実行時の適切なタイミングで)他のコードから「逆に呼び出される」からです。

手続き型コードの例とイベント駆動型コードの例を示します。

~~~javascript
// 手続き型コード
var user = user.create();

if ( user ) {
  // ユーザオブジェクトを使った処理
}

// イベント駆動型コード
user.create( function ( user ) {
  // ユーザオブジェクトを使った処理
}
~~~

### 関数の種類

### 関数のスコープ

### 関数の命名規則
関数に名前を付けるときは、動詞をその名称に使うようにします。次に例を示します。

* partseInt   // 入力の構文を解析する
* printData   // 日付を印刷
* processName // 名前を処理
* addNubmers  // 数値を足す


関数名は動詞で初め、その後にその動作の対象となる名詞をひとつあるいは複数書きます。

### 宣言型の戻り値と引数
関数は引数を渡したり値を戻されたりすることで、呼び出し側とやりとりを行います。

基本データ型の変数、つまり文字列、真偽値、数値を持つ変数は、その値が関数に渡されます。この結果、関数内で実引数(関数に渡された引数の値をもらう変数)の値を変更しても、呼び出しプログラム内ではその変更は影響を及ぼさないことになります。

一方、関数に渡されたオブジェクトは参照(リファレンス)によって渡されます。この結果、関数内でのオブジェクトに対する変更は、呼び出しプログラムに影響を与えます。

### 即時関数または、自己実行型無名関数
関数を名前を付けたり変数に保存したりせずに定義し、即座に実行する場合は即時関数(immediate function)を使います。
以下のようになります。

~~~javascript
(function () {})();
~~~

即時関数はグローバル名前空間に変数を追加しません。プライベート変数やプライベートメソッドを定義するときに使います。

#### 自己実行型無名関数を使ったモジュールパターン
コードを複数ファイルに分割しながらも、即時関数を活用して変数のスコープを制御します。

~~~javascript
var prison = (function () {
  var
    prisoner_name = 'Mike Mikowski',
    jail_term     = '20 year term';

  return {
    prisoner  : prisoner_name + ' - ' + jail_term,
    sentence  : jail_term
  };
})();

console.log( prison.prisoner ); // Mike Mikowski - 20 year term
console.log( prison.sentence ); // 20 year term
~~~

## トラブルへの対処、デバッグ、異種ブラウザ間の問題

# Web API

## イベント

### イベントの監視
イベントを監視するにはaddEventListener()という関数を使います。この関数はtype(イベントの種類。'click'など)、listener(イベントリスナの関数名)、useCaptureの3つの引数を受け取ります。

useCaptureがfalseもしくは何も指定されていない場合はバブリングの際にイベントリスナが呼び出されます。バブリングとはイベントが発生したHTML要素から外側のHTML要素の順にイベントリスナが呼び出される方式のことです。useCaptureがtrueの場合はキャプチャリングの際に呼び出されます。
実際にはバブリングが使われることがほとんどです。

~~~
object.addEventListener( type, listener, useCapture );
~~~

イベントリスナを削除するにはremoveEventListener()を使います。addEventListenerで指定したのと同じ引数を指定する必要があります。

### イベント処理のキャンセル - バブリングの中止
バブリングを中止するにはイベントオブジェクトのstopPropagation()を使います。この関数が呼び出されると、外側の要素で指定されているすべてのイベントリスナは呼び出されなくなります。propagationはイベントの伝播と呼ばれることもあります。
次の例のeはeventです。

~~~
if ( typeof e.stopPropagation === 'function' ) {
  e.stopPropagation();
}
if ( typeof e.cancelBubble !== 'undefined' ) {
  e.cancelBubble = true;
}
~~~

### イベント処理のキャンセル - デフォルトのアクションの中止
ブラウザにはリンクがクリックされると、新しいページを読み込むというデフォルトのアクションが定義されています。このデフォルトのアクションを中止するには2通りの方法があります。

* イベントオブジェクトのpreventDefault()関数を使う
* イベントリスナの返り値でfalseを返す

次の例のeはeventです。

~~~
if ( typeof e.preventDefault === 'function' ) {
  e.preventDefault();
}
if ( typeof e.returnValue !== 'undefined' ) {
  e.returnValue = false;
}
~~~

### イベント移譲

### イベントの種類
ブラウザごとにサポートされているイベントの種類は異なります。[Quirksmode](https://www.quirksmode.org/dom/events/index.html)にイベントの一覧があります。

|イベント |説明 |関連オブジェクト |
|---------|-----|-----------------|
|blur                   |オブジェクトがフォーカスを失ったとき   |ウィンドウ要素とフォーム要素 |
|focus                  |オブジェクトがフォーカスを取得したとき |ウィンドウ要素とフォーム要素 |
|change                 |input要素の入力内容が変更されたとき    |フォーム要素の入力フィールド |
|click,                 |マウスでクリックしたとき               |ほとんどのページ要素         |
|doubleclick(dblclick)  |マウスでダブルクリックしたとき         |ほとんどのページ要素         |
|keydown                |キーを押したとき                       |ウェブページのドキュメント要素と一部のフォーム要素                                                                    |
|keyup                  |キーを離したとき                       |ウェブページのドキュメント要素と一部のフォーム要素                                                                    |
|keypress               |キーを押して離したとき                 |ウェブページのドキュメント要素と一部のフォーム要素                                                                    |
|mousedown              |マウスのボタンを押したとき             |ほとんどのページ要素         |
|mouseup                |マウスのボタンを離したとき             |ほとんどのページ要素         |
|mouseover              |マウスを要素に合わせたとき             |ほとんどのページ要素         |
|mouseout               |要素からマウスを外したとき             |ほとんどのページ要素         |
|mousemove              |マウスを移動したとき                   |ほとんどのページ要素         |
|submit                 |フォームが提出されたとき               |フォーム                     |

イベントを処理するのはイベントリスナの役目です。イベントリスナは、イベントの名称に「on」という接頭辞を付けて表します。たとえばonload(ロードしたとき)、onblur(フォーカスを失ったとき)、onsubmit(提出したとき)といった具合です。

### イベントモデルの種類
イベントの扱い方(イベントモデル)は、大きく次の3種類に分けられます。このうちオリジナルイベントモデルはすべてのJavaScript対応ブラウザがサポートしていますが、残りふたつはブラウザによってサポートしている場合とサポートされていない場合があります。

* 「オリジナルイベントモデル」あるいは「DOMレベル0」と呼ばれるもの。HTML4の標準で、ある程度規定されたもので、機能はやや限定されますが、JavaScriptをサポートするすべてのブラウザで利用できるものです。初期のDOMの実装に基づくモデルです。
* 「標準イベントモデル」あるいは「DOMレベル2」と呼ばれるもの。こちらは「DOMレベル2」として標準化されたもので、オリジナルイベントモデルよりも強力な機能を提供します。IEを除く最近のほとんどのブラウザサポートされています。
* Internet Exploreのイベントモデル。残念ながら、IEは標準イベントモデルを(部分的にしか)サポートしていません。このため、利用したい機能によっては、ブラウザごとに異なる対応をしなければなりません。

### イベントの発生順序
イベントの発生順序には2つの種類があります。

* イベントキャプチャリング(event capturing)

    外側のHTML要素からイベントが発生したHTML要素へと順にイベントリスナが呼び出されていきます。

* イベントバブリング(event bubbling)

    イベントが発生した要素から外側のHTML要素へと順にイベントリスナが呼び出されていきます。

### イベントオブジェクトのプロパティ
イベントの種類:

|プロパティ |説明                                                     |
|-----------|---------------------------------------------------------|
|type       |イベントの種類                                           |
|bubbles    |イベントがバブリング中かどうかを表す真偽値               |

イベントが発生した環境についてのプロパティ:

|プロパティ |説明                                                     |
|-----------|---------------------------------------------------------|
|button     |マウスボタンが押された際に、どのボタンかを表す           |
|ctrlKey    |Controlキーがイベント発生時に押されたかを示す論理値      |
|altKey     |Altキーがイベント発生時に押されたかを示す論理値          |
|shiftKey   |Shiftキーがイベント発生時に押されたかを示す論理値        |
|metaKey    |Metaキーがイベント発生時に押されたかを示す論理値         |

キーボードイベントに固有のプロパティ:

|プロパティ |説明                                                     |
|-----------|---------------------------------------------------------|
|isChar     |イベントに文字が含まれているかどうかを表す真偽値         |
|charCode   |押された文字に対応するUnicode値(keypressイベントのみ)    |
|keyCode    |文字ではないキーのUnicode値                              |
|which      |(文字化とうかにかかわらず)押されたキーのUnicode値        |

イベントが発生した場所:

|プロパティ |説明                                                     |
|-----------|---------------------------------------------------------|
|PageX      |ページ(ビューポート)内での相対的な座標のX値              |
|PageY      |ページ(ビューポート)内での相対的な座標のY値              |
|screenX    |イベントが発生したコンピュータの画面のX座標              |
|screenY    |イベントが発生したコンピュータの画面のY座標              |
|clientX    |イベントが発生したクライアント領域(ウィンドウ内)のX座標  |
|clientY    |イベントが発生したクライアント領域(ウィンドウ内)のY座標  |

イベントに関連づけられている要素:

|プロパティ     |説明                                             |
|---------------|-------------------------------------------------|
|currentTarget  |バブリング中での現在のDOM要素                    |
|target         |オリジナルのDOM要素                              |
|originalTarget |オリジナルのDOM要素                              |
|relatedTarget  |イベントに関連する別の要素(イベントの種類による) |

### カスタムイベント

### パブリッシュ/サブスクライブパターン

## フォームと検証

## BOM(ブラウザオブジェクトモデル)
WebブラウザにはBOM(Brower Object Model: ブラウザオブジェクトモデル)と呼ばれるオブジェクトの集合が用意されています。

### BOMの構造
BOMのオブジェクトは下図に示すように階層構造になっています。

![BOMの構造](image/bom_construction.png)

### windowオブジェクト
windowオブジェクトはウェブページの内容、その周囲を取り巻く部分、そのページ内のイベントなど、ブラウザ全体の環境を包含したものとなっています。

windowオブジェクトのプロパティとメソッドは次の4種類に分類されます。

* ウィンドウの作成およびウィンドウの制御
* ウィンドウ内部を分割するタイプのドキュメント(フレームやiframe)の作成
* タイマーの生成と制御
* document、navigator、screenなどブラウザウィンドウの内容を操作するためのオブジェクトを指すプロパティ群

### ウィンドウの作成と制御
windowオブジェクトには新しいウィンドウを作成する1つのメソッドと3種類のダイアログを作成するそれぞれ3つのメソッドとがあります。

|メソッド     |説明                                       |
|-------------|-------------------------------------------|
|window.open  |新しいウィンドウを生成します               |
|alert        |メッセージ(警告)を表示します               |
|confirm      |ユーザにOKかキャンセルを確認してもらいます |
|prompt       |ユーザにテキストを入力してもらいます       |

#### window.openメソッド
windowオブジェクトのopenメソッドでウィンドウを生成し、その内容、サイズ、表示位置などを制御します。ユーザがブラウザの設定でポップアップウィンドウの表示を禁止していると下のコードを実行しても表示されることはありません。

* 1番目の引数は作成するウィンドウで表示するドキュメントのURLになります。
* 2番目の引数はウィンドウの名前です。
* 3番目の引数はウィンドウの外観や挙動を設定するためのものです。

~~~
window.open("http://oreilly.co.jp/",
            "test",
            "width=600,height=400,toolbar=no,location=no");
~~~

3番目の引数の代表的なオプション設定を示します。すべての環境で利用できるわけではないので検証が必要になります。

|オプション     |利用目的                                             |デフォルト値         |
|---------------|-----------------------------------------------------|---------------------|
|alwaysLowered  |親ウィンドウの背面に表示される                       |no                   |
|alwaysRaised   |親ウィンドウの前面に表示される                       |no                   |
|dependent      |親ウィンドウが閉じられると連動して閉じられる         |no                   |
|directories    |ブックマークバーまたはリンクバーを表示する           |yes                  |
|height         |コンテンツ表示領域の高さ(ピクセル単位)               |最小値は100ピクセル  |
|width          |コンテンツ表示領域の幅(ピクセル単位)                 |最小値は100ピクセル  |
|outerHeight    |ブラウザウィンドウの高さ(ピクセル単位)               |最小値は100ピクセル  |
|outerWidth     |ブラウザウィンドウの幅(ピクセル単位)                 |最小値は100ピクセル  |
|top            |ブラウザウィンドウの画面上を基準とした表示位置       |画面内に表示される   |
|left           |ブラウザウィンドウの画面左を基準とした表示位置       |画面内に表示される   |
|menubar        |メニューバーが表示される                             |ブラウザによる       |
|toolbar        |ツールバーが表示される                               |ブラウザによる       |
|location       |アドレスバーにURLが表示される                        |ブラウザによる       |
|status         |ブラウザウィンドウの下部にステータスバーが表示される |ブラウザによる       |
|resizable      |リサイズ可能なウィンドウが生成される                 |ブラウザによる       |
|scrollbars     |スクロールバーが表示される                           |ブラウザによる       |
|modal          |モーダルウィンドウとして生成される                   |                     |
|dialog         |ダイアログウィンドウを生成する                       |                     |
|minimizable    |最小化ボタンを追加、dialogがyesの場合のみ有効        |                     |
|titlebar       |タイトルバーの表示または非表示                       |on                   |
|close          |閉じるボタンの表示または非表示                       |on                   |

#### alertメソッド
ユーザにメッセージを表示します。

~~~
alert("本当に終了しますか？");
~~~

#### confirmメソッド
質問のメッセージと「OK」ボタンと「キャンセル」ボタンで構成されます。

~~~
var result = cofirm("ポテトも一緒にいかがですか？");
~~~

#### promptメソッド
説明用のメッセージとテキスト入力用のフィールドと「OK」ボタンと「キャンセル」ボタンで構成されます。下の例の1番目の引数は説明用のメッセージ、2番目の引数はテキスト入力用のフィールドのデフォルト値です。

~~~
var response = prompt("お住まいの都道府県を教えてください", "沖縄");
~~~

#### ウィンドウの操作
ウィンドウのサイズ、フォーカス、位置などを変更するメソッドを列挙します。

* moveTo(0, 0);
* focus();
* blur();
* resizeBy(50, 50);
* resizeTo(100, 100);

windowオブジェクトへの参照はスクリプトを実行中のウィンドウはself、その親ウィンドウはopenerです。
スクリプト上から作成したウィンドウへの参照が必要な場合は、window.open呼び出し時の戻り値を取得します。

### navigatorオブジェクト
navigatorオブジェクトは、そのページのアクセスに利用されているブラウザ(あるいはほかのエージェント)に関する情報を提供します。OSやブラウザ、セキュリティポリシー、言語、クッキーが利用可能かどうかといったものが含まれています。

多くの環境で利用できるプロパティを列挙します。

* appCodeName

    ブラウザのコードネーム

* appName

    ブラウザの名称

* appMivorVersion

    ブラウザのバージョン番号のうちマイナーバージョンの値(たとえばバージョン1.52であれば52)

* appVersion

    ブラウザのバージョン番号のうちメジャーバージョンの値(たとえばバージョン1.52であれば1.00)

* cookieEnabled

    クッキーが利用可能がどうか

* mimeTypes

    サポートされるMIME(Multipurpose Internet Mail Extension)タイプが記憶された配列

* onLine

    ユーザがオンライン状態かどうか

* platform

    ブラウザを実行中のプラットフォーム

* plugins

    ブラウザがサポートしているプラグインの情報が記憶された配列

* userAgent

    ブラウザのユーザーエージェント文字列

* userLanguage

    ブラウザがサポートする言語

### locationオブジェクト
locationオブジェクトのプロパティを示します。

|プロパティ |利用目的                                               |
|-----------|-------------------------------------------------------|
|hash       |URLの#以降の部分                                       |
|host       |URLのホスト(ドメイン)名とポート番号                    |
|hostname   |URLのホスト(ドメイン)名                                |
|href       |完全なURL(代入も可能。代入したURLに移動する)           |
|pathname   |URLのバス名の部分                                      |
|protocol   |URLで利用されているプロトコル(http、httpsなど)         |
|search     |URLの最初に現れるクエスチョンマーク(?)とそれ以降の部分 |
|target     |URLにターゲットが指定されていればその名称              |

### タイマー
タイマーには一度だけ動作するものと一定の間隔をおいて繰り返し実行されるものの2種類が存在します。1回だけ動作するタイマーの設定には`setTimeout`メソッドを利用します。このメソッドの呼び出しには2個の引数が必要になります。ひとつは実行する関数リテラルまたは関数名を指定し、もうひとつにはタイマーが実行するまでの時間をミリ秒単位で指定します。そのほかに設定された引数があれば、タイマー実行時に指定の関数への引数として処理されます。タイマーを設定したときに戻される値がタイマーの識別子となり、これを利用してタイマーをキャンセルすることができます。

~~~
var timer = setTimeout( func, 5000, "param1", parm2, ..., parmn );

// タイマーのキャンセル
clearTimeout( timer );
~~~

一定間隔で繰り返し実行されるタイマーが必要な場合にはメソッド`setInterval`を利用します。2個の引数が必要で、関数ルメイと実行間隔を指定します。タイマーの識別子が戻り値になります。

~~~
var timeout = setInterval( "functionName", 5000 );
~~~

### historyオブジェクト
historyオブジェクトはブラウザのページ読み込み履歴を保持しており、ブラウザ上の「進む」ボタン、「戻る」ボタンに相当する処理を行うためのプロパティとメソッドが用意されています。

HTML5からヒストリスタックをプログラムから制御する方法が提供されるようになりました。

* window.history.length

    セッションヒストリのエントリ数

* window.history.state

    オブジェクトの現在の状態

* window.history.go(n)

    指定された数のステップ数だけヒストリを進めたり、戻したりします。指定した値が0の場合、現在のページを読み直します。

* window.history.back()

    1ステップ分ヒストリを戻します。

* window.history.forward()

    1ステップ分ヒストリを進めます。

* window.history.pushState(data, title [, url])

    セッションヒストリに引数で指定されたデータを付け加えます。

* window.history.replaceState(data, title [, url])

    セッションヒストリの現在のエントリを更新します。

### screenオブジェクト
screenオブジェクトには画面サイズや表示可能数といった情報が記憶されています。ブラウザの種類とバージョンによってサポートされるプロパティには差異がありますが下記に示します。

* availTop(もしくはtop)

    ウィンドウを配置できるもっとも上側の位置

* availLeft(もしくはleft)

    ウィンドウを配置できるもっとも左側の位置

* availWidth(もしくはwidth)

    ピクセル単位での画面の幅

* availHeight(もしくはheight)

    ピクセル単位での画面の高さ

* colorDepth

    画面の色深度

* pixelDepth

    1ピクセルあたりに利用されるビット数

## クッキーとその後継技術

## WebStorage API
Webアプリケーションは、データを保存する方法が必要になることがあります。HTML5のLocalStorageとSessionStorage APIは、使い勝手がよく、簡単にデータを保存する方法を提供します。

技術的には[WebStorage API](https://html.spec.whatwg.org/multipage/webstorage.html)と呼ばれます。ほとんどの人はこれをLocalStorageと呼びます。

LocalStorageには2つの特徴があります。

* LocalStorageに保存できるデータ量には制限があります。この制限はブラウザごとに異なりますが、たいていは5MB以上(IE 8はユーザデータとして10MB可能です)保存できます。
* LocalStorageへの読み書きは、シングルスレッドのファイルI/O操作です。

### API
LocalStorageを扱うには`window.localStorage`オブジェクトのメソッドにアクセスします。

* setItem(key, value);
* getItem(key);
* removeItem(key);
* clear();

setItemに渡される値は文字列でなければなりません。配列やオブジェクトのような複合データを格納するするために複合データをシリアライズします。シリアライズにはJSONを使います。

~~~
var
  serialized_data,
  object_data;

// localStorageからkey_nameの値を取り出し、JavaScriptオブジェクトに変換(パース)する
serialized_data= localStorage.getItem( 'key_name' );
object_data = JSON.parse( serialized_data );

// JavaScriptオブジェクトをシリアライズしてlocalStorageにkey_nameの値としてセットする
localStorage.setItem( 'key_name', JSON.stringify( object_data );
~~~

## DOM(ドキュメントオブジェクトモデル)

### DOMレベル


[DOM Levels](https://developer.mozilla.org/ja/docs/DOM_Levels)

### DOM HTML API
DOM Core APIのほうが最近ではよく使われているようです。

### DOM Core API

#### DOMの木構造
次のDOMの木構造を構成する要素はすべてNodeオブジェクトと呼ばれます。

![DOMの構造](image/dom_construction.png)

#### Nodeオブジェクトのプロパティとメソッド
DOMコンテンツツリーの親子関係のプロパティ:

|プロパティ       |説明                                                           |
|-----------------|---------------------------------------------------------------|
|parentNode       |現在のノードの親ノード                                         |
|childNodes       |子ノードのリスト                                               |
|firstChild       |子ノードリスト中の最初のノード                                 |
|lastChild        |子ノードリスト中の最後のノード                                 |

DOMコンテンツツリーの兄弟関係のプロパティ:

|プロパティ       |説明                                                           |
|-----------------|---------------------------------------------------------------|
|previousSbiling  |ノードリスト中のひとつ前のノード                               |
|nextSibling      |ノードリスト中の次のノード                                     |

これまではノードを取得するメソッドでしたが、要素のみを取得するメソッドがあります。

DOMコンテンツツリーの親子関係のプロパティ:

|プロパティ                 |説明                             |
|---------------------------|---------------------------------|
|element.children           |elementの子要素を取得する        |
|element.firstElementChild  |elementの最初の子要素を取得する  |
|element.lastElementChild   |elementの最後の子要素を取得する   |

DOMコンテンツツリーの兄弟関係のプロパティ:

|プロパティ                     |説明                         |
|-------------------------------|-----------------------------|
|element.previousElementSibling |elementの前の要素を取得する  |
|element.nextElementSibling     |ノードリスト中の次のノード   |


その他、Nodeオブジェクトのプロパティ:

|プロパティ       |説明                                                           |
|-----------------|---------------------------------------------------------------|
|nodeName         |オブジェクトの名称。たとえば、HEAD要素ならHEAD                 |
|nodeValue        |要素でない場合は、オブジェクトの値                             |
|nodeType         |ノードの種類を数値で表現したもの                               |
|attributes       |NaveNodeMapと呼ばれる、要素の属性のキーと値の組からなるリスト  |
|ownerDocument    |このノードを保持するdocumentオブジェクト                       |
|namespaceURI     |ノードの名前空間URI                                            |
|prefix           |ノードの名前空間プレフィックス                                 |
|localName        |ノードのローカル名(名前空間URIが存在する場合)                  |

nodeTypeの詳細は次のとおりです。

|ノード         |ノードタイプの定数 |ノードタイプの値 |インタフェース |
|---------------|-------------------|-----------------|---------------|
|要素ノード     |ELEMENT_NODE       |1                |Element        |
|属性ノード     |ATTRIBUTE_NODE     |2                |Attr           |
|テキストノード |TEXT_NODE          |3                |Text           |
|コメントノード |COMMENT_NODE       |8                |Comment        |
|文書ノード     |DOCUMENT_NODE      |9                |Document       |

#### 木構造の変更
documentは、すべてのページ要素の親であり、オーナーでもあります。そのため、新しい要素のインスタンスを生成するために利用するファクトリメソッドのほとんどは、Coreのdocumentオブジェクトに属します。それに対して、Nodeオブジェクトは、Core APIにおける木構造の整合性を保つ役割を担当し、親子関係や兄弟関係をたどって、特定のノードに到達することを可能にしています。そして、Elementオブジェクトは、入れ子になった要素の中の、限られた範囲にあるものだけを変更するために、コンテキストを制限する方法を提供します。これらの3つのオブジェクトは、いずれもドキュメントツリーの変更には欠かせないものとなっています。

docomentのファクトリメソッド

|メソッド                 |作成されるオブジェクト |説明                           |
|-------------------------|-----------------------|-------------------------------|
|createElement(tagname)   |Element                |tagnameに指定された要素を作成  |
|createDocumentFragment() |DocumentFragment       |軽量のドキュメント             |
|createTextNode(data)     |Text                   |テキストを保持                 |
|createComment(data)      |Comment                |XMLコメント                    |

~~~
var txtNode = document.createTextNode( "新しいテキストノード" );
~~~

Nodeの変更用のメソッド

|メソッド                         |説明                                         |
|---------------------------------|---------------------------------------------|
|insertBefore(newChild,refChild)  |既存のノード(refChild)の前に挿入する         |
|replaceChild(newChild,oldChild)  |既存のノード(refChild)と入れ替える           |
|removeChild(oldChild)            |既存の子ノードを削除する                     |
|appendChild(newChild)            |ドキュメントに子ノードを追加する(最後に追加) |


## Ajax
Asynchronous JavaScript and XML(Ajax)には次の2つの側面があります。

* テクノロジの集合体としてのAjax
* アーキテクチャとしてのAjax

テクノロジの集合体としてAjaxは次の構成になります。

* ブラウザとサーバとの間における非同期チャネル
* JavaScript
* XML

アーキテクチャとしてのAjaxとは次のようなものです。

* 小さなサーバイベント: Webアプリケーションを構成するコンポーネントは、小さなリクエストをサーバに送り、情報の一部を取得し、DOMに変更を加えることでページの表示を微調整します。ページ全体のリフレッシュは発生しません。
* 非同期: サーバ宛のリクエストによってブラウザがロックすることはありません。ユーザは、アプリケーションの他の部分を使い続けることができます。リクエストの処理が実行中である旨をUIの更新によってユーザにフィードバックすることも可能です。
* onAnything: サーバとの対話は、ユーザによるあらゆるアクションを基に開始できます。マウスのクリックやキーの押下など、今日のブラウザはOSとほとんど同等のユーザイベントを補足できます。あらゆるユーザイベントが非同期リクエストのトリガーとなり得ます。

次のイメージ図のうち、(Ajax)と書かれている部分がAjaxの部分です。

![Ajaxのイメージ](image/ajax.png)

### XMLHttpRequst
XMLHttpRequstはJavaScriptオブジェクトです。これは、HTTPリクエストを送信し、レスポンスを受信し、それをXMLとして解析できるエンジンです。

リクエストを送信する処理とHTMLとの結びつけは次のようになります。

1. 例えばtype="submit"のinput要素にリクエストを送信する処理をイベントリスナとして登録しておく
1. ユーザが例えばtype="text"のinput要素にリクエストデータを入力する
1. ユーザが例えばtype="submit"をクリックすることでイベントリスナが呼び出される

Webブラウザがリクエストを送信する処理は次のようになります。

1. XMLHttpRequstインスタンスを生成
1. onreadyStatechangeプロパティに、受信したデータを解析する関数の名前をイベントリスナとしてセットする
1. open()関数でXMLHttpRequstの設定を行う
1. send()関数でリクエストを送信する

Webブラウザがデータを解析する関数は次のようになります。

1. readyStateプロパティをチェックしてXMLHttpRequstの状態(進行状況)を確認する。
1. reqdyStateプロバティの値が4(completed)になったら次の処理を行う
1. XMLHttpRequstインスタンスのresponseTextプロパティからサーバから受信したデータを取得する
1. 受信したデータでDOMを更新する

readyStateプロパティが取りうる値は次になります。

|readyStateプロバティの値 |説明                                       |
|-------------------------|-------------------------------------------|
|0: (uninitialized)       |まだsend()が呼び出されていない             |
|1: (loading)             |send()が呼び出され、リクエストの実行中     |
|2: (loaded)              |send()が完了して、レスボンス全体を受信した |
|3: (interactive)         |レスボンスの解析中                         |
|4: (completed)           |レスボンスの解析が終わって利用可能になった |

### XMLHttpRequstのメソッド
XMLHttpRequstのメソッドを示します。

* open

    openの構文は`open(method, url [, async, username, password])`です。指定したURLへの接続を、指定されたメソッド(GETまたはPOST)でオープンします。オブションの引数asyncにはリクエストが非同期(true, デフォルト)か同期(false)を指定します。またサーバ側処理に必要ならユーザ名(username)とパスワード(password)を指定します。

* setRequestHeader

    setRequestHeaderの構文は`setReuqestHeader(label, value)`です。このメソッドでリクエストヘッダのヘッダ名(label)と値(value)のペアを指定します。

* send

    sendの構文は`send(content)`です。このメソッドがXMLHttpRequestの核心で、必要なデータとともにリクエストを送信します。

* getAllResponseHeaders

    getAllResponseHeadersの構文は`getAllResponseHeaders()`です。すべてのレスポンスヘッダを文字列として返します。その中にはタイムアウトの値、Keep-Alive、content-type、サーバに関する情報、日付が含まれます。

* getResponseHeader

    getResponseHeaderの構文は`getResponseHeader(label)`です。指定したレスポンスヘッダを返します。

* abort
    abortの構文は`abort()`です。進行中のリクエストを中止します。


## デバイス操作API

## 画像とグラフィック

# SPAクライアント

![SPAアーキテクチャ](image/spa_architecture.png)

## シェルの開発

## 機能モジュールの追加

## モデルの構築

## モデルとデータモジュールの完成

# SPAサーバ
Node.jsを使用します。

## Webサーバ

### サーバの役割
SPAにおけるWebサーバの役割。

* 認証と認可
* 検証
* データの保存と同期

### Node.js
Node.jsを選択する理由。

* サーバーがアプリケーションである。その結果、別個のアプリケーションサーバーを用意し、インタフェースを取ることを気にする必要がない。すべてを1か所で1つのプロセスで制御する。
* サーバーアプリケーション言語がJavaScriptなので、サーバアプリケーションをある言語で記述し、SPAを別の言語で記述するという言語認識上の負荷を取り除ける。また、クライアントとサーバでコードを共有でき、これには多くの利点がある。例えば、SPAとサーバの両方で同じデータ検証ライブラリを使える。
* Node.jsはノンブロッキングでイベント駆動である。一言で言えば、平均的なハードウェアの1つのNode.jsインスタンスで、リアルタイムメッセージングで使うような大量の並列オープン接続を扱える。多くの場合、これは現代のSPAに大変望ましい機能である。
* Node.jsは高速で十分に信頼でき、モジュールや開発者の数が急速に増えてきている。

### requestオブジェクト
requestオブジェクトの重要なプロバティを次に示します。

* ondata: サーバがクライアントからデータを受信するとき(例えば、POST変数が設定されているとき)に呼び出されるメソッド。これは、ほとんどのフレームワークでクライアントから引数を取得するメソッドとき大幅に異なる。パラメータの完全なリストを変数で入手できるようにこのメソッドを除外する。
* headers: リクエストのヘッダすべて。
* url: 要求されたページのpathname
* method: リクエストに使う方法。GETまたはPOST。



### 高度なルーティング

### express-sessionによるセッション管理
Node.js用のライブラリ、express-sessionを使います。

[expressjs/session](https://github.com/expressjs/session)

インストール

~~~
npm install express-session --save
~~~

使い方

~~~
var app = express();
app.set('trust proxy', 1);  // trust first proxy
app.use( session({
  secret            : 'keyboard cat',
  resave            : false,
  saveUninitialize  : true,
  cookie            : {secure: true}
}));
~~~

#### options
次にexpress-sessionが受け付けるプロパティを示します。

*は実際に使用しているオプション

* cookie(*)

    session ID cookieを設定します。デフォルト値は`{ path: '/', httpOnly: true, secure: false, maxAge:null }`になります。

* cookie.domain

    Cookieのドメインを指定します。デフォルト値はホストのドメインになります。URLが要求されているサーバのドメインとの比較に使用します。一致する場合は、cookie.pathプロパティを確認します。

* cookie.expires(*)

    永続的なCookieの有効期限を設定するために使用します。有効期限を1時間に設定するときは`new Date( Date.now() + 60 * 60 * 1000 )`とします。

* cookie.httpOnly(*)

    CookieがクライアントのJavaScriptではなく、HTTP(S)のみで送信されるようにして、クロスサイト・スクリプティング攻撃から保護します。デフォルト値はfalseです。

* cookie.maxAge

    Cookieの有効期限をミリ秒で設定します。デフォルト値、もしくはnull値が指定されているとブラウザデフォルトの挙動になります。つまり、ブラウザを閉じたらCookieは削除されます。

* cookie.path

    Cookieのパスを指定します。要求されたパスとの比較に使用します。デフォルト値は'/'になります。このパスがドメインと一致する場合にCookieを送信します。

* cookie.sameSite
* cookie.secure(*)

    ブラウザーが確実にHTTPSのみを介してCookieを送信するようにします。Cookieに署名するかと書かれているサイトもある。デフォルト値はfalseです。

* genid
* name
* proxy
* resave(*)

    trueの場合、セッションストアにアクセスするたびにセッションを作り直します。セッションの作り直しが必要なければfalseを指定する。

* rolling
* saveUninitialized(*)

    trueの場合、未初期化状態のセッションも保存される。特に必要なければfalseを指定する。

* secret(*)

    Cookieの暗号化に利用するキーを指定します。キー変更する場合は`secret: ['(新しいキー)', '(今までのキー)', '(今までのキー)']`とします。先頭のキーは暗号化に用いられ、復号化には配列中のいずれかのキーが利用されます。

* store(*)
* unset

#### セッションの破棄

~~~
req.session.destroy( function ( err ) {
  // cannot access session here
})
~~~

### WebSocketとSocket.io
WebSocketでは、ブラウザとサーバが1つのTCP接続上に永続的で軽量な双方向通信チャネルを維持できます。WebSocketにより、ブラウザやサーバは、HTTPリクエスト-レスポンスサイクルのオーバヘッドや遅延なしにリアルタイムにメッセージを送信できます。

[Socket.IO](https://socket.io/)はNode.jsのモジュールです。WebSocketが使える場合はWebSocketでブラウザとサーバての間のメッセージングを提供し、ソケットが使えない場合には他の手法を使うように機能を低下させる機能を提供します。

Node.jsは優れたメッセージングサーバである。イベントモデルのおかけで、接続ごとにプロセスを作成しない。その代わりに、接続の開閉時に記録を取り、接続中に維持管理を行う。そのため、平均的なハードウェアで何万、何十万もの同時接続に対処できる。Node.jsは、1つ以上の開かれた接続上でメッセージングイベント(リクエストやレスボンスなど)が発生するまでは何も重要な仕事は行わない。

#### インストール

~~~bash
npm install socket.io --save
~~~

実行結果:

~~~
└─┬ socket.io@1.7.4 
  ├─┬ engine.io@1.8.4 
    │ └── ws@1.1.4 
      └─┬ socket.io-client@1.7.4 
          └─┬ engine.io-client@1.8.4 
                └── ws@1.1.2 
~~~

#### Node http serverでの使用例
Sever(app.js):

~~~
var
  app = require( 'http' ).createServer( handler ),
  io = require( 'socket.io' )(app),
  fs = require( 'fs' );

app.listen(80);

function handler ( request, response ) {
  fs.readFile( __dirname + '/index.html',
    function ( err, data ) {
      if ( err ) {
        response.writeHead(500);
        return response.end( 'Error loading index.html' );
      }

      response.writeHead(200);
      response.end( data );
    }
  );
}

io.on( 'connection',
  function( socket ) {
    socket.emit( 'news', { hello: 'world' } );
    socket.on( 'my other event', 
      function ( data ) {
        console.log( data );
      }
    );
  }
);
~~~

Client(index.html):

~~~
<script src="/socket.io/socket.io.js"></script>
<script>
  var
    socket = io( 'http://localhost' );

  socket.on( 'news',
    function ( data ) {
      console.log( data );
      socket.emit( 'my other event, { my: 'data' } );
    }
  );
</script>
~~~

#### Experss3/4での使用例
Sever(app.js):

~~~
var
  app     = require( 'express' )(),
  server  = require( 'http' ).Server( app ),
  io      = require( 'socket.io' )( server );

app.listen(80);

app.get( '/', function ( request, response ) {
  response.sendfile( __dirname + '/index.html' );
});

io.on( 'connection',
  function( socket ) {
    socket.emit( 'news', { hello: 'world' } );
    socket.on( 'my other event', 
      function ( data ) {
        console.log( data );
      }
    );
  }
);
~~~

Client(index.html):

~~~
<script src="/socket.io/socket.io.js"></script>
<script>
  var
    socket = io( 'http://localhost' );

  socket.on( 'news',
    function ( data ) {
      console.log( data );
      socket.emit( 'my other event, { my: 'data' } );
    }
  );
</script>
~~~

### まとめ

## サーバデータベース
MongDBを使用します。

### MongoDBドライバのインストール
MongoDBデータベースドライバをダウンロードしてインストールします。

~~~
npm install mongodb
~~~

アップデータするときは

~~~
npm update mongodb --save
~~~

### JavaScriptからの利用例
Node.jsはこのモジュールを使ってMongoDBデータベースを操作できます。

~~~javascript
var
  mongo = require( 'mongodb' ),
  mongoServer = new mongo.Server(
    'localhost',
    mongo.Connection.DEFAULT_PORT
  ),
  dbHandle = new mongo.Db(
    'pal', mongoServer, { safe : true }
  );
~~~

### MongDBシェルコマンド
MongDBのシェルは端末を開いて`mongo`コマンドで起動します。
データ階層はデータベース -> コレクション -> ドキュメントと理解するといいと思います。

|コマンド                 |説明                                                           |
|-------------------------|-------------------------------------------------------|
|show dbs                 |このMongoDBインスタンスにあるデータベースをすべて一覧表示する  |
|use &lt;database_name>      |現在のデータベースをdatabase_nameに切り替える          |
|db                       |現在のデータベース                                     |
|db.getCollectionNames()  |現在のデータベースで利用できるすべてのコレクションのリストを取得する  |
|db.&lt;collection_name>     |現在のコレクション |
|db.&lt;collection_name>.insert({'name': 'Josh Powell'}) |ドキュメントを挿入する   |
|db.&lt;collection_name>.find()                            |ドキュメントをすべて返す |
|db.&lt;collection_name>.find({'name': 'Josh Powell'})   |nameの値がJosh Powellであるすべてのドキュメントを返す  |
|db.&lt;collection_name>.update({'name': 'Josh Powell'},{'name': 'Mr. Joshua C.Powell'})   |nameの値がJosh Powellであるすべてのドキュメントをすべて更新する  |
|db.&lt;collection_name>.update({'name': 'Mr. Joshua C.Powell'},{$set: {'job':'Author'}})   |nameの値がMr. Joshua C.Powellであるすべてのドキュメントを部分的に更新する  |
|db.&lt;collection_name>.remove({'name': 'Mr. Joshua C.Powell'})   |nameの値がMr. Joshua C.Powellであるドキュメントをすべて削除する  |
|exit   |MongoDBシェルを終了する  |

## SPAを本番環境に備える

# SPAクライアント

![SPAアーキテクチャ](image/spa_architecture.png)

## シェルの開発

### State Pattern
JavaScriptのステートパターンでアプリケーションを制御する
[Take Control of your App with the JavaScript State Pattern](http://robdodson.me/take-control-of-your-app-with-the-javascript-state-patten/)

## 機能モジュールの追加

## モデルの構築

## モデルとデータモジュールの完成

### データバインディングとjQuery
データバインディングは、JavaScriptのオブジェクトが変更されたときに、その変更をDOM要素に反映し、逆にユーザがデータを変更するフォームを操作したときに、それに応じてJavaScriptのオブジェクトを更新するメカニズムです。

### オブザーバ
オブザーバ(Observer)パターンはクライアント側のJavaScriptプログラミングでよく使われます。ブラウザイベント(マウスオーバー、キープレスなど)はこの例です。ブラウザが起こしたイベントと比較するために、そのプログラムで作成したイベントをカスタムイベントと言います。このパターンは、購読者/発行者パターンとも言います。

このパターンの狙いは疎結合を促進することです。あるオブジェクトが別なオブジェクトのメソッドを呼び出すかわりに、あるオブジェクトは別なオブジェクトの特別な機能を購読し、そのオブジェクトから通知を受けます。この購読者は観察者とも言われます。一方、観察されているいるオブジェクトは発行者あるいはサブジェクトと呼ばれます。重要なイベントが発生したとき、発行者はすべての購読者に通知(呼び出し)します。ある形式のイベントオブジェクトでメッセージを渡すこともあります。

# JavaScriptのコーディングルール

## コードレイアウトとコメント

## 変数名

### 命名規則を使ってコメントを減らし改善する

### 命名規則を使う

## 変数の宣言と割り当て

## 関数

## 関数の命名
関数は大抵オブジェクトに対して処理を行う。そのため、関数名の最初の部分は常に動作動詞にしたい。

* 関数名は、必ず動詞の後に名詞がくるようにする。例えば、get_recordやempty_chache_mapなど。
* モジュールスコープの関数は必ず2音節以上にし、スコープを明確にする。例えば、getRecordやemptyCacheMapなど。
* 一貫した動詞の意味を用いる。次は一般的な動詞の一貫した意味を示している。

|指標             |指標の意味                             |ローカルスコープ |モジュールスコープ |
|-----------------|---------------------------------------|-----------------|-------------------|
|fn(汎用)         |汎用的な関数の指標                     |fn_cync          |fnSync             |
|curry            |引数で指定された関数を返す             |curry_make_user  |curryMakeUser      |
|destroy, remove  |データ構造を削除する                   |destory_entry    |destroyEntry       |
|empty            |データ構造から要素を削除する           |empty_chache_map |emptyCacheMap      |
|fetch            |外部ソースから取得したデータを返す     |fetch_user_list  |fetchUserList      |
|get              |オブジェクトなどからデータを返す       |get_user_list    |getUserList        |
|make             |新たに生成したオブジェクトを返す       |make_user        |makeUser           |
|store            |ストレージ用の外部ソースにデータを送る |store_user_list  |storeUserList      |
|set              |引数で指定された値の初期化や更新を行う |set_user_name    |setUserName        |
|update           |setと同様だが、以前に初期化されている  |update_user_name |updateUserName     |
|on               |イベントハンドラ                       |on_mouseover     |onMouseover        |

## 名前空間

## ファイル名とレイアウト

## 構文

### ラベル

### 文

#### continue

#### do

#### for

#### if
if文は、以下に示す形式のいずれかを使うようにする。elseキーワードは新たな行の先頭から始める。

~~~javascript
if ( condition ) {
  // 文
}
else if ( condition ) {
  // 文
}
else {
  // 文
}
~~~

#### return
return文では、戻り値をかっこで囲むべきではない。セミコロンの挿入を避けるためにreturnキーワードと同じ行で始めなければいけない。

#### switch

#### try

#### while

#### with

#### カンマ演算子を避ける

#### 割り当て式を避ける

#### 必ず===と!==の比較を使う

## コードを検証する

## モジュール用のテンプレート

# 参考文献

* [Front-End Developer Handbook 2017](https://frontendmasters.com/books/front-end-handbook/2017/)
* [Single Page Web Applications Forum](https://forums.manning.com/forums/single-page-web-applications)
* [How to Build a Responsive Form With Flexbox](https://webdesign.tutsplus.com/tutorials/building-responsive-forms-with-flexbox--cms-26767)
* [MOZILLA DEVELOPER NETWORK](https://developer.mozilla.org/ja/docs/Web/JavaScript)
* [ブラウザの仕組み: 最新ウェブブラウザの内部構造](https://www.html5rocks.com/ja/tutorials/internals/howbrowserswork/)
* [ステートフルJavaScript](https://www.oreilly.co.jp/books/9784873115542/)

