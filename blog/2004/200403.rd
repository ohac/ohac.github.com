=begin

== 20040306

=== [日記] PukiWikiでリニューアル

かなり久しぶりにサイトのメンテナンスをした。
メインのコンテンツが古いので、整理していきたい。

=== [PukiWiki] blog2とcalendar_viewer改造

h1やh2などの部分にリンクができてしまい、色が変になるのがいやだったので次のように変更した。

 calendar_viewer.inc.php
 //  $link = "<a href=\"$script?cmd=edit&amp;page=$r_page\">$s_page</a>";
     $link = "$s_page";

 blog2viewer.inc.php
 //    $source = preg_replace("/\*(.+)\n/", "*[[$1>$pagename]]\n", $source);

リンクがなくなってしまったので、h1やh2の部分以外でリンク部分を作りたい。

* calendar_viewerではなくblog2viewerを使うのが正しいようだ。知らなかった。というわけで、make_pagelink($m[1]) の部分を$m[1]に変更することで無事完了。 -- ohac 2004-03-06 (土) 17:14:25
* blog2プラグイン作者のページ > http://noldor.info/ -- ohac 2004-03-06 (土) 17:16:56

=== [PukiWiki] トラックバックのテスト

トラックバックのテストをさせていただきます。
トラックバックのテスト。トラックバックのテスト。
トラックバックのテスト。トラックバックのテスト。
トラックバックのテスト。トラックバックのテスト。
トラックバックのテスト。トラックバックのテスト。

* NG
  * ttp://t.blockblog.jp/trackback.php/sandbox/174/ 
  * ttp://app.cocolog-nifty.com/t/trackback/83221
* OK
  * ttp://blog.livedoor.jp/blog_guide/archives/25218.html 
  * ttp://trackbackyaro.cocolog-nifty.com/trackbackyaro/2004/01/2004.html
  * ttp://sandbox.bblog.jp/entry/174/

テストが済んだURLはhttpの部分をttpにしています。(2ちゃんみたいだ。)

* うまくいかない。ガクー。 -- ohac 2004-03-06 (土) 15:11:07
* 2つめに試したやつはうまくいった。わかったようなわからないような。 -- ohac 2004-03-06 (土) 15:20:55
* なんとなくわかってきた。rdf:RDFのタグのあるページのURLでリンクすればいいみたいだ。 -- ohac 2004-03-06 (土) 15:41:01

== 20040307

=== [PukiWiki] blog2がケータイなどで文字化け

「&#x5b」や「&#x5d」という表示がでてしまうことがあるようなので、blog2.inc.phpを「[ 」、「 ]」に書換えてみた。

=== [PukiWiki] pw-tools

pw-tools http://pukiwiki.sourceforge.jp/dev/index.php?%CA%DD%BC%E9%A5%C4%A1%BC%A5%EB これは便利そうだ。

=== [PukiWiki] showrss and tboff plugin

http://www.pukiwiki.org/index.php?%E8%B3%AA%E5%95%8F%E7%AE%B1%2F408

によるとshowrssプラグインを使うときはそのページのトラックバックをOFFにしておかないといけないようだ。tboffプラグインもパッケージ化するときに含めるようにしよう。

=== [PukiWiki] vim2html

vim2htmlプラグイン http://pukiwiki.sourceforge.jp/dev/index.php?cmd=read&page=PukiWiki%2F1.4%2F%BC%AB%BA%EE%A5%D7%A5%E9%A5%B0%A5%A4%A5%F3%2Fvim2html これは面白い。試しに使ってみたい。

=== [日記] 国内blogサイト

どんなのがあるか調べてみた。

http://internet.watch.impress.co.jp/static/link/2003/12/26/blog.htm

この記事にいろいろリンクされていた。

== 20040308

=== [PukiWiki] showrss and tboff

tboff を使ったページで showrss を使ってみたがうまくいかず、
結局 plugin_showrss_get_rss() の先頭で global $trackback; $trackback=0;
とすることにした。実験ではうまくいったけど、まだ外向けへの環境(このサイトなど)
では試していない。

=== [日記] 過去ページの整理

* 掲示板
  * blogのコメント機能があるので不要と思われるので消した。
* トップページ
  * ページビューランキングが閉鎖されたので削除。
  * からしれんこんランキングも削除手続きし、削除。
  * Java Web Ring も削除手続きし、削除。
