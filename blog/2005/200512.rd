=begin

== 20051201

=== [c][debian]STL
STLの勉強もしといた方がいいよなぁ。libstlport4.6*をインストールすれば使えるのかな。あれ?でもg++だけでもlist.hとか使えるなぁ。うーむ標準のg++でもある程度は使えるということなのかな。というかまずはC++をもっと勉強せなアカンかな。

=== [chinese]中日辞書が100円
ダイソーで売っていたのを買った。100円の辞書ってすごいなぁ。収録語数が少ないので逆に勉強にはいいかも。ピンインとカタカナの両方あるので、初心者にとっては分かりやすい。

== 20051202

=== [debian]ssh-askpass
ssh-askpassをインストールして、.xsessionにssh-add </dev/nullと書いておけばよいみたい。

=== [diary]OpenPNE(オープンピーネ)
ほほう。オープンソースなSNSですか。パッケージにはまだなっていないみたい。

=== [ruby]riとReFe
riとReFeをインストール。riはaptで取ってきた。ReFeはWebにある手順を見ながらインストール。RubyGemsっていうのもあるのですね。debianパッケージとの共存がややこしそう。

== 20051205

=== [game]KGSデビュー
ついにネット碁をやってしまいました。botと対局し、棋力は最初18kぐらいで決定したが、対人戦を何回か行い、今は20k。オンラインのGnuGoには6子で勝てたけど、5子では勝てなかった。

=== [game][debian][java]DebianでKGS(CGoban2)
KGSからlinux用のtar.gzをダウンロードしてきて、展開し、JavaVMを入れて、日本語フォントを設定して、java -jar cgoban.jarでOK。文字化けするときは export JAVA_FONTS=/var/lib/defoma/x-ttcidfont-conf.d/dirs/TrueType をしておくと X Window に依存しなくていいかも。あるPCではX.orgに変えたことが原因かどうか分からないけど、フォントがちゃんと表示されなくなっていたのでJAVA_FONTSを設定したところ、ちゃんと表示されるようになった。ところでSunのVMしか試してないけど、freeなVMだとどうなるのかな。tちなみに英語モードで起動したいときはLANG=C java -jar cgoban.jarでOK。

=== [game][debian][java]DebianでKGS(CGoban2)続き
フォントの問題は /etc/X11/xorg.conf を /etc/X11/XF86Config-4 と同じように設定すればちゃんと表示されるようになった。ただし、JAVA_FONTSを設定した場合と比較するとフォントの大きさが違う。DPIの設定か何かの違いだろうか。

=== [game][debian]KGSにsshトンネル経由で接続
java -jar cgoban.jar -helpで説明が表示されるが、ぱっと見たところサーバのホスト名とかポート番号とか変えられそうにない。jarの中にはそれっぽい設定ファイルがあるけど、jarの再構築なんて面倒臭いのでやりたくない(やりかけたけど...)。で、/etc/hostsにgoserver.igoweb.orgを127.0.0.1として登録し、SSHで自宅サーバへのトンネルを作る。こんな感じで→「ssh -L 2379:goserver.igoweb.orgのIP:2379 自宅サーバのホスト名」。この状態でjava -jar cgoban.jarとすれば見事に接続された。

=== [game][debian]KGSにsshトンネル経由で接続(続き)
ポート2379だけでなくhttpもトンネルしておかないと棋譜のダウンロードができなさそう。でもポート80はapacheが使っている。やはりconfig.propertiesを変更しないとだめかな。あ、そうかjarはそのままでconfig.propertiesだけ別のを優先にすればいいのかな。ということで以下のような手順でいけそう。

 $ unzip cgoban.jar org/igoweb/igoweb/config.properties
 $ vi org/igoweb/igoweb/config.properties (defaultHostをlocalhostに変更)
 $ java -cp .:cgoban.jar org.igoweb.cgoban.CGoban

=== [c]fork()とfflush()
fork()する前にfflush(stdout)しておかないと変なことになるなぁ。数分だけハマった。

== 20051206

=== [debian]w3m UTF-8
w3mmeeを使っていたが、普通のw3mでもUTF-8のページが表示できることを今頃気付いた。タブブラウザとしての機能も使いたいので、w3mmeeをやめてw3mに戻そうかな。これはUTF-8のテストページ http://www.w3.org/2001/06/utf-8-test/UTF-8-demo.html 。すごい、UTF-8なmlterm上のw3mで韓国や中国のYahooとかがちゃんと表示される。ページによっては、ページ切り替えのときにちょっとゴミが残るときがあるけど、まあ使えるレベル。たぶんUTF-8だと●とかが半角のフォントで表示されるのが原因と思われる。

== 20051207

=== [uim]KZIK
みのりさんのページ http://taffy632.blog24.fc2.com/ でKZIKについて紹介されていた。どうもありがとうございます。がんばってKZIKを完成させないと...。

== 20051208

=== [vim]TABや改行を見た目で分かるようにする
set listでいける。set listchars=でカスタマイズ可能。例えばset listchars=eol:$,tab:+-のような感じ。

=== [vim]vim --servername vim
vim --servername vimでvimを立ち上げておき、vim --remote filenameでそのファイルを編集できる。

== 20051209

=== [game][ajax]スーパーマリョ
Ajaxとは関係ないかもしれないけど、こんなの http://www.janis.or.jp/users/segabito/JavaScriptMaryo.html を見つけた。

=== [c]シグナル
signal(SIGPIPE, sighandle) ... すぐ忘れるのでメモ。

