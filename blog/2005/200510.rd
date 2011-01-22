=begin

== 20051003

=== [diary]冷却シート
ノートPCの冷却シートが売られていた。キャッチコピーには熱暴走などの防止などの内容が箇条書きされていたのだが、その中の一つに「バグに効果あり」と書いてあった。...バグには効かんだろう、いくらなんでも。

=== [windows]クセロPDF
へぇ、こんなの http://www.vector.co.jp/soft/win95/writing/se339554.html があるのか。最近Windows触ってないから知らなんだ。

=== [chinese]国慶節大型連休
10月1日(Sat)〜10月7日(Fri)はお休みのようだ。国慶節大型連休とのこと。8〜9日は出勤するみたい。

== 20051006

=== [linux]暗号化FS
man losetupでヒントがあるな。でもinsmod cryptoloopがエラーになる。2.6.xに上げたら、割と簡単に実現できそうな気がしてきた。お、losetup -E 1 /dev/loop0 hoge ならエラーが出ないな。XORでの暗号化なら簡単に実現できるのかも。

=== [linux]XOR FS
やってみたけど、先頭セクタがカラなので、XOR用のキーが簡単にバレるな。これじゃあ意味ない。

== 20051012

=== [chinese][debian]manpages-zh
LANG=zh_CN.GB2312環境でmanを見て勉強ができるかも。LANGUAGE=zh_CN:zh:en_GB:enもセットしないといけないようだ。ln --helpとかで中国語がでるようになったけど、man pingとかでは英語がでるなぁ。なぜだろう。

== 20051013

=== [chinese]ミドルネーム・ニックネーム
中国の若者はミドルネームやニックネームをつけるのがはやっているような気がする。同じ名字が多いので気持は分からんでもないけど、呼ぶ側としてはアメリカンなニックネームを呼ぶのは抵抗があるなぁ。

== 20051019

=== [diary]左手が痛い
ちょっと腱鞘炎ぽいかも。左小指のCTRLキーを使いすぎかもしれない。しばらくは左小指の付け根のCTRLキーを使うようにしよう。

== 20051020

=== [mutt]cキー
cは$\tc\n.にした方が便利かも。そして、CをCopyではなく、通常のcに割り当てる。Copyなんて滅多に使わないし、なくてもいいような気がするので。

=== [linux]Alt+TAB
TABは左手小指を使うので、Windowの切り替えをAlt+nとAlt+pでできるように変更した。WMはfluxboxを使用中。

=== [diary]iPod nano
見せてもらったら、自分も何かplayerを欲しくなってきた。Oggに対応しているやつがいいなぁ。あとライン入力があるやつ。でもWMAとかにエンコードされたらいやだな。光入力もあればベスト。USBマスストレージに対応していないとイヤだな。SDカードも使えたらいいなぁ。ということでメモ。IRIVER H140, RIO Unite 130, SEAGRAND XB800あたりがいいかなぁ。

 IRIVER H140 ... 40GB, Ogg, FM, Voice, 光, USB Storage
 IRIVER T10 ... 単三, Ogg, FM, Voice, USB Memory
 IRIVER T20 ... Ogg, FM, Voice, USB Memory
 RIO Unite 130 ... Ogg, FM, Voice, USB Memory, 録音はMP3
 SEAGRAND XB800 ... Ogg, FM, Voice, USB Memory, SD Card, 録音はWMA

=== [diary]キーボード
なんか色々考えていると新しいキーボードも欲しくなってきたなぁ。親指で押せるキーがもう少し欲しい。でもコンパクトでないとイヤだ。探してみるとなかなかいいのが見付からないな。左手だけ独立ハーフキーボードとかどうだろうか。足でUSBテンキーを押すというのも面白いかも。

=== [linux]WOL
Wakeup On LANの略。apt-cache search WOLでいろいろとツールが出てくる。使い道は出社に合わせてPCを立ち上げておくとか、昼休みの省電力とか。でも出社してないのにPCが立ち上がったら全く逆効果。