* リンク集より
  * アクセス数ログ削除。
  * Value Commerce削除。
  * リンク切れ。煙の園削除。

休み時間が終ったので続きは後で。

続き。(17:30より)

* リンク集の掲示板関連、全てリンク切れのようなので削除。
  * CHAU-Bar BBS - ttp://sz.redbit.ne.jp/~mkt/bbs/malchbbs/iconbbs.cgi?log
  * プログラミング同好会 - ttp://www.lounge3.net/program/
  * kajikaji-Board - ttp://cvnweb.bai.ne.jp/~kajikaji/yybbs/yybbs.cgi
  * Java BBS - ttp://www11.tok2.com/home/third/cgi-bin/java_bbs/bbs.html
  * Ami's Cyberhome - サポート掲示板 - ttp://amifriend.virtualave.net/software/cgi-bin/yybbs/yybbs.cgi
* リンク集のYahoo!オークション、別にここにある必要もないので削除。
* リンク集のMYお気に入りコミュニティ、リンク切れなので削除。
* リンク集の検索関連、別にここにある必要もないので削除。
* リンク集のStudio C、The Road To Progr@mer、リンク切れなので削除。
* リンク集のソフト開発者の為のサーチエンジン、リンク切れなので削除。

とりあえずリンク切れはなくなったぞ。
ちょっとしたリンクはweblogで紹介するほうがメンテナンスが楽なのでいいよな。
更新されてるかどうかのチェックはアンテナソフトを導入したほうがいい。
そのうちやっておこう。

=== [PukiWiki] 変更点整理

いろいろ触ったので、diffを取って整理しよう。

* image/bar.gif を追加。(見た目。)
* skin/user.css を調整。(見た目。)
* skin/user.skin.*.php を調整。(見た目。ただし$trackbackと$refererの値がうまく読めていないようなのでtrackbackもrefererも固定で表示されるようにした。)
* trackback/ がなぜかパーミッションが変わっていたので、chmod 777を実行。
* user.ini.php を $trackback = 1, $referer = 1, $autolink = 0, $usefacemark = 0 に。ただし、このやりかただと skin にうまく引き継げていないようだ。調査が必要。
* plugin/blog2.inc.php
  * PLUGIN_BLOG2_* を自分用に変更。(ユーザ設定部分は別ファイルでできるようにしたい。)
  * &#x5b, &#x5d を [, ] に変更。
* plugin/blog2navi.inc.php
  * notblog2page のエラーは出ないように変更。
* plugin/blog2viewer.inc.php
  * make_pagelink($m[1]) を $m[1] に変更。
  * preg_replace を以下のように改行を含め、またリンク部分も変更。

 - $source = preg_replace("/\n\*(.+)\n/", "\n*$1 [[*>$pagename]]\n", $source);
 + $source = preg_replace("/\*(.+)\n/", "*[[$1>$pagename]]\n", $source);

* plugin/referer.inc.php
  * referer_ignore_check($url) のときは continue し、表示しないように変更。

あと、気になったのが PukiWiki で diff を取ったときに色で差分が表示されるが、w3m で見ると色がわからない。なんとかしたい。

== 20040309

=== [PukiWiki] tboffがあるときtb_send()を呼ばない

このパッチでどうだろう。(file.php)

 +if (!preg_match("/^#tboff/",$postdata)) {
      tb_send($page,$lines);
 +}

=== [PukiWiki] vim2htmlよりrefpreプラグイン

vim2htmlよりrefpreの方が良さそう。

vim2htmlは自動でvimのコマンドが実行され、HTML化されるのかと思っていたのだが、どうやら手動であらかじめHTML化してそれを添付する必要があるようだ。

課題としては色をもうちょっと見やすくするのと、自動でvimを呼び変換してそれを表示するといったところか。

=== [日記] リンク集削除

リンク集を削除した。以下がリンクされていたページたち。

* オンラインソフト
  * @Nifty http://www.nifty.com/
  * Vector http://www.vector.co.jp/
  * 窓の杜 http://www.forest.impress.co.jp/
  * NetDeSoft http://www2s.biglobe.ne.jp/~takao777/
  * @ガッテン http://park1.wakwak.com/~gatten/

* 設計全般
  * 川村渇真の「知性の泉」 http://www.st.rim.or.jp/~k-kazuma/
  * ソフトウェアエンジニアのためのホームページ http://village.infoweb.ne.jp/~fwgf2942/maim2.htm

