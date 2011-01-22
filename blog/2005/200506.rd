=begin

== 20050601

=== [mlterm][uim]中国語
/etc/locale.gen に zh_CN.UTF-8 UTF-8 を追加、locale-genを実行。LANG=zh_CN.UTF-8 mlterm --im=uim:py で中国語入力と表示が可能に。文字が小さくて読めないので、mltermのオプションに -w 18 とか指定してやるといい感じ。

== 20050613

=== [diary]上海
出張に行ってきた。ちょっと体調を壊してしまった。碁石を30元で購入。これは安い。

=== [diary]ヘッドセット
400円のヘッドセットのマイクは音が悪いということにいまごろ気付く。ちゃんとしたマイクが欲しいな。ちゃんとしすぎているマイクならあるのだが。(Shureの588)

== 20050615

=== [linux]Skypeで中国語
うーむ。UTF-8でskypeを起動しているのにフォントが悪いせいか、中国語がちゃんと表示されない。gaimではちゃんと使えているのになぁ。どこでフォントの設定ができるのだろうか。

=== [linux]会社のPC
Skypeを使うと音がひどい。mp3とかは問題なく再生できてるのに。

=== [linux]mixer
ミキサー関連の操作ソフト。CUIとしてはreximaがなんとなくよさげ。ちなみにALSA用のalsamixerもCUIのようだ。

 aumix-gtk - Simple mixer control program with GUI and text interfaces
 gom - A generic audio mixer (Base versions)
 gom-x - A generic audio mixer (X version)
 rexima - A nice little ncurses mixer.
 setmixer - A commandline mixer

=== [linux]recorder
録音関係。

 rawrec - Buffered raw audio recorder/player
 sound-recorder - Direct-to-disk recording and play-back programs.

=== [linux]ALSA
OSSだとなぜかマイク入力がなんだかおかしいようなので、ALSAというのをインストールして試してみよう。

apt-get install alsa-base alsa-oss alsa-modules-2.4.27-2-386 実行後、
/sbin/alsaconf を実行してみる

カーネルイメージもバージョンアップされたようだ。ALSAとOSSの切り替えは discover, discover1 というのが関係しているらしい。/etc/discover.dのあたりに設定があるようだ。結果、ちゃんとマイク入力が使えるようになった。めでたし。

== 20050616

=== [diary]AdSense by Google
やってみた。ちょっと位置とか色とか調整せんとアカンなぁ。

=== [english]SkypeでEnglish
http://www.jyve.com/ こんなのがあるようだ。

=== [diary]マイク
1500円のマイクはノイズもなく、調子よく動作している。やっぱり400円のヘッドセットはあきません。(こればっかり。)

=== [debian][linux][java][game]Java Applet で日本語が豆腐に
http://www5f.biglobe.ne.jp/~nakayamahiroo/orcatools/debian.html これで解決した。これで linux でも Yahoo! Games ができるぞ!

== 20050617

=== [linux]日本語SJISのファイル名
http://tyche.pu-toyama.ac.jp/~ko-ji/linux/mount.html ここを参考。codepage=932でOK。codepage=cp932だとだめみたい。

=== [diary]orkutで日本語
いつのまにか使えるようになっていた。

=== [english]HDDレコーダと英語
英語学習にはHDDレコーダがとても便利だ。番組表もインターネットから取ってこれるし、検索も可能だし。ラジオもこんなことができたらいいのになぁ。ちなみに見ているのはNHK教育の英話関連、ライオンたちとイングリッシュ(アメリカの子供向け番組)、スタートレック(まだ追い付いていない)、ER10(これも追い付いていない)、キム・ポッシブル、あとは日本語字幕の映画など。二ヶ国語放送は日本語を聞いてると時間がかかるので、意味がよくわからなくても、英語だけを聞くようにしている。だからストーリーはあんまり理解できていない。

=== [ruby]here document(ヒアドキュメント)
こんな感じで使う。

 puts <<END
 あれこれ #{hoge} あれこれ
 END

"#{hoge}"のようにすることで内部変数などを埋め込むことができる。これは便利。

