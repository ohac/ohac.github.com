=begin

== 20051101

=== [debian][chinese]SCIMでピンイン
使えるようにした。LANG=zh_CN.UTF-8 mlterm --im=scimって感じで、CTRL+SPACEでSCIMを立ち上げ、xiexie1みたいな感じで変換する。最後に数字で確定するのがミソか。間違ってEnterを押すと、xiexieという文字がそのまま入力されるようだ。

== 20051102

=== [java][debian]non-freeじゃない系のjava
とりあえず、jikes, gcj, free-java-sdk, kaffe, gij, sablevm, classpath-tools, fastjarをインストールした。使い方等はこれから勉強していくつもり。

=== [java][debian]free-java-sdk
System.out.println("hello.")だけのコードを作成し、/usr/lib/fjsdk/bin/javac でコンパイルして、/usr/lib/fjsdk/bin/java で実行させることができた。javacとjavaはshell scriptで、javac は jikes-sablevm 、java は java-sablevm を使用しているようだ。

== 20051104

=== [debian]fstabとlinux-image-2.6.x
smbfsがfstabにあるとlinux-imageの設定でエラーが出るような気がする。あと、立ち上げ時もなんか赤い字でfailureとか出てたような気がするなぁ。

=== [debian]OpenOffice2.0
右後ろの人は動くようになったらしい。私のところはまだちゃんと動かないなぁ。使用しているミラーサーバが違うからだろうか。

=== [linux]prでテキスト整形
e2psが使えないので、prで整形を試みる。しかし、フッタが指定できなかったり、よく分からないところもあったりして困ってしまった。高機能版のprってないのかなぁ。スクリプトを自作した方がいいのかも。でもできたら標準ツールでなんとかしたいなぁ。

== 20051107

=== [debian]ML参加
やっとこさDebian JP UsersとDevelopersとDocumentationの3つを講読するようにした。本家の方もちょっと見てみたけど、すごい種類がいっぱいあるようだ。とりあえずdebian-userだけ講読しておいた。ここはメールが多そうだなぁ。

=== [debian]fail2ban
ほほう、こんなのがあるのか。

=== [english]ラジオ英会話
私もレッツスピークをおすすめしておこうかな。週に6回もあるし、本が安いのでグッドです。ちなみに私はリスニングは簡単な会話なら少し自信あるのですが、スピーキングとライティングが弱いです。

=== [debian]kstars
zoomしていくと惑星とか星雲、銀河がインライン表示されるので、なかなか面白い。

=== [diary]php
なんかヤバいらしいから自宅サーバのPHPをバージョンアップしておく。

=== [debian]OpenOffice.org 2.0, reportbug, querybts
あいかわらずOpenOfficeが動かない。reportbugにあるquerybtsコマンドでちょっと見てみると、#260965: openoffice.org: Crashes on startup というのがあった。これなのかな...。ちなみに.openoffice.org2あたりをrmしてみても改善は見られず。しばらく使えなさそう。と思ったら、LANG=Cで立ち上げると問題なく使えた。日本語入力は使えないけど、テキストをOooで開いて、コピペしたらなんとかなりそうかも。...いや、plain textを開くと文字化けしてるから無理かな。とりあえず待とう。

== 20051108

=== [debian]debian-user ML
すごい量。講読やめようかなぁ。それとも件名を見て拾い読みするかな。とりあえず振り分けの設定ぐらいはしておいた方がいいな。

=== [debian]dosemu+freedos
あらー、dosemu+freedosが動かないよ。/etc/dosemu/dosemu.conf を ~/.dosemurc にコピーして、$_layout="us"にしたら少し進んだけど、途中で止まる。むうー。「#327153: dosemu: fails to start」これかな。

=== [debian]cdrecord + linux 2.6.x
だいぶやり方が変わっているのね。ide-scsiなしでいけるのはありがたいことです。cdrecord -dev=ATAPI: -scanbus でスキャンして、cdrecord -dev=ATAPI:0,0,0 ...のようにして使えばあとは前と同じ。あ、あと/dev/cdromがscd0にsymlinkしていたのをhdcにsymlinkするように変更した。

