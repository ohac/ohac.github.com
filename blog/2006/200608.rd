=begin

== 20060801

=== [c]fopenのappendモードとfseek
"a"や"a+"でオープンするとfseekが機能しないようだ。これがANSIの仕様とのこと。知らんかった。30分ぐらい悩んだ。man 2 fopenやfseekで見てもそんなこと書いてないし...

=== [linux]ld.so.conf
LD_LIBRARY_PATHの代わりに/etc/ld.so.confというのがあるらしい。(Anthy-dev MLより)

== 20060815

=== [im][windows]skkime
自宅メインPCがWindowsになったのでskkimeを使っているのだが、AZIK配列じゃないから激しく打ち間違える。チャットでこんなに打つのが遅いとタイピングが下手だと思われかねない。ということで、こんなのを見つけた。 http://kemasoft.pya.jp/pukiwiki/index.php?%CE%A2%C1%EB%2Fskkime-azik 。試してみると、結構便利。 http://www.tatari-sakamoto.jp/~tatari/skkime.jis.html によると「ローマ字仮名ルールをレジストリから読み込む上限を 8192 に変更しました。」というのがある。これならもっとAZIKらしくできるかもしれない。またKZIKの実装も可能かも。しかし、レジストリの内容がよく分からん。

=== [diary]firefoxでCtrl+hをBSに
http://www.kncn.net/blog/item/388 http://wildlifesanctuary.blog38.fc2.com/blog-category-3.html これらが参考になりそう。ほほう、 chrome://global/content/platformHTMLBindings.xml で現在の設定が見られるのかぁ。 /usr/share/firefox/chrome/toolkit/content/global/platformHTMLBindings.xml を編集したらいいのかな。 http://www.mozilla-japan.org/unix/customizing.html ここの方が参考になるかな。いろいろ試してみて、一応実現はできたけど、アップグレードするたびに変更が必要なのはちょっとまずいな。もうしばらく待とう。

=== [im]SKKで使ってないキーストロークを利用した漢字変換
例えば、「OMu」を「思う」、「KanE」(AZIKなら「KzE」)を「考え」とかどうだろう。しかし、「KanE」はうまくいくが、「OMu」は「思うむ」になってしまいうまくいかないな。送り仮名の置換機能があればいいのかも。

== 20060816

=== [im]skkimeカスタマイズAZIK/KZIK完全対応
とりあえず skkimeのAZIKカスタマイズページからレジストリファイルをダウンロードしてきて、重要そうな部分をデコードするところまでコーディングした。download.shしてからreverse.rbで変換となっています。 http://ohac.sytes.net/cgi-bin/viewcvs.cgi/kzik/skkime/ あら? ViewCVSで見えない。なぜだ。「NOTE: There are 2 files, but none match the current selection criteria.」って何? cvsコマンドを使えば問題ないのに。それと「Commit Identifier:」って何? こんなの今まであったっけ。

=end
