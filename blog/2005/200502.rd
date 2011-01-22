=begin

== 20050202

=== [linux]screenでプレフィクス+s
間違えてプレフィクスの後にsをタイプするとCTRL+Sがそこに送られてしまい、現在の状態がよくわからないようになってしまうことがあった。このようなキーは使うことがなさそうなので、キーマップを変更してしまった。ついでにプレフィクス+qも。それぞれsplitとonlyに割り当てた。これで大文字SとQと同じ機能となる。

=== [english]英語でソースコードのコメント
linux kernelのソースからライティングの勉強をしてみよう。

* AのときはB。 B if A
* AはB用に予約されていたけど...  A used to be reserved for B, but ...
* AはB用に予約されている。 A is reserved for B
* Aはセグフォールトを発生させる。 A causes a seg fault.
* Aしない方がいい。 Should never A
* Aするな。 Don't A
* 必要ならAしよう。 if necessary we A.
* このルーチンはA。 This routine A.
* これなしではAはちゃんと動かない。 A doesn't work correctly without this.
* AはBをCに送る。 A sends B to C

あかん。ソースが難しいからコメントの意味がよくわからんことが多い。kernelよりもアプリケーションのソースコードの方が参考になるかなぁ。

=== [english]コメントアウトの反対語は?
アンコメント(uncomment)らしい。

=== [diary]特許って
一太郎が特許侵害しているとのこと。そんなに大したアイデアでもなさそうなことが特許になっていることに驚く。発明と呼べるほどのアイデアなのかあれは。つまりKDEやGNOMEとかもそのようなヘルプ機能を作ってはいけないということなのね。しばらく松下の製品は買わないことにしよう。同様な問題としては音楽の盗作問題もあるな。大したメロディでもないのに「盗作だ」とか騒ぐのはやめてほしいよ。こんなにたくさんの曲が作曲され続けたら、そりゃ同じようなメロディも出てきますがな。

=== [linux]indentで整形
ペアプログラミングを実施するにはコーディング基準が必要。そこでC言語用にindentコマンドを調べてみた。自分のスタイルに近いのはK&Rをベースにして、 -kr -ut -nce -i4 -ts4 -ip4 -ncs といったところか。

== 20050203

=== [linux]write()
「countバイト書き込む保証はない」か。ミスしてそうなのでレビューするときは注意しよう。

=== [english]ソースのコメント勉強
flacのソースより。

* 必要なら後でAを決めるつもり。we will determine A later if necessary.

=== [diary]Pair Programming
いきなり導入するのも難しい。一回、実験的に実施してみたいな。いきなり席の横にはりつくのは目立つし、場所も狭い。そこで自分の席でconsoleを共有することを考えた。例えば同じ開発サーバの同じユーザにssh等でお互いに2つログインし、screenをお互い1つずつ立ち上げておく。screen -x [pid]でお互いに相手のscreenに接続。また、IRC Clientも用意しておきコミュニケーションはそこで行う。どうだろう。ペアプロの趣旨から少し外れるかもしれないが、コーディングしている相手が何か調べて欲しことを相手に頼めば、もう1つのコンソールでgrepやらTAG Jumpやらで探してくれる(かもしれない)。うーん、人間マルチタスクだ。

=== [diary]xchat
とりあえず社内IRCに接続してみた。設定でJISにしてやる必要があるみたい。

=== [vim]VimIRC.vim
こんなのもあるのか http://www.vim.org/scripts/script.php?script_id=931 日本語も使えるな。creditsにKoRoNさんもいるみたいなので安心だ。というか、最初に作った人が日本人みたい。

=== [linux]screen multiuser
こんな感じか。

 # chmod +s /usr/bin/screen
 
 user1側
 $ (prefix): multiuser on
 $ (prefix): acladd user2
 
 user2側
 $ screen -ls username/
 $ screen -x username/(pid)

== 20050204

=== [vim][english]spell check
vimから!spell %|sort|uniqでスペルミスの単語一覧が表示できる。

=== [diary]screenでe-learning
派遣社員の指導をscreenとIRCを使ってやってみた。なかなか快適に説明できる。これは使えるかも。

=== [linux]ssh and screen
sshで自宅へ繋げるときはscreenを実行しといた方がよいな。いつ切れるかわからんし。実際、vim立ち上げたまま切れたし。

=== [linux]UNIX FAQ
http://www.nurs.or.jp/~asada/FAQ/UNIX/section3.9.html メモ。

== 20050207

