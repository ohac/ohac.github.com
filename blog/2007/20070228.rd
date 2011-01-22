# back: ../index.rd
=begin

== 2007-02-28

=== vim "[f" is deprecated
"[f"はもう古いらしい。"gf"を使えとのこと。"gf"でファイルがなかったら、作っ
てくれるモードがあったらいいのになぁ。

=== Mercurial .hgrc
よく使うパターンをメモっておく。

 [ui]
 username = HOGE Hoge
 
 [encode]
 **.rd = pipe: nkf -w
 
 [decode]
 **.rd = pipe: nkf -e

=== 最近使ってみたソフト
* imwheel
  * マウスホイールでキーイベントを発生させたりできる。
* fortune-mod
  * 占い。英語なのでちょっとした勉強にもなるかも。
* azureus
  * BitTorrent client。Javaで動く。sun-java6-jreを入れておいた方が安定する。
* qtparted
  * パーティションエディタ

=== mlterm, mlclient with Alt+key
~/.mlterm/keyに以下のような定義をするとAltキー+任意のキーで文字列を送ることが
できる。

 Mod+a="^La"

GNU screenのprefixキーと組み合わせるとAltキーを使っていろいろとscreenを制御で
きる。(^Lはvim上ではCTRL+V CTRL+Lで入力できる。)

しかし、mlclient上だと現状ではダメみたい。

=end
# vim:ft=rd
