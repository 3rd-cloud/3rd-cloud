# KUSANAGI 8 の yum アップデートでエラーになったときに試す手順

KUSANAGI 8 で久しぶりに yum アップデートしたところ、エラーでうまく動かなかった場合の対応策です。

## 前提

こちらの記事は KUSANAGI **8** 向けの記事です。
KUSANAGI **9** 向けではありません。

確認方法として、

```bash
kusanagi --version
```

を実行して、 `KUSANAGI Version 8.` からはじまるバージョンであれば対象になります。

## 問題の切り分け

### HTTP Error 404 が表示される

下記のようなエラーが発生した場合は、ネットワークの問題です。

```bash
[Errno 14] HTTP Error 404 - Not Found
```

たまにあるのが、アップデートを取得する接続先のサーバーがダウンしているケースです。
これが意外と気が付きにくい。。。
この場合は時間をおいて、再度挑戦してみてください。

いくら時間をおいても上記のエラーが発生する場合には、そもそもサーバーのネットワーク設定が間違っている可能性があるので、curl などで調査するところから始めてください。

### アップデート途中でエラー文字が表示される

下記のようなエラーが発生した場合は、依存するリポジトリを追加指定する必要があります。

```
Error: Package: kusanagi-php7-7.4.21-1.noarch (kusanagi)
           Requires: libonig.so.105()(64bit)

エラー: パッケージ: kusanagi-php7-7.4.25-1.noarch (kusanagi)
           要求: libicudata.so.69()(64bit)
```

このあとのアップデート再挑戦の項目を試してください。

## アップデート再挑戦

### 1. yum アップデート

#### アップデートに失敗したとき再チャレンジするときのコマンド

```bash
yum clean all
yum update kusanagi
yum update --enablerepo=remi,remi-php56
```

#### 長期間（数ヶ月や数年）アップデートしていないようなときのコマンド

1回ではすべて適用できないかもしれないので、何度か試してアップデートがなくなったことを確認してください。

```bash
yum clean all
yum update --enablerepo=remi,remi-php56
```

### 2. サーバー再起動

yum アップデートしただけでは、サーバーで稼働中のサービスにアップデートは反映されません。
アップデートを反映するためにサーバー再起動を行ってください。

yum アップデートで例えば Nginx がアップデートされた場合、Nginx サービスをリスタートする必要があります。
どのサービスをリスタートすればよいかは、アップデートされたモジュールに依存します。
また、一部モジュールは再起動しないといけないものもあります。
手っ取り早くかつ確実なアップデートの適用方法はサーバー再起動です。

上記の切り分けができる方は、下記コマンド例でサービスの再起動も可能です。

```bash
# Nginx 再起動
kusanagi nginx

# PHP7 再起動
kusanagi php7

# 現在有効なサービスを再起動
kusanagi restart
```

## ※注意

アップデート作業により不具合が起きても責任は取れませんのであしからず。
万が一元に戻せるようきちんとバックアップを取って作業しましょう。

## 参考

KUSANAGI 8 更新情報
https://kusanagi.tokyo/archives/tag/kusanagi8/

KUSANAGI 8 FAQ
https://kusanagi.tokyo/faq/

KUSANAGI 8 コマンド
https://kusanagi.tokyo/document/command/