=== [diary]/dev/fd0
あれー? floppyがmountできなくなっているなぁ...。と、調べてみると単にBIOSの設定が消えていただけだった。なぜ消えるのだ...。

=== [debian]gs-esp
「#337936: Can't print japanese text from a2ps」。e2psがうまくいかない件はこれと同じかな。ところで、間違えてSend a report that this bug log contains spam.というリンクを押してしまいました。ごめんなさい。どうしたらいいのかなぁ...。自動でspam判定を行うということなのかな。だとしたら大丈夫っぽいけど。

== 20051109

=== [debian][uim]uim-0.4.7-2
リリースされた。自分向けkzik版を作らねば。早く本家に取り込み可能なコードを考えないといけないなぁ。

=== [debian]openoffice.org 2.0
新しいのがきた。さて、問題は解決しているかな...おお、ちゃんと動くようになった。ありがたや。

== 20051110

=== [diary]cvsでrevert
cvs di -u hoge.c | patch -R なるほどね。これが一番スマートかも。

=== [ajax]JavaScriptでinclude
hoge.jsからfoo.jsをinclude(import?)できないのかなぁ。HTMLからincludeできるのはわかるけど、*.jsから*.jsもあれば便利なのだが。

== 20051111

=== [diary]ホワイトバンド:趣旨説明不足で購入者から批判
ちゃんと説明しとかなあかんよ。ほんまに。

=== [ajax]JavaScript debug
JavaScript debug http://eto.com/d/0502.html#JavaScript_debug というのがあったので使ってみた。JavaScriptはprint文デバッグみたいなのができなくてalert()とかを使いまくることが多いが、これがあればプリント文デバッグみたいなことができるようになる。debug.jsというのをHTMLからincludeすれば使えるようになるが、*.jsから直接includeする方法が分からない(できないかも)のが残念である。

== 20051114

=== [debian]aptitude
試しに使ってみた。使っていないlibをアンインストールしてもらえるようだ。

=== [debian]gs-esp defoma
武藤さんの日記 http://kmuto.jp/d/index.cgi/debian/gs-esp-8151.htm によると、 export GS_LIB=/usr/share/fonts でなんとか使えるようだ。解決するまでは .xsession にでも書いておこうかな。これでやっと e2ps が使える。ありがたや。

== 20051115

=== [uim]SKK補完機能
試してみたいが、最新のをbuildしないと使えない。今はその気力がない。

=== [diary]w3m keymap
以下のものを加えた。なかなかいいかも。元々のoはOへ、Hは?へ割り当てた。

 keymap  0   LINE_BEGIN
 keymap  i   GOTO_LINK
 keymap  o   BACK
 keymap  b   NEXT_LEFT_UP
 keymap  w   NEXT_RIGHT_DOWN
 keymap  H   SCREEN_TOP
 keymap  L   SCREEN_BOTTOM
 keymap  C-f NEXT_PAGE
 keymap  C-b PREV_PAGE

=== [debian]gs-esp defoma 続き
gvでe2psの結果を表示することができたのでOKだと思っていたが、どうもcupsys自体には例の環境変数が届いていないようで、gvから印刷しようとすると失敗した。/etc/init.d/cupsysで設定して、restartしてもうまくいかなかった。うーん。/usr/lib/cups/filterのpstopxl, pstorasterを変更してみた。うーん、違うな。/usr/lib/cups/filterをGS_LIBでgrepすると「# Use CUPS font path ("FontPath" in /etc/cups/cupsd.conf)」というコメントがあったので、FontPathを例のパスに変更して、念のためcupsysをrestart。お、いけたいけた。

== 20051116