=== [game]Yahoo! Games
会社からだとポートが開いてなくて実行できなかった。残念。

=== [linux]dig -xでホスト名逆引き
digはdnsutilsパッケージにある。

== 20050620

=== [linux]Skype qt3-qtconfig
SkypeはQtアプリケーションのようだ。qt3-qtconfigをapt-get installした。qtconfigを実行。適当にフォントを組み合わせて日本語と中国語の両方を表示させようとしてみるが上手くいかない。おしいところまではいくのだが。

=== [diary]MSNとSkype
うー、またMSNメッセンジャーが接続に失敗する。やっぱりMSNよりSkypeの方が安定していていいなぁ。

=== [game]mixi囲碁
2つとも負けました。投了するタイミングが難しいな。今のレベルでは何目差なのか計算ができないし、石が死んでいるのかどうかも自信がない。もっと鍛えねば。

=== [game][java]Yahoo!大富豪
linuxだと日本語入力ができない。別のところで日本語を入力してコピペするといけるようだ。で、大富豪をちょっとやってみたが、誰も会話していなかった。これはこれでゲームに集中できるので面白いかも。

=== [linux]世界時計
なんとなく世界時計が必要っぽいのでgworldclockをインストール。 http://homepage1.nifty.com/backpackers/time.html Webならここの時計がわかりやすい。サマータイムには対応していないようだ。ロンドンがGMT/UTCと同じなのか。ちなみにグリニッジ天文台というのがロンドンあったらしい。今は活動を停止しているそうな。

== 20050621

=== [windows]インストーラ
http://www.jrsoftware.org/isinfo.php Inno というインストーラ。それにしてもWindowsにはパッケージ管理のソフトはないのか。現状ではCygwinのrpmぐらいしか選択肢がないのかな。

=== [windows]MSI
Windowsの標準ではMSIというインストーラがあるらしい。キーワードは makecab.exe, msidb.exe。 msidb.exe -d mydatabase.msi -a mycab.cab みたいな感じで1つにまとめるようだ。 http://www.saga-ed.jp/workshop/edq01449/wininst/wininst.htm ここが参考になりそう。マイクロソフトのOrcaというユーティリティーを使うこともできるようだ。

=== [game]gnugoに初めて勝つ
初めてgnugoに勝てました! SGFファイルを残しておこう。Blackが私です。gnugoの起動オプションは /usr/games/gnugo --mode gmp --quiet 。version は 3.6-2、む、ちょっと古いな。

 (;GM[1]FF[3]
 RU[Japanese]SZ[9]HA[0]KM[5.5]
 PW[White]
 PB[Black]
 GN[White (W) vs. Black (B)]
 DT[2005-06-21]
 SY[Cgoban 1.9.14]TM[-]
 RE[B+0.5]
 ;B[cf];W[gc];B[gf];W[ef];B[ee];W[dc];B[eg];W[he];B[hf];W[cd];B[de];
 W[be];B[bf];W[ge];B[fe];W[if];B[ie];W[ig];B[gd];W[hd];B[fd];W[hc];
 B[hg];W[ih];B[hh];W[fc];B[ii];W[af];B[ag];W[ae];B[cg];W[id];B[if];
 W[ce];B[ec];W[eb];B[dd];W[db];B[ed];W[tt];B[tt];
 TW[aa][ba][ca][da][ea][fa][ga][ha][ia][ab][bb][cb][fb][gb][hb][ib][ac][bc][cc][ic][ad][bd]
 TB[df][ef][ff][bg][dg][fg][gg][ig][ah][bh][ch][dh][eh][fh][gh][ih][ai][bi][ci][di][ei][fi][gi][hi]
 C[The game is over.  Final score:
 White = 22 territory + 0 captures + 5.5 komi = 27.5
 Black = 24 territory + 4 captures = 28
 Black wins by 0.5.
 ]
 )

== 20050622

