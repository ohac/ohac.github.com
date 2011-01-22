=begin

== 20041004

=== [linux] telnetrc

telnetで他のlinuxサーバやOS-9サーバに入ったとき、日本語が入力できなかった。

調べたところ、telnet の -L オプションで解決した。

ホームに .telnetrc というファイルを以下のように作成すれば -L オプションを省略できる。

 DEFAULT
  set outbinary

DEFAULTのところはサーバ名でもよいらしい。

== 20041005

=== [IM] Anthy prime sumika

Anthyとprime、sumikaを試す。インプレッションを以下に。

* Anthy
  * なかなか使いやすくてよい。SKKユーザじゃない人にはおすすめ。
  * AZIKも使える。
  * かな入力も使える。(ちなみにuim-skkでは使えないようだ。)
* prime
  * 予測変換が面白い。
  * さすがにちょっと重い。
  * AZIKは使えないようだ。
* sumika
  * ~/.uimを上書きされてしまうので注意。

やっぱり私にはuim-skkが一番しっくりくるな。

ところで uim-helper-toolbar-gtk はログアウト時に kill されないのかな。
とりあえず .xsession に kill uim-helper-toolbar-gtk を入れてみた。
それと uim-helper-toolbar-gtk-systray をKDE上で使うと今のモードが見えない。
しかたないのでsystrayじゃない方を使っている。

* killallはうまくいかなかった。KDEの設定でセッションを保存しないようにしたらいけた。 -- ohac 2004-10-05 (火) 18:16:11

=== [linux] telnetrc改

.telnetrcをさらに変更。これで環境変数も思いのまま。

 DEFAULT
  environ define TERM ansi
  set outbinary

== 20041006

=== [linux] dotfiles.com

いろんなサンプル設定ファイルが公開されているサイト。

http://dotfiles.com/

うーん。mutt-utf8の日本語環境での設定がわからん。orz

=== [linux] ssh-agent

む、ssh-agentがいつのまにか自動で立ち上がるようになっている。

eval `ssh-agent` を実行する必要はなくなったのか。これは便利だ。

これでssh-addするだけで全ターミナルでsshがログインなしで使える。

== 20041007

=== [linux] mutt+rxvtでcolor

muttで文字が灰色になるのはなぜだろうと調べていたら、
.XresourcesでRxvt*color7: #a9a9a9と定義していたのが原因だと判った。

Rxvt*colorは0〜15まで定義しているのだが、muttでは0〜7しか使用できないように思える。

=== [vim] mutt+vimで文字コード問題

muttでメールを新規作成するときに文字コードがうまくいかなかったのはどうやらvim側に問題があったようだ。

vimの設定でfileencodingsにiso-2022-jpやsjisを含めたりするとうまくいかないことがあった。新規作成でiso-2022-jpになり、再編集時はsjisと認識されたりしていた。

fileencodingを設定しなければ問題ないので、.mutt/muttrcを以下のようにして解決した。

 set editor="vim --cmd 'set fileencoding=euc-jp'"

さらに .vimrc を以下のようにした。

 if &fileencoding != 'euc-jp'
   set fileencodings=iso-2022-jp,utf-8,sjis
 endif

ちなみにvimの-cや--cmdオプションはvi -c 'hogehoge'という風にはできないようだ。必ず、vim -c 'hogehoge'のようにしなければならない。

== 20041008

=== [mutt] fetchmail procmail

sylpheedからmuttに移行しようと勉強中。

imgetでメール受信しようと思ったが、ちょっとややこしそうだったので、fetchmail+procmailを久しぶりに使ってみることにした。

.fetchmailrc はこんな感じ。練習中なのでkeepにしてある。

 defaults proto pop3
 poll mailserver1
   user "hogehoge"
   pass "password"
   mda "/usr/bin/procmail"
   keep
 poll mailserver2
   user "hogehoge"
   pass "password"
   mda "/usr/bin/procmail"
   keep

