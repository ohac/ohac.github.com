=begin

== 20050107

=== [crawl]年末年始はcrawl
結局、冬休み中にはクリアできなかった。とりあえずHigh ElfのFighterで自己新記録は出した。死因はOrcish Mineの4Fぐらいでランダム階段と知らずに昇り降りしたため、orcに囲まれ、orc knightにやられた。なんとか1対1で戦えるようにしたが、一撃がきつすぎた。今思えばwandを使っておれば勝ってたかもしれない。ちなみにknightの後ろにはwarriorが3体ほどいたようだ。wizardとpriestもいたような気もする。Levelは11ぐらいだったかな。Lairも見つけたが、3Fで行き止まりになっていた。テレポートとか壁を掘る手段がなかったので、あと回しにしようと思っていた。

=== [crawl]お金落とし作戦
goblinやorcなどはお金を拾う。そこでお金を1G落とすマクロを組んでおき、拾わせながら攻撃すると相手の攻撃を受けなくて済むのではと思い、やってみた。思ったとおりうまくいった。1G落とすのはほとんどturnを消費しないようなので、かなり使える。序盤で死ぬ確率がかなり軽減できるのではないかと思う。

== 20050111

=== [diary]マックホルツ彗星
土曜日はあんまり見えなかったが、日曜日に見ると少し見えるようになっていた。たぶん大気の状態が良かったのだと思う。でもボンヤリしていることに違いはない。

=== [crawl]動く食料
ザコは倒さずに地下へどんどんもぐっていった方が良いかもしれない。あとで食料にしたり、逃げるときの障害物にしたり、神へ捧げたりできる。また、ハラヘリ状態にまで連れまわしてから倒した方が効率がよいかも。そうこうしているうちに新たな敵(ザコ含む)が出現するかもしれない。ただ、神によっては時間とともに信仰値がだんだん下がるのもあるのであまりダラダラするのは問題がある場合もあり。しかし、いつになったらクリアできるのだろうか。

=== [diary]OS-9/68K
OS-9というOSでの開発環境をなるべくlinux端末でできるようにするために(というか仕事が少しでも楽しくなるように)ツールを作成中。具体的にはOS-9サーバにあるファイルとlinux側のファイルで同期を取るというもの。ftpとかtelnetのライブラリがあるのでruby を使用している。ftpクラスはOS-9のftpdに合わしてちょっと改造する必要がある。今はwrapperクラスを作ってなんとかしている。

=== [game]6ニムト!
新年会にてプレイ。7人中3位だった。まずまずの成績か。それにしてもコツがあるようなないような不思議なゲームだ。(コツはあるのだけど、それをあまり感じさせない。)

== 20050112

=== [game]人狼BBS
気になるゲームだな。今度やってみよう。

=== [linux]manpages-ja-dev
man memcpyとしてもなんも出ない。manpages-ja-devがインストールされていなかったようだ。

=== [linux]OS-9
OS-9のソースコードの一部をlinuxで動作するように移植中。これが完成すればテストが楽になる。コンパイルもOS-9サーバと比べると高速なので快適だ。warningレベルも最大に上げておく。OS-9 v2.4のコンパイラはK&Rでプロトタイプチェックがないので、gccでプロトタイプチェックを行う。

== 20050114

=== [game]人狼BBS
募集開始から数分で満員になるから参加できないよ。募集開始時刻がわかればなんとかなるのだが、よくわからない。あ、過去ログをいくつか見ればわかるか。こういった系統(ボードゲーム、カードゲーム、パーティーゲームなど)のゲームがもっと開発されていけば面白いのにな。ネットワーク対応桃太郎電鉄とかいただきストリートとかがあってもよさそうなのに。そういえばカプコンのカタンはあれからどうなったのだろう。

=== [linux]スタティックライブラリ
こんな感じで作るようだ。

 $ ar rv libxxx.a xxx.o
 $ ranlib libxxx.a

これを使うときはgccのコマンドラインにlibxxx.aを追加するだけ。

== 20050117

=== [linux]cvs import
今更ながらcvs importの意味がわかってきた。これを使うとvendor branchというのが生成されて、そのbranchに対して変更をcommitしていけるようだ。つまり別のバージョン管理方法を採用しているような場合、そのファイルをCVSにも移しておきたいような場合に使えそうだ。ようするに独自の管理方法であるOS-9のソースをCVSへコピーできそうというわけ。これが半自動化できれば、やっとこさCVSへの移管の第一歩を踏みだせたということになる。