=== [linux]rpm 3 and 4
rpm3のときはrpm -bbとかでパッケージを作成していたが、rpm4の場合、rpmbuild -bbみたいな感じで作成するようだ。--nodirtokensというオプションの説明には "generate package header(s) compatible with (legacy) rpm[23] packaging" とある。もしかして、rpm3 で使えるパッケージが作成できるのかも。今頃発見するなんて遅すぎたかも。とりあえず3.0.3のターゲットにrpm -i --nodeps *.rpmでインストールできることを確認した。--nodepsが必要なのがちょっといやだけど、まあしょうがないか。と、思ったがインストールできているように見えて実はインストールされていないことが判明。やはり、rpm4ではrpm3(3.0.3)のパッケージのビルドは不可能なのかも。

=== [linux]rpm and ant
antのrpmタスクで--nodirtokensを指定したいときは、commandを"-bb --nodirtokens"に変更すればよい。つまりデフォルトは"-bb"なので、これに"--nodirtokens"を追加した文字列にすればよいということ。

=== [linux]rpm3 and ant
antのrpmタスクでrpmをビルドするコマンドはrpmBuildCommandというアトリビュートを設定できるようだ。このコマンドはrpmのバージョンによっては"rpm"であったり、"rpmbuild"であったりするようなので、このアトリビュートの存在を知っておいた方がいいかもしれない。

=== [game]gnugoに勝つ(2回目)
また勝てた。しかも大差(12目半勝ち)で。たぶん最初の4手ぐらいが非常に重要なのではないかと思う。次は9路盤の後手と13路盤の先手で勝つのを目標にがんばろう。

 (;GM[1]FF[3]
 RU[Japanese]SZ[9]HA[0]KM[5.5]
 PW[White]
 PB[Black]
 GN[White (W) vs. Black (B)]
 DT[2005-06-21]
 SY[Cgoban 1.9.14]TM[-]
 RE[B+12.5]
 ;B[gf];W[dg];B[cf];W[cg];B[df];W[ef];B[ee];W[ff];B[fe];W[gg];B[he];
 W[hf];B[ge];W[hg];B[bg];W[bh];B[af];W[ie];B[id];W[if];B[hc];W[ah];
 B[cc];W[ag];B[bf];W[tt];B[tt];
 TW[eg][fg][ig][ch][dh][eh][fh][gh][hh][ih][ai][bi][ci][di][ei][fi][gi][hi][ii]
 TB[aa][ba][ca][da][ea][fa][ga][ha][ia][ab][bb][cb][db][eb][fb][gb][hb][ib][ac][bc][dc][ec][fc][gc][ic][ad][bd][cd][dd][ed][fd][gd][hd][ae][be][ce][de]
 C[The game is over.  Final score:
 White = 19 territory + 0 captures + 5.5 komi = 24.5
 Black = 37 territory + 0 captures = 37
 Black wins by 12.5.
 ]
 )

=== [game]gnugoに勝つ(3回目)
後手でも勝てました。これからは13路盤をやろう。

 (;GM[1]FF[3]
 RU[Japanese]SZ[9]HA[0]KM[5.5]
 PW[White]
 PB[Black]
 GN[White (W) vs. Black (B)]
 DT[2005-06-22]
 SY[Cgoban 1.9.14]TM[-]
 RE[W+5.5]
 ;B[ee];W[gf];B[eg];W[fc];B[ge];W[dd];B[ff];W[cf];B[ch];W[hd];B[cc];
 W[dc];B[cd];W[de];B[db];W[eb];B[bb];W[da];B[ca];W[cb];B[ab];W[ba];
 B[hf];W[ae];B[he];W[gd];B[id];W[ic];B[ie];W[hb];B[bg];W[bd];B[bf];
 W[ce];B[be];W[bc];B[af];W[ad];B[cg];W[dg];B[dh];W[df];B[ed];W[fd];
 B[ef];W[ec];B[fe];W[tt];B[tt];
 TW[aa][ca][ea][fa][ga][ha][ia][ab][bb][db][fb][gb][ib][ac][cc][gc][hc][cd]
 TB[gf][if][ag][fg][gg][hg][ig][ah][bh][eh][fh][gh][hh][ih][ai][bi][ci][di][ei][fi][gi][hi][ii]
 C[The game is over.  Final score:
 White = 18 territory + 6 captures + 5.5 komi = 29.5
 Black = 23 territory + 1 captures = 24
 White wins by 5.5.
 ]
 )

