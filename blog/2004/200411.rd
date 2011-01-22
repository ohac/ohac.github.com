=begin

== 20041101

=== [game]MHでHR20に
やっと全クエクリアしてHR20になった。黒龍クエがいきなり出現していた。レイア・レウスを倒しまくったからかな。

=== [english]ロードオブザリング
今更ながら第1作目を見る。やはり3つ見ないと話が完結しないようだ。RPGのルーツなので世界観が結構面白かった。

=== [english]オズの魔法使い
95%読破。もうちょっとだ。

=== [c]変数は初期化しよう
変数を初期化してない箇所があり、そのまま初期化されずに使用される可能性のあるコードがあった。やはりwarning levelを上げてちゃんとチェックするようにせなアカンね。しかし誰の仕業か、と調べたところ、あ、オレか。ごめんごめん。でも初期化せずに使うようにしたのは私じゃないですからー、斬り。(うーん。言い訳にしかならんなorz)

=== [linux]FDのMBRにウィルスがないか確認
dd if=/dev/fd0 bs=512 count=1|xxd みたいな感じ。

=== [linux]lspci via unichrome
lspciでハードウェアの構成を調べる。via/s3g unichromeのビデオカードって、どのドライバなのか。via_drv.oか? xfree86の4.4.0で使えるようになる? とりあえずvesa_drv.oで逃げておこう。

== 20041102

=== [linux]gaim
gaimというのを入れてみる。MSNメッセンジャのプロトコルとかが使えるらしい。社内からも使えるのだろうか。うーん、使えないようだ。Windowsからだと使えるみたいなのになんでかな。

=== [uim,english]本家のMLに参加せねば
Anthy-dev MLで反応があった。英語のMLを講読しないとだめかな。読むだけならなんとかなるかな。

=== [english]オズの魔法使い
100% やっと読み終えた。

=== [mutt]インデックス作成
メールが多いフォルダだとインデックス作成に時間がかかるな。これはSylpheedの方がよいかも。mewとかだとどうなんだろうか。

=== [linux]fileの移動
受信側で nc -l -p 12345 >foo.afio とかやっといて、送信側のホームディレクトリで find | afio -Zo - | nc -q 60 hostip 12345 みたいにする。終わったら受信側で afio -iZ foo.afio みたいな感じで。

=== [linux]qkc ack
qkc はパッケージになってないので、ack -A を使うべし。qkcという名のaliasかshellスクリプトを作るか。

== 20041104

=== [mutt]mutt 1.5.6
muttでときどき日本語の文字が抜けたりするな。なんでかな。mutt + mutt-utf8 1.3.28-2.2 を mutt 1.5.6-20040722 に上げたのが悪いのかな。1行ずつスクロールしたときにおかしくなりやすい。CTRL+Lで再描画すれば問題なくなる。

=== [linux]新PCへ移行
会社で使っていたPCが不調となったので、新しいPCへ移行中。以下を順番に処理すること。

 未 muttの文字消え問題
 未 debian-jp の qkc
 未 uim-* を開発バージョンに上げる
 未 愛用キーボードに繋ぎかえる
 未 マウスのスクロールボタン(?)に対応させる
 未 j2sdkのインストール
 未 java関連パッケージ(tomcat3 woody等)のインストール
 未 SH-4用コンパイラのインストール
 未 rpm3構築環境
 未 ランレベルエディタで普段いらんやつを消す
 未 w3m(w3mmee?)でなぜかTABキーが効かない
 済 印刷(CUPS)
 済 lha, dosemu, dosemu-freedos (non-free)
 済 gs-cjk-resource とか cmap-adobe1 とか gs-esp とか (non-free系が多い)

=== [linux]clamav with nullmailer
clamavインストールするときにeximがちゃんと設定されてないとアカンとか言われたので、とりあえずnullmailerをインストールして適当な設定をしておいた。こんなんでええのかw。

=== [diary]頭痛
頭が痛い。頭痛薬のむか。

=== [linux]Cups
ほとんど理解していないが、教えてもらった通りにやってみる。印字できた。

