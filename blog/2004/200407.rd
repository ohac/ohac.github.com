=begin

== 20040702

=== [linux] debian sargeに移行

woody と sarge, sid が混じった環境でいろいろと不都合があったので、思い切ってsarge環境に移行した。(init 1 後、 apt-get -t sarge upgrade)

インストール途中でいろいろ聞かれたりしたが、大体enterキーを押して進む。

途中でflexがエラーとか出たが、使っていないので apt-get remove flex で削除。

これで一応インストールは完了したので、reboot。

しかし、思っていた通り、問題が起きた。

まずネットワークがつながらない。
これは /etc/modules.conf に alias eth0 sis900 を追加して ifup eth0 で解決。

gvは問題なさそう。しかし、相変わらずkochi-minchoの「調」の字の「口」の部分が塗り潰されている。

OpenOffice 1.1.0は動作する。しかし、相変わらずメニューバーなどの文字が表示されない。編集文書の字は表示されるのだが。apt-get -t sid install openoffice.org とすれば改善されるだろうか。後でやってみよう。

* OpenOffice 1.1.1にupgradeしたらメニューバーが表示された。これで一つ解決した。 -- ohac 2004-07-02 (金) 18:34:55
* OpenOffice 1.1.1はすばらしい。1.1.0とは大違いだ。openoffice & でバックグラウンド実行しておけば、sylpheedから添付ファイルをすばやく開くことができる。これでMS-Office系の添付ファイルも恐くなくなった(かも)。 -- ohac 2004-07-02 (金) 20:41:53

=== [linux] vmware

会社から支給されたvmwareをインストールしてみた。

debianなのでrpmを使うかtar.gzを使うか迷ったが、無難にtar.gzを選択。(alianでrpmを使用する方法もあるが、この方法はちょっと不安だ。)

無事インストールは完了した。

で、ゲストOSのインストールをしようと、このPC(Gateway製)用のWindows ME OEMのCD-ROMを入れてブートしてみた。しかし、インストール途中で「GatewayのPCではない」というエラーが表示され断念。orz

=== [日記] 九州へいこう

出張で九州に行かねばならない。

そこで九州大分の安い宿を調べた。

* 健康ランド豊の国:3460yen
* ニューはやし:3500yen
* クドウ:3900yen

健康ランド豊の国に決定。

部屋は狭いが、24時間営業の大浴場があるのでよさげ。

== 20040713

=== [IM] 接頭辞・接尾辞(SKK)

む、skkで接頭辞・接尾辞なる機能があることを今頃発見。

例えば
 Di[SPACE]>kaku[SPACE]
と入力すると
 痔核
と変換される。

さらに
 Chou>TanoSii
と入力すると
 超楽しい
と変換される。

(例文が悪いって?)

== 20040723

=== [linux] ldd

非常に基本的なことだが、ある実行ファイルの使用する共有ライブラリを調べたいときは

 ldd filename

とすればよい。例えば ldd /bin/bash という感じだ。

知らなかったのでメモしておきます。

== 20040726

=== [日記] 映画 Catch me, if you can.

Catch me, if you can. を観た。泣いてしまった。
こんな悲しい話だったとは知らなかった。

ちなみに今までで泣いてしまった映画は

* レナードの朝
* フランケンシュタイン(デ・ニーロのやつ)
* タイタニック

半泣きだったやつは

* セント・オブ・ウーマン
* A.I.

うーん。案外少ないな。

ちなみに映画ではないが動物番組で盲導犬が老犬になってから主人と再会したシーンがあり、これも泣いてしまった。

== 20040730

=== [linux] mplus font

M+というフォント http://mplus-fonts.sourceforge.jp/ をインストールしてみた。

小さいけど、見易くてなかなか良い。
ということで .Xresources を次のように変更。ついでに krxvt も使うようにした。

 kterm*dynamicFontLoad: false
 kterm*fontList: mplus_j12r-iso, mplus_j12r-jisx, mplus_j12r
 kterm*Font: mplus_j12r-iso
 kterm*romanKanaFont: mplus_j12r-jisx
 kterm*kanjiFont: mplus_j12r
 kterm*boldFont: mplus_j12b-iso
 kterm*romanKanaBoldFont: mplus_j12b-jisx
 kterm*kanjiBoldFont: mplus_j12b
 
 Rxvt*font: mplus_j12r-iso
 Rxvt*mfont: mplus_j12r
 Rxvt*mfontn: mplus_j12r-jisx
 
 Skkinput*fontSet: \
 -mplus-gothic-medium-r-normal--10-100-75-75-c-50-iso8859-1,\
 -mplus-gothic-medium-r-normal--10-100-75-75-c-50-jisx0201.1976-0,\
 -mplus-gothic-medium-r-normal--10-100-75-75-c-100-jisx0208.1983-0
 Skkinput*minibufferfontSet: \
 -mplus-gothic-medium-r-normal--10-100-75-75-c-50-iso8859-1,\
 -mplus-gothic-medium-r-normal--10-100-75-75-c-50-jisx0201.1976-0,\
 -mplus-gothic-medium-r-normal--10-100-75-75-c-100-jisx0208.1983-0

Sylpheed もこのフォントを使うために /etc/gtk/gtkrc.ja と ~/.sylpheed/sylpheedrc も変更した。