=== [debian][java]update-alternatives
java, javac等は$JAVA_HOME/binにPATHを通していたが、Debian流儀に合わせてupdate-alternativesを利用することにした。visudoで/usr/sbin/update-alternativesを許可し、/usr/sbinにPATHを通し、update-alternatives --list java で一覧表示、sudo update-alternatives --config javaでインタラクティブ設定。javacは高速なjikes、jarは高速なfastjar、javadocはgjdocにしておいた。残りは無難にSunのJ2SDKにしておく。

=== [crawl][nethack]公開ゲームサーバ
http://alt.org/nethack/ とか http://www.alice3.net/ があるみたい。(情報元: mixiのrogue likeコミュ)

=== [ajax][game]Ajaxで囲碁
Ajaxで囲碁ができたら面白いかも。Java Appletは敷居が高いし、linuxからだとチャットがうまく動かないみたいなのでAjaxで実現できたら便利。あとは人狼BBSのように観戦者のコメントが隠せたら、あとで見て面白いかも。チャット機能も欲しいな。

=== [wiki]hiki its.rb
http://hikiwiki.org/ja/its.rb.html 社内のBTSに使えるかも。その前にHikiを用意しないと...。

=== [debian][im]skkdic
skkdicパッケージ等、なくなったらいやだなぁ。

=== [debian]e2ps
矢印と罫線の向きが変になるなぁ。

== 20051118

=== [debian]最小構成の構築
ゼロから構築してみた。arとかで展開した後にchrootでbashが動く状態にして、次にdpkgが動く状態まで持っていき、次にaptitudeが動くように。最後にlinuxとliloをインストールしてブートできるようにした。grubはよく分からなかった。ドキュメントとか消さなくても、なんとか256MB以内に収まっている。でも考えてみると最小構成のdebianを作るツールはすでに存在しているような気がする。Debian辞典にも何か書いていたことを思い出す。でも勉強になったので、よしとする。さて次はread onlyなdebianを構築するぞ。(ちなみにこれは仕事です。)

=== [debian]mount / as read-only
Red hat 9とか6.2をread-onlyにするよりも、かなり簡単に作業ができた。さすがdebian。/etc/fstab で defaults,ro と書いて、/etc/mtab を /proc/mounts へsymlink、/etc/network を書き込み可能なパーティションへsymlinkし、/etc/rcS.d/S11/readonly.shというのを作成して、そこで /etc/network.skel をその書き込み可能なパーティションへコピー(初回だけ)。たったこれだけで、ftpdとかtelnetdがちゃんと動いている。

=== [debian]nfs-server
よく分からないのでnfs-kernel-serverを選択。nfs-user-serverというのもあるらしい。遅いらしいけど、機能豊富でデバッグしやすいとの説明があった。man exportsの例を見ながら、/etc/exports に /hoge *(ro,insecure,all_squash,sync) みたいな感じで書き込み。おおー、mountできたよ。

=== [wiki]PukiWikiバージョンアップ
自宅サーバの調子が悪いので再起動してみたら、PukiWikiが全く動かなくなった。どうやらSeg.faultしているようだ。仕方がないので、PukiWikiの最新版を入れてみると、これはすんなり動作した。仕方なしにデータを最新版のディレクトリにコピーしたりして、やっとこさ前とほぼ同じような見た目で動くようになった。パッケージになっていないのはやはり不便だと痛感。Hikiに移行するか、PukiWikiをパッケージ化してみるか...。そんな気力はなさそうだが。

=== [diary]しし座流星群
ちょっとベランダから見てみたが、1つも流星は見えず。東が半分しか見渡せないのが痛い。仕方ないのでオリオン座の子三つ星や火星を双眼鏡で覗いてみた。手ブレが厳しい。三脚が使える双眼鏡か小型望遠鏡が欲しい。mixiの報告を見ると、昨日はそんなに流星は見えなかったようだ。

== 20051121

=== [ruby]apache2とwebrickのポートを接続
/etc/apache2/mods-enabled/ に mods-available の proxy.conf と proxy.load を symlink する。/etc/apache2/conf.d に webrick というファイルを以下のように作成。

 <IfModule mod_proxy.c>
   <Proxy *>
     Allow from all
   </Proxy>
   ProxyPass  /webrick  http://localhost:3000
 </IfModule>