* Java言語
  * java.sun.com http://java.sun.com/
  * Java House ML http://java-house.etl.go.jp/ml/

* プログラマー関連
  * パソコン初心者の館(Javaとパズルの世界) http://www.pro.or.jp/~fuji/index.html
  * とりあえずホームページ(IconManなど) http://sira.jp/soft/

* HTML
  * HTMLのチェック http://openlab.ring.gr.jp/k16/htmllint/htmllint.html

リンクが多いとtrackback処理が重いせいか登録に時間がかかるなぁ。 -- ohac 2004-03-09 (火) 17:44:34

== 20040310

=== [PukiWiki] cvs.sourceforge.jp

sourceforge.jpから最新のソースをチェックアウト。

 cvs -d:pserver:anonymous@cvs.sourceforge.jp:/cvsroot/pukiwiki login
 # パスワードはナシでOK。
 cvs -z3 -d:pserver:anonymous@cvs.sourceforge.jp:/cvsroot/pukiwiki \
     co -d sf.pukiwiki pukiwiki
 # sf.pukiwiki というディレクトリにチェックアウトする例。

これで cvs diff とか cvs update が使えるので便利になるかも。

r1_4_2のタグでupdateすれば1.4.2のソースになるのかな。

=== [PukiWiki] データ部とスクリプト部を分けるには

ディレクトリを作り、そこに以下のようなphpを作成。

 <?php
 require('/home/hoge/pukiwiki/pukiwiki.php');
 ?>

/home/hoge/pukiwiki の部分はpukiwikiの本体のあるディレクトリを指すようにする。

たとえば /home/hoge/public_html に pw というディレクトリを作成したとすると、
ここに /home/hoge/public_html/pw/pukiwiki.php のように作ればよい。

そしてこのディレクトリ pw に attach backup cache counter diff trackback wiki を作成し、chmod 777 を実行。

pukiwiki.ini.php を pw にコピーし、PLUGIN_DIRを/home/hoge/pukiwiki/pluginに設定。

/home/hoge/pukiwiki の skin, image, pukiwiki.png, ja.lng を pw にシンボリックリンクする。

/home/hoge/pukiwiki の init.php, default.ini.php はそれぞれ UA_INI_FILE, SKIN_FILE をパス指定するようにすれば完成。

これでパッケージ化へとまた一歩進んだ。

== 20040311

=== [日記] ゲームファンタジスタ

昨日はゲームファンタジスタ http://www.planning24h.jp/gf/ やファブォリテ http://shaula.hiho.jp/ というサイトの動画を見ていて夜更ししてしまった。おかげで今日は非常に寝むたい。世の中にはすごい(ひまな)人がいるもんだ。

== 20040312

=== [ソフト開発] CVSブランチと日付指定

http://nekop.nondakure.jp/diary/?date=20030717

ここによると

 CVSのお話。updateのとき、-rでブランチ指定するとSticky Tagが付く。幹で-Dで日付
 指定をするとSticky Dateが付く。では、ブランチ上の過去のソースを取り出すため両
 方指定したらどうなるかというと、Sticky Tagは付くがSticky Dateは付かない。しか
 し、ちゃんと指定した日付のソースは取得できる。Sticky Dateが付いていないため、
 もう一度cvs updateすると、最新版が落ちてくる。

とのこと。大変勉強になりました。

=== [日記] ガソスタで

ガソスタかガソスタかどっちなのか。というのはさておき。
ヘッドライトが片方切れていたのを店の人に指摘されたので、交換をお願いした。
するとどうも車幅灯の片方も切れていることも判明。それも交換してもらう。

おまけにオイル交換もしたほうがいいと勧められるが、これはしなかった。
ちなみにほかのガソスタでは水抜きを入れたほうがいいと言われている。
燃費が落ちてきたので、やらなアカンなあとは思っているのだが...

=== [PC] 画面がまっくろ

家のPCでなんか画面が紫っぽいのでビデオカードのコネクタあたりを触ってみたら、
画面が消えてしまった。

その後、いろいろと触ってみたがBIOSの画面も出ない状態になってしまった。最悪だ。

=== [日記] 銀河がいっぱい

昨日、ハッブル宇宙望遠鏡で撮った写真を見てちょっと感動してしまった。

http://hubblesite.org/newscenter/newsdesk/archive/releases/2004/07/

Hubble Ultra Deep Field (超深宇宙)というらしい。

