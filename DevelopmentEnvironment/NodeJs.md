# Node.js について

## Node.js のインストール

Node.js のインストールに[nvm] (Node Version Manager)を使用します。

[nvm]: https://github.com/nvm-sh/nvm

最新のバージョンを確認します。2024-09-24現在はv0.40.1が最新です。

### nvmのインストール

- インストール

下記のv.040.1を前に確認したv.040.1に置き換えます。

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
nvm --version
0.40.1
```

### nvmによる最新版のNode.js のインストール

```bash
nvm install node
node --version
v22.9.0
```

### Node.jsのユニットテストとデバッグ
