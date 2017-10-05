% JavaScriptのコーディングルール
% 2017年5月2日
% 五十嵐 浩人

# コードレイアウトとコメント

# 変数名

## 命名規則を使ってコメントを減らし改善する

## 命名規則を使う

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

# 変数の宣言と割り当て

# 関数

# 名前空間

# ファイル名とレイアウト

# 構文

## ラベル

## 文

### continue

### do

### for

### if
if文は、以下に示す形式のいずれかを使うようにする。elseキーワードは新たな行の戦闘から始める。

~~~
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

### return
return文では、戻り値をかっこで囲むべきではない。セミコロンの挿入を避けるためにreturnキーワードと同じ行で始めなければいけない。

### switch

### try

### while

### with

### カンマ演算子を避ける

### 割り当て式を避ける

### 必ず===と!==の比較を使う

# コードを検証する

# モジュール用のテンプレート

