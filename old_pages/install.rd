= Javaインストーラ
== ダウンロード
* 実行ファイルのダウンロード ((<jinstall-0.01.lzh|URL:install/jinstall-0.01.lzh>))
* ソースコードのダウンロード ((<jinstall-src-0.01.lzh|URL:install/jinstall-src-0.01.lzh>))

== Javaアプリケーションの配布をどうするか
Javaでソフト開発したのは良いが、Windowsユーザーに簡単に使ってもらうためにはインストーラが必須と考える。しかし、せっかくなのでインストーラもJavaで開発したいものだ。そこでこのプロジェクトを発足させた。と言っても私一人で作るのであるが。

== レジストリとショートカット
まずはWindows特有のJavaのクラスライブラリにないものをネイティブメソッドを使って、扱えるようにすることが必要である。その中でもレジストリとショートカットは必須であろう。Program Filesのパス調査や、スタートメニュー・デスクトップへのショートカット作成がインストーラには必要だからである。

== ネイティブメソッドのコンパイラ
コンパイラにはできるだけフリーのツールを使いたいものだ。そこで候補にあがったのがcygwinのgccとBorland Cである。gccでは残念ながらjni.hなどがうまくコンパイルできずに断念してしまった。Borland Cの方は簡単にコンパイルできた。手順の概要を簡単に説明しよう。

* Borland Cのインストール
* PATHにBorland Cのインストール先のbinフォルダを追加
* readme.txtを参考にbinフォルダにbcc32.cfg,ilink32.cfgを作成
* bcc32.cfgの-Iオプションにjdkのinclude及びinclude/win32を追加

== 今後
まだインストーラにはほど遠いですが、がんばって完成させたいと思います。なお、このクラスの作成には秀インストールのソースコードを参考にさせていただきました。ソースコードを提供していただきありがとうございました。

== 関係リンク
* ((<秀まるおのホームページ|URL:http://hidemaru.xaxon.co.jp/>)) (リンク切れ)
* ((<hanawa's home page|URL:http://www.geocities.co.jp/AnimeComic/1098/index.html>))
* ((<Borland C++ Compiler 5.5|URL:http://www.borland.com/bcppbuilder/freecompiler/>))