* プリンタのインストール  Canon LBP-930EX
* 参考ページ
* http://www.e-aiyama.com/~toshi/Computer/Linux/Cups.html
* apt-get install cupsys foomatic-bin foomatic-db cupsys-bsd cupsys-driver-gimpprint foomatic-db-gimp-print foo2zjs foomatic-gui hpoj
* apt-get install foomatic-filters-ppds
* cp /usr/share/ppd/Canon/Canon-LIPS-IVv-lips4v.ppd.gz /usr/share/cups/model/
* gunzip /usr/share/cups/model/Canon-LIPS-IVv-lips4v.ppd.gz
* /etc/init.d/cupsys restart
* lpadmin -p lp0 -E -v lpd://IPアドレス/p1 -m Canon-LIPS-IVv-lips4v.ppd
* http://localhost:631 でプリンタの設定の確認ができる

=== [diary]RTCへの書き込み
うーん。割り込み処理中に重い処理があるようだ。これが原因か?(謎)

=== [linux,java] jdk-1_5_0-linux-i586.bin
試してみたが、debパッケージを作るところが動かない。とりあえず1.4.2-06でがまんする。unstable contribにあるjava-packageでmake-jpkgを実行。

=== [linux]rcconf
で、いらないサービスを停止してみる。これって全runlevelで同じ設定になるのかな。

=== [java].antrc with tomcat4
tomcat3ではなくtomcat4でコンパイルできるようにしてみた。(コメントアウトされているのがtomcat3版)

 ANT_OPTS="-Drpmdir=/home/ohashi/build/rpm"
 ANT_ARGS="${ANT_ARGS}:${ANT_HOME}/lib"
 #ANT_ARGS="${ANT_ARGS}:/usr/share/tomcat/lib/common/servlet.jar"
 #ANT_ARGS="${ANT_ARGS}:/usr/share/tomcat/lib/common/core_util.jar"
 #ANT_ARGS="${ANT_ARGS}:/usr/share/tomcat/lib/container/jasper.jar"
 ANT_ARGS="${ANT_ARGS}:/usr/share/tomcat4/common/lib/servlet.jar"
 ANT_ARGS="${ANT_ARGS}:/usr/share/tomcat4/common/lib/jasper-compiler.jar"
 ANT_ARGS="${ANT_ARGS}:/usr/share/tomcat4/common/lib/jasper-runtime.jar"
 ANT_ARGS="${ANT_ARGS}:/usr/share/java/junit.jar"
 ANT_ARGS="${ANT_ARGS}:/usr/share/java/struts-1.1.jar"
 ANT_ARGS="-lib ${ANT_ARGS}"

=== [java]tomcat4
うーん。なかなかtomcat3から4に上げるのは大変だなぁ。でももうちょっとで動きそうだ。お、cactus+StrutsTestCaseがやっと通るようになった。

== 20041105

=== [linux]新PCへ移行
ふう。これでほぼ問題はなくなったな。

 未 SH-4用コンパイラのインストール
 未 rpm3構築環境(chroot必要)
 未 ターゲットのRAMディスクイメージ作成環境(mknod root権限必要)
 未 自分専用のPukiWikiをインストール(apache2を入れる)
 未 社内用アンテナ(cronの設定)
 済 CD-R作成できるようにする(grubでscsi)
 済 愛用キーボードに繋ぎかえる(.Xmodmap)
 済 AMF受信用ftpユーザの設定
 済 ntpdateの設定(/etc/default/ntpdate)
 済 muttの文字消え問題(woodyのやつを入れる)
 済 openofficeのfont置換設定
 済 mozilla-firefoxのブックマークを移動
 済 sshdの設定(社内用なのでとりあえずpassword認証でよしとする)
 済 マウスのスクロールホイールに対応させる
 済 java関連パッケージ(ant, tomcat4等)のインストール
 済 j2sdkのインストール
 済 ランレベルエディタ(rcconf)で普段いらんやつを消す
 済 Sylpheed (news reader)
 済 w3mmeeでなぜかTABキーが効かない .w3mmee/keymap に keymap TAB NEXT_LINK追加
 済 uim-* を開発バージョンに上げる
 済 debian-jp の qkc

=== [linux]ホイールマウス
なんだかよくわからんが、Protocolの部分を ImPS/2, GlidePointPS/2, MouseManPlusPS/2, ExplorerPS/2 と順番に変えてみると ExplorerPS/2 でホイールが使えるようになった。もっと賢く見分ける方法はないものか。

