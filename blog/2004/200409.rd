=begin

== 20040901

=== [PC] CFライタが不調

個人持ち SanDisk のCF&メモリスティックリーダー/ライタをlinuxでmountして、大量のファイルをtar でコピーしてみると...

OSが不安定になった。orz

会社にある SanDisk の CFオンリーリーダー/ライタなら全然問題なし。

少量のファイルなら特に問題なさそうなのですが... 悲しい。

== 20040906

=== [linux] update-rc.d

/etc/init.d のスクリプトを /etc/rc?.d に symlink するには update-rc.d というコマンドを使うようだ。

今まで手でリンクしていたが、今後はこれを使うようにしよう。

== 20040907

=== [PC] ウィルスバスターズ

家のPCがいつのまにかウィルスが入っていた。
帰宅してから、復旧作業にとりかかる。

Cドライブにx.exeというファイルがあった。tempにも怪しいファイルがあり。これを適当にリネーム。

タスクマネージャで見るとwmplayerとかiexplorerとかがなぜか動作していたので、強制的に終了させる。その他にも怪しいタスクがあったので念のため強制終了。

WINDOWSやWINDOWS/SYSTEMをひと通り見て怪しそうなフォルダやファイルをリネーム。
しかし、explorerは途中で止まってしまったので、cygwin(DOS窓みたいなやつ)でコマンドを実行し、リネームした。

regedit を立ち上げ current user やら local machine の Run, RunOnce などを見て怪しそうなやつを消していく。

再起動後、もう一度レジストリを見ると Run とかが復活している。くそう。
でも状況はだいぶマシになっているようだ。

LAN を切った状態で IE を立ち上げ、するとホームページが変なアドレスに設定されていたので、これを空白のページに設定しなおす。ついでにセキュリティの設定でスクリプトとかActive Xとかをダイアログ表示させるように変更。

この段階でトレンドマイクロオンラインスキャンのページに行き、ウィルスがありそうなフォルダ(WINDOWSやProgram Files など)をスキャン。どうやら、WMPLAYER.EXEがウィルス付きになってしまったようだ。これをリネームし、レジストリを再度消して立ち上げなおす。今度はレジストリが復活していない。よし、これでほぼOKだ。

途中で Windows/PCHEALTH とか _RECOVER というディレクトリが怪しいと思い、消そうと努力してみたが、全然消せなかった。後で調べたところ、これは Windows ME の標準機能のようだ。ややこしいもの作らんといてほしい。

それにしても、なぜウィルスに冒されたのかがわからない。とりあえずIEは使わん方がよいかも。mozillaでも入れてみるか。

== 20040908

=== [linux] tar and cdrecord

そうか、

 tar zc . | cdrecord -

でバックアップが取れるのか。

リストアは

 tar zxf /dev/cdrom

みたいな感じでいけるようだ。

ISO9660イメージじゃないのでmountできないけど、圧縮できるのは便利だな。

なお、cdrecord は dev=0,0,0 みたいに書くのは面倒なので /etc/default/cdrecord
をデバイスに合わせて修正しておけば便利である。

== 20040911

=== [linux] mkisofs and cdrecord

CD-Rの焼き方メモ。

初回
 mkisofs -r -J -h [files or dirs] | cdrecord -multi -

2回目以降追記
 mkisofs -r -J -h -C `cdrecord -msinfo` -M 0,0,0 [files or dirs] | cdrecord -multi -

といった感じか。

== 20040913

=== [linux] cdrecord -multi

cdrecord の -multi オプションだけを使えば、その後の mount で -o session=0 のような感じで、各トラックをそれぞれ独立して mount できるのかと思っていたが、どうもそうではないらしい。

ちゃんと mkisofs の -C と -M オプションを指定して、ISOイメージを作成しなければならないようだ。

それとCD-Rを入れ直さなくても、cdrecord -load と実行すれば入れ直したのと同じような動作になるようだ。ちなみに、入れ直すためのコマンドは cdrecord -eject ; cdrecord -load で OKだ。

=== [linux] debian日本語環境

http://debian.fam.cx/

ここの日本語関係というページは最初のセットアップ時に参考になる。

今までは試行錯誤しながらやってたけど、こういうのを見た方がよさそうだ。

