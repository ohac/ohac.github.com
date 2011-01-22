=begin

== 20050404

=== [linux]ブラウザでハングル
mlterm+w3mmeeだとeuc-krなページが普通に見れる。でもfirefoxでハングルの表示がうまくいかない。どのフォントを使えばいいのかな。いろいろ試しているとttf-unfonts, ttf-baekmuk, ttf-alee, mozilla-firefox-locale-ko, xfonts-baekmukあたりを適当にインストールしたら表示されるようになった。たぶん入れなくてもいいやつも入れてしまったと思うが、まあいいか。uimでの入力もできてそうな感じだ。

== 20050406

=== [diary]太陽系外惑星の写真(mixiの星空好きコミュより)
http://www.uchutaiken.com/ ここのトピックスよりリンクされている。すごいな。

=== [english]NHK
テレビ英語講座がリニューアルされたのでちょっと見た。

=== [english]Ally McBeal
レンタルDVD 3本目に突入。他のドラマと比べると収録時間が長いのでお得。

== 20050407

=== [linux]EUC-KRなmlterm
/etc/locale.genにko_KR.EUC-KRを追加し、/usr/sbin/locale-genを実行。LANG=ko_KR.EUC-KR mltermで実行すればOK。

=== [english]NHKイギリス英語
ドラマ。若者のイギリス英語がさっぱり聞きとれない。がっくし。

=== [linux]firefoxでCtrl+h
Ctrl+hをBSとして動作させたい。/usr/lib/mozilla-firefox/res/builtin/platformHTMLBindings.xmlに handler event="keypress" key="h" modifiers="accel" command="cmd_deleteCharBackward"のようなタグをinputFieldsとtextAreasに追加するといいらしい。ユーザ別の設定ファイルにしたいんだけど、まあいいか。

== 20050408

=== [uim]0.4.6final1-2
バージョンアップされていたようだ。後で入れ替えてみよう。

=== [uim]uim-skk辞書登録が遅い
別のインスタンス(例えばuim-ximとuim-fep)で同じ単語(「帰る」と「返る」など)を繰り返し辞書登録(優先順位変更)すると登録処理にとても時間がかかることがある。またインスタンスを終了するときも遅いときがある。新しいバージョンで直ってたらうれしいけど、直ってなかったら報告しないといけないなぁ。

=== [uim]0.4.6final1-2続き
directしか選べなくなって、大変苦労した。結局、uim-m17nlibというパッケージをインストールすることで解決。原因はよくわからない。お隣りさんのdebianにはuim-m17nlibがなくてもちゃんと動作しているようだ。うーん。ちなみにuim-skkの辞書登録が遅い問題はどうやら解決していたようだ。

=== [vim]set encoding
今までは set encoding=japan と set termencoding=EUC-JP を .vimrc に設定していたが、これは設定しない方がよいということがわかった。設定していなければ、LANGの設定に合わせて自動設定してくれるようだ。これでLANGがja_JP.UTF-8になっていてもちゃんと動作するようになった。ちなみに LANG=ko_KR.EUC-KR mlterm --im=uim:hangul2 で立ち上げた mlterm だと EUC-KR なファイルが vim で編集できるようだ。

=== [mutt][debian]文字化け
apt-get dist-upgradeしたら、muttがまた文字欠けするようになった。ということでまたwoodyのパッケージに戻した。mutt-utf8というのも入れて、UTF-8のmltermで動作することを確認した。使うことはあまりないと思うけど。

== 20050411

=== [diary]花粉症
金曜ぐらいから花粉症がひどい。目、鼻、喉がつらい。マスクをせずに花見なんかに参加したのが悪かったのかも。ということでマスクを購入。

=== [diary]HDDレコーダ
ようやく購入することになった。東芝のやつにした。

== 20050414

=== [diary]高速かけ算メソッド
http://adunion.cocolog-nifty.com/column/2004/03/post_9.html これを見て、以下の式を考えてしまった私は変だろうか。

 729 * 639
 = (730 - 1) * (640 - 1)
 = 73 * 64 * 100 - 730 - 640 + 1
 = (70 + 3) * (60 + 4) * 100 - 1370 + 1
 = (7 * 6 * 100 + 180 + 280 + 12) * 100 - 1370 + 1
 = (4200 + 460 + 12) * 100 - 1370 + 1
 = 467200 - 1370 + 1
 = 465200 + 630 + 1
 = 465831

ちなみに九九を間違えて、予想以上に時間がかかってしまったことは内緒だ。

== 20050419

=== [linux]stty erase ^H
CTRL+HがBS(Back Space)と同じ動作になるようにするコマンド。実際には stty erase [CTRL+V][CTRL+H] と入力する必要がある。画面上は stty erase ^H と見える。

=== [ruby]libreadline-ruby
というか、rubyから1行入力を行うときはgets()ではなく、libreadline-rubyをinstallして、Readline.readline()を呼べばいいのか。これで日本語入力がやりやすくなる。

=== [diary]w.p.m.
www.kojima.netより引用『キー入力のスピードを現わす国際的な単位は、このように「1分間に単語(アルファベットの文字を5文字打つと1つの単語となるという約束事を覚えてください)をいくつ打てます」という意味でw.p.m.が使われています。一つの目安として、世界基準(Global standard)は20w.p.m.です。外資系の秘書なら50w.p.m.を要求されます。』

