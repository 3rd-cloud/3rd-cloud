# KUSANAGI 9 for Vagrant 使い方

## 3. WordPress 環境作成

KUSANAGI 9 サーバーを推奨環境で自動構築し、WordPress サイトを一つ構築します。

```sh
vagrant up
```

SSH 接続はアプリを使わずに下記コマンドからでもできます。

```sh
vagrant ssh
```

このあと、 http://www.vagrant.local からセットアップ作業を開始します。
作成されるサイトなどの情報は、 `vars.sh` 変数で変更できます。