== 20051021

=== [diary]ねり消し
キーボードのキーごとの高さを調節するのにねり消しを使うアイデアはどうだろう。しかし、ねり消しなんて今でも売ってるのかなぁ。ちょっとベタベタしそうだけれども。ちなみに高くしたいのは左下のCTRLキーである。

=== [diary]宇宙ネタFlashアプリ(mixi宇宙コミュより)
http://4d2u.nao.ac.jp/top.html と http://4d2u.nao.ac.jp/topH.html

=== [diary]Ajax
まずはCSSとJavaScriptの勉強をしないといけないなぁ。何が実現可能で、何が不可能なのかがまず分からないので。とりあえず矩形を組み合わせていろいろできそうなことはわかった。棒グラフとか、メータとか、縦か横の線とか。動的なFORMの生成で使いやすいUIが構築できたらいいかも。

== 20051024

=== [diary]キーボードにねり消し
ねり消しを買ってきたので左下のCTRLに貼り付けてみた。これが意外とうまくいった。キーボードのキーの高さを調節したい人にはおすすめかもしれない。それほどベタつかないし、簡単には外れない。ベタつきが気になるなら、ティッシュを小さく切って、上に置けばよい。

=== [music]スパイラル 上原ひろみ
ニューアルバムを買った。初回限定のDVDに釣られたという話もある。今回は割とピアノを弾いている割合が高いかも。前よりもJazz色が濃いような気がした。まだ一回しか聞いてないけど。

=== [music]MDプレーヤー
MZ-E730 http://www.ecat.sony.co.jp/audio/walkman/products/index.cfm?PD=18138&KM=MZ-E730 を買おうかと検討中。MDは140MB(74分)、CDは650MB(74分)なので大体1/5ぐらいに圧縮しているようだ。MDLPの2倍なら1/10、4倍で1/20といったところか。2倍なら128KbpsのMP3やOggと同じぐらいの圧縮率であろう。音質はきっとATRAC3の方がいいのではないかと思う。たぶん。なぜMP3プレーヤー系を買わないのかと言うと、1)再生スピード可変機能がある、2)CDからMDへの高速ダビングが簡単でPCが不要、3)メディアが安い、4)音質が良さそう、といったところか。もちろん将来的にはMP3プレーヤー系に移行する可能性が高いので、別系統での保存もちゃんとしておきたいと思う。(レンタルCDの場合の話)

== 20051025

=== [chinese]ninとmixi
mixiで中国語のninという字(\u60a8)がunicodeのescape文字にならないようだ。＆#x60a8;と書けばいけるように見えるが、投稿後に確認するとEUC-JPに変換されてしまうようだ。lv -OejでEUC-JPに変換すると8F BD FBの3バイト文字になる。こんな字、日本語にあるのかな。おそらく第3水準か第4水準の文字なのだろう。EUC-JPの3バイト文字は環境によってはちゃんと表示されないようだ。

=== [chinese]HTML変換
こんなフィルタで中国語等をHTML用UNICODE埋め込みコードに変換できるようだ。Java依存なので、もうちょっとなんとかできないかな。

LANG=ja_JP.UTF-8 native2ascii inputfile.utf8 | sed "s/\\\\u/;\\&#x/g" | sed "s/^;//"

=== [chinese]Exicite中日・日中辞書
Exciteに中日辞書、日中辞書ができてるなぁ。

=== [ajax]prototype JavaScript Framework
http://prototype.conio.net/ これがJavaScriptの重要なライブラリのようだ。Railsもこれを使っているようだ。

=== [ajax]AjaxTags / JavaWebParts
JSPを使うときはこれが選択肢としてあるみたい。ライセンスはApacheのようだ。AjaxTagsはJavaWebPartsに統合されたようである。でも、結局はかなりの部分を自作しないと本当に欲しいものは手に入らないような気がする。

