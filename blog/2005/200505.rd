=begin

== 20050510

=== [english]速聴
CDが2枚入った英語の本を買う。片方のCDは2倍速と3倍速で収録されている。聞いてみたが、確かに脳が聞きとろうとがんばっている感じがする。日本語の3倍速なら聞きとれるようになるような気がした。自分でお手軽に倍速CD-Rが作れたら面白いかも。ツールを組
み合わせたらできそうな気がするが、今はやり方がわからない。

=== [game]シレン2
鬼ヶ島25階、鬼にやられる。

=== [game]囲碁
かんたんな手筋の本を買った。打倒GnuGo。手筋と詰碁の違いがいまいちわからない。

=== [xp]ttyrecによるプログラミングトレーニング
ができないか考えてみたい。質のよいトレーニングビデオができたら、それを渡して自習してもらうといったことが可能かも。社内資産が社外に流出したらちょっと悲しいが。それかオープンな教材として、有志が集まって教材を増やすという手法も考えられるなぁ。

http://namazu.org/~satoru/tty/index.html.ja ここにある Introduction to Debian packaging というのは考えているものに近いなあ。

== 20050511

=== [linux][english][music]速聴と耳コピとsox
soxでスピード変更とピッチシフトができそうだ。"cents"って何だろう。1200 centsで 1 octaveということなのかな。 sox infile.ogg outfile.ogg speed -c 1200 pitch -1200 みたいな感じかな。聴くには sox infile.ogg -t ossdsp -w -s /dev/dsp みたいな感じか。これを使って速聴用のCD-R Audioをいっぱい作ろうかな。遅くすれば耳コピ用にも使えるなぁ。

=== [xp]ttyplayネタ
なるべくttyrecで保存して役に立ちそうかどうか考えてから行動するようにしようと思う。せっかくタイピングするのだから、録画しておいて損はないと思うので。(ttyrecはxpカテゴリではないような気もするが、まあいいか。)

=== [linux]zsh
zshよさげだなぁ。bashから乗り換えようかな。

== 20050512

=== [linux][english]速聴用データ作成
英会話CDをリッピングして、速聴用データを作成していみた。しかし、なぜか3トラックまでしかリッピングできず。2倍と4倍のoggに変換してみた。市販の倍速CDと比べると少し音質が悪くなるな。effectは stretch .5 とすればピッチを変えずにスピードが2倍になるようだ。speedとpitchの組み合わせよりもこっちの方が簡単だ。再生もsoxコマンドを使わずにplayを使う方が簡単だ。

=== [linux]cdparanoia
jack経由でしか使ったことなかったが、会社のPCにjack(というかpython)がうまくapt-get install できなかったので、とりあえずcdparanoiaを単体で使ってみることに。cdparanoiaでヘルプが表示され、それのexamplesによるとcdparanoia -vsQ でCDのトラック構成を確認、cdparanoia -B で全トラックをリッピング、という感じみたい。自宅でリッピングできなかったCDは会社ではリッピングできた。家でもjackを経由しなければリッピングできるのかもしれない。

=== [english]2-paraのmp3
お、サーバに残るようになったのか。wget -i URLs.txt でGETしておいた。

=== [linux]zshと日本語
bashで日本語を入力したときはBSで1文字ずつ消せるが、zshだと乱れるようだ。まあ大した問題ではないのだけれど。

== 20050513

=== [linux]zsh tips
zshは便利だ。ということで、いろいろメモ。

 bindkey -e               # emacsライクに
 bindkey '^]' vi-cmd-mode # でも CTRL+] でviモードへ
 KEYTIMEOUT=1             # (ESCに割り当てると ESC の機能が使えないので...)
 zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z} r:|[-_./]=* r:|=*'
 # ↑これは便利! AaaBbb.java.orig なら a.j.o<TAB> で補間可能に!
 autoload -U compinit
 compinit
 _cache_users=(guest ohac)
 _cache_hosts=(hoge foo)  # ssh o<TAB>f<TAB> で ohac@foo に補間される

== 20050518

=== [vim]特定ディレクトリのみSJIS判別
普段は副作用のあるSJIS判別を止めておきたいが、あるディレクトリ以下にはSJISのファイルが大量にあるときは以下のような設定をしておけば便利。カレントディレクトリに依存するため完璧ではないけど、結構実用的だと思う。

 if getcwd() =~ 'hoge'
   set fileencodings=sjis
 endif

=== [linux]アスキーアート
convert hoge.png hoge.pbm してから pbmtoascii hoge.pbm でアスキーアートが作成できる。メールのx-faceヘッダをターミナルに表示したりするときに便利(便利なのか?)。

== 20050520

=== [diary]フーリエの冒険
http://www.pro.or.jp/~fuji/otherbooks/fft.hippo.html (kzkさんの日記より)。仕事柄、フーリエ変換を使うのでメモ。

=== [game]glGo
http://www.pandanet.co.jp/English/glgo/ debパッケージもあるようだ。libsdl-ttf2.0-0とlibsdl-image1.2をインストールすると動いた。3Dでも一応動作した。遅いけど。これはビデオカードのセッティングの問題であろう。

== 20050525

=== [vim]TABをspaceに
":set expandtab" した後に ":%retab" する。前にもメモしたような気がするが、まあいいか。

=== [linux]e2psで改ページしない
http://lists.debian.or.jp/debian-users/200409/msg00260.html これかな? e2ps hoge.txt | sed -e '1s/ EPSF-1.2//' >hoge.ps でうまく改ページされる ps が生成された。めでたし。

== 20050527

=== [diary]Search IRC
http://searchirc.com/ こういうのを使えば便利かも。

== 20050530

=== [diary]Skype
使ってみた。相手がいないので、echo123にcallして終了。自分の声が返ってくるのが遅いけど、こんなものなのかなぁ。ヘッドセットマイクは390円だった。安いなぁ。

=== [english]英語chat
仕事で上海の人と英語で(Skypeで)チャットすることになった。うーん大変。練習になっていいけど。

=end
