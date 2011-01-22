=begin

== 20050801

=== [vim]Space to TAB
:set noexpandtabのあとに:retab!とする。!がないとうまくいかない。TABをSpaceにするときは:set expandtabのあと:retabでOK。!がなくてもいいみたい。

=== [game]gnugo
13路。3子のハンデをもらって勝てました。まだまだ置石なしは遠い。

=== [game]シレン2 神社44Fで持ち帰り
44Fは大部屋のモンスターハウスだった。なぜか壺からモンスターが出なかったので諦めてアイテムを持ち帰った。モンスターの数が多すぎると召喚できないのかも。今度からは聖域とモンスターの壺を1つずつぐらいは持っておくようにしよう。ちなみにHPは400以上あった。

== 20050802

=== [chinese]中国語基本単語1000
ピンインと漢字が書かれた中国語基本単語1000 http://www.penta.ge.cst.nihon-u.ac.jp/~guohaiyan/Chineseword/top.html というのを見つけた。これのHTMLソースからlv -Ou8でUTF-8化して、文字化けしていない部分をtailとheadを使って取り出し、HTMLタグを消して単語帳にしてみた。使用条件はちょっとよくわからないけど個人的に使うぐらいなら問題ないと思う。意味は書いていないので、別途調べる必要がある。

=== [uim]ipa-x-sampa
発音記号の入力を試してみる。なんか"_"とか"|"あたりを押すとmltermが落ちることがあるなぁ。バグがたくさんありそうな予感。それにしても変調記号の入力方法がよく分からないなぁ。

== 20050803

=== [mutt]添付ファイルを転送
vで添付ファイル表示モードにしてtですべてにタグを付ける。;fで転送すればよい。ただし、impliccit_autoviewはnoでなければならないようだ。

== 20050804

=== [linux]gcc 4.0
gcc 4.0環境に変わっていたので、今まで出てなかったwarningが出るようになっていた。主にsigned/unsignedの違いでいろいろ出ているようだ。修正しておいた。

== 20050808

