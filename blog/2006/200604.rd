=begin

== 20060406

=== [debian]smartmontools - control and monitor storage systems using S.M.A.R.T.
HDD等の寿命、品質をモニタするツール。smartctl -a /dev/hda みたいな感じで使用するらしい。

=== [linux]NFSでumount
NFSでmountしたままサーバがいなくなり、umountできなくなったときは、fuser [mount point]で表示されたPIDをkillすればumountができるらしい。famdをkillすればいいらしい。

=== [vim]上下の行をコピー
Insert or Replace ModeでCTRL+Y or E 。たまに便利なときがある。

=== [linux]zImageのLinux versionを調べる
zcat zImage | grep "Linux version.*" -o -a

== 20060407

=== [debian]gs-cjk-resource
派遣社員のPCで印刷がうまくいかないとの問い合わせあり。次の手順で解決。/etc/apt/sources.listにnon-freeを追加、apt-get updateし、gs-cjk-resource, cmap-adobe-japan1と2をインストール。あと、/etc/cups/cupsd.confにFontPath /usr/share/fontsを追加してリスタート。

== 20060418

=== [debian]NTPサーバ
openntpd, ntp, chronyの3種類、パッケージがあるようだ。ググるとchornyが簡単そうでいいかもしれない。ntpdateをcronで定期的に動作させる手もありそうだけど、今回のケースではchronyの方がいいかも。

=== [debian]ntpdate adjtimex
いや、やっぱり複雑なのでやめ。ntpdateとadjtimexの2つのパッケージでなんとかなりそう。

=== [diary]no-ipへの更新通知
no-ipで登録してあったIPがいつの間にか更新されなくなっていたようだ。調べると2006/01/13の更新が最後。とりあえずWebページでre-activateしておいた。うーむ。

=== [vim]フリーカーソルモード
:set virtualedit=allでOK。横長の文章を見るときなどに便利かも。zlとzhで左右スクロールと組み合わせて使う。

=end