== 20051212

=== [uim][debian]uim 0.4.9.1-1
sidでリリースされた。またもやKZIK版のuimをビルドしないと...。ちなみにMLの方では1.0.0がリリースされたとのメールがあった。SKKの打ち間違い対策は非常にありがたい。しかし、自分でdebianパッケージ作るのも大変なのでしばらく待つことにする。

=== [debian]デバイスドライバ確認ページ
メモ http://kmuto.jp/debian/hcl/

== 20051213

=== [tDiary]Refererスパム
キター。これか。とりあえずRefererを非表示にしておこう。

=== [game]掲示板囲碁
自分で作らなくても、すでに存在していたみたい。あすなろ碁会所 http://ichigoweb.zive.net/~asunaro/ のボード碁ダウンロード http://ichigoweb.zive.net/~boardgo/ にある。将棋、オセロ、麻雀もあるようだ。でもあまり打たれていないなぁ。

=== [vim][chinese][english]発音記号
vimでC-kのあと、"a-"とか打てば発音記号が入力できる。詳しくは:help digraphsに。

=== [vim]マウスの中クリックでペースト
の代わりに、「"*p」が使える。「"+p」だとfirefox等でコピーしたテキストがペーストできる。

=== [vim]仮想上書き
:help vreplace-mode。要はgRと押すと全角文字はちゃんと2文字として扱ってくれるというもの。日本人はRをgRにマッピングしてしまってもいいかもしれない。

=== [vim][debian]辞書補完、シソーラス補完
パッケージになっているフリーの辞書やスペルチェックデータと組み合わせると便利かもしれない。プログラミング言語ごとの辞書とかもあると便利かも。適当に単語を抽出するスクリプトを書いて、それを使えばいいかな。いや、でも誰かがすでに作ってそうだなぁ。お、あるある。ここ http://members.jcom.home.ne.jp/advweb/build/howto/dictionary.html とかここ http://www.vim.org/ とか。

== 20051214

=== [debian][uim]uim-0.4.9 KZIK版
debパッケージを作った。

=== [debian]自分用ファイル
複数のPCで共有しておきたいファイルは自分用のdebパッケージを作って管理すればラクになるかも。パッケージを作る練習にもなるし、やってみるかな。

== 20051216

=== [diary]漢字出現頻度
2ちゃんねる板別スレッド一覧漢字出現頻度ランキング http://www.madin.jp/diary/?date=20051121 というのがあったのでメモ。

=== [debian]新規でパッケージ作成
前にもやったけど、もう忘れていたのでメモ。

 $ sudo apt-get install dh-make
 $ mkdir hoge-1.0
 $ cd hoge-1.0
 $ touch hoge
 $ cat >Makefile
 DESTDIR=debian/hoge
 clean:
     rm -fr $(DESTDIR)
 install:
     mkdir -p $(DESTDIR)/usr/bin
     cp hoge $(DESTDIR)/usr/bin
 [CTRL+D]
 $ dh_make -n -s
 [Enter]
 $ cd debian
 $ rm *.ex *.EX README*
 $ cd ..
 $ dpkg-buildpackage -us -uc -rfakeroot

== 20051220

=== [linux]LILO LBA
L 04 04 ...というメッセージが出て立ち上がらないと言われ呼ばれた。悩んだ結果、どうやら-lオプションが必要なことが分かった。今まではこの手順でいけてたのに、なんで
かなぁ。

=== [diary]タイピングKZIK
「たまにはKZIKの漢字を覚えないと」と思い、ちょっとタイピング練習。タイプウェルのlinux版が欲しいなぁ。AZIKにネイティブで対応してたらさらにいいかも。

=== [debian]firefox-1.5
sidに降りてきたのでインストール。おおー、速い。日本語のメニューがないけど自分が使う分には特に問題はない。パッケージ名はmozilla-firefoxだったのが今回からfirefoxに変わったようだ。

== 20051221

=== [linux]今日初めて知ったコマンド集
人に教えるには自分も勉強しなければならない。ということでメモ。

 newgrp 別のグループに切り替えるコマンド。
 watch 定期的にコマンドを実行するコマンド。watch -n 1 date みたいな感じで。
 whatis コマンドの要約表示。whatis -w "oo*" みたいに。

== 20051222

=== [diary]吹雪
今日はすごい吹雪。さむいさむい。

=== [linux]screen
:title hogeでウィンドウタイトルを変更、:number 0とかでウィンドウ番号を変更。:otherで1つ前のウィンドウに切り替え。

== 20051226

=== [music]上原ひろみ・トップランナー
12月29日(木)24時からNHKであるらしい。12/25にもあったのだが総集編と書いてあったのでてっきりただの再放送かと思っていたが、前回放送しなかった曲をオンエアしていたらしい。ということで12/29は忘れずに録画しておかないと。

=== [game]gnugoに5子で勝つ
gnugo-3.7.7に5子のハンデをもらい2回勝てた。次は4子にチャレンジ。

== 20051228

=== [game][debian]qgo
qgoがdebian sidにあったので入れてみた。碁盤が美しい。コウになったときの着手禁止点の処理がちょっとおかしいような気がするが、まあそんなに気にする問題でもないかも。

=== [game]gnugo level 10
level 10、19路5子で対局してみたが、ボロ負けした。

=== [linux]anacron
cronの代わりにanacronを使ってみる。サーバじゃないときはこっちの方が便利っぽい。

=end
