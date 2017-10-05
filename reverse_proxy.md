% リバースプロキシとその環境
% 2017年10月5日
% 五十嵐 浩人

# リバースプロキシについて

## リバースプロキシの役割
リバースプロキシは、不特定多数のクライアントから寄せられる要求に対して、応答を肩代わりすることにより特定のサーバー負担を軽減したり、アクセスを制限することにより特定のサーバのセキュリティを高めたりする目的にに用いられます。

リバースプロキシが使われる理由は以下の通りです。

* セキュリティ
* 暗号化/SSL高速化: SSLによる暗号化でセキュアなWebサイトを作るとき、暗号化をWebサーバ自体が行うのではなく、SSL高速化のためのハードウェアを備えたリバースプロキシで行う。この用途に用いる場合、SSLオフローダとも呼ばれる。
* 負荷分散: リバースプロキシは負荷を複数のサーバに分散させることができる。Webサーバ群にリバースプロキシを組み合わせる場合、リバースプロキシが各WebページにあるURLを書き換えることもある(外部に公開されているURLを内部の位置に変換する)。ロードバランサ(Load Balancer、負荷分散機)と呼ばれることもあります。
* 変化しないコンテンツのキャッシュ
* 圧縮
* 速度の調整
* 仮想的なサーバの統合

このドキュメントでは暗号化/SSL高速化と負荷分散について記述する。

### L4スイッチとL7スイッチ
ロードバランサには大きく分けてL4スイッチとL7スイッチの2種類あります。

L4スイッチはトランスポート層までの情報を解析するので、IPアドレスやポート番号によって分散先のサーバを指定することができます。

L7スイッチはアプリケーションまでの情報を解析するので、クライアントからリクエストされたURLによって分散先のサーバを指定することができます。

### OSI参照モデルのおさらい
OSU参照モデルの7つの階層とは以下のことでした。

* 第7層: アプリケーション層

    具体的な通信サービス(例えば、ファイル・メールの転送、遠隔データベースアクセスなど)を提供。HTTPやFTP等の通信サービス。

* 第6層: プレゼンテーション層
* 第5層: セッション層
* 第4層: トランスポート層

    ネットワークの端から端までの通信管理(エラー訂正、再送制御等)。

* 第3層: ネットワーク層
* 第2層: データリンク層
* 第1層: 物理層

## リバースプロキシの動作
このドキュメントで想定するリバースプロキシの動作は以下の通りです。

* クライアントからの要求を受け取り、適切なWebサーバへと要求を転送します。Webサーバは要求を受け取り、いつものように仕事をしますが、応答はクライアントにではなく、リバースプロキシへ返します。要求を受け取ったリバースプロキシはその応答をクライアントに返します。
* クライアントとリバースプロキシの間のみKeep-Aliveオンにして、リバースプロキシとバックエンドのWebサーバ間はKeep-Aliveオフにします。
* クライアントとリバースプロキシの間の通信をSSLで暗号化する。

# システム環境の準備

## OS

## HAProxyのインストール
HAProxy(The Reliable, High Performance TCP/HTTP Load Balancer)のインストール手順です。

~~~bash
$ sudo apt update
$ sudo apt install haproxy
~~~

### インストールされるファイルの抜粋
エラーが発生したときに配信するファイルのサンプル

~~~
/etc/haproxy/errors
/etc/haproxy/errors/400.http
/etc/haproxy/errors/403.http
/etc/haproxy/errors/408.http
/etc/haproxy/errors/500.http
/etc/haproxy/errors/502.http
/etc/haproxy/errors/503.http
/etc/haproxy/errors/504.http
~~~

設定ファイル

~~~
/etc/haproxy/haproxy.cfg
/etc/init.d/haproxy
/etc/logrotate.d/haproxy
/etc/rsyslog.d/49-haproxy.conf
~~~

ドキュメント

