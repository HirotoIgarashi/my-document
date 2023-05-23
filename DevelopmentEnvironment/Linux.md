# Linux 入門

以下のドキュメントは Linux のディストリビューションとして[Linux mint]を利用することを前提として記述します。

[Linux mint]: https://linuxmint.com/

## Linux mint について

### コマンド例

#### ディストリビューションの情報を表示する

簡単な例

```bash
cat /etc/issue
Linux Mint 21.1 Vera \n \l
```

詳細を表示する例

```bash
cat /etc/lsb-release
DISTRIB_ID=LinuxMint
DISTRIB_RELEASE=21.1
DISTRIB_CODENAME=vera
DISTRIB_DESCRIPTION="Linux Mint 21.1 Vera"
```

```bash
cat /etc/os-release
NAME="Linux Mint"
VERSION="21.1 (Vera)"
ID=linuxmint
ID_LIKE="ubuntu debian"
PRETTY_NAME="Linux Mint 21.1"
VERSION_ID="21.1"
HOME_URL="https://www.linuxmint.com/"
SUPPORT_URL="https://forums.linuxmint.com/"
BUG_REPORT_URL="http://linuxmint-troubleshooting-guide.readthedocs.io/en/latest/"
PRIVACY_POLICY_URL="https://www.linuxmint.com/"
VERSION_CODENAME=vera
UBUNTU_CODENAME=jammy
```