=== [linux]cvs rls, cvs ls
リモートでリポジトリのlsが取れるようだ。しかし、cvs server側がサポートしていないといけないらしく、社内のcvs serverではrlsできなかった。

=== [diary]スキー
お、バンドメンバからスキー(スノボ)ツアーの計画が。これはなんとしてでも参加したいな。ということでよろしく。あとでメールでも返事します。

=== [game]XEVIOUS 140万点
レトロゲームをやっている友達に影響されてゼビウスをちょっとやってみた。初日は3回ほどやってみたが、42万点どまり。最終面がクリアできなくてリタイア。次の日、10回ぐらいやってみたところ、ようやく最終面がクリアでき、3周ほどして140万点を出せた。さすがに3周目にもなると集中力が切れてきて、おまけにネコの影響もあり、ミスしまくりでした。黄色とマーチと顔面パシパシがあればもうちょっといけたかも。(あるあるネタです。)

=== [linux]fileコマンド
すげー。OS-9/68Kの実行可能モジュールファイルをlinux等のfileコマンドに通すと"OS9/68K module"と表示されるではないか。しかし、なぜかreadme.txtが"DBase 3 data file with memo(s)"と認識されてしまう。

=== [linux]cvs import binary
バイナリファイルは.cvswrappersで指定できるようだが、importするときは -W で指定する必要がある。このとき-Wオプションをいくつも指定することができるようだ。(例: cvs import -W "*.bin -k 'b'" -W "*.png -k 'b'" ...)

=== [linux][vim]Kでman 2を開く
viのKキーで、sleep()とかopen()とかを調べたいのに、違うman pageが出て困る。こんなときはset kp=man\ 2とすればOK。ファイルの拡張子ごとに変えてやればもっと便利かも 。

== 20050118

=== [linux][vim]Kでman 2:3:1を開く
昨日のやりかたでは1つのセクションしか検索できていなかったので set keywordprg=man\ -S\ 2:3:1:4:5:6:7:8:9 のように変更してみた。うん、快適だ。

=== [diary]バグ発見
電話でいろいろ話をしていてソースコードを確認しているとたまたまバグを発見した。つい言ってしまったが、激レアケースで、しかもバグが発動しても大した問題にならなさそうだったので黙っておいた方がよかったかも(悪人?)。でも言ってしまったので直してリリースすることになった。

=== [english]English mail
uim MLの未読処理がたまってる。積極的に読んでいかないとたまっていくなぁ。今は読むことで精一杯だ。

=== [english]本買った
図書券をもらったので英会話の本を買った。readingとlisteningをメインにやってたので、writingとspeakingが苦手。そこで簡単なスティーブン・ソレイシーのなるほどフレーズ100というのを買った。読みと聞きは簡単なんだけど、いざ自分からoutputしようとするとなかなか出てこないフレーズが多いので、このぐらいの難易度がちょうどいいかも。しかし、「最強の英会話教師」って、何を基準に最強なのかは不明だ。

== 20050119

=== [diary]bugzilla
へえ、bugzillaって、バグの依存関係も設定できるのか。

=== [diary]OS-9のソースをCVSに
やっとできた。と思ったらinetdが死んだ。sleepが必要か。

=== [vim]CTRL+V
ブロックでの範囲指定ができる。初めて知った。

=== [vim]howm
,,cでページ作成したときに、そのとき開いていたファイルにもファイル名がリンクできたら便利だと思う。vimの機能で"]f"とタイプすればそのファイルを瞬時に開いてくれるし。s:OpenMemo()に以下のようなコードを追加したらいけそうだ。

 if a:linenum == 0
   call append('.', g:howm_glink_pattern . ' ' . filepath)
 endif

"/home/username/" は "~/" に変換してしまいたいなぁ。1行に収まっていないので。

=== [game]MH G
明日、Monster Hunter G発売。欲しいな。

== 20050120

=== [diary]OS-9のソースをCVSに(訂正)
昨日の「inetdが死んだ」というのはうそです。「1分間の接続回数制限にひっかかった」ということです。

=== [game]MH G
今日Monster Hunter G発売。欲しい。

=== [game]super XEVIOUS 30万点
うーん、難しい。ブラグザカートの連発はきつい。

=== [diary]洋楽の歌詞
http://www.sing365.com/ からダウンロードできるが、速度が遅いのでなんとかしたい。artist/ の下にAで始まるアーティストなら a.html, a2.html といったページに分かれてインデックスがおいてある。これをwgetとかでローカルに保存しておけば便利かもしれない。歌詞ダウンロード支援ソフトでも作ってみるかな。 grep -o lyric.nsf[^\"]* a.html とかすると重要なリンク部分だけ抜き出せるな。インデックスページの一覧は grep -o "artist/[^>\"]*" a.html | sort | uniq という感じか。