=== [ゲーム] 大阪で6ニムトなどができる施設

仲間うちで盛り上がるカードゲーム「6ニムト!」であるが、大阪吹田にこれを含んだいろいろなゲームができる施設ができるらしい。

http://www.famitsu.com/game/news/2004/03/12/103,1079066754,22513,0,0.html

http://www.watch.impress.co.jp/game/docs/20040312/bee.htm

http://www.sega.jp/

== 20040313

=== [日記] 友達の輪。(ミクシィとorkut)

ミクシィ http://mixi.jp/ というのに誘われたので入ってみた。
クチコミで広がる友達ネットワークといった感じか。
(リアルな友達でもし入ってみたいという人は声をかけてちょうだい。)

ちなみにorkutというにも誘われたのだが、操作方法が間違っているためかなぜかメールが来ない。

== 20040314

=== [日記] orkutに入る

orkut http://www.orkut.com/ っていうのに参加した。
知っている人がいないか探してみたがほとんど見つからず。
やっぱり、コンピュータ関係の仕事をしている人から先に人が増えていくことが多いのだろうか。

* OsakaとJapaneseのコミュニティが面白いな。英語はある程度読めるけど、書くのはほとんどだめなので、残念。もうちょっと修行が必要だ。 -- ohac 2004-03-14 (日) 23:24:15

== 20040316

=== [linux] マルチセッションなCD-R

http://www.is.titech.ac.jp/~yuki/memo/cd-r3.html が参考になる。

cdrecordの-multiオプション。mkisofsの-Cオプションがミソということか。

=== [日記] モデム死んでいた

昨日はモデムが死んでいて、Webにアクセスできませんでした。
電源切り入りで復旧。

どうでもいいけど、「電源入り切り」っていうのと「電源切り入り」とどちらが正しいのだろうか。

== 20040317

=== [english] The cream puff

今日から英語日記を書こうと思う。

I'm going to write a diary in English from today.

今日、本屋にいった。
欲しい本がなかった。
買ってきたシュークリームがおいしかった。

I went to the bookstore.
The book I'm looking for wasn't there.
The cream puff I bought was really good.

=== [linux] scの使い方

テキストベースの表計算ソフト「sc」を使ってみる。

http://www.rbt.his.fukui-u.ac.jp/~naniwa/pub/sc.html と
http://www.asahi-net.or.jp/~AW4T-SGFJ/japana/csv.html と
http://www.t-kita.net/spreadsheet/sc.html と
http://senzai07.poly.kit.ac.jp/~iwata/SpreadsheetSc.html 
が参考になった。

CSVを読み込むには以下のようにすればいいみたい。

 psc -d, -k <hoge.csv >hoge.sc
 sc hoge.sc

CSVをソートし、全部文字列扱いにして左寄せにするにはこんな感じ。

 sort -t , -k 4 -k 2 hoge.csv|psc -L -S -d , -k >hoge.sc

っていうか、sc本体でのソートのやりかたがわからんのです。"/"を使うのかな?

== 20040318

=== [english] My PC has been broken

これらのブログとウェブサイト(以下)は英語の勉強に役に立ちそうだ。

These blogs and web sites (as follows) are helpful for me to improve my English skill.

* http://koho.ktplan.jp/blog/mt/
* http://blog.livedoor.jp/english99/
* http://www.eigoden.co.jp/
* http://www.mag2.com/m/0000067218.htm

今日は車でNHKのラジオ英会話番組を聞いた。
すでに何回も聞いた内容なので新しいのが聞きたくなった。
でも、今はPCが壊れているのでMP3プレイヤに転送できない。
早く修理しないといけないなあ。

I was listening to the NHK's English conversation program in my car today.
I wanted to listen to a next program because I've listened many times.
But I can't transfer it to my MP3 player because my PC has been broken now.
I have to fix it sooner.

=== [Ruby] Rubyリファレンス

普段あまり使わない言語はすぐに忘れてしまう。
Rubyのカテゴリを追加して、いろいろとメモしていこう。

リファレンス http://www.ruby-lang.org/ja/man/

(ちなみに普段使う言語というのはJavaやC/C++のことです。)

=== [linux] scの使い方(sortなど)

scでソートする方法がわかったのでメモ。