== 20050623

=== [diary]サーバPC
ノートPCを使っているが、ちょっとHDDが不安な感じなので、なんとかしたいなぁと考えている。デスクトップ機を使った場合、気になるのはやはり音と消費電力、室内温度上昇といった点か。ちょっと調べてみた。EPSON Direct は安価な静音PCを販売しているようだ。NEC は10万円ぐらいの水冷PCがある。Be Silent MS6000というのもあるな ( http://www.e-lets.co.jp/product/pc-ms6000/ )。Be Silentの説明では消費電力 25W で計算している。1ヶ月360円ぐらいとのこと。タワーPCは125Wで計算しているようだ。これだと1ヶ月1800円ぐらいらしい。

== 20050624

=== [diary]アクセス数
やたらアクセス数が増える日があるので、調べてみるとただのロボットだった。

=== [english]Rikai Friends
http://rikai.meta4-group.com/ja_JP/public/home.jhtml

== 20050626

=== [diary]サーバー完成
新しいサーバーPCがほぼ完成したので、記入テストしてみます。

=== [diary]makerss.rb
新しいサーバーのtdiaryでmakerss.rbのプラグインがうまく動かない。とりあえず外しておく。

== 20050627

=== [diary]今日のにゃんこ
土曜日は今日のわんこだけじゃなくて、にゃんこもやってるらしいぞ、そこの君。

=== [diary]PRIDE
やはりシウバか。それにしても桜庭は痛々しい。

=== [diary]静音PC お値段
レシートが手元にないので大ざっぱな値段ですが、こんな感じでした。

* ACアダプタ電源(60W)          ... 約10000円
* M.B. (VIA C3 800MHZ CPU)     ... 約 7000円
* 2.5inch HDD(HITACHI-IBM 60GB ... 約 8000円
* メモリ(DDR 256MB)            ... 約 3000円
* 2.5inch HDD接続用ケーブル    ... 約 1000円

家にあるやつを流用したのは
* Micro ATX ケース
* 大きめの低回転ファン
* CD-Rドライブ
* キーボード・マウス

=== [diary]静音PCセットアップメモ
Debian sidをインストール。手元にはwoody時代のネットワークインストールCD-RWしかなかったので、とりあえずこれでインストール。途中で音を出すためにALSAをインストールしたが、このときkernelのバージョンが上がり、なぜかLANが使えなくなるトラブルがあった。insmodしてもうまくいかず、しばし悩む。しかし、discoverをinstallすると見事に認識した。オーディオも入出力可能になり一件落着。

=== [diary]静音PC ACアダプタとCPUファン交換
恐る恐る買ってきたACアダプタ電源に交換してみる。すると何の問題もなく立ち上がった。10000円もする電源なのでこれが一番心配だった。60Wで足りるのかとか。まだCD-Rを動かしたことないけど、なんとなくいけるような気がする。これで気になる動作音はCPUファンのみとなった。HDDはとても静かなので全く気にならない。最初にCPUクロックを133x3に落として、電圧を若干落とし、CPUファンを外してみた。すると70℃ぐらいまで上昇したので、これはさすがにやばいと思い低速の大型ファンをケース内に宙吊りし、CPUに風があたるようにした。これで50℃前後に落ち着いた。蓋を閉めるとかなり静かだ。以下はsensorsの結果。VCoreが妙に高いのが気になるが、まあ動いてるからよしとしよう。

 $ sensors
 eeprom-i2c-0-50
 Adapter: SMBus Via Pro adapter at 5000
 Memory type:            DDR SDRAM DIMM
 Memory size (MB):       256
 ....
 vt1211-isa-6000
 Adapter: ISA adapter
 VCore1:    +2.74 V  (min =  +1.79 V, max =  +1.89 V)   ALARM
 +5V:       +4.53 V  (min =  +4.73 V, max =  +5.24 V)   ALARM
 +12V:     +11.84 V  (min = +10.77 V, max = +13.15 V)
 +3.3V:     +3.17 V  (min =  +3.13 V, max =  +3.45 V)
 fan1:     1883 RPM  (min = 2978 RPM, div = 8)          ALARM
 fan2:        0 RPM  (min = 2978 RPM, div = 8)
 ERROR: Can't get TEMP2 data!
 Proc Temp: +47.5°C  (high =   +65°C, hyst =   +60°C)
 MB2 Temp:  +16.3°C  (high =   +45°C, hyst =   +40°C)
 vid:      +1.850 V  (VRM Version 9.1)

== 20050629

=== [english]英英辞書
輸入ものの辞書を買う。1300YENぐらい。紙の質が悪いけど安いのでよい。

=== [debian]Debian辞典
購入。ちょっと高かったけど役に立ちそうなので。ぱらぱらと読んでみると我流でやっていた方法のdebian流なやり方がいくつかあった。

=== [diary][linux]VAIOノートのHDD交換
HDDがそろそろ寿命なので交換。VAIOのHDDを取り出すのに苦労する。OSはDebian辞典のちっちゃいCD-ROMでインストール。Vine 2.5とかdebian woodyのときはVAIO Noteの場合、ブート時にkernelへパラメータを指定する必要があったけど、debian sargeのインストーラでは指定する必要なさそう。もしかしたらインストーラではなくlinux kernelが賢くなったのかもしれない。とりあえずX Windowが立ち上がるところまでで終了。続きはまた明日。

=== [debian]起動時メッセージの確認方法
/etc/default/bootlogd を yesにしたら /var/log/boot に残る。会社のとある人からとある人経由で情報を得た。まだまだ知らないことが多いなぁ。

=== [diary]USB抜き差し
あまり頻繁に抜き差ししない方がよさそうだ。

=== [diary]自宅サーバ反応なし
お昼前ぐらいから自宅サーバの反応がない。どうなったのかなぁ。CPU暴走か? それとも飼い猫の仕業か? グローバルIPアドレスが変わったか? 心配だなぁ。

=== [diary]自宅サーバ反応なし(結果)
ローカルDHCPのIPが更新されてしまったようだ。固定IPへ変更してからDHCPクライアントを止めずにほっといたのが悪かったみたい。予想はすべて外れであった。

=== [diary]上海からohac.sytes.net
違うIPになるなぁ。DDNSの情報がうまく届いていないのかなぁ。上海事務所のDNSサーバがおかしいような気がする。誰に言えばいいの>かな。

=== [debian]Skype for debian
英語のページにはdebパッケージがあるけど、日本語のページにはdebパッケージがないなぁ。どういうことだ。

== 20050630

=== [diary]自宅サーバ反応なし
あかん。また繋がらない。会社からだとどうすることもできないのがつらいなぁ。

=== [diary]自宅サーバ反応なし(結果)
どうやらY!BBのWAN側IPが変わっていたようだ。no-ipのパッケージをinstallして、no-ip -Cで設定して完了。

=== [uim]AZIKときゅうり改
emacs上のanthyでAZIKきゅうり改が使えるようになったらしい。

=== [diary]comDesk
http://css.jaist.ac.jp/~miuramo/comdesk/ VNCみたいなソフトらしい。

=== [linux]読学のススメ
http://hira.main.jp/wiki/pukiwiki.php linux kernelのメモらしい。

=== [linux]webcam (Logitech QuickCam Notebook Pro)
http://www.logitech.com/index.cfm/products/details/US/EN,CRID=4,CONTENTID=5040 がんばればlinuxで使えるらしい。Logicool の Qcam (QuickCam)シリーズ QV-31 QV-300N とかもいけそう。 http://www.rmatsumoto.org/index.php?Linux%A4%C8Web%A5%AB%A5%E1%A5%E9 お、ここにもいろいろのっているぞ。 Philips製コントローラーを使用した製品で Samsung MPC-C30、Logitech QuickCam 3000 Pro、Creative Labs Webcam 5とかもいけそうかな。

=end