== 20050121

=== [game]MH G
買ってもうた。オンに接続できないみたいなので、オフを2つほどクリア。

=== [uim]uim-fep UIM_FEP_SETMODE
vimから echo 0 > $UIM_FEP_SETMODE で 直接入力モード、ひらがなモードがトグルするらしい(Anthy-ML 1613より)。

=== [uim]uim-fep with screen
以前にscreenの仮想shellごとにuim-fepを起動してどうこう、とか話をしたと思いますが、試してみるとuim-fepを先に起動してscreenを後で起動すればuim-fepは1つだけで済むことに今頃気付きました。これでzaurus上でもuim-fepがサクサク使えそうな気がしてきた。

=== [linux]screen maptimeout
vi使っていて、ESCを押しても反応が遅いのはこれで調整できるのかな。C-a : でmaptimeoutと実行すると300msと表示された。もう一度maptimeout 10と設定するとESCの反応が速くなった。.screenrcに書き込み、完了。ああ、あとmsgwaitというのも0.3秒に設定しておこう。それとstartup_messageもoffに。

=== [linux]screen split
おお、画面分割ができるのか。できるのではないかとは思っていたが、やはりできたか。以下のキーバインドを追加した。

 bind j focus down
 bind k focus up

=== [linux]screen ブロックでのコピー
vimのC-vみたいな範囲指定ができるのか調べてみた。コピーモードでcとCで左端と右端を設定できるようだ。なるほど。

