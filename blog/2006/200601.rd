=begin

== 20060105

=== [game]NDS品切れ
NDSを買おうと思って、店を回るが、どこも品切れ。仕方なく、Mr.ドリラーfor PS1を購入してお茶を濁しておく。

=== [windows]teraterm macro
TeraTermのマクロで定期的に現在時刻をログに記録したいときは次のようなマクロを実行すればよいのかなぁ。ググっても、ほとんど情報がないなぁ。手元にWindows機もないので試せない。

 while 1
   getdate timestr
   logwrite timestr
   pause 60
 endwhile

== 20060106

=== [linux]anacron
anacronに変えたのはいいけど、PCの電源を入れてすぐにupdatedbが動くのはちょっといやだなぁ。昼休みに動いてほしい。

== 20060110

=== [game]CGoban2(KGS)
ホスト名・ポート番号は設定画面にて設定変更可能であった。以前にややこしい手順を書いたけど、あれは不要と判明。しかし、どこに保存されているのか分からんなぁ。あ、~/.javaの中か。

=== [game]KGS+Skype
この前、KGSでチャットしていたらSkypeでボイスチャットしているから参加して、と言われ、最初は断わったが、やはり気になるのでリッスンオンリーで参加させてもらった。3名のグループチャットを初めて体感した。実はうちのPC、マイク入力が壊れているのです。コンパクトなUSB Audio変換が欲しいな。もう1つある修理用VAIOからパーツを取ってもいいけど、ちょっと面倒。

=== [debian]Skype
http://debian.fam.cx/index.php?uploader にあるskype-staticqt(現在1.2.0.18)を使えばsidでもskypeがインストールできるようだ。

=== [uim][debian]uim 1.0.0-1
新しいパッケージがsidに降りてきたようだ。またビルドしなければ。ついにバージョン1かぁ。MLでリリースされたのは知っていたけど、使ってませんでした。これで簡単に使うことができるなぁ。

== 20060111

=== [diary]鼻うがい
「鼻うがい」っぽいことができるようになった。

=== [diary]キーボードにねり消し2
Kのキーを押すと爪と指の間にカドが当たりちょっと痛かったが、ねり消しを少しだけキーにはりつけることで少し解消した。すごいぞ、ねり消し。

=== [debian]firefox 1.5へ移行
Java AppletとFlashを有効にするために /usr/lib/mozilla-firefox/plugins にあるシンボリックリンクを /usr/lib/firefox/plugins に移す必要があった。まあ、それぞれを再インストールしてもいいのですが、この方が手軽かと。

=== [linux]screen -S hoge
起動時の-Sでセッション名を指定できる。例えばscreen -S hogeで1つ立ち上げておき、もう1つのターミナルからscreen -x hogeでそのセッションに入ることができる。

=== [linux]screen -cとsource
共通設定を~/.screenrcに持っておき、別の設定ファイルを~/.screenrc_hogeとして作り、.screenrc_hogeにはsource .screenrcと書いておく。起動はscreen -c $HOME/.screenrc_hogeで。

=== [linux]screen -X
例えば screen -X wall hoge とすると全ウィンドウにメッセージhogeを表示させることができる。screen -S hoge -X wall hoge のような感じでセッションを指定することもできる。make ; screen -X wall done みたいに使えるかな。

=== [linux]screenと$WINDOW
screenの中で動作しているときは$WINDOWにウィンドウ番号が入っている。スクリプトでこの値をみて、screenの内と外で動作を変えたりすることができそう。

=== [linux]ttyrecとscreen(メモ)
ttyrecしたものをscreenで分割したウィンドウでttyplayしながら解説を書き込んだものをttyrecする。というアイデア。長い日本語だ。どこまでが主語なんだ。

== 20060112

=== [zaurus][game]VNCで囲碁
zaurusにvncviewerをインストールして、debianサーバにvncserverをインストールしてみた。これでcgobanがタッチパネルで打てる。mltermは何故か動作しないようだ。xtermは問題なさそう。

=== [debian]Hiki
Hikiへの移行できるように使い方やPukiWikiとの違いを勉強中。attachのプラグインの設定方法に悩んだが、なんとかうまく動作させることができた。