=== [diary]mixi囲碁部オフ会
8/5,6とオフ会に行ってきた。勉強になったけど一勝ぐらいはしたかったなぁ。もっとがんばらないと勝てないな。後日、gnugoと対戦してみたが、あまり強くなった気はしなかった。棋力は上がったかもしれないけど気力が低下したのかも(ぉぃ

== 20050809

=== [game]シレン2 41F
HP400を超えた。ダイレップウがしおかんべんに攻撃し、呼んでも戻ってこず、分裂しまくったしおかんべんにやられてしまった。パコレプキングだったら一発で倒せるのに...。ダイレップウは使いにくいかも。

=== [game]gnugo 13路 2子
やった。やっと勝てたよ。

 (;GM[1]FF[3]
 RU[Japanese]SZ[13]HA[2]KM[0.5]
 PW[gnugo]
 PB[ohac]
 GN[gnugo (W) vs. ohac (B)]
 DT[2005-08-09]
 SY[Cgoban 1.9.14]TM[-]AB[jd][dj];W[cd];B[ch];W[fk];B[fj];W[gj];B[ek];
 W[fi];B[ej];W[hc];B[ic];W[hd];B[ib];W[jk];B[ki];W[ec];B[kf];W[gk];
 B[kk];W[kl];B[lk];W[fl];B[el];W[hb];B[ha];W[ga];B[ia];W[ll];B[gb];
 W[mk];B[lj];W[bf];B[fb];W[eb];B[fa];W[ea];B[fc];W[fd];B[bg];W[em];
 B[dm];W[fm];B[dk];W[ag];B[ah];W[ii];B[af];W[be];B[cg];W[fg];B[eh];
 W[ae];B[ag];W[df];B[eg];W[ef];B[fh];W[gh];B[ei];W[hg];B[gi];W[hi];
 B[fi];W[id];B[jc];W[jj];B[jh];W[mj];B[mi];W[ml];B[ji];W[ie];B[je];
 W[kj];B[li];W[gc];B[ga];W[if];B[ig];W[ih];B[jg];W[cf];B[dg];W[jf];
 B[lf];W[tt];B[tt]
 )

=== [linux]telnet and read-only
telnetしたときに"all ports in use"みたいなメッセージが出て、つながらないときは/dev/ttyp0あたりがread-onlyになっていないか注意しよう。今回は/dev/ttyp0〜がsymlink切れになっていたようだ。rc.sysinitで自動mknodするように変更して完了。

=== [linux]未来のファイル
変な時刻のときにできたファイルを調べた。touch foo; find -newer foo -xdev みたいな感じ。

=== [chinese][vim]文字コード
BIG5は台湾と香港で使われるらしい。上海ではGB2312。vimではset fileencodings=gbkかgb2312でいけそうな感じ。cp936でもいいのかな。よくわからないけど。GB2312って、EUC-JPと似ているのかな。日本語のコメントと中国語が混ざっているような感じがするし。とりあえずLANG=UTF-8 mltermで上海のサーバにsshで繋ぎ、vimで中国語のソースコードが見られるようになった。しかし、コメントは英語で書くって言ってなかったっけ? (^^;

== 20050810

=== [java]JspC
む、上海の環境でJspCがうまく動作しない。 jasper.jar, servlet.jar, tomcat_util.jar, struts.jar を /usr/java/apache-ant-1.6.3/libへコピーしてみた。~/.antrcでも設定可能だけど説明がじゃまくさいので共通ディレクトリにコピーした。

== 20050811

=== [java]JUnit + Ant + Log4J
build.xmlに <sysproperty key="log4j.configuration" value="file:log4j.properties"/> みたいに書けばいいみたい。これがわかるまで結構時間がかかった。

=== [game]シレン2 神社右64F
ようやく女王グモを捕まえた。しかし、そのあとにタイガーウッホーンに落し穴に落されてしまった。仕方がないのでもう一度捕まえた。念のため予備の女王グモも捕まえておいた。これで99Fまで行けるかな。できればタウロス系3種類とプチフェニックスは持ち帰りたいなぁ。それが成功したとしてもンドゥバを全て揃えるのは大変そうだ。

=== [diary]USEN光BB
今日、切り替えとのこと。Y!BBの解約をしないといけないなぁ。さきほど工事完了したと連絡が入った。しかし、まだY!BBの回線が生きているようだ。本当に工事完了したのだろうか。早く帰ってモデムを取り換えてみたい。

=== [diary]SPAM
なんか最近多いなぁ。ほとんどがinfo@*.comというアドレスのようだ。2chでスレも立っているみたい。あんまり続くようだとprocmailでごみ箱行きの設定にしようかな。

== 20050815

=== [game]シレン2 神社右72Fでやられる
重要なモンスターを出したままピンチに陥る。召喚スイッチでメンベルス5匹を召喚してしまったのがきっかけだった。どうしようもなくなり、たまたま持っていた高とび草を飲みワープ。しかし、敵の真横にワープしてしまい、ゲイズでいちかばちかの混乱作戦を試みるが失敗。相手は混乱しながらも正確にシレンを襲ってきた。ということで死亡。収穫なし。ハイスコアは残せたが...

=== [game]シレン2 神社右99F!
次のプレイでようやくクリアできた。しかし90Fぐらいから壺が出なくなり、レアなモンスターを捕まえることができないばかりか、落し穴に落ちたりしてモンスターが少しずつ減り、結局収穫は女王グモとミノタウロス、それと大漁旗ぐらいであった。プチフェニックスを失ったのは惜しかった。次回は効率的に短時間で潜ってみようかと思う。もののけ王国完成はまだまだ先だ。

=== [diary]USEN光BB
うまく開通したようだ。やはり高速なのはいいな。しかし私の無線LANカードは低速なやつなので無線のときはほとんど実感できない。Y!BBの解約をした。解約はWebからはできず、電話する必要があった。電話するといろいろ聞かれた。「どこに乗り換えるのか?」とか「安定するかどうかわからないのでもうしばらくADSLを継続してみては?」とか、ほっといてください。モデムはユーザ負担で返却しなければいけないらしい。契約書(?)を見ると30 日経過しても返却されない場合はモデムを買い取らなければならないとのこと。で、3年ぐらいはレンタルしてたから、そこそこ安くなっているかと思いきや、まだ3万円台。まるで住宅ローンのようだ。

== 20050816

=== [english][uim]SKKをcorpusに利用できないか?
SKKを英作文に使えないだろうか。例えば /can you で変換するとコーパス辞書から can you で始まるフレーズの内、上位のものを選択できるとか。しかしスペースを押した時点で変換されてしまうなぁ。スペース以外の押しやすい文字で代用する必要があるかな。/can/you とか。コーパスSKK辞書サーバみたいなのを設計するのがベストだろうなぁ。SKKの辞書プロトコルを調べたらプロトタイプを作れるかも。

== 20050818

=== [diary]フォントのズレ
mixi囲碁部で用いられている「ａ-ｂ-ｃ-ｄ-ｅ-ｆ-ｇ-ｈ-ｉ」という座標。これってなんとかできないかなぁ。Windows+IE環境だとたぶんピッタリと表示されるのだけど、Debian+Firefox環境だとズレまくる。モナーフォントというのを入れたら解決するのかなぁ。半角英数で「a-b-c-d-e-f-g-h-i」と書いてもきっとダメなんだろうなぁ。ためす環境が手元にないのがつらい。Macだとどう見えるのかなぁ。preタグで囲うとmixiとはちょっと違う結果になりそうだが。

 現状
 １└┴┴┴┴┴┴┴┘
 　ａ-ｂ-ｃ-ｄ-ｅ-ｆ-ｇ-ｈ-ｉ
 
 案1(IEでどう見えますか?)
  １└┴┴┴┴┴┴┴┘
　a-b-c-d-e-f-g-h-i
 
 案2(笑)
 １└┴┴┴┴┴┴┴┘
 　英比死出猪不字屁愛

=== [linux]トリビア: 全角英数をJISで
echo "ＡＢ"|nkf -j|xxd で確認すると"ＡＢ"は"#A#B"となっているようだ。JISのファイル(つまりメールデータ)をgrepするときに知っておくと便利かも。

== 20050826

=== [linux]機種依存文字一覧
機種依存文字一覧 http://www.shurey.com/Soft/JavaScript/font2.html 。画像ではなく、ちゃんと(?)テキストのままでまとめてあるページ。動作確認用にメモ。

=== [english]機種依存文字
英語でなんて言うのだろう。"machine dependence character"かな? と、調べていると電気郎 http://www.geocities.jp/ps_dictionary/ なるものを発見。"machine-dependent character codes"らしい。アルファベット毎にページが分かれているので、wgetで取り込んで、ローカル辞書にしてしまえばいいかもしれない。

=== [diary]マリモ
浮いたらしい。

=== [linux]nkf -g
最新のnkfには--guessオプションがあるようだ。私はずっとfile2(file-kanji)を使っていたが、file2だとUTF-8を認識してくれない。

=== [uim][ruby]uim-ruby
へえ、こんなことができるのか。自作関数に渡せば、色々カスタマイズできそうだなぁ。問題はuim側の変換メソッド切り替えがワンタッチでできないことかも。中国語と日本語を順番に入力すると、とても不便だということに気付く。英語と日本語だとこんなことはないから、あまり重視されていないのでしょうね。

== 20050829

=== [diary]プラネタリウム
ドラマでメガスターというプラネタリウムの映像を見た。テレビを通してもすごいと思った。近くで見られたらいいけど、どうも近くにはなさそうだ。

=== [diary]USEN VoIP
IP電話の設定をした。最初はUSENから送ってきたVoIP対応ルータ(Aterm)をBUFFALOの無線ルータの内側にセットしたが、うまくいかなかった。発信はできるけど着信ができない、こちらの声は相手に届くが、相手の声が聞こえない、という症状であった。UDPのポートはNATで通しているつもりなのだが、うまくいかないので諦めた。結局、AtermをWAN側にすることで解決。無線ルータはだだのアクセスポイントに格下げとなった。

== 20050830

=== [linux]gcc-3.3
昔のkernelをmakeしようとしたら、gcc-4.0にバージョンアップしていたのでmakeできなくなっていた。MakefileのCCあたりをgcc-3.3と定義すれば問題なくなった。

=== [linux]devlist.h
kernelのmakeが通らない。drivers/pciのdevlist.hを生成するルールがないとか言われる。make depをやり直したらいけるようになったような感じ。Makefileを書き換えてからmake depをしていなかったのかもしれない。

== 20050831

ひさしぶりに勝てたよ。それにしても48手目は大失敗だったかも...

 (;GM[1]FF[3]
 RU[Japanese]SZ[13]HA[2]KM[0.5]
 PW[GnuGo]
 PB[OhaC]
 GN[GnuGo (W) vs. OhaC (B)]
 DT[2005-08-31]
 SY[Cgoban 1.9.14]TM[-]AB[jd][dj]
 RE[B+0.5]
 ;W[cd];B[jk];W[ec];B[kg];W[fk];B[fj];W[gj];B[fi];W[ek];B[dk];W[hk];
 B[ki];W[hc];B[hd];W[cg];B[ch];W[bh];B[bi];W[ci];B[di];W[dh];B[cj];
 W[hh];B[hi];W[gi];B[ii];W[ch];B[ai];W[bk];B[bj];W[cl];B[dl];W[bl];
 B[ak];W[gh];B[ej];W[gd];B[he];W[ic];B[jc];W[ib];B[jb];W[fh];B[fl];
 W[gl];B[el];W[ge];B[gf];W[hf];B[hg];W[if];B[id];W[ff];B[ig];W[jg];
 B[jf];W[ja];B[ka];W[ia];B[kc];W[gg];B[jh];W[il];B[jl];W[jm];B[km];
 W[im];B[kk];W[gk];B[gm];W[hm];B[fm];W[al];B[cm];W[bm];B[dm];W[aj];
 B[ik];W[hl];B[ck];W[ei];B[ak];W[ih];B[am];W[jg];B[ig];W[eh];B[ah];
 W[ag];B[jg];W[ij];B[jj];W[hj];B[hg];W[ie];B[je];W[gf]
 (;B[ji];W[tt];B[tt];
 TW[aa][ba][ca][da][ea][fa][ga][ha][ab][bb][cb][db][eb][fb][gb][hb][ac][bc][cc][dc][fc][gc][ad][bd][dd][ed][fd][ae][be][ce][de][ee][fe][af][bf][cf][df][ef][bg][dg][eg][fg]
 TB[la][ma][kb][lb][mb][lc][mc][kd][ld][md][ke][le][me][kf][lf][mf][lg][mg][kh][lh][mh][li][mi][aj][kj][lj][mj][bk][lk][mk][al][bl][cl][kl][ll][ml][bm][em][lm][mm]
 C[The game is over.  Final score:
 White = 42 territory + 5 captures + 0.5 komi = 47.5
 Black = 40 territory + 8 captures = 48
 Black wins by 0.5.
 ])
 (;B[tt];W[ji])
 )

=end
