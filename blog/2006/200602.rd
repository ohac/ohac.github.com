=begin

== 20060202

=== [game][java][linux]iGo棋院をappletviewerで動かす4
sshでポート転送してみると安定動作しているようだ。しかし、棋譜検索して、その棋譜を表示したくても表示されない。これはブラウザと連動させているのであろうか。appletviewerの限界かな。

=== [game][java][ruby]Hiki用 KGS GoodShapeプラグイン開発
KGSからSGFをダウンロードして、それをGoodShapeで表示するプラグインも作ってみました。ソースは省略。そのうち自分のCVSにでも入れとこうかな。

=== [ruby]StringIO
Stringの+=で文字列をどんどん追加していくと、サイズが増えるに従って極端に遅くなってくる。大きな文字列を作るときはStringIOクラスを使った方がよい。これはJavaで言うところのStringBufferみたいなものであろう。

=== [linux]newgrp & groups
グループを変えるコマンドって、何やったかな...。ああ、newgrpか。groupsというコマンドも覚えとかなアカンな。

== 20060206

=== [debian]ttyplayerとhiki
ttyplayer appletをhiki pluginにして、パッケージを作ってみた。

=== [linux]ttyrecしたデータを編集
時間がかかっているところを短くするようなことができたらいいのにな。作れるかな?

=== [linux]firefox調子悪い
firefoxがときどき調子悪くなる。googleツールバーとの相性が悪いのかもしれないと思って、これを外してみた。...が、関係なかったようだ。

=== [linux][zaurus]firefox用 All-in-One Gestures
入れてみた。これは便利かも。ザウルスでvncviewerの窓からfirefoxを開いているときは左クリックでジェスチャーできるようにしておけば快適かも。まだ試してないけど。

=== [linux][debian]firefoxとFlashGotとd4x
詳細で Downloader 4 X というのを選べば使えるようだ。

=== [debian]hikisetup(メモ)
/usr/bin/hikisetupのFile.makedirsをFileUtils.makedirsに書き換え。hikisetup実行。/usr/share/hiki/misc/plugin/attach/attach.cgi を /usr/share/hiki/ にコピー。hikisetup でできた hiki.cgi をマネして、 /usr/share/hiki/attach.cgi を load するような attach.cgi をhikisetupでできたディレクトリに作成。 .htaccessは消す(mv)

 sudo adduser username www-data
 newgrp www-data
 chgrp www-data hiki/data
 chmod g+w hiki/data -R

=== [debian]apache2とuserdir(メモ)
apache2インストール。a2enでuserdirを有効に。/etc/apache2/sites-available/hikiを作る。a2ensiteでこれを有効に。

 DirectoryIndex hiki.cgi
 AddHandler cgi-script .cgi
 <Directory "/home/*/public_html">
 Options +ExecCGI -Indexes
 </Directory>
 <Directory "/home/*/public_html/data">
 Deny from all
 </Directory>
 <Files "hikiconf.rb">
 deny from all
 </Files>

== 20060207

=== [debian]FreeMind
Mind Mapというのを作るソフト。なかなかいいかも。普通のメモとしても使える。

=== [debian]ArgoUML
UMLを作成するツール。まだ画面をちょっと見たぐらい。UMLの書き方をあまり知らないので、そこから勉強しないといけない。

== 20060208

=== [diary]del.icio.us
http://del.icio.us/ に登録したので、ブックマークを移動。自宅PCのブックマークは移動完了。会社PCのブックマークは...かなり多い。

=== [xp][wiki]FreeMind Applet
Java Appletがあるようだ。HikiとかCVSとかと接続できるようにしてみたいなぁ。

=== [xp]VNCでFreeMind
社内IRCでChatしながらFreeMindの画面をホワイトボードのようにみんなで見る、というのを実験してみた。参加者がFreeMindの使い方を知らないので、あまり大したことはできなかったが、今後いろいろ試していきたいと思う。

=== [xp]UML練習
ユースケース図を書いてみた。慣れてないのでなかなか進まない。というか、勉強してから書けよ、と言われそうだ。気がつくとユースケースっぽくない実装を意識したような図が出来ていた。いかんいかん。

== 20060209

=== [xp][debian]ArgoUML+J2SDK1.5
ArgoUMLのクラス図でattributeとかoperationが表示されない問題があり、使い方が悪いのかといろいろ試していたが、J2SDK1.4を使っていたのが悪かったようだ。J2SDK1.5に入れ替えるとちゃんと表示されるようになった。おまけにLook&Feelもかっこよくなり、日本語入力の表示位置も改善された。