=== [linux]洋楽の歌詞
スクリプトを作成した。./mklist.shでindexを更新、./getsong.sh artist-name でアーティスト一覧を所得、表示。./getsong.sh artist-name song-name で歌詞のダウンロードとtext変換といった感じだ。かなり、無理矢理だが一応使い物にはなる。text変換をもうちょっと改善したいな。それとアルバム名からの検索もできたら便利かも。

 ---mklist.sh
 #!/bin/bash
 wget -c http://www.sing365.com/artist/{a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,0-9}.html
 grep -o "artist/[^>\"]*" [abcdefghijklmnopqrstuvwxyz].html | sort | uniq \
 | grep -o "[a-z][0-9][0-9]*\.html" >more_index
 files=`tr "[:cntrl:]" " " <more_index`
 files=' '$files'END'
 files=${files/ END/}
 wget -c ${files// / http://www.sing365.com/artist/}
 cat 0-9.html [a-z].html [a-z][0-9]*.html \
 | tr \\351 ? \
 | grep -h -o "lyric.nsf[^\"]*" \
 | sort >database

 ---getsong.sh
 #!/bin/bash
 #ARTIST=a-ha
 #TITLE=take-on-me
 ARTIST=$1
 TITLE=$2
 #echo $ARTIST' '$TITLE
 if [ -z $ARTIST ]; then
     echo "usage: $0 artist title"
     exit
 fi
 if ! [ -a $ARTIST.rslt ]; then
     files=`grep -i $ARTIST database|tr "[:cntrl:]" " "`
     files=' '$files'END'
     files=${files/ END/}
     wget -O $ARTIST.rslt ${files// / http://www.sing365.com/music/}
 fi
 if [ -z $TITLE ]; then
     grep -o "lyric.nsf/[^/\">]*" $ARTIST.rslt | grep -i -e -$ARTIST
     exit
 fi
 if ! [ -a $ARTIST.$TITLE.txt ]; then
     files=`grep -o "lyric.nsf[^\">]*" $ARTIST.rslt | grep -i $TITLE | tr "[:cntrl:]" " "`
     files=' '$files'END'
     files=${files/ END/}
     wget -O $ARTIST.$TITLE.html ${files// / http://www.sing365.com/music/}
     w3m -dump $ARTIST.$TITLE.html > $ARTIST.$TITLE.txt
 fi
 #cat $ARTIST.$TITLE.txt

=== [ruby]-n option
ほほう。フィルタを作るときには便利なオプションですな。BEGIN{}とEND{}と組み合わせるといいのか。

=== [diary]社内ML
む、社内MLのアナウンスメールが英語に変わっているぞ。

== 20050124

=== [game]MH G
クック訓練所を1つクリア。10分前に大タル爆弾Gなどが支給されるようだ。

=== [english]洋楽練習
英語の発音と歌の練習ということでいろいろボソボソと何オクターブか下げて歌ってみた。Take 6, Tack and Patti, Jamiroquai, Elvis Costello, Style Council, 今井美樹(fiestaというアルバム)など。のどが痛くなった。防音室でもあれば大声で歌えるのだが。

== 20050125

=== [im]きゅうり改
という配列があるらしい。「しゅ」、「しゅう」、「コーヒー」、「入力法を練習します」がそれぞれ fi, fii, dlpskp, eiirodjsljxlr;nfiifkwhfj となるらしい。AZIKだと xu, xh, nghryokuhpwordxhsims か。NICOLAだとsSf, sSfa, rSxxSx, SuSfaSeSli.aSaSt;sSfasSoc(Sは親指シフトを示す)。実装の容易性とタイプ数の少なさからいうとやはりAZIKがいいな。

=== [im]私がNICOLA配列を捨てたワケ
ついでにちょっと頭の中を整理。

* QWERTYやJISかな配列も極めればかなり速くなる。自分のNICOLA打ちでは高速タイパーにはとても勝てない。ちなみに自分のQWERTYもNICOLAとあまり変わらない速度である。
* 実装が難しい。つまり、なかなか実装されない。
* 同時打鍵には時間というパラメータがあるのが気に入らない。(同時の定義はどうなるのか、超高速でタイプしたときに同時打鍵との区別が付くのかなど。)
* SKKとの相性が悪い。(普通シフトと親指シフトの同時入力は難しい。それに私はSKKを使うとき普通シフトを親指に割り当てているので、空きがない。また、"/", "l", "q" は使えない。)
* 英語キーボードでは使えない。
* 片手では打てない。
* 外来語が入力しにくい。特に「ゃー」は左手がつりそうになる。</ul><p>

というワケで今はAZIK+SKKに乗り換えて、かなり満足している。

== 20050126

=== [linux]覚えておくと便利なフィルタ
使い方をすぐに忘れるので簡単なやつから覚えようと思う。

* awk '{print $1}' ...... 左端の単語を抽出
* sed -e 's/old/new/g' .. old を new に置き換え
* tr a b ................ a を b に置き換え
* tr ab AB .............. a, b を A, B に置き換え
* tr ab A ............... a, b を A に置き換え
* echo `ls -l` .......... ls -l結果の改行/TAB/SpaceをSpace 1個分に

=== [linux][english]スペルチェッカ
ispellは知ってたけど、ただのspellというコマンドがあるのは知らなかった。iはinteractiveの略だったのですね。EUC混じりのテキストをspellコマンドに通しても問題なさそうなので、ispellよりもspellの方が便利そうです。

=== [english]日本昔話
http://www.geocities.co.jp/HeartLand-Gaien/7211/ とても簡単で読みやすい。ストーリーも知っていることが多いので、わかなない単語が出てきても推測できるのよい。多読の一環として全部(158話ある)読んでみるかな。とりあえず1〜3を読み終えた。

== 20050128

=== [game]もう1度やりこんでみたいGAME
私も書いてみた。

* Super XEVIOUS (100万点目指したい)
* The Tower of DRUAGA (昔、達成したような気がするノーミスクリアを目指す)
* グロブダー (あんまり得意じゃなかったけど、なんか極めたいような気がする)

うむ。あまりないな。やり直す気力がないやつなら...

* Fire Crystal (Black ONYXの続き)
* Xanadu とシナリオ2
* ソーサリアン
* ギャプラス
* ドラゴンバスター
* メトロクロス

って、ところかな。

=== [linux]cvs -n up
ローカルファイルの状況を確認するとき"cvs re ."を実行していたが、"cvs -n up"の方が便利かもしれない。

=== [english]日本昔話
4〜6読破。7途中。

== 20050131

=== [english]Love Actually
映画を見た。聞き取れる箇所が前よりは増えたような気がする。

=== [game]MH G
HR14にup。キリンは強すぎる。オフはモノブロスクリア。訓練所はクックの片手剣とボウガンをクリア。

=== [windows]su
windowsでのsuみたいなやつはrunasというコマンドらしい。メモ。

=== [linux][english]辞書調査
中途半端だが、メモっとく。

* /usr/share/edict/edict (和英)
* /usr/share/edict/kanjidic (漢字)
* /usr/share/edict/compdic
* /usr/share/dict/american-english (spellのみ)
* dict-gcide - A Comprehensive English Dictionary
* dict-moby-thesaurus - Largest and most comprehensive thesaurus
* edict - English / Japanese dictionary
* enamdict - Dictionary of Japanese proper names
* kanjidic - A Kanji Dictionary

=end