.procmailrc はこんな感じ。

 LOGFILE=$HOME/MailMutt/procmail.log
 MAILDIR=$HOME/MailMutt/
 DEFAULT=$MAILDIR
 :0 c
 backup/
 :0
 * ^From:.*melma@
 DM/
 :0
 inbox/

ディレクトリ名を"/"で終わらせたらMaildir形式となり、newというサブディレクトリに保存されるようだ。前は "inbox/." みたいに設定していた。この場合は MH 形式になるようだ。(つまり inbox/{1,2,3} という感じになる。)

=== [mutt] muttに移行完了

やっとこさmuttに移行完了した。

操作にもちょっとずつ慣れてきた。

X-Faceのヘッダを表示できるようにしたいな。sylpheedはx-faceに対応していたのか。そんなこと今まで知らなかった。windowsのメーラーもx-faceに対応しているやつが結構あるみたいだ。

メールフォルダをgrep -i x-face で検索してみると、x-faceを使っているメールを1通だけ発見!

その画像はこんなんだった。→ （・∀・）

わざわざビットマップにしなくてもよいのでは(w

== 20041009

=== [linux] gpg keyserver

GPG公開鍵の送受信方法。

 gpg --recv-keys --keyserver hkp://keyserver.noreply.org:80 F9EDA275
 gpg --send-keys --keyserver hkp://keyserver.noreply.org:80 F9EDA275

会社の環境だとポート80(HTTP)しか通さないから、このような方法となった。

ちなみに F9EDA275 は私のIDです。

Webからだと、 http://keyserver.noreply.org/ で検索が可能。
11371ポートが空いていなくても大丈夫である。

== 20041012

=== [linux] OpenOfficeでメニューが文字化け

OpenOfficeでメニューが表示されない問題にずっと悩み続けていたが、ようやく解決した。

本屋でDebian sargeの本を立ち読みして知ったのだが、KDEなどのフォント設定をちゃんと日本語フォントに設定しておかなくてはならないらしい。

コントロールパネルで外観メニューのフォントをKochi Gothic 10に設定すると、ちゃんと表示されるようになった。よかったよかった。

=== [linux] antiword

MS-Word文書をテキストにするコマンド antiword が UTF-8 を扱えるようだ。
 antiword -m UTF-8.txt hoge.doc | lv -Iu -Oej -k | cat

=== [linux] xlhtml

xlhtml も UTF-8 を処理できるようだ。

 xlhtml hoge.xls | w3mmee -T text/html -dump

muttで.mailcapで定義したら非常に便利。(かも。)

=== [linux] 英文法チェッカ Queequeg

スペルチェッカを探していたら、こんなん見つけました。

英文法チェッカ Queequeg

http://queequeg.sourceforge.net/

英作文に便利かも。

== 20041013

=== [linux] xlhtml for Excel 5.0

Excel 5.0/95の添付ファイルメールが届いた。これの対策。

 xlhtml -m hoge.xls | nkf | w3mmee -T text/html -dump

nkf は sid の最新にしておけば、UTF-8 も扱えてよさげ。(-w/Wオプション)

=== [linux] 自宅サーバをDebianに

VineからDebianに移行した。
とりあえずテスト書き込みしてみます。

== 20041014

=== [linux] hikiとtDiary

Debianに移行した記念にhikiとtDiaryを入れてみた。

http://ohac.sytes.net/hiki/

http://ohac.sytes.net/tdiary/

初心者なもので、よくわからんことが多いな。

== 20041015

=== [日記] 日記移動

日記は

ttp://ohac.sytes.net/tdiary/

ここに書くことにしたのでよろしく。

== 20041013

=== [tDiary][linux]なるほど
.htaccessを少し変更する必要があったが、なんとか動いた。
httpd.confとかよくわからんスギ。

=== [diary]2つ目
ほほう。

== 20041014

=== [diary]タイトルとこの見出しの違い
どう使い分けるべきか。
カテゴライズも考えないといけない。

=== [linux]PukiWikiのRecentがおかしく
なってしまった。
おそらくサーバを再インストールしたときにタイムスタンプが消えてしまったものと思われ。

=== [linux]a2psjよりe2psの方が
よさそうだ。マージンの指定などができるし。

=== [linux]oooqs-kde
入れてみた。OpenOfficeの起動が早くなるらしい。

=== [linux,uim]uim 0.4.4.1-2が動かない
apt-get で uim をアップグレードしたのはいいが、動かなくなってしまった。
いろいろ試してみて、以下の方法でなんとかした。

* /etc/locale.gen に ja_JP.UTF-8 UTF-8 を追加し、locale-genを実行。
* ~/.uim の vim 用の ESC で日本語入力モードから抜けるパッチをコメントアウト。(これは不便!→パッチを作った!)
* ~/.uim に (define default-im-name 'skk) を追加。
* ~/.xsession の GTK_IM_MODULE, XMODIFIERS が uim-skk だったのを uim に変更。

しかし、krxvt で ja_JP.eucJP な環境だと変換候補が文字化けする。
mozilla-firefox や mlterm なら文字化けしなかった。

=== [linux]mltermをインストール
mlterm mlterm-tools, unifont をインストール。 ~/.mlterm/main を以下のように。

 fg_color=white
 bg_color=black
 fontsize=14
 #use_anti_alias=true

=== [tDiary]HTMLタグ
tDiaryって、HTMLタグを書く必要があることに今頃気付く。
このへんはWikiの方が便利だ。

== 20041015

=== [linux][im]uimでESCキー
Anthy-dev MLへ情報を投げたら、vi用の設定を追加していただけた。ありがたや。
.uim に (define skk-use-with-vi? #t) と書けばよいとのこと。

=== [linux]spamassassinを入れてみた
.procmailrc に

 ###
 :0fw
 * < 256000
 | spamassassin -P

と入れてみた。 :0fw: spamassassin.lock だとなぜかうまくいかなかった。
spamdって使った方がよいのかな。spamdが走っている場合は spamc というのでチェッ
クができるようだ。

== 20041017

=== [uim,linux]ビルドできた
uimのdebパッケージのビルドができた。いやーよかったよかった。
ちなみにこの日記はWindowsからPuTTY(SSH)でDebianサーバーにログインして、そこからw3mを使ってウェブにアクセスし、 uim-fep を立ち上げて書いています。(あー、ややこし。)
しかし、ノートPCのCTRLキーは押しにくいなぁ。Caps Lockと入れ替えたくなるよ。

== 20041018

=== [java][junit]JUnit対応のテストへ書き換え
昔作ったテストケースはJUnitじゃなかったので、この際JUnitに書き換えておく。結構量があるので、しんどいかも。
ということでテストしてみると1つ重大なバグを発見。不幸中の幸いか、このクラスを使用した装置で出荷済みは1台だけ。こんなことなら早くテストの自動化をやっておけばよかったと後悔。
助かった。このバグ入りのソフトはどうやら出荷されてなさそうだ。今後はこんなことがないよう注意しよう。

=== [linux,im]uimの文字化け
svnの最新でdebをビルドしたので早速インストールしてみた。なおってるみたいだ。

== 20041019

=== [linux]SpamAssassin spamd
spamdを有効にするには /etc/default/spamassassin の ENABLED を 1 にする必要があるようだ。これを有効にして、.procmailrcの方をspamassassin -Pというのをspamcに書き換えた。ちょっと速くなったような気がする。

=== [linux][im]AZIKと促音(そくおん)
gooの国語辞書によると、「語中において、無声閉鎖音 k ・ t ・ p や無声摩擦音 s の前で一拍分だけ息をとめるものをいう。」とある。ということは、AZIKでのキーシーケンスで問題となるのはkk(きん),tt(たち),pp(ぽう),ss(せい)の4つだけということか。特にttはSKKとの組み合わせで問題になり、特殊拡張に分類されているので、このシーケンスを使わないように設定できる必要があると思う。また、kk,pp,ssについてもAZIKのセミコロンの位置のキーがないような特殊キーボード(Linux Zaurusなど)ではオフにできる方がよい。そのうちuimに取り込みたいと思う。

== 20041020

=== [diary]台風
台風なので帰ってもよいということになった。帰ろう。

=== [c,unittest]check
debianにcheckというパッケージがあったので試してみた。checkの使い方というより、aclocal/automake/autoconfの使い方がわからなくてハマった。日本語で説明されたページはないものかと調べると次のようなページがあった。
http://www.02.246.ne.jp/~torutk/softwarebp/zakki20010410.html

=== [uim,linux]uimで"sq"を"さい"となるように
やっとできた。うれしい。("q"の"ん"を無効にしておく必要あり。それと"q"を"@"で代用するところも無効にすること。)

 ###
 --- skk.scm.orig	2004-10-20 21:09:58.000000000 +0900
 +++ skk.scm	2004-10-20 22:06:49.000000000 +0900
 @@ -955,6 +955,22 @@
  	     (skk-append-residual-kana sc)
  	     #t)
  	   #t)
 +       ;; Hack to handle "sq" sequence as "さい" for azik.
 +       (if (skk-kana-toggle-key? key key-state)
 +           (begin
 +	     (set! key (to-lower-char key))  
 +	     (set! stat (skk-context-state sc))
 +	     (set! res
 +	           (rk-push-key!
 +		    rkc
 +		    (charcode->string key)))
 +	     (if (and res
 +		      (= stat 'skk-state-kanji)
 +		      (or
 +		       (list? (car res))
 +		       (not (string=? (car res) ""))))
 +	         (begin (skk-append-string sc res) #f) #t))
 + 	  #t)
         (if (skk-kana-toggle-key? key key-state)
  	   (begin
  	     (skk-append-residual-kana sc)

== 20041021

=== [linux]SpamAssassinが日本語メールで役に立ってなさそげ
社内のメールがSPAMとして認識されてしまうな。

 SPAM: Hit! (2.5 points)  Cc: contains similar domains at least 10 times
 SPAM: Hit! (1.0 point)   Subject: contains a question mark
 SPAM: Hit! (0.2 points)  BODY: Contains at least 3 dollar signs in a row
 SPAM: Hit! (0.9 points)  URI: Filename is just a '\#'; probably a JS trick
 SPAM: Hit! (1.8 points)  URI: Uses %-escapes inside a URL's hostname

Cc:に一杯列記するから2.5ポイント。日本語件名だと"=?iso-2022"のハテナがカウントされるので1.0ポイント。ISO-2022-JPだとESC+$が入るので0.2ポイント。最後の2つはよくわからんな。たぶん日本語だからダメなんだろう。

== 20041022

=== [linux]SpamAssassin
ヘッダが化けることがあったり、誤認識が多いのでとりあえず.procmailrcから外しておく。今後に期待といったところか。

=== [linux]clamav (Clam Anti Virus)
会社のメールで大量に変なメールがきた。clamavでチェックしたところ、Worm.SomeFool.AJ だそうな。

 $ clamscan foo.com
 foo.com: Worm.SomeFool.AJ FOUND
 ----------- SCAN SUMMARY -----------
 Known viruses: 24499
 Scanned directories: 0
 Scanned files: 1
 Infected files: 1
 Data scanned: 0.03 MB
 I/O buffer size: 131072 bytes
 Time: 6.290 sec (0 m 6 s)

これはNetsky.Bというらしいのだが、ClamAVの方が先に(同時に?)見つけたらしく、全然違う名前になっているようだ。やるじゃないかClamAVめ。

=== [im,uim]「ん」の入力
AZIKでは"q"で「ん」が入力できる。AZIKでは"an","on"などの子音+"ん"が揃っているので、必要ないんちゃうのって思ってたが、よく考えたら母音+"ん"のときに必要ということがわかった。「アンインストール」とか打つときは"q"があると便利だ。まあこの例だとSKKで"/uninstall"の方が打ちやすいけどね。

=== [java,junit,unittest]StrutsTestCase
Cactus + StrutsTestCase を試してみる。まだちゃんと動いていないが、なんとかして動かすぞ。
http://homepage2.nifty.com/ymagic/struts/Impressions/ImpressionStrutsTestCase.html (参考ページ)

== 20041025

=== [linux]固定IPの取り方
/etc/network/interfacesを以下のようにするらしい。(今までDHCPしか使ってなかったので知らなかった。)

 auto eth0
 iface eth0 inet static
   address 192.168.xxx.xxx
   netmask 255.255.255.0
   broadcast 192.168.xxx.255
   gateway 192.168.xxx.xxx

=== [unittest]サンプリング割り込みでのテスト
組み込み系のテストではターゲットでのテストが必要である。タイミングなどに変化を与えないように気をつけながらテストコードを書く必要があるし、テストの実行開始や終了条件も色々とあるのでどうしても自作のフレームワークを作る必要がある。まあ、フレームワークといってもたいしたことないのだが、testサブディレクトリにtarget_test.hみたいなのを用意し、TARGET_TEST_1_SETUP_1 とか TARGET_TEST_1_BEGIN や END などを定義し、本体のコードが読みにくくならないように注意しながら本体に組み込むといったものである。テストの結果は TARGET_TEST_1_PRINT_RESULT で定義しておき、任意のタイミングでどこかに表示可能にしておく。このプリント文はテスト実行中なら"Running..."完了なら"Success"または"Failure"と表示させる。

== 20041026

=== [music]ゆず
ゆずの地図という曲、なんかに似ている。ジャクソンファイブかな?
ググッてみると、曲名は「夢の地図」でやはりジャクソン5に似ているとのこと。パクりかと思ったが、わざとそのようにしているような感じらしい。小林亜星が相手だったらきっと訴えられてたであろう。しかし、アレンジの著作権って、そんなに厳しくないのかな。

=== [tDiary]曜日
tDiaryって、曜日表示できないのかなぁ。

=== [diary]健康調査CGI
http://aoki2.si.gunma-u.ac.jp/thi/thi.html でチェックしてみた。

 パーセンタイル     0.01 0.1    1    5 10 20    50     80 90 95   99   99.9 99.99
 尺度（得点）        +----+-----+----+--+--+-----+------+--+--+----+-----+----+
 多愁訴　　　(35)    :    .     .    .  .  .     .      .@ .  .    .     .    :
 呼吸器　　　(18)    :    .     .    .  .  .     .      @  .  .    .     .    :
 目と皮膚　　(20)    :    .     .    .  .  .     .      .  . @.    .     .    :
 口腔と肛門　(14)    :    .     .    .  .  .     .   @  .  .  .    .     .    :
 消化器　　　(13)    :    .     .    .  .  .     .@     .  .  .    .     .    :
 直情径行性　(17)    :    .     .    .  .  .   @ .      .  .  .    .     .    :
 虚構性　　　(15)    :    .     .    . @.  .     .      .  .  .    .     .    :
 情緒不安定性(25)    :    .     .    .  .  .     .    @ .  .  .    .     .    :
 抑鬱性　　　(13)    :    .     .    .  .  .     @      .  .  .    .     .    :
 攻撃性　　　(11)    :    .     . @  .  .  .     .      .  .  .    .     .    :
 神経質　　　(12)    :    .     .    .@ .  .     .      .  .  .    .     .    :
 生活不規則性(19)    :    .     .    .  .  .     .@     .  .  .    .     .    :
 心身症傾向　(-0.634):    .     .    .  .  .     .     @.  .  .    .     .    :
 神経症傾向　(-3.191):    .     .    .  .  @     .      .  .  .    .     .    :
 尺度（得点）        +----+-----+----+--+--+-----+------+--+--+----+-----+----+
 パーセンタイル     0.01 0.1    1    5 10 20    50     80 90 95   99   99.9 99.99

http://aoki2.si.gunma-u.ac.jp/thi/interpret.html

== 20041027

=== [diary,music]青い地球は手のひら
かの香織の曲がラジオでかかっていた。ひさしぶりに聴いたが、やっぱりいい曲だと思う。最近どうしているのだろうか。

=== [music]上原ひろみ(Jazz Piano)
とてもイイ!ピアノもいいが、曲もいい。

=== [diary]QRコード
QRコードって、DENSO WAVEっていうところが知的所有権を持っているのかと思っていたが、そうではないらしい。QRコードという名称が登録商標となっているみたいで、いつかはISOやJISなどで仕様が公開されるようなことが書いてある。

=== [uim]skkで学習が変?
になっているようだ。設定の問題かな?

=== [english]オズの魔法使い
45%ぐらいまで読んだ。

=== [diary]orkut
む、w3mからログインできないぞ。どうやらJavaScriptを使っているようだ。ログイン後に http://www.orkut.com/Home.aspx へアクセスすれば問題なさそう。

=== [linux]LDAP
LDAPを使ってみる。

 ldapsearch -h hostname -p portnum -x -b "o=hoge corp,c=jp" -s sub "mail=*"

みたいな感じで使えた。sn: 苗字、cn: 氏名、mail: メールアドレスみたいに使うようだ。ん!?なぜか私のエントリが2つもあるぞ。

== 20041028

=== [linux]debian-installer
 http://www.debian.org/devel/debian-installer/
 http://cdimage.debian.org/pub/cdimage-testing/sid_d-i/i386/pre-rc2/sarge-i386-netinst.iso
 http://cdimage.debian.org/pub/cdimage-testing/daily/i386/

なるほど。初めてsargeのインストーラの場所を知った(w

=== [linux]cu
cu -s 9600 -l /dev/ttyS0 みたいな感じで使えるらしい。後で試してみよう。

=== [linux]mutt
キーバインドがw3mやviとだいぶ違うので気持ち悪いな。カスタマイズしたい。

=== [linux]LDAP
/etc/ldap/ldap.conf に BASE と URI を設定しておけば、ldapsearch -x "mail=hoge*" みたいな感じで使えるようだ。URIはldap://hoge.hoge.jp:portみたいな感じ。

== 20041029

=== [mutt]機種依存文字
の入ったメールを受信すると文字化けするな。これは困る。というか機種依存文字を使わないで。

=== [linux]apt-line
む、社内にdebパッケージが置かれたサーバがあるじゃないか。使わせてもらいます。

=== [linux].gnomerc
gnomeのときは.xsessionsではなくて、.gnomercに書くのか。なるほど。

=== [uim]今後の開発予定をまとめる
ヤマケンさんからMLに返信があった。まとめなきゃな。

=== [junit]junitreport
antでjunitreportを使用するにはjunitタスクがエラーで終了しないようにする必要がある。つまり、haltonfailure="no" にすればよいということか。

=== [junit]batchtest vs TestSuite
TestSuiteよりもAntのbatchtestの方が便利だな。

=== [uim]BTS
BTSってなんだ? ああ、Bug Tracking Systemか。Bugzillaのアカウントを作る必要があるな。MLに投稿した本文をExcite翻訳で訳して、わかる範囲で修正し、Summaryを適当に書いてSubmitしておいた。英語ができるようになりたいなぁ。

=== [english]オズの魔法使い
60% ぐらい読んだ。もうちょっとだけ簡単なやつの方がよかったかな。

=== [junit]assertEquals(double,double)
あれー、doubleやfloatの比較ってどうするんだろう。あー、なるほどassertEquals(expected,actual,delta)でdeltaを使って誤差範囲を指定できるのか。

=== [game]PS2 Compact
そういえばコンパクト版のPS2って、HDDはどうなるんだろう。

=end