/s で範囲選択開始。カーソルを移動(#$とタイプすれば全範囲を選択)しTAB で決定。
"+$C+$B"のような感じでソート方法を指定。('"'もタイプする必要あり)
+は昇順、-は降順。$は文字列ソート、#は数値ソート。CやBというのは列の名前。

その他、いろいろメモ。

irで行を追加, icで列を追加

Eで現在のセルの内容を編集(vi風キーバインド)。全角文字は2文字として扱われ、とても不便。

f 45 0 0 で今の列を45文字に設定。

TERM=ktermになっていると反転や色がうまく動作しない。
export TERM=vt100でセットし、ファイルを開けると全角文字が文字化けする。
kterm上でCTRL+マウス右クリックし「完全リセットを行う」を選択。CTRL+Lで表示される。うーん、なんて面倒なんだろう。

=== [日記] コーヒー

コーヒーについて語って下さい。 http://yukiboh.moo.jp/weblog/archives/000315.html 
へトラックバック。

トラックバックって、あんまりやったことないので自信がないが試しにやってみる。

コーヒーはかなり好きだが、面倒くさいので私はもっぱらモンカフェみたいなインスタントドリップ方式のやつを飲んでいる。ちなみに会社ではコーヒー会員というのがあり、1ヶ月1000円で飲み放題である。しかし、電気ポットに入れているのであまり衛生的ではなさそう。会社では1日に3回ぐらいは飲む。休日は1回ぐらいかな。

* ポットに入ってるコーヒーって煮詰まってるのが多いから最後の方に飲むと胃がムカムカするんですけど、仕事してると息抜きっていうかそんなコーヒーでも飲みたくなるんですよねー。 -- 魚政 2004-03-18 (木) 09:56:07
* そうそう。私はタバコを吸わないので、息抜きというとコーヒーになってしまいます。おいしくなくてもなんとなく落ち着きますよね。 -- ohac 2004-03-18 (木) 12:31:15
* 電気ポットですか〜。昔バイトしてたお惣菜やさんでは、煮物とかに使う大鍋にお湯を沸かしてインスタントコーヒーを入れてましたが…ポットも鍋も苦手です（笑） -- ゆき坊 2004-03-18 (木) 16:23:19
* インスタントはあまり飲まないのですが、たまにもらいもののインスタントコーヒーがあったりするので、めんどくさいときはこれも飲むこともありますね。缶コーヒーよりはインスタントの方が好きです。 -- ohac 2004-03-19 (金) 00:40:55

== 20040319

=== [PC] Adobe Reader SpeedUp

Adobe Reader SpeedUp http://www.forest.impress.co.jp/article/2004/01/13/adobereaderspeedup.html  というソフトがあるらしい。

=== [english] White huge tower?

今日はテレビドラマ「白い巨塔」を観た。
黒木瞳の演技は良かった。
ところでごみを捨てに行った。
だって今日はごみの日だから。

I watched TV drama "Shiroi Kyotou". (White huge tower?)
Hitomi KUROKI was pretty good.
By the way, I took the gabage out.
Because it is a gabage collection day today.

間違いを見つけたら訂正してね。

Please correct a mistake if you found it.

=== [Ruby] curses.so

RubyでCUIなアプリを作ろうと思う。
何を作りたいかというと英作文の練習プログラムである。
和文が表示され、キーを押すと答を1文字ずつ表示するような仕組みがほしいのである。

画面制御は curses.so というのが使えるようだ。しかし、私のDebian PCには入っていなかったので、

 apt-get install libcurses-ruby

としてインストールした。

 require 'curses.so'
 Curses.init_screen
 Curses.noecho
 ch = Curses.getch
 Curses.addstr('input ch = ' + ch)

みたいな感じで使えるようだ。

=== [PukiWiki] そうかrss10か

mixiで日記一覧がうまく表示されないと思っていたが、PukiWikiの場合どうやら"?cmd=rss"ではなく"?cmd=rss10"にすればいけるみたい。しかし、RSSとかRDFとかややこしいなあ。ようするにバージョンの違いということか。

=== [ゲーム] カタンがCAPCOMから発売

カタンがCAPCOMから発売 http://www.watch.impress.co.jp/game/docs/20040317/catan.htm  だそうだ。コンパクトなやつは結構安い。

== 20040323

=== [linux] Debianでリモートプリンタの設定

昨日やったことの整理。

 apt-get -t sarge install gs-ja

gs-ja 7.07-4を取ってくる。これにlips4vがある。

/etc/printcap の rlp のコメントアウトされている部分を有効にし、
rmにホスト名(IPアドレス)、rpにプリンタ名を設定する。

 /etc/printcapの例
 
 rlp|Remote printer entry:\
     :lp=:\
     :rm=192.168.0.1:\  <--ここと
     :rp=lpt1:\         <--ここを編集
     :sd=/var/spool/lpd/remote:\
     :mx#0:\
     :sh:

lpr -Prlp filename でテキストを印刷すればとりあえず何か出力される。
このとき /var/spool/lpd/remote を見ると状況がわかる。

さて、職場のプリンタは Canon LIPS IV なのだが、どうしたものか。
いろいろググってみてとりあえず /usr/bin/gsfilter というのを作成する。

 #!/bin/sh
 gs-ja -q -dNOPAUSE -sDEVICE=lips4v -sPAPERSIZE=a4 -sOutputFile=- -

chmod +x /usr/bin/gsfilter しておく。
printcapに :if=/usr/bin/gsfilter: を追加して完了か。
/etc/init.d/lpd restart も実行しておく。

まずpsを作成しよう。

 unset MPAGE
 mpage sampletext >sampletext.ps
 gv sampletext.ps

で確認したが、日本語が文字化け。

gv /usr/share/doc/gs/examples/cjk/gscjk_aj.psでも文字化けしているので、これはgvの問題だと判断。

 apt-get install gsfonts-*
 apt-get install gs-cjk-resource cmap-adobe-japan1 psfontmgr

を実行。(gsfonts-* は関係ないかもしれない。)
gscjk_aj.psは正常に表示されるようになった。
しかし、mpageで変換したやつはまだ文字化けしている。

Vine Linuxのときはテキストをpsに変換するのにmpageを使っていたが、debianのmpageはなぜかうまくいかないのかも。と思い、a2psとa2ps-perl-jaを取ってくる。

 apt-get install a2ps-perl-ja a2ps

これでa2psjで変換したpsは日本語が表示された。a2psの方は文字化け。
これを先程のgsfilterに通してみる。

 gsfilter <sampletext.ps >sampletext.lips
 lpr -Prlp sampletext.lips

ようやく印字ができた。
しかし、これでは不便なので入力フィルタを自動的に通すようにしたい。
いろいろやってみたが上手くいかない。
どうもリモートプリンタの場合、printcapの :if=/usr/bin/gsfilter: が
無視されるようだ。:lpr_bounce: を追加してもダメだった。

結局、以下のようなprintcapとgsfilterの組み合わせでなんとかなった。

 lp|Generic dot-matrix printer entry:\
         :lp=/dev/null:\
         :sd=/var/spool/lpd/lp:\
         :mx#0:\
         :sh:\
         :if=/usr/bin/gsfilter:
 
 rlp|Remote printer entry:\
         :lp=:\
         :rm=pr930ex:\
         :rp=lpt1:\
         :sd=/var/spool/lpd/remote:\
         :mx#0:\
         :sh:

 #!/bin/sh
 /usr/bin/gs-ja -q -dNOPAUSE -sDEVICE=lips4v -sPAPERSIZE=a4 -sOutputFile=- - \
               | lpr -P rlp


ようやく lpr sampletext.ps で印字できるようになった。

今後の課題:
* magicfilterとは何なのか。
* a2psjの使い方。
* lpr より lprng の方がいいのか。

=== [linux] sortの使い方

sortの使い方。

tオプションでセパレータを指定できる。たとえばCSVの場合、-t ',' みたいなオプションを付ける。

kオプションでどこからどこまでをキーにするかを指定。たとえば2つ目以降をキーにするときは、-k 2とする。2つ目から3つ目までのときは-k 2,3、2つ目だけのときは-k 2,2とする。キー文字列の前後の空白を除く場合はbを付け、たとえば-k 2b,2bのように指定する。

kオプションは複数指定可能。-k 2b,2b -k 4b,4b のようにすれば2つ目、4つ目の順にソートする。

 sort -t ',' -k 3b,3b -k 5b,5b inputfile >outputfile

みたいな感じである。

=== [vim] ファイルの再オープン

:e で今のファイルを再オープンすることができる。
文字コードや改行コードを指定してから:eを実行すると便利。

 例
 :set fileformats=mac
 :set fileencodings=sjis
 :e

== 20040323

=== [vim] 文字コードの指定

vimのfileencodingやfileencodingsでは iconv --list で表示される文字コードが
指定可能。以下にいくつか例を。

 set fileencodings=iso-2022-jp,utf-8,cp932 (or windows-31j)

SJISの機種依存文字が扱える。しかし、「〜」などが文字化けする。
文字が少ないとEUCファイルを半角カタカナだと判断されてしまうことがある。

 set fileencodings=iso-2022-jp,utf-8,sjis

SJISの機種依存文字が扱えない。「〜」などは正常に扱える。
文字が少ないとEUCファイルを半角カタカナだと判断されてしまうことがある。

 set fileencodings=iso-2022-jp,utf-8

SJISが扱えない。
そのかわり文字が少ないEUCファイルを変にSJISとして扱うことはなくなる。
私は現在はこれを使っている。

* あ、いい忘れてたけどこれはlinuxでのvimの話です。 -- ohac 2004-03-23 (火) 12:46:56

== 20040326

=== [PC] PC復活

AGPのビデオカードが抜けかかっていたようだ。
そもそもmicro ATXのケースにATXのマザーを無理矢理入れていることに問題がある。
買い間違えた私が悪いのですけどね。
マザーはケースの中で宙ぶらり状態である。
あまり衝撃を与えるとまた接触不良になるかもしれないので注意が必要だ。

=== [linux] j2se-package

Java開発環境の j2sdk を debian のパッケージにしてしまうツール mpkg-j2sdk が j2se-package という名前に変わっているようだ。
Web ページも移動したのか/etc/apt/sources.listを次のように変更した。

 #deb http://www.stud.uni-karlsruhe.de/~ude2 debian/ <-- これが元のURL
 deb http://nosid.de/z42 debian/                     <-- これが新しい方
 #deb-src http://nosid.de/z42 debian/                <-- これが新しい方(src)

apt-get update, apt-get install j2se-package でインストール。

その後、j2se-package の引数に Sun の j2sdk を指定すればパッケージの完成。
(いろいろ聞かれるが、適当に答えるとよい。)

=== [linux] mozillaとsylpheedをverup

mozilla を Debian/sarge のやつにした。
 apt-get -t sarge install mozilla-locale-ja
mozillaを立ち上げ、日本語の設定をして再起動。
メニューが日本語になり、Googleの検索バーも日本語が使えるようになった。

sylpheedもsargeのものにupgradeした。
プレビューしただけでは既読マークが付かないようにする設定が増えていたのでこれを設定した。

sylpheed-claws ってのもあるな。これはなんだろうか。

=== [linux] マウスのスクロール用ボタン

/etc/X11/XF86Config-4 を以下のように変更したらいけるようになった。

 Section "InputDevice"
 Identifier  "Mouse0"
 Driver      "mouse"
 Option      "Protocol" "IMPS/2"           <--- ここと
 Option      "Device" "/dev/input/mice"
 Option      "Button" "5"                  <--- ここと
 Option      "ZAxisMapping" "4 5"          <--- ここが重要みたい
 EndSection

== 20040327

=== [linux] debianセットアップ完了

やっとdebianのセットアップが大体終わった。

セットアップに苦労したが、あとはapt-getでいろいろな最新ソフトを試せるので楽しみだ。

=== [日記] mixiがメンテナンス中

のようだ。
23時以降にアクセス可能になるとのこと。

=== [日記] プラネタリウムソフト

#ref(kstar3.png)

Debian linuxのKDEにKStarsというアプリがある。
これを使うと現在の星の位置などが簡単にわかる。

しかも、星や星雲などを右クリックするとインターネットから写真をダウンロードしてきて表示する機能まである。これはおもしろい。

== 20040329

=== [日記] CD-RW

12倍速対応のCD-RWを5枚買った。

xcdroastを使って試しに書き込んでみた。~
これまではcdrecordコマンドを使ってたけどやっぱりGUIがあると便利やね。

== 20040330

=== [日記] NHK英語番組

だいぶNHKのTV英語番組の内容が聞きとれるようになってきた(気がするだけ?)。
約1年間聞き続けた成果かも。
しかし、英作文やスピーキングはぜんぜんだめです。

来週からは新学期(NHKの話)なのでまた1年間はがんばろうと思う。

=== [linux] 動画を見る

動画もWindowsに頼らずに見れるようにしたいのでいろいろ調べていた。
KDEのviewerなどで見ると白黒になったりしてどうもよろしくない。
smpeg-plaympegのパッケージにあるplaympegが安定してそうだ。

その他のcodecも見たいのでmplayerを試すが途中で挫折。また時間があればチャレンジしたい。

Real Player8と9も試したが画面が表示された後で固まってしまう。RedHatならちゃんと動くのだろうか...

=== [linux] 認証の設定ミス(apache)

知らぬ間に内輪で使用しているページが認証なしでアクセスできるようになっていた。
やばいやばい。(そんなにやばいものがあるわけではないが。)

httpd.conf を

 <Directory /home/*>
 AllowOverride AuthConfig
 </Directory>

のように変更した。
認証が必要なページを移動したので.htaccessも変更が必要になっていた。

 AuthUserFile /home/hoge/hoge/passwd
 AuthGroupFile /dev/null
 AuthName "Please enter username and password"
 AuthType Basic
 require valid-user

こんな感じ。

=== [linux] UDFパケットライトCD-RW

簡単にCD-RWが使えるようにUDF file systemに挑戦しているがうまくいかない。
keywordはudf.o, mkudffs, cdrwtool, pktsetupなど。

=== [ソフト開発] coff2bin

http://www.dce.bg/~vladitx/tms320c54x/

ここにcoff2binがある。TIのcoff2というファイル形式を別のフォーマットに変換するためのツールのようだ。

=== [linux] dosemu

apt-get -t sarge install dosemu dosemu-freedos xfonts-dosemu
xdosemu 又は dosemu で実行。  
D: に移動すると ~ が見える。 

xdosemuはxmodmapのキーカスタマイズが効かないのでkterm上でdosemuを使う方が便利そうだ。

ちなみにTIのDSPコンパイラがdosemu上で動作した。

=== [ソフト開発] linux on SH-4

今日の仕事。

Linux 2.4.22を自社製のSH-4で動作するようにがんばっている。

 Linux version 2.4.22 (ohashi@ohashigw) (gcc version 3.0.3) #15 2004 3 30 17:05:15 JST
 On node 0 totalpages: 1024
 <1>bootmem alloc of 45100 bytes failed!
 <0>Kernel panic: Out of memory
 <0>In idle task - not syncing

ここまで動いた。

とりあえずシリアルポートにprintkの出力が確認できるようになったので一安心。

=== [linux] lsof

lsof で open 中のファイル一覧が見れる。デバッグに便利そうだ。
umount できないときの調査にも使えるかな。

=== [linux] netcat(nc)と自動処理

netcat を入れてみた。
 netcat hostname port
telnet のように使うには netcat hostname 23 とする。 

 (echo 'hoge';sleep 1;echo 'hoge') | nc hostname 23 -q 10

のようにすればタイミングを制御しながら文字列を送信できる。
telnetでも同じようなことはできそうだ。

=== [java] thread dump

JavaHouse MLより。

 |Windows NT系|CTRL+Break|
 |linux系     |kill -3   |

でスレッドダンプが取れるらしい。
しらなんだ。

=== [Ruby] 英作文練習用プログラム

#ref(eisaku.rb)

* ruby と libcurses-ruby が必要。
* 使い方: ./eisaku.rb filename
* キー操作
  * L 1文字ずつ答を見る
  * J 次の問題へ
  * Q 終了
* 問題ファイルのフォーマット
  * 和文、英文、空行という順番にならべる。

問題ファイルの例。

 これはペンです。
 This is a pen.
 
 疲れた。
 I'm tired.

* Curses.init_screenでは画面が消えないことがあるな。Curses.clearを使うのが正解かな。 -- ohac 2004-03-31 (水) 00:08:19

== 20040331

=== [linux] CD-Rはイジェクトが必要

CD-Rに追記したあとはいったんイジェクトしないとうまくmountできないようだ。

ちなみに

 mount -o session=0 /cdrom
 mount -o session=1 /cdrom

とかでセッションを選択してmountできる。

=== [english] wget is helpful

「まぐまぐ」のメールマガジンにはいろいろと英語のメールマガジンがある。
wgetを使えばバックナンバーを一括ダウンロードが可能だ。
例えば「今日のメール英語表現」の場合は
 wget -r "http://backno.mag2.com/reader/Back?id=0000067218"
と実行すればOKである。

There are some English educational mail magazine on http://mag2.com/ .
It is possible to get all backnumbers automatically if you use "wget".
For example, in case of "kyou no mail eigo hyougen".
You can do it by using the command below.
 wget -r "http://backno.mag2.com/reader/Back?id=0000067218"