~~~
/usr/share/doc/haproxy/51Degrees-device-detection.txt.gz
/usr/share/doc/haproxy/DeviceAtlas-device-detection.txt
/usr/share/doc/haproxy/NEWS.Debian.gz
/usr/share/doc/haproxy/README.Debian
/usr/share/doc/haproxy/README.gz
/usr/share/doc/haproxy/SPOE.txt.gz
/usr/share/doc/haproxy/WURFL-device-detection.txt
/usr/share/doc/haproxy/architecture.txt.gz
/usr/share/doc/haproxy/changelog.Debian.gz
/usr/share/doc/haproxy/close-options.txt
/usr/share/doc/haproxy/configuration.txt.gz
/usr/share/doc/haproxy/contrib
/usr/share/doc/haproxy/contrib/base64
/usr/share/doc/haproxy/contrib/base64/base64rev-gen.c
/usr/share/doc/haproxy/contrib/debug
/usr/share/doc/haproxy/contrib/debug/Makefile
/usr/share/doc/haproxy/contrib/debug/flags.c.gz
/usr/share/doc/haproxy/contrib/ip6range
/usr/share/doc/haproxy/contrib/ip6range/Makefile
/usr/share/doc/haproxy/contrib/ip6range/ip6range.c.gz
/usr/share/doc/haproxy/contrib/iprange
/usr/share/doc/haproxy/contrib/iprange/Makefile
/usr/share/doc/haproxy/contrib/iprange/iprange.c.gz
/usr/share/doc/haproxy/contrib/netsnmp-perl
/usr/share/doc/haproxy/contrib/netsnmp-perl/README.gz
/usr/share/doc/haproxy/contrib/netsnmp-perl/cacti_data_query_haproxy_backends.xml.gz
/usr/share/doc/haproxy/contrib/netsnmp-perl/cacti_data_query_haproxy_frontends.xml.gz
/usr/share/doc/haproxy/contrib/netsnmp-perl/haproxy.pl.gz
/usr/share/doc/haproxy/contrib/netsnmp-perl/haproxy_backend.xml
/usr/share/doc/haproxy/contrib/netsnmp-perl/haproxy_frontend.xml
/usr/share/doc/haproxy/contrib/netsnmp-perl/haproxy_socket.xml
/usr/share/doc/haproxy/contrib/selinux
/usr/share/doc/haproxy/contrib/selinux/README
/usr/share/doc/haproxy/contrib/selinux/haproxy.fc
/usr/share/doc/haproxy/contrib/selinux/haproxy.if
/usr/share/doc/haproxy/contrib/selinux/haproxy.te
/usr/share/doc/haproxy/contrib/spoa_example
/usr/share/doc/haproxy/contrib/spoa_example/Makefile
/usr/share/doc/haproxy/contrib/spoa_example/README
/usr/share/doc/haproxy/contrib/spoa_example/spoa.c.gz
/usr/share/doc/haproxy/contrib/tcploop
/usr/share/doc/haproxy/contrib/tcploop/Makefile
/usr/share/doc/haproxy/contrib/tcploop/tcploop.c.gz
/usr/share/doc/haproxy/contrib/trace
/usr/share/doc/haproxy/contrib/trace/trace.awk
/usr/share/doc/haproxy/cookie-options.txt
/usr/share/doc/haproxy/copyright
/usr/share/doc/haproxy/examples
/usr/share/doc/haproxy/examples/acl-content-sw.cfg
/usr/share/doc/haproxy/examples/auth.cfg
/usr/share/doc/haproxy/examples/content-sw-sample.cfg
/usr/share/doc/haproxy/examples/option-http_proxy.cfg
/usr/share/doc/haproxy/examples/ssl.cfg
/usr/share/doc/haproxy/examples/transparent_proxy.cfg
/usr/share/doc/haproxy/examples/wurfl-example.cfg
/usr/share/doc/haproxy/intro.txt.gz
/usr/share/doc/haproxy/linux-syn-cookies.txt
/usr/share/doc/haproxy/lua.txt.gz
/usr/share/doc/haproxy/management.txt.gz
/usr/share/doc/haproxy/netscaler-client-ip-insertion-protocol.txt
/usr/share/doc/haproxy/network-namespaces.txt
/usr/share/doc/haproxy/proxy-protocol.txt.gz
~~~