=== [ajax]AjaxFaces
これもJavaで使えるが、ライセンスの問題がありそうだ。

== 20051026

=== [debian]OpenOffice.org 2.0
やっとアップグレードできた。パッケージ構成がだいぶ変わったみたい。試しに動かしてみると、すぐに落ちた。

=== [debian]linux-image-2.6.12-1-686
ACPIあたりを使ってみたかったので、2.4系から2.6系に入れ替えてみた。

=== [diary]WOL
WOLでスタンバイ状態のWindows XPを起こすことに成功した。最初はpingやTCPパケット等を受信するだけで起きてしまう状態だったが、デバイスマネージャで設定を変更するとwakeonlanだけに反応するようになった。ある意味、設定内容は専門用語で説明書きを入れてもらわないと逆に分かりにくいと思う。

=== [diary]フットコントローラ
980円のキーボードを足元に置いて、Enterキー等を試してみたけど、足が寒くてちょっとつらい。それがなければまあまあ使えそうな感じだ。

=== [debian]linux-gate.so.1
debianでredhat9用にrpmを作るとlinux-gate.so.1に依存するようになってしまった。kernelをアップグレードしたからだろうか。仕方ないので--nodeps付きでインストールしておく。

=== [diary]サーバ不具合
自宅サーバが調子悪い。なんか変なプロセスがいっぱい走っている。たぶんHDDのどこかが壊れて、cronか何かの自動処理がコケたまま止まってしまっているのだろう。kill -KILL しまくったが、いくつかのfindが終了しない。今度、リブートしておこう。ところで、pstreeというコマンドを今ごろ知った。これは見やすくて便利。

== 20051027

=== [music]MDプレーヤー購入
手に入れた。MDLP2とSPをヘッドホンで聞き比べるとほとんど分からなかった。MDLP4はさすがに違いが分かる。MDLP2は結構実用的かもしれない。

=== [debian][java]Ant Jspc
Jspcが動かなくなった。ant-optionalを導入したら復活したようだ。現在の~/.antrcはこんな感じ。余計なものもあるかも知れないけれど。

 ANT_OPTS="-Drpmdir=/home/hoge/rpm"
 LOCALCLASSPATH="/usr/share/tomcat/lib/common/servlet.jar"
 LOCALCLASSPATH="${LOCALCLASSPATH}:/usr/share/tomcat/lib/common/core_util.jar"
 LOCALCLASSPATH="${LOCALCLASSPATH}:/usr/share/tomcat/lib/container/jasper.jar"
 LOCALCLASSPATH="${LOCALCLASSPATH}:/usr/share/java/junit.jar"
 LOCALCLASSPATH="${LOCALCLASSPATH}:/usr/share/java/log4j-1.2.jar"
 LOCALCLASSPATH="${LOCALCLASSPATH}:/usr/share/java/struts-1.1.jar"

=== [ajax]libhtml-prototype-perl
perlからprototypeを使うにはこのパッケージをインストールしておくといいかも。

=== [linux]簡単タイマ
sleep 10m ; xclock みたいな感じでxclockが10分後にpopupする。

=== [debian]convmv
日本語のファイル名を扱うのに便利そうだ。

== 20051031

=== [debian]JDMC 2005
行ってきた。みなさんの鍵へ署名しなければ...

=== [debian]gedit
e2psやu2psでうまく印字できないので、geditを入れてみた。プレビューもできるのでよさげな感じである。

=== [diary]suspend
サスペンドしていたPCをwakeonlanで起こすと、IPアドレスが変わっていた。DHCPで設定してあるからしょうがないけど、これでは不便である。ううむ。

=== [debian]NICOLA
Ruby勉強会で使っていたKNOPPIXでSCIM Anthyがあったので、親指シフトが使えるか試してみたら、ちゃんと使えた。すばらしい。

=end