=== [game][debian]mixi囲碁部とmixi棋院用のWiki
http://ohac.sytes.net/mixigo にHikiで構築した。まだ初期ページのままですが、これからいろいろ編集していきたいと思います。ハンドル名とかIDとかを公開していいかどうかを確認していかないといけないなぁ。

=== [music]パッシブスピーカーとMD
ヘッドホン端子に接続するパッシブスピーカーを買ってみた。古いラジオのような感じの音がする。コンパクトでなかなかいいかも。

=== [linux]screenでmonitor on
screen で monitor on とすると、そのウィンドウがバックグラウンドになっていて、何か出力があったときに1回だけ知らせてくれるが、screen -x を使い、複数のscreenで共有して使っているときは少し注意が必要である。説明が難しいので省略。

=== [linux]長い中指とキーボード
中指は長いから、キーボードの中指の列はちょっと上にシフトさせた方がいいと思う。そんなキーボードがあったらいいのになぁ。ただしコンパクトキーボードに限る。「,」のキーなんて、「J」に人差し指を置いた状態ではとても押せない。

== 20060113

=== [debian]gs-esp defoma 続き2
apt-get upgrade をしたためか、またe2psでの.psで日本語が印字できない状態が再現していた。 /etc/cups/cupsd.conf /etc/cups/cupsd.conf.dpkg-old を diff すると FontPath の行が変更されていた。いつもdiffして確認してたつもりだったけど、確認を忘れていたみたいだ。FontPath /usr/share/fontsを定義して、/etc/init.d/cupsys restart して完了。

== 20060118

=== [debian]zsh全角対応
全角文字がちゃんと使えるようになったみたい。これはうれしい。

=== [uim](゜∀゜)
SKKでは/allで∀に変換される。grep "^[:alpha:].*\/.\/" /usr/share/skk/SKK-JISYO.L と実行すれば他にもいろいろ出てくる。д=de, Д=De, ゜=はんだくてんorまる。つまり顔文字をSKKにリアルタイム辞書登録したいらしい。

== 20060119

=== [debian]dpkg hold(メモ)
apt-getであるパッケージを保留したいときのコマンド。

 $ echo  パッケージ名  hold | sudo dpkg --set-selections
 $ echo  パッケージ名  install | sudo dpkg --set-selections
 $ dpkg --get-selections | grep hold

=== [debian]invoke-rc.d hoge start
いつも /etc/init.d/hoge start とかやってたけど、invoke-rc.d hoge start というやり方もあるようだ。

=== [ruby][debian]rubyでterminalアプリ
Windows + TeraTerm + VNCでターミナルを使うのはなんか嫌だ。rubyでシリアルポートをTCP/IPへパイプするようなツールが作れたら便利かも。libtermios-ruby をインストールすれば作れそうだ。

== 20060123

=== [english]電子辞書Canon wordtank V35
買った。学生向けの学習コンテンツが豊富なので、これで勉強してみようと思う。それにしても、受験英語って難しいな。

=== [diary]VAIOのキーボード
飼い猫に壊された。瞬間接着剤が必要かなと思い購入したが、パチンとはめこむだけで直ってしまった。買う前にちゃんと確認しないと!

=== [diary]東北の女子高生
この前、東北に出張に行ったのだが、そこで見た女子高生はむっちゃ寒いのにむっちゃ薄着。生足でミニスカート。恐れいった。

=== [diary]東北の電車の扉
東北のJR仙石線の電車は扉に開閉ボタンが付いていた。東北はみんなあんなボタンが付いているのかな。

=== [game]ヒカルの碁(院生頂上決戦)
ツタヤで新品が500YENでタタき売られていたので、買ってみた。前作(平安なんちゃら)よりは棋力が上がっているようだ。油断すると負けることがある。最初は19路でやっていたが、相手が遅いので今は13路。最後の判定がおかしいことがあるので、事前に形勢判断機能を実行しておいて、不当な判定をされないように注意しながら終局しなければならない。この点はイマイチだが、全体としてはまあまあ面白い。GCやGBAのヒカルの碁はどのぐらいの棋力なんだろうか。

== 20060124

=== [linux]tarの--numeric-owner
tarで展開時にこのオプションを付けていないと、その展開したシステムにあるUID/GIDに書き変わってしまう。別システムのイメージを作成するときは注意が必要である。