=== [linux]OpenOfficeフォント置換
以下のフォントをsazanamiなどに置換するとよい。

 Gothic
 Mincho
 MS Gothic
 MS Mincho
 ゴシック
 明朝
 ＭＳ ゴシック
 ＭＳ 明朝
 ＭＳ Ｐゴシック
 ＭＳ Ｐ明朝

=== [linux]sshd UsePAM
UsePAM yesになっているとPasswordAuthentication noにしていてもパスワード認証が可能になるようだ。PAM任せということか。

=== [linux,mutt]mutt文字化け
sargeやsidのmutt(1.5.6-20040722と20040907)はだめだ、日本語が文字化けする。ということでwoodyのmuttをinstallした。libdb3-util, libsasl7 は最新を使用。mutt, mutt-utf8はwoodyのものを使用した。mutt-utf8は不要かもしれないが一応入れた。

=== [linux]cdrecord grub
dmesg|grep CDとするとどうやらCD-Rドライブはhdcのようだ。/boot/grub/menu.lstを編集し、kernel /boot/vmlinuz... の行に hdc=scsiを追加する。grubはliloみたいに書き込まなくてもいいのか、こりゃ便利だ。
rebootして、cdrecord -scanbus。2,0,0 200) 'MATSHITA' と表示されたので、 /etc/default/cdrecord を編集、 CDR_DEVICE=matshita と書き換え matshita=	2,0,0	-1	-1	"" を追加。cdrecord -eject で反応があることを確認して完了。

== 20041108

=== [linux]新PCへ移行
よく見ると新PCにはFDドライブがないじゃないか。これは不便。ということで移植。

 未 SH-4用コンパイラのインストール
 未 rpm3構築環境(chroot必要)
 未 ターゲットのRAMディスクイメージ作成環境(mknod root権限必要)
 未 自分専用のPukiWikiをインストール(apache2を入れる)
 未 社内用アンテナ(cronの設定)
 未 /etc/fstab
 済 /etc/hosts
 済 FDドライブ移植

=== [linux]gaimでMSN
gaimのMSNオプションでログインサーバmessenger.hotmail.com、ポート番号443にして、HTTPメソッドを利用する。で接続できるようになりました。どうもありがとう。ん!?急にエラーがでるようになって使えなくなった。よーわからん。

=== [linux]液晶モニタ
どうやら液晶モニタが壊れていたのではなくて、本体側のビデオカード(というかマザーボード)が壊れていて画面が見にくくなっていたようだ。人間っていうのは不思議なもので、自分にとって都合の良い方に判断しがちである。ということで新液晶モニタを支給してもらったのでウハウハである。

=== [linux]qkc -O
Antのexecやapplyタスクから呼ばれたときは標準出力がリダイレクトされていて、-Oオプションが付いたときの動作となってしまう。これを防ぐためにシェルスクリプトをかまして、そこで /dev/tty にリダイレクトしてやればOK。

=== [music]Baby Boo
朝ラジオでBaby Booというアーティストの曲がかかっていた。ちょっといいかもしれん。1曲しか聴いてないからなんとも言えんけど。

== 20041109

=== [linux]ack -cで漢字コード判定
pipeを通して使えるのでfile2より便利。

=== [linux]仮想デスクトップ
いままで仮想デスクトップっていうのを使ってなかったけど、使ってみると便利かもしれない。Alt+TABでウィンドウの巡回を行っていたけど、Alt+数字で各仮想デスクトップに移動できるようにしておけばAlt+TABを何回も押さなくて済む。ついでにAlt+Fでフルスクリーンに、Alt+Tでタイトルバーなしに、Alt+Pで前面に、Alt+Vで縦に最大化、Alt+Xで最大化、てな感じにしてみるとかなり快適になった。GUIなアプリではAltでメニューを選択できるけど、私はGUIをあまり使わないのでこれでいいのかもしれない。

== 20041110

=== [linux]新PCへ移行
まだやることが少し残っているな。
 未 SH-4用コンパイラのインストール
 未 rpm3構築環境(chroot必要)
 未 ターゲットのRAMディスクイメージ作成環境(mknod root権限必要)
 未 自分専用のPukiWikiをインストール(apache2を入れる)
 未 社内用アンテナ(cronの設定)
 未 改ページ印刷がおかしい
 済 sambaサーバ
 済 /etc/fstab

=== [linux]mp3spltというアプリ
テープやMDをmp3化するのには便利かも。

