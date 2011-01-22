# back: ../index.rd
# <<<2007/20070304.rd
# * ((<2007-03-04|URL:2007/20070304.html>))
=begin

== 2007-03-04

=== wodim
cdrecordはなくなってwodimというのになったようだ。
* wodim -scanbus
* genisoimage -o foo.iso dirname
* wodim foo.iso
全部ユーザーモードでできた。えらい簡単だな。
/etc/group のdiskに自ユーザーを追加していたからかもしれない。

と思ったらmount /media/cdromでマウントできない。
* wodim blank=all でDVD-RWを消去。やたら時間がかかる。allにしたのが間違いか?

ううむ。
* wodim -dummy -v speed=2 -pad foo.iso

これでどうだ? むむダメか。-dummyはテスト用かな?

* wodim -v speed=2 -pad foo.iso
今度こそどうだ? いやダメみたい。

* wodim blank=fast で消して...

debianのisoイメージでやってみよう。
* wodim -v speed=2 -pad ~/azureus/debian-31r5-i386-businesscard.iso

-daoか-saoがいるのかも。
* wodim -v speed=2 -dao ~/azureus/debian-31r5-i386-businesscard.iso
ダメだ...

driver=mmc_mdvd
ダメ...

CD-RWなら問題なく焼けた。DVD-RWは何か特殊なのかな。

=== cryptmount
なんとか暗号化ファイルシステムの構築に成功。
iceweaselのパスワード保存ファイルとかgnupgとかsshの鍵とかを入れて、
シンボリックリンクにしてみた。

鍵とループバック用ファイルをUSBメモリ、HDD等の3箇所以上に分散させて、
Mercurialで同期させることで紛失・故障時の対策としている。

=== 起動直後のalsaが変
なぜか毎回 alsaconf の再実行を行わないといけない。
とりあえずsudoで実行可能にして、fluxbox/menuにalsaconfを追加しておいた。

=== USB 80GB HDD購入
音楽データを入れて、IO DataのDVDプレーヤーのUSB端子に接続して使用する予定。
あとバックアップ用にも使う。

=== LOST シーズン3
AXNで5月から放送開始らしい。
そして来週からシーズン1,2を平日に毎日放送する。
シーズン2は見たけど1がまだなので見ようと思う。

=end
# vim:ft=rd