## HAProxyのバージョン
バージョンは1.7.2になります。

~~~
$ haproxy -version
HA-Proxy version 1.7.2-1 2017/01/13
Copyright 2000-2017 Willy Tarreau <willy@haproxy.org>
~~~

# HAProxyの設定

## /usr/share/doc/haproxy/examples/ssl.cfgの内容
~~~
# This configuration is a simplified example of how to use ssl on front
# and backends with additional certificates loaded from a directory for SNI
# capable clients.

global
  maxconn 100

defaults
  mode http
  timeout connect 5s
  timeout client 5s
  timeout server 5s

frontend myfrontend
  # primary cert is /etc/cert/server.pem
  # /etc/cert/certdir/ contains additional certificates for SNI clients
  bind :443 ssl crt /etc/cert/server.pem crt /etc/cert/certdir/
  bind :80
  default_backend mybackend

backend mybackend
  # a http backend
  server s3 10.0.0.3:80
  # a https backend
  server s4 10.0.0.3:443 ssl verify none
~~~


## /etc/haproxy/haproxy.cfg

~~~/etc/haproxy/haproxy.cfg
global
	log /dev/log	local0
	log /dev/log	local1 notice
	chroot /var/lib/haproxy
	stats socket /run/haproxy/admin.sock mode 660 level admin
	stats timeout 30s
	user haproxy
	group haproxy
	daemon

	# Default SSL material locations
	ca-base /etc/ssl/certs
	crt-base /etc/ssl/private

	# Default ciphers to use on SSL-enabled listening sockets.
	# For more information, see ciphers(1SSL). This list is from:
	#  https://hynek.me/articles/hardening-your-web-servers-ssl-ciphers/
	# An alternative list with additional directives can be obtained from
	#  https://mozilla.github.io/server-side-tls/ssl-config-generator/?server=haproxy
	ssl-default-bind-ciphers ECDH+AESGCM:DH+AESGCM:ECDH+AES256:DH+AES256:ECDH+AES128:DH+AES:RSA+AESGCM:RSA+AES:!aNULL:!MD5:!DSS
	ssl-default-bind-options no-sslv3

defaults
	log	global
	mode	http
	option	httplog
	option	dontlognull
        timeout connect 5000
        timeout client  50000
        timeout server  50000
	errorfile 400 /etc/haproxy/errors/400.http
	errorfile 403 /etc/haproxy/errors/403.http
	errorfile 408 /etc/haproxy/errors/408.http
	errorfile 500 /etc/haproxy/errors/500.http
	errorfile 502 /etc/haproxy/errors/502.http
	errorfile 503 /etc/haproxy/errors/503.http
	errorfile 504 /etc/haproxy/errors/504.http
~~~

## 設定項目

### grobalセクション

### defaultsセクション
ここに記述した設定が続くセクション全てで有効になります。

### frontendセクション
アクセスを受ける側についての設定を記述します。

### backendセクション
アクセスの振り分け先の設定を記述します。

### listenセクション
フロントエンドとバックエンドを合わせてまとめて記述します。

## https -> httpの例

# 動作検証

## HAProxyの起動、停止、再起動、リロード
起動

~~~bash
sudo service haproxy start
~~~

停止

~~~bash
sudo service haproxy stop
~~~

再起動

~~~bash
sudo service haproxy restart
~~~

リロード

~~~bash
sudo service haproxy reload
~~~

## ログ

# [付録] 基礎知識

# [付録] 参考文献

* [HAProxy](http://www.haproxy.org/)
* [HAProxy Configuration Manual](http://cbonte.github.io/haproxy-dconv/1.7/configuration.html)
* [HAProxy を使ってみたメモ](http://ngyuki.hatenablog.com/entry/2016/04/21/002302)