=== [linux]改ページ印刷
が変だ。改ページが認識されていないのか? e2ps側の問題か? 前は e2ps 4.30-2 、今は e2ps 4.34-3。戻してみたが、問題は解決せず。CUPS周りの問題かな。前はgs側でLIPS4vへ変換してたからいけてたのかな。

=== [linux]mount smbfs user
sambaで文字コード変換がうまくいかない件、やっと原因がわかった。/etc/fstabのuserオプションをONにしているとsmbfsでiocharsetやcodepageがうまく動作しないようだ。む、noautoを付けてもダメっぽいな。

=== [linux]apache2 userdir
なんだかよくわからないが、/etc/apache2/mods-available/userdir.confのOptionsにExecCGIを追加すればCGIが動くようになった。あとは、/etc/apache2/apache2.confのDirectoryIndexにいろいろ追加したり、AddHandlerに.rbや.phpを追加したり。

=== [linux]apache2 + php4
php4-cgiとか libapache2-mod-php4 が必要っぽい。pukiwiki.phpの先頭に #!/usr/bin/php4-cgi を追加し、chmod a+x pukiwiki.php とすれば実行できたが、こんなんでいいのかな。よくわからん。

=== [wiki]wema
http://www.mikihoshi.com/wema/
ローカルのapache2で動くように入れてみた。こりゃ面白いな。なんかに使えそうだけど、何に使おうか。

=== [vim]chalice
自宅のPCに入れてみた。会社のPCにも入れてみよう。

=== [linux]sambaメモ
smbclient -L localhost で自サーバの状態がわかる。smbpassword username でpasswordの設定。/etc/samba/smb.confに以下追加。あと、いらん共有を外して完了。

   [global]
      #client code page = 932 ←前はこれでいけてた。
      #coding system = EUC    ←前はこれでいけてた。
      unix charset = EUCJP-MS
      display charset = CP932
      dos charset = CP932
   ..snip..
   [samba]
      comment = for samba
      browseable = yes
      writable = yes
      path = /hoge/hoge

== 20041111

=== [diary]ののちゃん
最近、朝日新聞の「ののちゃん」の様子がおかしい。お化けネタばっかりになっている。

=== [linux]Z80のコンパイラ
sdccというパッケージ。sdcc -mz80 foo.c のようにコンパイルするようだ。

=== [uim,im]prime suikyo
primeはlibsuikyo-ruby1.8に依存、これはsuikyo-tableに依存というかんじ。キーテーブルはこのsuikyo-tableから生成できるようにすればよいということか。/usr/share/suikyo/conv-tableにいろいろあるな。さすがにnicolaはなさそげ。「nx27=ん」というのはここからきているのか。 http://taiyaki.org/suikyo/

=== [linux]rpm strip
rpmにすると毎回実行ファイルのmd5が変わる。たぶんstripして、サイズを減らしているのだと思う。

=== [linux]ide-scsi /dev/scd0
CD-R焼くところまではセットアップしていたけど、マウントする設定を忘れていた。/dev/cdromのシンボリックリンクを/dev/scd0に向け、/etc/fstabを/dev/hdcを/dev/cdromに修正。マウントポイントは/media/cdrom0。

== 20041112

=== [linux]XMLで検証記録を
kxmleditorを試す。XMLをHTMLに変換するには何がいいかな。xalanというのがあるらしい。おお、Antからxalanを呼べるではないか。DTDの書きかたを知らないのでDTDなしで試してみた。DTDを書けばルールを定義できるので便利かも。

=== [vim]chalice
会社のPCにも入れてみよう。必要なのは vim curl gzip qkc(debian-jp) といったところか。とりあえず ~/vim_macros/chalice にインストール。 plugin/chalice.vimの「〜」の文字を取り除けば一応動作した。自宅で使っているときに日本語が変になったときがあったが、.vim/chalice を消してもう一度取り直せば問題がなくなった。今思えばRキーを押せばリロードされて直ったのかもしれない。ちなみに半角カナが読める設定でないと乱れる。自分の環境ではmltermで見るとOK。rxvtはmplusフォントで設定しているのでダメっぽい。板によっては文字化けするなあ。あ、fileencodingsにcp932を含める必要があるのか。sjisだとダメみたい。 let s:cmd_conv = 'nkf -e -Z' とすれば半角カナとか機種依存文字を変換できるのかな。