=== [linux]chownやchgrpとsビット
chownでsビットが消えるので付け直すことを忘れないようにしないと。

=== [diary]DELLのキーボード
DELLの黒いキーボードがなかなか良さげな感じだ。親指に配置されているキーが縦に大きくなっている。また、変換、空白、無変換が押しやすい位置にある。これでテンキーが付いてなければ欲しいかも。

== 20060129

=== [game][ruby]ボード碁の開発
webrickの勉強を兼ねて、 http://ohac.pun.jp/hg/bbsigo/ を開発中。スローペースですが。

== 20060130

=== [game][java][linux]iGo棋院をappletviewerで動かす
firefoxでのJava AppletでiGo棋院にログインするとチャットのところで発言した途端にブラウザが固まってしまう。原因はよく分からないが、とりあえずappletviewerなら問題ないだろうと思い、appletviewerで動作させる方法を調べてみた。どうやら以下のようなスクリプトで動作可能っぽいことが分かった。

 #!/bin/sh
 if ! [ -a room.html ]; then
 wget http://kawa.igo.cc/club/room.php "--post-data=name=$1&passwd=$2" -O room.html
 wget http://kawa.igo.cc/club/`grep -o '[^ ]*\.jar' room.html`
 fi
 nc -l -p 1586 -c 'nc kawa.igo.cc 1586' &
 appletviewer room.html

$1 $2にはユーザIDとパスワードを入力すればよい。なお、ssh経由でポートフォワーディングするには次のようなのをバックグラウンドで動作させとけばよい。(この場合は上記のncの行は不要となる。)

 ssh -L 1586:kawa.igo.cc:1586 hoge.hoge.jp

=== [linux]netcatでポートフォワーディング
ポートフォワーディングするのにsshを使うほどでもないときはnetcatがいいかもしれない。こんな感じ→ nc -l -p 12345 -c 'nc hostname 23'

=== [debian]srecord
S-Record形式のファイルを扱いたいときに使えそうなパッケージ。srec_cat input -o output -binary みたいな感じでいけるみたい。OS-9/68Kのbinexを使う場合は-s=3オプショ ンを付けないとうまくいかなかった。

=== [linux]screenでログを取る
logfile "/home/hoge/screen%d_%m(%y).log" を .screenrc に書いておき、:logでログ記録開始、もう一度:logで終了。logfileの定義がなくても使えるが、書いておくと便利と 思う。

=== [music]上原ひろみlive on NHK BS2
http://www3.nhk.or.jp/omoban/main0205.html#20060205011 2/22らしい。

== 20060131

=== [game][java][linux]iGo棋院をappletviewerで動かす2
ときどき固まるようだ。ncでワンタイムのソケット接続にしているのがまずいかもしれない。sshでのポートフォワーディングならソケット切断してもリトライ可能なので、sshを使うようにしてみて、安定性を見てみたいと思う。あ、それとアイコン化してしまうとアプレットが停止してしまうようなので注意。

=== [game][java][linux]iGo棋院をappletviewerで動かす3
今のところ安定している。昨日と違うのはsshでポート転送していることと、碁盤を開いていない状態で放置していることぐらいかな。

=== [game][java][ruby]Hiki用 GoodShapeプラグイン開発
playgo.to の GoodShape アプレットをHiki用のプラグインにしてみました。(goban.rb)

 def goban( str )
 str = <<END
 <applet codebase="http://playgo.to/java/" code=mori.go.GoodShapeApplet width=450 height=450>
 <param name=size value=19>
 <param name=moves value="#{str}">
 <param name=advancemoves value=true>
 <param name=language value=Japanese>
 </applet>
 END
 end

=== [game][ruby]Hiki用 KGS SGFプラグイン開発
KGSからSGFをダウンロードして表示するプラグインも作ってみました。GoodShapeAppletとも連携させたいなぁ。(kgs_sgf.rb)

 require 'net/http'
 require 'iconv'
 def kgs_sgf( str )
 rv = nil
 Net::HTTP.version_1_2
 Net::HTTP.start('kgs.kiseido.com', 80) { |http|
 res = http.get("/games/#{str}.sgf")
 rv = res.body
 iconv = Iconv.new('EUC-JP', 'UTF-8')
 rv = iconv.iconv(rv)
 }
 "<pre>\n#{rv}\n</pre>"
 end

=end