== 20050420

=== [linux]/usr/bin/mozilla-suite
隣の席から/usr/bin/mozilla-suiteがエラーになるとのことで調査。どうやらif,elif,fiの対応がおかしいようだ。fiを一箇所消したら直った。

=== [im]KZIKとタイピング練習
Wikiページを作成。 http://ohac.sytes.net/pukiwiki.php?kzik

=== [im]scim-skk
パッケージができたようだ。まだ試していないけど。uim-skkと比べて、どうなんだろうか。AZIK(KZIK)に対応できそうかどうか調べてみたいところだが、また今度。

=== [diary]風来のシレン2
友人よりNINTENDO 64を借りたので、再開。鬼ヶ島の最後で鬼に囲まれてやられる。今思えば、皮の盾のまま戦ったのが間違いだった。それと杖や巻物が未識別のまま、鬼の部屋に突入してしまったのも問題があった。何階まであるのか知らんかったからしゃーないかな。

== 20050421

=== [diary]ルータ入れ替え
無線LANルータを購入し、セットアップした。無線APが2箇所になったので、全ての部屋で無線LANが使えるようになった。これはうれしい。だんだんシステムが複雑になってきたなぁ。東芝のHDDレコーダやPS2もLAN接続されているし。サーバのHDDがヤバい音を発していた。そろそろ交換せなやばいかな。でもノートPCのHDDって、交換したことないなぁ。GWにやってしまうか。

=== [music][english]80's
ツタヤで80年代の洋楽の懐しいアルバムとかベストとか借りた。

=== [uim]libuim-ruby
rubyからlibuimが使えるらしい。

=== [xp]何のために見積るか
「開発効率を向上させたい。そのためには実績を客観的に判断できるものさしが必要。見積りと実績を比較して、開発効率が向上したかどうかが見えるようにしたいので何か考えて。」との命令。はっきり言って大反対。まず疑問がいっぱいある。

* 見積りの誤差が大きいと評価にならない。
  * 誤差の大きいもので仕事を評価されてはたまらない。
* そもそも見積り可能なのか。
  * 例えばスピードなどの性能を10%向上させるには何工数必要か。
  * それは現在のスピードがいくらかによって大きく変わる。
  * カールルイスに「あと1秒速く走れ」といってもそれは無理だ。
* 実績の方では割り込みの時間をちゃんと考慮されるのか。
  * 実績も正確に記録されていなければ意味がない。
  * 結果がよくなるように見せるためにウソの実績を報告される可能性もある。
* で、開発効率が向上していたら(または向上していなかったら)どうするのか。
  * そこのプランが見えないとやる気がしない。

結局、手間ばかりが増えて、ほとんどメリットがないように思える。今日の定時後に打ち合わせらしいので、このあたりを聞いてみることにする。

== 20050425

=== [ruby]getopts is deprecated
optparseを使えとのこと。

=== [diary]PRIDE
吉田vsシウバ。いい試合だった。

=== [linux][game]碁
碁関連のパッケージ。gnugo,mgtはコンソールアプリのようだ。

 cgoban - complete Go board
 gnugo - play the game of Go
 gtkgo - Skinable version of the game "Go"
 mgt - a game record display/editor for the oriental game of go
 uligo - tsumego (go problems) practice tool
 qgo - Go client and full featured SGF editor

== 20050426

=== [linux][game]碁
gnugo は cgoban のエンジンとして使用できるようだ。これらはとあるプロトコルでやりとりされているらしい。エンジンとGUIを分離しているのはとてもUNIXらしい設計だと思う。gnugoのテキスト表示はモノクロの半角文字なので見にくい。表示用のフィルタを自作し、これを通すことでカラーの全角表示が実現できた。これは gnugo | ./gnugo.rb のように使用する。ヘルプが乱れるなどの不具合があるが、もうちょっと工夫したらなんとかなりそうだ。ちなみに碁は超初心者です。「ヒカルの碁」に影響されて、ちょっとルールを覚えた程度。

 #!/usr/bin/ruby -n
 $backcolor = "34"
 if $_  =~ /^[^ ]/ then
   gsub(/\(x,o\)/, '(△,▲)')
 elsif $_  =~ /A B C/ then
 elsif $_  =~ /White/ then
   gsub(/\(O\)/, "\033[0m●\033[" + $backcolor + "m")
 elsif $_  =~ /Black/ then
   gsub(/\(X\)/, "\033[0m○\033[" + $backcolor + "m")
 elsif $_  =~ /^ *[0-9]/ then
   gsub(/\../, '・')
   gsub(/\+./, '＋')
   gsub(/O\)/, "\033[0m■\033[" + $backcolor + "m")
   gsub(/X\)/, "\033[0m□\033[" + $backcolor + "m")
   gsub(/O./, "\033[0m●\033[" + $backcolor + "m")
   gsub(/X./, "\033[0m○\033[" + $backcolor + "m")
   gsub(/o./, "\033[0m▲\033[" + $backcolor + "m")
   gsub(/x./, "\033[0m△\033[" + $backcolor + "m")
 end
 $_ = $_.chop
 puts "\033[" + $backcolor+ "m" + $_ + "\033[0m"

=== [vim]grep
nnoremap <silent> gr :grep <cword> *<CR> のように定義しておけばgrでカーソル上の単語をgrepできる。

=end