=== [xp]ArgoUML
ユースケースとかTODOとかの使い方が少しずつ分かってきた。でも、やっぱりちゃんとした本を一つ欲しいなぁ。Webでの入門記事だと目が疲れてしゃーない。今度買いに行こう。

=== [diary]三菱i
デザインが好みだ。ミッドシップというのもいいなぁ。

== 20060220

=== [xp]IRCbotとscreenとttyrec/play
チャットしながら、screenで画面共有しながら、コードレビューして指導とかしており、画面操作の状況をttyrecすれば後で見直しができるので便利。しかし、チャットは別画面になっているので、チャットの内容がttyrecに記録されない。これを解決するにはIRCbotをscreenのマルチウィンドウで動作させておき、チャット内容を表示させるといった方法が考えられる。いつかやってみたい。

=== [xp][ruby][debian][vim]rbotとnadoka
RubyでのIRC botのようだ。これを使うかな。いや、proxyならnadokaの方がいいのかな。nadokaの方がよさそう。ログをtail -fでリアルタイム表示しておけばttyrecできるな。vimircとは相性が悪いような気がする。とりあえずxchatでproxyに接続してみた。

=== [ruby][vim]nadokaでVimIRC
VimIRCはnadokaのbacklogbotと相性が悪いみたい。 DefaultBotFiles = [] で空にしてやれば普通に動作するようだ。いや、そうでもないか...。ちょっと挙動がおかしい。

=== [diary]すごいCUI
すごいGUIというのを同僚から教えてもらった。http://www.youtube.com/watch?v=iVI6xw9Zph8 自分としてはすごいCUIというのを考えてみたいな。例えばカーソルが2つあるとか、複数の人で画面をあちこち触れるとか、メッセージがポップアップするとか、それでいてシンプル設計とか。

=== [diary]トリノモーグル男子決勝
やっとこさ、録画してあったモーグルを見た。いやー、決勝は感動しました。印象に残ったのは2位の人のスピード・アグレッシブさ。そして、1位の人の綺麗なフォーム。あと1080を決めてきた人もすごかった。スコアは伸びなかったけど、まあしゃあないかな。そして、なんといっても三浦豪太の解説。「あー、この舌の動きは....微妙ですね。」って、そんな解説いらんねん(笑)。

=== [game][debian]ボンバーマン
bombercloneというパッケージ。ついついハマってしまった。

=== [game][debian]カタン
pioneersというパッケージがあり、これがあればカタンができる。一人でプレイするにはpioneers-ai, pioneers-client, pioneers-server-gtk あたりをインストールしておけばOK。対戦したコンピュータはやたら速いので流れが掴めないデメリットがあるが、まあ楽しめるレベルか。Windows用のクライアントはあるのかな。あればWindowsユーザと対戦して遊べそうだが。

== 20060222

=== [debian]weechat (IRC)
VimIRCがnadoka経由だとうまく動かないので別のCUIのIRCを探す。irssiというのを試すが、日本語をどう扱うのか分からず断念。weechat-curses を試すと画面が乱れたが、TERMCAPのせいだろうか、GNU screenの中で動作させると乱れがなくなった。 .weechat/weechat.rc にlook_charset_decode_utf = "ISO-2022-JP"と設定してやれば日本語が使えるようになった。日本語入力をBack Spaceで消すと1byteずつしか消えないという問題があるが、まあ我慢できるレベルである。

=== [debian]weechat (IRC) 続き
あー、ダメだ。行を折り返すと文字が乱れる。うーん。軽くてよさそうだったのに。しかも server_charset_encode = "ISO-2022-JP"としておけばサーバへ送るメッセージがJISになるけど、JISモード終了のEscape sequenceが抜けてるし。うーん。nadokaのプラグインとしてCUIを作った方が早いかも。

== 20060224

=== [music]上原ひろみlive
NHK BSでやってた。感動しました。やっぱり天才ですこの人。巨匠と呼ばれる日も近いでしょう。

== 20060228

=== [diary]スキー
奥伊吹にいってきた。デジカメで動画をとってもらったが、自分のO脚具合に愕然とした。これじゃあ足が揃っているように見えないよ...。モーグル用コースはコブが深くて斜度がきつかったので難しかった。それに雪質が悪くてバランスが崩れまくり。筋力は落ちてるし。まあ、でも楽しかった。

=== [debian][ruby]IRC nadoka用CUIプラグイン
とりあえず作ってみた。readlineのライブラリが必要です。http://ohac.sytes.net/cgi-bin/viewcvs.cgi/ohac-files/ ここのtermclient.nb ってやつを /usr/share/nadoka/plugins にコピーして、nadokaの設定ファイルで 'termclient' をプラグインに加えたらOK。

=end