=== [linux] readcdで各trackを取り出す

readcd を使えば任意のトラックのイメージを取り込むことができそうだ。

ただし、セクタがよくわからないので、cdrecord -toc で調査する必要がある。

 $ cdrecord -toc
 ..snip..
 first: 1 last 3
 track:   1 lba:         0 (        0) 00:02:00 adr: 1 control: 4 mode: 2
 track:   2 lba:    247498 (   989992) 55:01:73 adr: 1 control: 4 mode: 2
 track:   3 lba:    261792 (  1047168) 58:12:42 adr: 1 control: 4 mode: 2
 track:lout lba:    269186 (  1076744) 59:51:11 adr: 1 control: 6 mode: -1

こんな感じの出力が得られる。ここでtrack 2が欲しいときは247498から261792までを取ればよいと思われる。なので、

 $ readcd sectors=247498-261791
 ..snip..
 Enter filename [disk.out]: 

こんな感じでファイル名を聞いてくるので、disk.out でよければこのままenter。

途中で

 readcd: Input/output error. Cannot read source disk
 readcd: Retrying from sector 254794.

こんなエラーがでたら、CTRL+C で強制終了。

完成した disk.out がtrack 2 の内容である。(ハズ)

=== [linux] uim-skk

skkinput が不安定なので何かいいのがないか探していたら、uim-skkというのがあることがわかった。(Anthyとは独立してたのね。)

http://anthy.sourceforge.jp/cgi-bin/hikija/hiki.cgi

