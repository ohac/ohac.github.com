= iiimp親指シフト化

== 主な特長
Linux用 ATOK Xなどで使用されているライブラリ xiiimp.so.2 を親指シフト(NICOLA配列)にする。

== 制限事項
* JISかなが使えなくなる
* 変換・無変換キーを親指シフトキーとしたとき、変換・無変換の機能は使えなくなる

== ダウンロード
* 元となるソフト ((<URL:ftp://ftp.x.org/contrib/i18n/sdk2-dev10.0.tar.gz>))
* 差分プログラム(以下のどちらか)
  * ((<sdk2-dev10.0-iiimp.patch|URL:nicolaiiimp/sdk2-dev10.0-iiimp.patch>))
  * ((<iiimf-nicola-0.1-0.nosrc.rpm|URL:nicolaiiimp/iiimf-nicola-0.1-0.nosrc.rpm>))

== インストール・設定方法
* patchの場合
  * /usr/lib/im/xiiimp.so.2に上書きコピーする
* rpmの場合
  * rpm --nodeps -i iiimf-nicola-0.1-0.i386.rpm
* xmodmap で以下のように設定する
  * ひらがなカタカナキーを設定する
  * 右親指シフトを mod3 に設定する
  * 左親指シフトを mod4 に設定する
* 再起動後、日本語入力時にひらがなカタカナキーを押せばNICOLA配列でタイプ可能となる

== *設定例
以下のようなxmodmap設定ファイルを用意し、"xmodmap [ファイル名]"で読み込む。

 keycode 132 = Hiragana_Katakana
 
 keycode 135 = Muhenkan
 clear mod4
 add mod4 = Muhenkan
 
 keycode 134 = Henkan
 clear mod3
 add mod3 = Henkan

* キーコード(keycode)は環境によって違うので、xevなどで調べてください。

== 最近の変更履歴
* 2002.4.17 Ver.0.00

== 要望と問題点
 |内容                                    |対策/対応Ver.|
 |強引に実装しているので、なんとかしたい  |未           |
 |JISカナと切り替え可能にしたい           |未           |
