=begin

== 20040802

=== [Ruby] バイナリファイル

pack(), unpack() を使えばバイナリファイルも扱うことができるようだ。
http://kansai.anesth.or.jp/gijutu/ruby/man-z1/refm0250.html とか参考になる。

リトルエンディアン・ビッグエンディアンの指定も可能なのはありがたい。

== 20040809

=== [linux] ユーザ・グループ管理

「adduser ユーザ名 グループ名」で既存のユーザを既存のグループに追加できる。
ただし、この設定が反映されるのはこの後にログインしてからのようだ。「su - ユーザ名」でログインすればOK。linuxを何年も触ってきたが、今ごろになってこんな基本的なことを知る自分。

== 20040811

=== [linux] a2psjで倍率指定印字

a2psj に -fx0.5 のようにオプションを指定すれば50%の縮小モードとなる。-fx0.75 のような指定もできるようだ。

=== [linux] debian package作成

debianのパッケージ作りに挑戦。

http://debian.fam.cx/?AptGet

ここを参考にした。

debuildというコマンドがいるらしいので、
 apt-get install devscripts

で取ってくる。

 apt-get source skkinput
 cd skkinput-2.06.4
 debuild -uc -us

で試しに skkinput をビルドしてみる。debuildのオプションの意味はよくわかっていない。

エラーがでたので、apt-get build-dep skkinput としてみる。しかし、とくにこれといって何かが変わった感じはしない。再度debuildしてもやはりエラー。

 cc1: Invalid option `32'

だそうだ。gcc への -m32 というオプションが悪いようだ。とりあえず今日はあきらめるか。

http://namazu.org/~tsuchiya/debian/

このへんも参考になるかも。

* おっとtypo発見。debialではなくdebianです。 -- ohac 2004-08-12 (木) 19:22:25

== 20040812

=== [linux] dpkg-buildpackage

dpkg-buildpackage -rfakeroot -us -uc で gzip を build してみるが、texiがどうのこうの言われて失敗。unzip を build するとこれは成功した。

 dpkg-buildpackage: binary and diff upload (original source NOT included)

というメッセージが出るが、なんだろうか。どこかにuploadされたのか。まさかそんなことないとは思うが。

あるページには apt-get 用のやり方を書いていたので、メモ。

 自作パッケージ置場に移し、
 $ apt-ftparchive packages . | gzip -c9 > Packages.gz
 $ apt-ftparchive sources . | gzip -c9 > Sources.gz

だそうだ。また今度やってみよう。

dpkg-buildpackage -rfakeroot -uc -b というオプションの例もあった。 -b と -us ってどう違うのかな。

=== [linux] libc6の依存関係

sargeの環境で作成したdebパッケージをwoodyに持っていくとlibc6が古いとか言われ、インストールできない。そこで debian/control の Depends: ${shlibs:Depends} を消してとりあえずの対策を行った。

=== [linux] 新規でdebパッケージを作る

いろいろ教えてもらいながらチャレンジしてみる。

 mkdir hoge-1.0
 cd hoge-1.0

ここで Makefile を作っておく。 clean: と install: も定義しておく必要がある。
install: は ${DESTDIR} を使い、そこにインストールされるように書けばよいみたい。

そして、dh_make を実行。とりあえず single binary を選ぶ。

debian ディレクトリにいろいろできるが不要なものが多いので

 README.Debian
 changelog
 control
 copyright
 rules

を残して、あとは削除。

 dpkg-buildpackage -rfakeroot -us -uc

で完成。-us -uc は電子署名をしないオプションのようだ。

== 20040825

=== [linux] ncftpは便利

ncftpというftpクライアント。なかなか便利だ。
なにが便利かというと

* 補完が効く
* ブックマークを保存できる(ユーザ名、パスワードも)
* デフォルトが anonymous 動作である

さすがにOS-9マシンへのFTPでは補完が効かないようだ。残念。 -- ohac 2004-08-26 (木) 09:21:59

== 20040830

=== [linux] dpkg -x

debファイルの解凍のやり方
 mkdir dirname
 dpkg -x arekore.deb dirname
dpkg --help ってやっても出てこないので注意。

=== [linux] symoops

ぐはあ。よく見ると Debian に乗り換えた後、/var/log/ksymoops/ にログがたまり続
けていたらしい。du -sh /var/log/ksymoops で 74M と表示されている。
なんだろうか。このログは。