以下、インストールメモ。

 # apt-get install uim

 $ vi ~/.xsession
 skkinput関連をコメントアウトし、以下を記述。

 export GTK_IM_MODULE=uim-skk
 export XMODIFIERS=@im=uim-skk
 exec uim-xim &
 exec uim-helper-toolbar-gtk &

 $ vi ~/.uim
 以下のようにする。(AZIKもどき設定とvi用ESC設定。)
 
 (load-azik-table)
 
 (define skk-proc-state-direct-no-preedit-orig skk-proc-state-direct-no-preedit)
 (define skk-proc-state-direct-no-preedit
   (lambda (key key-state id sc rkc)
     (if (or
          (= key 'escape)
          (and
    (= key 91) ;; [
    (= key-state 2))) ;; control
          (begin
            (skk-context-set-state! sc 'skk-state-latin)
            (rk-flush rkc)
            (skk-update-mode id sc)
            (skk-update-prop-label sc id)))
     (skk-proc-state-direct-no-preedit-orig key key-state id sc rkc)))

uim-helper-toolbar-gtk-systray というのもあるが、この環境でのKDEのトレイだとうまく動作していない。

AZIKもどきは、やはり「もどき」である。改造してやりたいが、どこをいじればいいのかなぁ。

== 20040915

=== [IM] uim-skk + AZIKが割とまともに...

なってきた。なかなかエエやないか。

開発者のメーリングリストにでも入って、パッチを上げるようにしたいな。

== 20040917

=== [IM] uim-skk + azik 用 patch

とりあえずのパッチ。

このパッチについてはメーリングリストにはまだ報告していない。

無難な方のパッチは報告した。
取り込んでもらえたようだ。

 ##
 --- japanese.scm.orig	2004-09-14 17:52:31.000000000 +0900
 +++ japanese.scm	2004-09-16 19:24:26.000000000 +0900
 @@ -34,35 +34,34 @@
      ((("-"). ())("ー" "ー" "ー"))
      (((","). ())("、" "、" "、"))
      ((("."). ())("。" "。" "。"))
 -    ((("!"). ())("！" "！" "!"))
 -    ((("\""). ())("”" "”" "\""))
 -    ((("#"). ())("＃" "＃" "#"))
 -    ((("$"). ())("＄" "＄" "$"))
 -    ((("%"). ())("％" "％" "%"))
 -    ((("&"). ())("＆" "＆" "&"))
 -    ((("'"). ())("’" "’" "'"))
 -    ((("("). ())("（" "（" "("))
 -    (((")"). ())("）" "）" ")"))
 -    ((("~"). ())("〜" "〜" "~"))
 -    ((("="). ())("＝" "＝" "="))
 -    ((("^"). ())("＾" "＾" "^"))
 -    ((("\\"). ())("＼" "＼" "\\"))
 -    ((("|"). ())("｜" "｜" "|"))
 -    ((("`"). ())("‘" "‘" "`"))
 -    ((("@"). ())("＠" "＠" "@"))
 -    ((("{"). ())("｛" "｛" "{"))
 +    ((("!"). ())("!" "！" "!"))
 +    ((("\""). ())("\"" "”" "\""))
 +    ((("#"). ())("#" "＃" "#"))
 +    ((("$"). ())("$" "＄" "$"))
 +    ((("%"). ())("%" "％" "%"))
 +    ((("&"). ())("&" "＆" "&"))
 +    ((("'"). ())("'" "’" "'"))
 +    ((("("). ())("(" "（" "("))
 +    (((")"). ())(")" "）" ")"))
 +    ((("~"). ())("~" "〜" "~"))
 +    ((("="). ())("=" "＝" "="))
 +    ((("^"). ())("^" "＾" "^"))
 +    ((("\\"). ())("\\" "＼" "\\"))
 +    ((("|"). ())("|" "｜" "|"))
 +    ((("`"). ())("`" "‘" "`"))
 +    ((("@"). ())("@" "＠" "@"))
 +    ((("{"). ())("{" "｛" "{"))
      ((("["). ())("「" "「" "「"))
 -    ((("+"). ())("＋" "＋" "+"))
      (((";"). ())("；" "；" ";"))
 -    ((("*"). ())("＊" "＊" "*"))
 -    (((":"). ())("：" "：" ":"))
 -    ((("}"). ())("｝" "｝" "}"))
 +    ((("*"). ())("*" "＊" "*"))
 +    (((":"). ())(":" "：" ":"))
 +    ((("}"). ())("}" "｝" "}"))
      ((("]"). ())("」" "」" "」"))
 -    ((("<"). ())("＜" "＜" "<"))
 -    (((">"). ())("＞" "＞" ">"))
 -    ((("?"). ())("？" "？" "?"))
 -    ((("/"). ())("／" "／" "/"))
 -    ((("_"). ())("＿" "＿" "_"))
 +    ((("<"). ())("<" "＜" "<"))
 +    (((">"). ())(">" "＞" ">"))
 +    ((("?"). ())("?" "？" "?"))
 +    ((("/"). ())("/" "／" "/"))
 +    ((("_"). ())("_" "＿" "_"))
      
      ((("1"). ())("1" "1" "1"))
      ((("2"). ())("2" "2" "2"))
 @@ -108,24 +107,6 @@
      ((("k" "y" "e"). ())("きぇ" "キェ" "キェ"))
      ((("k" "y" "o"). ())("きょ" "キョ" "キョ"))
  
 -    ((("k" "w" "a"). ())("くぁ" "クァ" "クァ"))
 -    ((("k" "w" "i"). ())("くぃ" "クィ" "クィ"))
 -    ((("k" "w" "u"). ())("くぅ" "クゥ" "クゥ"))
 -    ((("k" "w" "e"). ())("くぇ" "クェ" "クェ"))
 -    ((("k" "w" "o"). ())("くぉ" "クォ" "クォ"))
 -
 -    ((("q" "w" "a"). ())("くぁ" "クァ" "クァ"))
 -    ((("q" "w" "i"). ())("くぃ" "クィ" "クィ"))
 -    ((("q" "w" "u"). ())("くぅ" "クゥ" "クゥ"))
 -    ((("q" "w" "e"). ())("くぇ" "クェ" "クェ"))
 -    ((("q" "w" "o"). ())("くぉ" "クォ" "クォ"))
 -
 -    ((("q" "y" "a"). ())("くゃ" "キャ" "キャ"))
 -    ((("q" "y" "i"). ())("くぃ" "キィ" "キィ"))
 -    ((("q" "y" "u"). ())("くゅ" "キュ" "キュ"))
 -    ((("q" "y" "e"). ())("くぇ" "キェ" "キェ"))
 -    ((("q" "y" "o"). ())("くょ" "キョ" "キョ"))
 - 
      ((("g" "g"). ("g"))("っ" "ッ" "ッ"))
  
  
 @@ -141,12 +122,6 @@
      ((("g" "y" "e"). ())("ぎぇ" "ギェ" "ギェ"))
      ((("g" "y" "o"). ())("ぎょ" "ギョ" "ギョ"))
  
 -    ((("g" "w" "a"). ())("ぐぁ" "グァ" "グァ"))
 -    ((("g" "w" "i"). ())("ぐぃ" "グィ" "グィ")) 
 -    ((("g" "w" "u"). ())("ぐぅ" "グゥ" "グゥ")) 
 -    ((("g" "w" "e"). ())("ぐぇ" "グェ" "グェ")) 
 -    ((("g" "w" "o"). ())("ぐぉ" "グォ" "グォ"))
 -
      ((("s" "s"). ("s"))("っ" "ッ" "ッ"))
  
      ((("s" "s"). ())("っs" "ッs" "ッs"))
 @@ -162,18 +137,6 @@
      ((("s" "y" "e"). ())("しぇ" "シェ" "シェ"))
      ((("s" "y" "o"). ())("しょ" "ショ" "ショ"))
      
 -    ((("s" "h" "a"). ())("しゃ" "シャ" "シャ"))
 -    ((("s" "h" "i"). ())("し" "シ" "シ"))
 -    ((("s" "h" "u"). ())("しゅ" "シュ" "シュ"))
 -    ((("s" "h" "e"). ())("しぇ" "シェ" "シェ"))
 -    ((("s" "h" "o"). ())("しょ" "ショ" "ショ"))
 -
 -    ((("s" "w" "a"). ())("すぁ" "スァ" "スァ"))
 -    ((("s" "w" "i"). ())("すぃ" "スィ" "スィ"))
 -    ((("s" "w" "u"). ())("すぅ" "スゥ" "スゥ"))
 -    ((("s" "w" "e"). ())("すぇ" "スェ" "スェ"))
 -    ((("s" "w" "o"). ())("すぉ" "スォ" "スォ")) 
 -    
      ((("z" "z"). ("z"))("っ" "ッ" "ッ"))
  
      ((("z" "a"). ())("ざ" "ザ" "ザ"))
 @@ -216,30 +179,12 @@
      ((("t" "y" "e"). ())("ちぇ" "チェ" "チェ"))
      ((("t" "y" "o"). ())("ちょ" "チョ" "チョ"))
  
 -    ((("t" "w" "a"). ())("とぁ" "トァ" "トァ"))
 -    ((("t" "w" "i"). ())("とぃ" "トィ" "トィ"))
 -    ((("t" "w" "u"). ())("とぅ" "トゥ" "トゥ"))
 -    ((("t" "w" "e"). ())("とぇ" "トェ" "トェ"))
 -    ((("t" "w" "o"). ())("とぉ" "トォ" "トォ"))
 -
 -    ((("t" "h" "a"). ())("てぁ" "テァ" "テァ"))
 -    ((("t" "h" "i"). ())("てぃ" "ティ" "ティ"))
 -    ((("t" "h" "u"). ())("てゅ" "テュ" "テュ"))
 -    ((("t" "h" "e"). ())("てぇ" "テェ" "テェ"))
 -    ((("t" "h" "o"). ())("てょ" "テョ" "テョ"))
 -    
      ((("t" "s" "a"). ())("つぁ" "ツァ" "ツァ"))
      ((("t" "s" "i"). ())("つぃ" "ツィ" "ツィ"))
      ((("t" "s" "u"). ())("つ"   "ツ"   "ツ"))
      ((("t" "s" "e"). ())("つぇ" "ツェ" "ツェ"))
      ((("t" "s" "o"). ())("つぉ" "ツォ" "ツォ"))    
  
 -    ((("c" "h" "a"). ())("ちゃ" "チャ" "チャ"))
 -    ((("c" "h" "i"). ())("ち" "チ" "チ"))
 -    ((("c" "h" "u"). ())("ちゅ" "チュ" "チュ"))
 -    ((("c" "h" "e"). ())("ちぇ" "チェ" "チェ"))
 -    ((("c" "h" "o"). ())("ちょ" "チョ" "チョ"))
 -
      ((("c" "y" "a"). ())("ちゃ" "チャ" "チャ"))
      ((("c" "y" "i"). ())("ちぃ" "チィ" "チィ"))
      ((("c" "y" "u"). ())("ちゅ" "チュ" "チュ"))
 @@ -255,7 +200,6 @@
      ((("d" "a"). ())("だ" "ダ" "ダ"))
      ((("d" "i"). ())("ぢ" "ヂ" "ヂ"))
      ((("d" "u"). ())("づ" "ヅ" "ヅ"))
 -    ((("d" "s" "u"). ())("づ" "ヅ" "ヅ"))
      ((("d" "e"). ())("で" "デ" "デ"))
      ((("d" "o"). ())("ど" "ド" "ド"))
  
 @@ -265,19 +209,6 @@
      ((("d" "y" "e"). ())("ぢぇ" "ヂェ" "ヂェ"))
      ((("d" "y" "o"). ())("ぢょ" "ヂョ" "ヂョ"))
  
 -    ((("d" "h" "a"). ())("でゃ" "デャ" "デャ"))
 -    ((("d" "h" "i"). ())("でぃ" "ディ" "ディ"))
 -    ((("d" "h" "u"). ())("でゅ" "デュ" "デュ"))
 -    ((("d" "h" "e"). ())("でぇ" "デェ" "デェ"))
 -    ((("d" "h" "o"). ())("でょ" "デョ" "デョ"))
 -
 -
 -    ((("d" "w" "a"). ())("どぁ" "ドァ" "ト ゛ァ"))
 -    ((("d" "w" "i"). ())("どぃ" "ドィ" "ト ゛ィ"))
 -    ((("d" "w" "u"). ())("どぅ" "ドゥ" "ドゥ"))
 -    ((("d" "w" "e"). ())("どぇ" "ドェ" "ト ゛ェ"))
 -    ((("d" "w" "o"). ())("どぉ" "ドォ" "ト ゛ォ"))
 -
      ((("n" "n"). ())("ん" "ン" "ン"))
      ((("n"). ())("ん" "ン" "ン"))
      ((("n" ""). ())("ん" "ン" "ン"))
 @@ -316,17 +247,6 @@
      ((("f" "e"). ())("ふぇ" "フェ" "フェ"))
      ((("f" "o"). ())("ふぉ" "フォ" "フォ"))
  
 -    ((("f" "w" "a"). ())("ふぁ" "ファ" "ファ"))
 -    ((("f" "w" "i"). ())("ふぃ" "フィ" "フィ"))
 -    ((("f" "w" "u"). ())("ふぅ" "フゥ" "フゥ"))
 -    ((("f" "w" "e"). ())("ふぇ" "フェ" "フェ"))
 -    ((("f" "w" "o"). ())("ふぉ" "フォ" "フォ"))
 -
 -    ((("h" "w" "a"). ())("ふぁ" "ファ" "ファ"))
 -    ((("h" "w" "i"). ())("ふぃ" "フィ" "フィ"))
 -    ((("h" "w" "e"). ())("ふぇ" "フェ" "フェ"))
 -    ((("h" "w" "o"). ())("ふぉ" "フォ" "フォ"))
 -
      ((("f" "y" "a"). ())("ふゃ" "フャ" "フャ"))
      ((("f" "y" "i"). ())("ふぃ" "フィ" "フィ"))
      ((("f" "y" "u"). ())("ふゅ" "フュ" "フュ"))
 @@ -415,13 +335,10 @@
  
      ((("w" "w"). ("w"))("っ" "ッ" "ッ"))
  
 -    ((("x" "w" "a"). ())("ゎ" "ヮ" "ワ"))
      ((("w" "a"). ())("わ" "ワ" "ワ"))
      ((("w" "i"). ())("うぃ" "ウィ" "ウィ"))
 -    ((("x" "w" "i"). ())("ゐ" "ヰ" "ィ"))
      ((("w" "u"). ())("う" "ウ" "ウ"))
      ((("w" "e"). ())("うぇ" "ウェ" "ウェ"))
 -    ((("x" "w" "e"). ())("ゑ" "ヱ" "ェ"))
      ((("w" "o"). ())("を" "ヲ" "ヲ"))
      ((("w" "h" "a"). ())("うぁ" "ウァ" "ウァ"))
      ((("w" "h" "i"). ())("うぃ" "ウィ" "ウィ"))
 @@ -539,7 +456,6 @@
      ("@" "＠")
      ("{" "｛")
      ("[" "［")
 -    ("+" "＋")
      (";" "；")
      ("*" "＊")
      (":" "：")
 @@ -597,7 +513,9 @@
  (define load-azik-table
    (lambda ()
      (require "japanese-azik.scm")
 -    (set! ja-rk-rule (append ja-rk-rule ja-azik-rule))
 +    (set! ja-rk-rule (append ja-azik-rule ja-rk-rule))
 +    (define-key skk-prev-candidate-key? 'generic-prev-candidate-key?)
 +    (define-key skk-kana-toggle-key? "@")
      ))
  
  ;;

== 20040924

=== [日記] MP3 Player

Rio S10というMP3プレイヤー用に512MBのSDメモリカードを購入した。
6000円ぐらいで台湾製のアヤシイSDカードだったが、一応ちゃんと動作した。

しかし、このプレイヤーはどうやらFAT形式でフォーマットしないで独自のフォーマットを使用しているようだ。これではWindows用の転送ソフトがないともう使いものにならない。linuxで転送することは現状ではできなさそうである。

最近のMP3プレイヤーはどうなのかちょっと調べてみたが、どうも最近は内蔵メモリにして安く販売するというのが主流のようだ。内蔵メモリならアイリバー(iRiver)というメーカーのiFP-799や899、HDタイプならH120というのが良さげである。SDカードが使えるやつだとRio Chiba、Rio Forgeぐらいかな。Rio ForgeはもしかしたらFAT形式のファイルシステムを採用しているのかもしれない。USBマスストレージにも対応してそうなレビューがあったし。

=== [vim] vim初期カーソル位置

RedhatからDebianに移行してから、vimの初期カーソル位置がファイルの先頭になってしまい、前回のカーソル位置に移動してくれないので不便に感じていたが、解決方法が見つからず放置していた。

しかし、今日もう一度調べてみたところ、やっとその方法がわかった。

まず基本として、viminfoの機能がONになっている必要がある。これは特に問題なかった。そして、「"」というマーク位置に前回の位置が保存されているので、「'"」とタイプすれば無事前回の位置に移動する。

あとはこれを自動で実行する方法であるが、Redhatの/usr/share/vim/vim57/macros/vimrcを調べてみると以下のような記述があった。これに間違いない。

 " Only do this part when compiled with support for autocommands
 if has("autocmd")
   " In text files, always limit the width of text to 78 characters
   autocmd BufRead *.txt set tw=78
   " When editing a file, always jump to the last cursor position
   autocmd BufReadPost * if line("'\"") | exe "'\"" | endif
 endif

.vimrcでマネしてみたところ無事動作した。

ちなみに、どのvimrcが読み込まれているかを調べるには vim -V を使うと大体わかるようだ。

== 20040927

=== [vim] vim 6.3.25 (gvim)

sidのvimをインストールしてみた。versionは6.3.25。

gvimを実行すると、フォント幅は変だが、一応日本語が使えたので、フォント設定方法を調べてみた。

結局、~/.vimrcに以下のような記述をすればいけることがわかった。

 if has("gui_running")
  set guifont=Kochi\ Gothic\ 10
  set guifontwide=-misc-fixed-medium-r-normal-ja-18-120-100-100-c-180-iso10646-1
 endif

どうやらUTF-8でマッピングされた日本語フォントが必要なようだ。

アンチエイリアスが効いていて、見た目も綺麗で満足である。

== 20040928

=== [linux] modutils

昨日、apt-get dist-upgradeしたのだが、今日立ち上げるとネットワークが繋がらない。

調べると/etc/modules.confがまた書き変わっている。このファイルをよく見ると。

 DO NOT MODIFY THIS FILE!

と書いてあった。orz

よくわからないが、/etc/modutil/あたりで書けばよさそうだったので、/etc/modules/aliases に alias eth0 sis900 という行を追加してみた。

* その後に、update-modulesコマンドを実行する必要があるようだ。これで/etc/modules.confに反映されるようだ。 -- ohac 2004-09-28 (火) 09:32:22