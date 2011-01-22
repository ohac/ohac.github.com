= KZIK(Kanji Zutto Ii Kanji)
skkime用のレジストリファイルを新規追加しました。(New! 2006-08-16)

== KZIKの特徴(設計方針)
* Quertyローマ字またはAZIKからの移行がやりやすい。
* AZIKローマ字入力とほぼ互換性がある。
* SKKとの相性がよい。(1ストローク目は必ずアルファベットなど)
* 同音異義語の打ち分けを重要視。
* 約750文字(2打鍵で約400文字、3打鍵で約350文字)の漢字が入力可能。
* skkimeでの実装(レジストリファイル)がある。
* uim-skkでの実装(パッチ)がある。

== ダウンロード

=== skkime
((<URL:http://ohac.pun.jp/hg/kzik/file/tip/skkime/>))

=== uim
* ((<URL:http://ohac.pun.jp/hg/uim-debian/>))
* ((<URL:http://ohac.pun.jp/hg/uim-debian/.hg/patches/>))
* ((<URL:http://ohac.pun.jp/hg/uim-trunk/>))
* ((<URL:http://ohac.pun.jp/hg/uim-trunk/.hg/patches/>))
* ((<URL:http://ohac.pun.jp/hg/kzik/file/tip/uim/>))

== KZIKの弱点
* 未完成である。
* 漢字が少ない。(T-Code, TUT-Codeと比べて)
* 打ちにくいストロークの漢字が多い。(T-Code, TUT-Codeと比べて)

== マッピング案
左が1ストローク目、上が2ストローク目となる。例えば「思」という字は sg とタイピングする。

 - w  r  t  y  u  i  s  d  f  g  j  k  ;  z  x  c  v  b  m  ,  .
 s                            思       ■    着 送 空 分 見 ■ ■
 d    対                      大       ■    代    遅 書    ■ ■
 f    件 仕          会       以       ■    点 押 換 付    ■ ■
 g                   行    試          ■    欠 要 用 様    ■ ■
 h    合             方    法          ■    機 移 信 買    ■ ■
 j    重 使          ★       聞       ■    生 身 地 自    ■ ■
 k                   ★                ■    変 開 気 効    ■ ■
 
 - w  r  t  y  u  i  s  d  f  g  j  k  ;  z  x  c  v  b  m  ,  .
 w          ■ ■          ■ ■ ■    ■    ■ ■ ■ ■ ■ ■ ■
 r       力          ★    ■          ■    ■ ■ ■ ■ ■ ■ ■
 t                         強          ■    ■ ■ ■       ■ ■
 y       ■       ■ ■ ■ ■ ■    ■ ■    ■ ■ ■ ■ ■ ■ ■
 p    ■ ■          ★    ■          ■    ■ ■ ■ ■ ■ ■ ■
 
 - w  r  t  y  u  i  s  d  f  g  j  k  ;  z  x  c  v  b  m  ,  .
 z       ■          ■                ■             ■ ■
 x    ■             ■    ■ ■                   ■ ■ ■
 c    ■ ■       ■ ■    ■ ■    ■ ■    ■    ■ ■ ■ ■ ■
 v    ■ ■          ★    返 ■       ■ 帰    ■    ■ ■ ■ ■
 b    ■             ★    ■          ■    ■ ■ ■    ■ ■ ■
 
 ★は3ストローク用予備
 ■は割り当て可能領域

== タイピング練習用ソフト
typing.rbとtyping.kzik。./typing.rb typing.kzikという感じで使用する。

* ((<URL:http://ohac.pun.jp/hg/kzik/file/tip/typing/>))
