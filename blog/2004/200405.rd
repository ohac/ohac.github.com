=begin

== 20040510

=== [ゲーム] Mangband build

mangbandのビルドメモ。

mangband-070-dsb-20040306.tar.bz2 に mangband070.01-xim.diff.gz のパッチを当てる。
 $ cd mangband-070-dsb-20040306/
 $ zcat ../mangband070.01-xim.diff.gz | patch -p1

すると src/Makefile でエラーが出るが CFLAGS と LIBS を以下のようにすれば OK のようだ。

 CFLAGS = -Wall -g -pipe -D"USE_XAW" -D"USE_GCU" -D"USE_XIM" -I/usr/include/ncursesw
 LIBS = -L/usr/X11R6/lib -lX11 -lXaw -lncursesw

apt-get で libncursesw5-dev, xlibs-dev, libxaw7-dev あたりをインストールしておく必要あり。最後に src に cd して make で完了。./mangclient で実行できる。

入手先メモ:
* 本体: http://dsb.to/~yakina/mangband/
* パッチ(Patch for Originalの方): http://homepage2.nifty.com/vgdfm/

=== [ゲーム] モンスターハンター

オンラインゲームがやりたくてモンスターハンターを買ってしまった。(まだ届いてないけど。)

誰がやってる人いるかな。

== 20040511

=== [ゲーム] mangband設定ファイル

mangbandの設定ファイルはカレントディレクトリにlib/user/options.prfというファイルを作ればよいみたい。

 Y:rogue_like_commands
 X:always_pickup

とりあえずこんなかんじ。

* mang-j022-dsb.zipにWindows版の初期設定ファイルがあるのでこれを利用するとよさそう。またreadme*もあるので読んでおくこと。 -- ohac 2004-05-12 (水) 12:03:28

== 20040514

=== [ゲーム] PS2をネットに

昨日、繋げてみた。

特に問題もなくすんなり繋がった。

そしてUSBキーボードもテスト。PS/2をUSBに変換するCoregaの装置を使い、IBMのキーボードを接続、これも問題なく動作した。しかし、テンキーは使えないようだ。そういうものなのかな。

モンスターハンターをするための契約処理をPS2上で行った。日本語入力に苦労するがなんとか完了。すぐにゲーム自体の登録も終り、早速街へ。

ネットワークゲームはMangbandを除くと初めてなので緊張した。クエストレベル1の人がいる街へ入り、その人と2人でレベル1のクエストを2つやってみた。チャットとキャラの操作の切り替えに手間取ったり、途中、砥石や食料がなくなり苦労したが、なんとかクリア。

その後、ログアウトしてオフラインでレベル2のクエストを1つクリア。1人だと気楽だ。慣れたらオンラインでもリラックスしてできるだろうか。

== 20040520

=== [ゲーム] モンスターハンター

オンラインにも慣れてきて、だいぶ面白くなってきた。
序盤で手に入りやすい素材での調合についてまとめてみた。

* 回復薬* (薬草, アオキノコ, ハチミツ)
* ペイントボール (ペイントの実, ネンチャク草)
* *タル爆弾 (火炎草, *タル, ニトロダケ)
* 毒生肉 (生肉, 毒テングダケ)
* シビレ生肉 (生肉, マヒダケ)
* 眠り生肉 (生肉, ネムリ草)
* けむり玉 (ツタの葉, 石ころ, ネンチャク草)
* 閃光玉 (光蟲, 石ころ, ネンチャク草)
* こやし玉 (モンスターのフン, 石ころ, ネンチャク草)
* 強走薬  (にが虫, ハチミツ, 生焼け肉)
* 落とし穴 (ツタの葉, クモの巣, トラップツール)
* 解毒笛 (角笛, にが虫, 大地の結晶)
* 音爆弾 (火炎草, ニトロダケ, 鳴き袋)

== 20040521

=== [ゲーム] MH地図

地図。

http://www.geocities.jp/web_monsterhunter/hoka_2/saisyu/index.html

これが欲しかった!

=== [ソフト開発] tcpdumpメモ

tcpdumpの使い方メモ。
 tcpdump -s 128 -vvv -X -N "tcp and src host hoge and tcp[13] & 8 != 0"
この例だと、
 |-s 128|snaplen を 128 bytes に|
 |-vvv  |詳しく表示|
 |-X    |16進ダンプとASCII表示|
 |-N    |ドメインは表示しない|
 |tcp   |TCPを表示|
 |src host hoge|ホストhogeから送信されたパケットを表示|
 |tcp[13] & 8 != 0|PSH (push) フラグの立っているパケット表示|
となる。

== 20040525

=== [linux] a2psj使い方

a2psj のメモ。

* a2psj -p で段組みなしの印刷(portrait)
* a2psj -nh -nt でヘッダフッタがなくなる(no header, no tail)
* a2psj -ns で枠がなくなる(no scale), 右下のページ印字もなくなる。
* a2psj -m でパンチ穴のガイドを印刷(punch Mark)

よく使うと思われるのは

* a2psj -nh -nt -ns    hoge.txt >hoge.ps (段組み)
* a2psj -nh -nt -ns -p hoge.txt >hoge.ps (段組みなし)

こんな感じか。aliasでも作っておいた方がいいかも。

== 20040526

=== [linux] Sylpheedでメールの印刷

全般の設定、その他、印刷のところを、
 a2psj %s | lpr
と設定すればOK。a2psjのオプションはお好みに合わせて変更。