== 20041115

=== [linux]新PCへ移行

 未 SH-4用コンパイラのインストール
 未 rpm3構築環境(chroot必要)
 未 自分専用のPukiWikiをインストール(apache2を入れる)
 未 社内用アンテナ(cronの設定)
 未 改ページ印刷がおかしい
 済 1280x1024での表示
 済 ターゲットのRAMディスクイメージ作成環境(mknod root権限必要)
 済 CD-Rをmount可能に


=== [uim,im]T-Code
最新でdebを作成してインストール。あと自分用(実験用)のパッチが少し入っている。"]"+T-CodeシーケンスでT-Codeの入力ができるようにしてみた。T-Codeの漢字を9文字ほど覚えた。ひらがなとカタカナはAZIKで入力するので覚える予定はない。"]"は親指で押せるように.Xmodmapを変えてみた。"]"だとSKKの変換開始として処理できないのでqにでも割り当てた方がよいかも。あ、よく考えたら"]"だと"「"の閉じが打てないな。qに割り当てたら交ぜ書きで"仕よう"を"仕様"に変換とかできるし、いいかも。"ん"はあきらめるか。

=== [uim,im]nicola
nicolaで入力できるようにテーブルを作ってみた。でもprefixタイプなので同時打鍵はサポートしていない。それにしても1ストローク系(というかローマ字ベースでない系)はSKKとの相性が悪いな。しばらくはAZIKから抜けだせそうにない。

=== [uim,im]mlterm ハングル入力
mltermでハングルなどを打つにはexport LANG=ja_JP.UTF-8にした状態でmltermを立ち上げ、uim-im-switcherで切り替えるとよいみたい。SHIFT+SPACEを押して適当にタイピングすればハングルが表示される。これでヨン様もばっちりということか(意味不明)。ちなみに私はハングルは読めません。

=== [linux]1280x1024 vesa
vesaでは1024x768しか使えないのかと勘違いしていた。HorizSync 28-50 ってなっていたところを HorizSync 28-75 と範囲を広げると見事に1280x1024で表示された。ずっと1024x768で使っていたので、むっちゃ広く感じる。/var/log/XFree86.0.logを見ると (II) VESA(0): #0: hsize: 1280  vsize 1024  refresh: 60  vid: 32897 と残っていたので、これ(refresh: 60の部分)がヒントとなった。

== 20041116

=== [mutt]重要メールは色を変える
さすがに左端に"!"と表示されるだけだと判りにくいので、色を付けてみる。~/.mutt/muttrc に color index yellow default ~F を追加。

=== [uim]uim-xim
rxvtなどをリサイズしたときにuim-ximの変換窓が追従しないという問題がようやく解決できた。デバッグのやり方もちょっとわかってきたような気がする。差分を整理してMLへ報告するか。svn diffしようとしたけど、svnサーバが死んでるようだ。

=== [linux,uim]fluxbox + uim-toolbar-gtk-systray
KDEは重いのでfluxboxに乗り換えてみた。uim-toolbar-gtk-systrayはやはりサイズが変だが、.fluxbox/initでsession.screen0.toolbar.height: 40といった具合に大きくしてやれば使えないこともない。これも直したいな。もしかして、fluxbox側の問題なのかな。

=== [debian]debuildとdpkg-buildpackage
違いがよくわからん。-nc -b のオプションをつけると高速にビルドできるようだ。(cleanをしない。バイナリのみ生成。)

== 20041117

=== [linux]flashplugin-nonfree
このパッケージをインストールするとプラグインのインストールを半自動でやってくれる。これは便利だな。

=== [vim]置換
2ch の KoRoNさんのノウハウより、* でカーソル上のキーワードを拾って、:%s//hoge/g で置換できるとのこと。確かにできる。これは便利かも。

=== [diary]postcards.com
グリーティングカードが来ていると英語のメールが来た。怪しいなあ、と思いつつもそのURLをコピーしてみるとCard Not Foundのエラーが表示された。HTMLメールを見直してみると、アンカータグのhref=の部分と表示されているURLが違っていた。hrefの方はIPアドレスを直接書いてあり、ポート番号も80ではなく8180となっている。怪しすぎる。

== 20041118