=== [linux]sshが途中で切断される
メモ。キーワードはnullパケット、VaraTerm (Guevala)、puttyとのこと。puttyは日本語の設定がよくわからんので断念。vara(vala?)なんとかはapt-cache searchで出てこなかったので断念。なので~/.ssh/configを変更することにした。

 Host *.hogehoge.hoge
     TCPKeepAlive yes
     ServerAliveInterval 10
     ServerAliveCountMax 6

=== [vim]VimIRCコマンドメモ
 /join #channel
 /part
 /op nickname
 /list
 /nick nickname
 /mode #channel +s
 /invite nickname #channel
 /whois nickname

=== [vim]立ち上げが変
Enterを押さないと立ち上がらない現象が時々再現する。vim --nopluginなら立ち上がる。別の窓なら問題ないのに。色々やってると再現しなくなってしまい、調査できず。

=== [english]アルマゲドン
二ヶ国語放送の英語で見てみる。叫んでるシーンが多く、ほとんど聞きとれず。ツタヤ半額だったので、ロードオブサリング2つの塔を借りる。今度見るつもり。

=== [c][unittest]assert()
大げさなユニットテストフレームワークを使わなくても、今はassert()だけでよさそうな気がしてきた。プリント文もわかりやすいし。

== 20050208

=== [linux]vimircでログ保存とURLリンク
:w! ~/irclog みたいな感じで保存できる。これを別screenでw3mmeeとかで開いておき、Rでreload、:でURLをlink化すればチャット中にでてきたURLをすぐに確認することができる。: C-P [Enter] [prefix] C-N R : の7ストロークちょいか。zaurusで操作すると少し面倒かも。botを作るしかないかな。フルキーボードなら全然問題ない操作感ではあるが。

=== [linux]TIME_WAITがなかなか消えない
echo '1' >/proc/sys/net/ipv4/tcp_tw_recycle で解決。サーバ側のデバッグをするときは便利だ。

=== [c]gccで-O -Wall
初期化されていない変数をチェックするには-Wallだけではダメで、-Oも付ける必要があることに気付く。

=== [linux]screenでprefix+?
キーバインドが表示されるようだ。prefix+:helpと同じ機能。

=== [linux]nadoka
ruby版IRC proxyをちょっとだけ試してみた。

== 20050209

=== [diary]共有ホワイトボード
みたいなソフトないかな。VNCでお絵描きソフトでも立ち上げておくしかないのか。

=== [linux]screen共有の書き込みロック
.screenrcに以下を記述。screen 1で1つ生成してからaclchgを行うのがミソ。screen>立ち上げてからprefix+mでmultiuser onとなる。

 screen 1
 aclchg guest -wx "#?"
 aclchg guest +x "detach"
 bind m multiuser on
 bind r aclchg guest -w "#"
 bind w aclchg guest +w "#"

=== [linux]screenとircで指示を
screenとircのみで派遣社員2名を同時に指示・教育してみる。結構使えるかも。自分のコーディングは進まないけど、教育が進めば..

== 20050214

=== [diary]SKI
スキージャム勝山に行ってきた。エキスパートコースに1回も行けなかったのが悔いに残る。あのコースに行くと元のゲレンデに戻ってしまうのでしゃーないか。コブは前よりは少し滑れるようになったような気がする。コブでは1回もコケなかった。しかし、なんでもないところで何回かコケた。これは筋力がついていかなくなったためだと思われる。エアには2回挑戦。1回目は減速しまくりでストレートジャンプ。ちょっと後傾ギミ。2回目はもうちょっと速度を早めてストレートジャンプ。まあまあ後傾ではなくなったかな。もうちょっと高く安定して飛べるようになったら、スプレッドやツイスターに挑戦してみたい。今までは無理矢理スプレッドをしたりしてたが、やはり基礎のストレートジャンプを安定することをまずやりたいと思う。って、次はいつスキーに行けるのか。

== 20050216

=== [xp]pair programming
screenとIRCだと相手の表情が見えないし、独り言のようなつぶやきも聞けないので、やっぱり席が近い方がいいんだろうなぁ。相手が今なにを考えているのかが見えてこない。IRCに独り言をどんどん書いてくれる人ならいいんだけど、そこまでのタイピングスピー
ドを要求するのも酷だし。それと、そろそろペア交代のことも考えていかないといけないな。