=== [ruby]webrickでrhtmlを使う
こんな感じかな。

 #!/usr/bin/ruby
 require 'webrick'
 include WEBrick
 s = WEBrick::HTTPServer.new(:Port=>3000, :DocumentRoot => '.')
 s.config[:MimeTypes]["rhtml"] = "text/html"
 trap("INT") {
     s.shutdown
 }
 s.start

rhtmlをtext/htmlにする方法を見つけるのに時間がかかってしまった。

== 20051122

=== [debian]kernel 2.6
家のNotePCで2.4からバージョンアップしようとするとinitrdで失敗する。うーん。

=== [c]C++ throws
ひさびさにC++のクラス設計をやってみる。かなり忘れているなぁ。Javaでいうところのthrowsってないのかな...なさそうだ。throwは怖くて使えないかも。throwは使わずに従来通りの戻り値でのエラーチェックにした方が無難かな。その関数内でのtry catchならcatch忘れしなさそうなので、このぐらいなら使えるかも。

=== [c]C++ finally
finallyがないから、デストラクタでなんとかしろということか。

== 20051124

=== [debian]e2psで罫線と矢印の向きが変になる対策
こんなフィルタをかましてみました。全然根本的な解決ではないけど。

 #!/usr/bin/ruby -n
 require 'jcode'
 $KCODE='e'
 print $_.tr("┌┐└┘─│┬┴├┤┏┓┗┛━┃┳┻┣┫→←↑↓" \
 , "┐┘┌└│─┤├┬┴┓┛┏┗┃━┫┣┳┻↑↓←→")

=== [english]Dr.SLUMP Vol.1
ハワイ土産のマンガを読み終えました。どうもありがとうさんです。

== 20051125

=== [mutt]半角カナ
最近は半角カナを使う人が減ってきたけど、半角の"「"、"」"、"・"を知らずに使ってしまう例が多いなぁ。しかも、これらの文字はぱっと見て、半角カナ系の文字と気付きにくいから困る。UTF-8なMuttでこのテキストを送るとISO-2022-JPではなくUTF-8で送ってしまう。しかも送ってから気が付く。うーむ。nkf -j のフィルタをかませば対策できるけど、どこに仕掛けたらいいのか。muttから呼ばれるエディタをvimのラッパースクリプトにすればいけるかなぁ。でも、それだと中国語や韓国語のメールは送れないよな。

=== [mutt]続・半角カナ
ということで、muttvimというラッパーをかますことにした。

 #!/bin/bash
 vim $1
 lv -Iu8 -Oej $1 | nkf -E -j | lv -Ij -Ou8 >/tmp/muttvim.tmp
 diff -u $1 /tmp/muttvim.tmp
 if [ $? -ne 0 ] ; then
   read -p "Do you want to change this to ISO-2022-JP ? (Y/n)" ans
   if [ -z $ans ] ; then
     ans="Y"
   fi
   if [ $ans != "n" ] ; then
     mv -f /tmp/muttvim.tmp $1
   fi
 fi

== 20051128

=== [uim][debian]自分用uim
自分用uimパッケージをビルドした。

=== [uim][debian]firefoxでuimが使えない
それを入れるとfirefoxで使えなくなってしまった。ううむ。mltermのuimはOKなのだが。

== 20051130

=== [uim][debian]firefoxでuimが使えない(解決)
昨日からうまく動いている。変えた点と言えば、 .xsession の export GTK_IM_MODULES=uim を export GTK_IM_MODULE=uim に変えたぐらいかな。関係あるかどうか分からんけど。

=== [debian]VAIO Z505とlinux 2.6
2.6のカーネルをinitrdを別のところからコピーして、無理矢理インストールしてみた。しかし、どうも立ち上げ速度が極端に遅い。それと2.4で使えていた無線LANが使えなくなった。設定とかいろいろ変わるんだろうなぁと思いつつ、2.4に戻した。

=end