=== [uim]uim-xim問題続き
MLに投げてみたところ、uim-ximの問題ではないとのこと。rxvtやmlterm側の問題らしい。mlterm 2.9.0ではこの問題が修正されているとのこと。しかし、Debian sargeにはmlterm 2.9.0 が入るかどうかわからないし、rxvtも修正されているかどうか不明だ。uim-ximユーザとして考えるとadhocでもいいから対策版が欲しいのではないかと思う。さて、どうしたものか。uim-ximの起動オプションでadhocモードを作るとかかなあ。ktermはどうなんだろうか。それにしてもuimの開発チームはみんなどんなターミナルを使っているのだろう。常に最新版を追い掛けているのかな。

=== [linux]rxvt + w3mmee-img
スクロールすると画像が乱れるな。mltermに乗り換えるか。

=== [linux,uim]mlterm
しゃーないのでこれも独自でCVS版最新のdebを作るか。だんだんハマってきた感じがするな。uimも組み込みで使えそうな感じがするし、まあいいか。

=== [diary]アンテナ
たださんのアンテナに登録されたみたい、どうもありがとうございます。これでアクセス数が増えるかな。

== 20041119

=== [uim]nicola対応に挑戦
skk.scm の skk-sokuon-shiin-char? を改造。こんな感じか。

 (define skk-sokuon-shiin-char?
   (lambda (c)
     (and (alphabet-char? c)
       (and
       (< c 97)      ;; a
       (> c 122)     ;; z
         ))))

=== [linux]SJIS環境へtelnet
mlterm -km=sjis -e telnet hoge みたいな感じでSJISの表示はできるのだが、漢字入力ができない。...と思ったら、mshell(OS-9/68Kのshell)が対応していないだけだった。umacs(OS-9/68Kのエディタ)で入力したらいけたよ。

== 20041122

=== [linux]SH-4 linuxとbusybox
仕事で開発中の装置で使う。busyboxは最新にアップデートしておいた。

=== [diary]
お、アンテナが1つ増えたな。最近はゲームネタをほとんど書いてなくてすんません。

== 20041124

=== [game]モンスターハンターG
4990YENで2005/01/20発売らしい。この値段なら買ってもいいかも。

=== [mutt]mutt+imputでBCC
うまく送信されないな。mutt側かimput側か切り分けねば。

=== [java]html:〜というタグ
を使うとソースがでかくなり、動作も重たいな。普通のHTMLタグで書いた方がよさそうだ。html:linkとかhtml:formはjsessionidを引き継ぐために必要なのかな。あとhtml:linkを普通のaタグに変更した場合、ベースとなるサーブレット名(foo.warなら"foo/"の部分)も必要っぽい。汎用性がなくなるが、高速化されるなら、html:〜を使わないほうがよさそうだ。

== 20041125

=== [java]jsessionid
やっとわかった。"/サーブレット名/foo.do;jsessionid=xxx"という文字列を得るには response.encodeURL(request.getContextPath() + "/foo.do") とすればよいのか。これで html:link, html:form タグとおさらばできそうだ。あ、もっといい方法があった。response.encodeRedirectURL("foo.do") とすればよいみたい。しかし、Struts風に書けば、重くなるというのはいやだな。Strutsの利点が台無しだ。Struts1.1系では改善されているのだろうか。(今は1.0系を使ってる。)

== 20041129

=== [game,ruby]るびろぐ
Rubyでのlogライブラリかと思ってたら、実はネットワーク対応のrogueらしい。mangbandみたいなやつですな。angband系じゃないので、好みかも。今度やってみようかな。

=== [diary]Windowsをサーバとして使用した場合のライセンス
ややこしいな。できればこんなややこしいOSは使いたくない。でも仕事だからしょうがないか。

=== [diary]Yahoo路線情報
よく使う駅を50まで登録できるみたい。登録しておくと便利かも。

=== [linux]telnetとnc
echo 'GET /'|telnet host 80とかやるとダメで、echo 'GET /'|nc host 80ならいける。telnetしか入ってないから、telnetでやりたいのだが...

== 20041130

=== [diary]車検証にQRコード
よく見ると付いているな。なんの情報が入っているのだろうか。これって軽自動車だけなのかなぁ。ググってみると車台番号や型式などが入っているとのこと。

=== [linux]gonzuiソースコードのサーチエンジン
http://namazu.org/~satoru/gonzui/
ソースコードのサーチエンジンとのこと。

=end
