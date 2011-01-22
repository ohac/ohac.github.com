=begin

== 20060515

=== [linux][ruby]sqliteと日時とTime Zone
current_timestampはGMTでの日時を文字列で格納するようだ。データベースのファイルをダンプ表示してみて、そのことに気付く。かなりハマった。rubyのsqliteライブラリを使ってこれを取り出すとJSTの日時としてparseされてしまうのでよくない。しょうがないのでinsert文側でdatetime('now', 'localtime')として値を入れることにした。うーむ。

== 20060518

=== [debian]インストールされているnon-freeパッケージを調べる
 dpkg -l | grep "^ii" | awk '{print $2}' | xargs apt-cache policy | grep non-free -B 5

こんな感じか。

=== [linux]ispell
インタラクティブでなくていいので、スペルチェックだけして結果の表示だけしてほしいときは cat file | ispell -W 3 -C -a -d british |grep "^&" | awk '{print $2}' | sort -u こんな感じかな。-W, -C, -d は好みでON/OFFすればいい。C言語用やJava言語用のispell用辞書とかないのかな。プロジェクト毎に個人辞書を作ればいいかな。makefile
等に組み込めば便利かも。

== 20060523

=== [debian]インストールされているnon-freeパッケージを調べる 2
mixi内で助言があったのでメモ。 grep-available -F Section -s Package non-free | cut -d" " -f2 | xargs dpkg -l | grep ^ii

=== [linux]ispell 2
間違い修正版。ispellの-aなんか使わずに-lを使えばよかった。ということでこんな感じに cat file | ispell -W 3 -C -l -d british -p `pwd`/ispell_hoge | sort -u

=== [linux]freefont
客先へ提出する報告書をOpenOfficeで作成。印刷してみると、ちょっとフォントが美しくないのが気になった。こういうときは、やはり商用フォントが必要かも。でも今回はこのまま出そうかな。

=== [rails]メモ
Ruby on Railsの自分用メモを取っていこう。

 rails foo
 cd foo
 vi config/database.yml (ここでsqlite3等に書き換え)
 script/generate model hoge (単数形で)
 vi db/migrate/001_create_hoges.rb (ここでサンプル行をアンコメント)
 rake migrate
 script/generate controller welcome
 vi app/controllers/welcome_controller.rb (ここでscaffold :hogeと書く)
 script/server
 w3m http://localhost:3000/welcome

=== [rails]testメモ
 vi test/fixtures/hoges.yml (nameに何か追加)
 vi test/functional/welcome_controller_test.rb (assert trueのところを消す)
 vi test/unit/hoge_test.rb (assert trueのところを消す)
 rake test (とりあえず通る)
 vi test/unit/hoge_test.rb (p Hoge.find_all とか書くと動きが分かる)
 vi test/functional/welcome_controller_test.rb (fixtures :hogesを追加)

== 20060529

=== [debian]apt-key
今まで見て見ぬふりをしていたapt-keyをちゃんとすることにした。こんな感じ。お、いつのまにか社内からgpgの鍵サーバにアクセスできるようになっている。

 gpg --keyserver wwwkeys.pgp.net --recv-keys 010908312D230C5F
 gpg --export -a 010908312D230C5F > /tmp/key
 apt-key add /tmp/key


=== [debian][english]ipodder
linuxでiTunesみたいなpodcast受信ができないか調べたところ、ipodderというのがあった。どうもこっちの方がオリジナルらしい。注意点としてはLANG=CとかLANG=ja_JP.UTF-8で動作させないとうまく動かないことがあるということ。また、日本語のRSSを扱うには/etc/python2.3/site.pyのencoding="ascii"をencoding="utf-8"に変更しないとうまくいかない。ダウンロードしたファイルはUTF-8なファイル名になってしまうので注意が必要。これで英語の勉強をしようかと思う。とりあえずSDやCFにコピーして、Zaurusで聞くことにしている。専用のプレーヤーが欲しくなるな。

=== [debian]rox-filer
このソフトは結構いいかも。nautilusより好きかも。ファイル名はUTF-8になるようだ。ipodderでダウンロードした日本語のファイル名のファイルをCFやSDへコピーするのに便利。しかも、/etc/fstabに定義があるディレクトリはマウント・アンマウントが簡単にできる。/etc/fstabはこんな感じに書いておけば日本語のファイル名がうまくSJISに変換されるようだ。

 /dev/sda1  /mnt/sda1  vfat  user,noauto,codepage=932,iocharset=utf8

=end