=== [vim]vimirc.vim autojoin失敗
422: MOTD File is missingのときにうまくautojoinできていなかったのでパッチを当てた。

 --- vimirc.vim.orig     2005-02-15 09:18:27.000000000 +0900
 +++ vimirc.vim  2005-02-15 09:18:33.000000000 +0900
 @@ -6518,7 +6518,7 @@
           irc_chan_line('', $mesg);
         }
      }
 -  elsif ($comd == 376) # RPL_ENDOFMOTD
 +  elsif ($comd == 376 || $comd == 422) # RPL_ENDOFMOTD
      {
        unless ($Current_Server->{'conn'} & $CS_RECON)
         {

== 20050218

=== [vim]howm-vim不具合
vimがEnter押すまで立ち上がらなくなる症状がまた再現した。~/.vimrcのhowm-mode vimの初期化部分をコメントアウトすると直った。vimをいくつか立ち上げていると再現するような感じがする。

=== [vim]howm-vimバージョンアップ
したようだ。

== 20050221

=== [uim]uim-fep Added -S option (GNU screen mode)
uim-0.4.6beta1のリリースノートにこんな説明があった。何だろう。今度試してみるか。

=== [diary]筋トレ
スキーブーツで筋トレ、バランスボールでバランストレーニングをちょっとやっておいた。またスキーにいきたいなぁ。もうちょっと痩せなきゃな。

=== [game]SUPER XEVIOUS 30万点
ひさびさにプレステ1をセッティングしてみた。うーん静かだ。ファンレスはいいねぇ。SUPER XEVIOUSはどうしてもAREA14が突破できない。ブラグザカートの3連発はひどすぎる。攻略およびリンク集サイトメモ http://qtchicks.hp.infoseek.co.jp/namco_xevious.html

=== [music]柴咲コウ
結構歌うまい。ジャジーな曲。6/8拍子。

== 20050223

=== [game]SUPER XEVIOUS 38万点
ようやくAREA 14をクリア。AREA 15はたいしたことなかった。AREA 16も運よく1回でクリアできた。初めてギャラクシアンに出会えた。しかし、ループ後、集中力が切れたのと難易度が上がったことで点数はあまり出なかった。ちなみにEASY設定の50000点でEXTENDする設定。EASY設定なのに全然EASYじゃないよ。今後の目標としてはAREA 14を安定してクリアできる実力をつけ100万点を目指す。あわよくばジェミニ誘導ができるようになること。ブラグザカートは左下で必死でよけたらなんとかなる確率が高いことがわかった。ザッパーで破壊すべきかどうかはよく考えてから実行するとよい。よく考える時間は与えてはくれないけれども。あまり早く破壊してしまうと次のブラグザカートが出現してしまうから、ぎりぎりまで粘ったほうがよい。それから破裂するまではあんまり動かないようにして、破裂した時点で少し軸をずらすとうまくいく可能性が高い。

== 20050224

=== [diary]眠い
昨日はなぜか妙に眠くて、すぐに寝てしまった。というわけでハイスコアアタックはしていない。

=== [linux]GNU Arch
tlaというパッケージ。分散リポジトリに興味があり、ちょっとだけ仕事にも関連していたので試してみた。しかし、結構複雑でまだ全てを理解できていない。公開するにはftpとかWebDAVとかの書き込み可能プロトコルがないと面倒な感じがする。よくわかってないので間違っているかもしれないが。

== 20050225

=== [linux]cvs ann
svnやtlaにcvs annのような機能ってないのかな。annはかなり便利なので、これがないと移行する気にならないかも。

=== [game]SUPER XEVIOUS 36万点
うーん。AREA14で5機ほどやられたが、なんとかAREA16へ。しかし、AREA16で全滅。やっぱりAREA16は難しかった。2回目はAREA14をワープしてしまい、まあラッキーかなと思ったが、やはりAREA16で全滅。ジェミニ誘導は何度か成功したが、安定せず。点数もあまり稼げなかった。EASYからNORMALやHARDに変えてみたところ、「やはりEASYはEASYである」ということがわかった。100万点なんて突破できるのだろうか。ちょっと自信がなくなってきた。ノーマルXEVIOUSの1000万点にでもチャレンジしてみようかな。すごい時間かかりそうだけど。

== 20050228

=== [uim]uim-0.4.6beta2-3
debian unstableのuimがバージョンアップしているようだ。隣の席で日本語が入力できなくなったとのことで見てみるとバージョンアップしていたようだ。~/.uimをリネームして、再起動。さてどうなるかな。私も昼休みぐらいにバージョンアップしてみようっと。最近は自分でビルドしてないからありがたい。その後、anthy側がバージョンアップされていなかったらしいと聞いた。apt-get upgradeでuimもanthyもバージョンアップするのではないのかなぁ。あれ、自分のところではapt-get install uimできないなぁ。404 Not Foundになる。あ、 http://ring.asahi-net.or.jp/archives/linux/debian/debian/pool/main/u/uim/ ここに無いなぁ。まあ、また今度にするか。

=end
