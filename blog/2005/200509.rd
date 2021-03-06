=begin

== 20050901

=== [game]GnuGo 2子 7目勝ち(3回目)
やっと安定して勝てるようになってきたかも。ちなみに休み時間の5分ぐらいで打ちきっています。明日はコミなしの互い先でもやってみようかな。

=== [game]GnuGo 定先 1目負け
夕方にちょっとやってみた。1回目はぼろ負け。2回目は1目負け。うーん惜しかった。ところで互先と定先ってどう違うのかな。Wikipediaによると定先とは「下手が常に黒石を持つ」とのことなので、今回のケースだと定先の方が正しいのかな。

== 20050902

=== [game]囲碁の掲示板対局
これをサポートするようなソフトがあれば面白いかも。書き込みのテキスト生成やら、なにやらいろいろと。でも、たぶんアイデアだけで何も作らないと思う。

=== [game]囲碁の掲示板対局を円滑にできないか
例えばこういう状態で黒番だとすると、

 ┌┬┬┬┬┬┬┬┐
 ├┼┼┼┼┼┼┼┤
 ├┼┼┼┼┼┼┼┤
 ├┼┼●┼┼●┼┤
 ├┼┼┼●●┼●┤
 ├┼○┼○○○☆┤
 ├┼┼┼┼┼┼┼┤
 ├┼┼┼┼┼┼┼┤
 └┴┴┴┴┴┴┴┘

こんな感じに★に打つとして、その先の予想図を「いろは」で書いて相手に伝え、

 ┌┬┬┬┬┬┬┬┐
 ├┼┼┼┼┼┼┼┤
 ├┼┼┼┼┼┼┼┤
 ├┼┼●┼┼●┼┤
 ├┼┼へ●●┼●ろ
 ├┼○に○○○○★
 ├┼┼ほ┼┼ははい
 ├┼┼┼┼┼┼はは
 └┴┴┴┴┴┴┴┘

もし相手が「いろはに」までが予想通りだとしたら、「ほ」を相手が思うところに書きかえて返信する。さらに「いろは」で予想図を書く。

 ┌┬┬┬┬┬┬┬┐
 ├┼┼┼┼┼┼┼┤
 ├┼┼┼┼┼┼┼┤
 ├┼┼●┼┼●┼┤
 ├┼☆ろ●●┼●●
 ├┼○●○○○○●
 ├┼┼い┼┼○┼○
 ├┼┼┼┼┼┼┼┤
 └┴┴┴┴┴┴┴┘

どうでしょう。ヨセの場面とか、終局寸前とかだと結構いいかもしれません。布石のあたりではほとんど使えないでしょうね。ちなみにヘタすると相手にヒントを教えてしまいますけど。いや、うまくやれば相手を誘導できるかも...。って、心理ゲームかよ。ちなみにこの例はヘタクソな私が超適当に考えた(あまり考えていない)ものなのでツッコまないでね。あくまでも例ですので。

== 20050907

=== [diary]社内のコミュニティ
社内でmixiみたいなコミュニティ機能付きのSNSみたいなのを立ち上げられたら面白いかも。

=== [diary]コマンドプロンプト
くそー、なんでWindowsのバージョンごとにコマンドプロンプトの位置や名前が変わるのだ。手順が書きにくいやないか。

=== [english]中国の方と電話
日本語が話せる方と電話することがあるのだけど、あっちの方は英単語(外来語とか)の発音がいいので、こっちもそれに合わせて発音してやろうかと思ったりします。しかし、近くの日本人に聞かれるのがなんとなくはずかしいので、カタカナ英語で発音してしまいます。いやだなぁ。日本語の中にでてくる英単語はやっぱりカタカナで発音する方がしっくりくるよなぁ。慣れてないだけかなぁ。しかも最悪なのは日本人同士で使うことのある聞き間違い防止用の"d"を「デー」と言ったりするクセが抜けてなかったりして。

== 20050908

=== [linux]暗号化ファイルシステム
いろいろあるみたいだけど、どれがスタンダードなんだろうか。

=== [game]GnuGo 13路定先
くそう、全然勝てん。というかいい勝負にもならない。やっぱり前にいい勝負をしていたのはマグレだったようです。

== 20050913

=== [debian][english]辞書関連パッケージ
うーむ、gnomeかKDEの辞書以外でいいのはないかなぁ。gidicというのはちょっと思っているものとは違うみたいだし。

 gidic - A simple GTK Dictionary
 kdict - dictionary client for KDE
 gnome-utils - GNOME desktop utilities
 dict - Dictionary Client
 sdic-eijiro - Installer for EIJIRO dictionaries for sdic
 xjdic - Japanese-English dictionary search program
 edict - English / Japanese dictionary

=== [debian][english]dict
dict wordで検索できるようだ。むむ、辞書用のポート 2628 が空いていないではないか。困るなぁ。

=== [english]マウスだけで辞書検索
dictという辞書コンソールアプリをマウスだけで操作したい。範囲選択して、ターミナルへペーストするだけで検索できたら便利かも。rubyか何かで入力タイムアウトを0.5秒ぐらいで単語を読み込むようなものを作って、dictに渡せばいいかも。人間がタイプしたときと自動判別できるようにすればなおベターかも。2文字目の入力が遅いときはペーストだと判断するとか。

=== [english][ruby]マウスだけで辞書検索(続き)
とりあえずできた。tdiaryでインデントを書くにはどうしたらいいのかな、とりあえず先頭に文字を入れてpreタグにしておこう。

 #! /usr/bin/ruby
 require 'io/wait.so'
 
 exec('stty raw') if fork == nil
 Process.wait
 
 timer = 0
 str = ''
 while true
     if $stdin.ready?
         ch = $stdin.getc
         str = sprintf("%s%c", str, ch)
         timer = 5
         next
     end
     $stdin.wait(0.1)
     if timer == 0
     elsif timer == 1
         # quit!
         break if str =~ /qu/
         exec('stty -raw') if fork == nil
         Process.wait
         exec('dict ' + str) if fork == nil
         Process.wait
         exec('stty raw') if fork == nil
         Process.wait
         timer = 0
         str = ''
     else
         timer = timer - 1
     end
 end
 exec('stty -raw') if fork == nil
 Process.wait

=== [linux]使用中のファイルを調べる
ls -l /proc/*/cwd と ls -l /proc/*/fd で、どのプロセスがどのファイルをオープンしているかがわかるようだ。

== 20050914

=== [ruby][english]辞書
無駄が多かったので、リファクタリングしてみました。

 #! /usr/bin/ruby
 require 'io/wait.so'
 system('stty -icanon min 1 time 0 -echo')
 while true
     str = ''
     str << $stdin.getc
     str << $stdin.getc while $stdin.wait(0.5) != nil
     break if str =~ /:q/
     system('dict', str)
     puts '---'
 end
 system('stty icanon echo')

== 20050915

=== [diary]Google
お、Googleからの検索で来られた人がいるようだ。Googleの検索ロボットがちゃんと巡回してくれるようになったのかなぁ。あとでログを見てみようっと。

=== [ruby]begin .. end while ..
昨日のコードは begin .. end while .. を使った方が短かくなるなぁ。

=== [linux]ハングルUTF-8をpsに
どうやったらいけるのかなぁ。gnome-u2psとかでできるのかと思ったけど、u2ps -o out.ps in.utf8 としてから、gv out.psで見てみると日本語の部分は問題ないけどハングルのところが「・」になる。あ、それとWindowsでハングル・日本語混じりのテキストを表示編集できるエディタってないかなぁ。Vimでいけるのかな、もしかして。印刷できたらさらにうれしいのだが。

== 20050916

=== [mutt]添付ファイルのdot
muttかimputかその先わからないけど、text/plainな添付ファイルに"."だけの行があるとそこでファイルが途切れるようだ。本文でも同じようだ。というか、そういう仕様なのかな。"."だけの行は特別な意味があるらしいし。やっぱりテキストファイルもzip等でアーカイブして送る方が無難かもしれない。

=== [mutt]添付ファイルのdot(解決)
~/.im/Config に IgnoreDot=on を追加することで解決しました。

== 20050920

=== [game]シレン最果てへの道58階
だいぶ進んだ。初回なので失敗しないように慎重に行こうと思う。2回目ならスピード重視で進めてもいいと思うけど、とりあえずクリアしたいので。といいながら途中で失敗するかもしれないけど。それにしてもNintendo DSが欲しい。シレンの新作が出るらしいので。

=== [linux]git/cogitoとMercurial
ソースコード管理ツールの一種らしい。もう大学生ではない日誌 http://kodou.net/diary/?date=20050919 からの情報。

=== [linux]RSCM
「CVSやSubversionなどをRubyから扱うためのツールらしい」とのこと。これももう大学生ではない日誌 http://kodou.net/diary/?date=20050918 からの情報。会社の独自ツールでRubyからCVSを呼ぶときにfork(), exec()を使っているのですが、これがあればexec()を使わなくてもいけるのかなぁ。

== 20050921

=== [linux]e2psで文字化け
あれ?知らん間にe2psで日本語が文字化けするようになってしまったようだ。韓国語混じりのテキストをps化しようといろいろ試していた頃に何か変わってしまったのかなぁ。gs関連、gv、e2psを最新にしても直らない。ううむ。

=== [diary]スキルチェック
社内教育として、テスト形式でなんかできないかなぁ。

=== [english]dict
しめしめ、dict用のポートが空いたぞ。

=== [english]辞書と単語テストを連動
この前作った辞書CUIで、参照した単語を記憶して、単語テストにできないかな。さらにそのテストで暗記したかどうかのチェックがあり、それの統計や前回の出題日時などから効果的な出題をしてくれるとか。UTF-8にも対応して、中国語などにも対応できたらさらにいいなぁ。

== 20050922

=== [debian]defomaでエラー
Use of uninitialized value in print at /var/lib/defoma/scripts/gs.defoma line 108.

defoma-reconfigureでこんなのが出るなぁ。gv で Ryumin-Light-* とかが見つからないという問題はこれが関係しているのかなぁ。フォント周りは難しすぎてトラブルシューティングがほとんどできないな。

== 20050924

=== [debian]apt-get upgrade
openofficeがMD5値が違うとか言われて中断するなぁ。

=== [diary]VAIOノート故障
また電源が入らなくなった。が、2〜3日電源を入れずにほっとくと再べ電源が入るようになった。たぶん熱暴走した後、何かがおかしくなってしまっているようだ。ノート用の冷却ファンかゲルシートみたいなやつが欲しいな。食品用の冷却ゲルを冷蔵庫で冷やしておいて、2つぐらいならべて下にひいてみようかなぁ。

== 20050926

=== [diary]ノートPCの冷却
冷蔵庫で冷やしておいたゲル状の液体の入った保冷材を2つノートPCの下に置くと結構冷えるのでおすすめかも。ファンが回りだすとうるさいPCにも使えそうです。

=== [game]シレン最果て99F
やっとクリアできました。城飾りを一つとり損ねた。時間は20時間ぐらい。ちょっと慎重に進めすぎたかも。その代わり1回目でクリアできました。

== 20050927

=== [linux]git/cogit試用
Anthy-MLでgit/cogitが流行りつつあるなぁ。試してみようかなぁ。とりあえずインストールして、ローカルで使ってみた。cg-initで.gitが生成され、あとはそこにファイルなどを作成して、cg-add filenameでadd、cg-commitでcommitといった感じだ。cg-diffやcg-statusなどもCVSユーザにとっては直感的で使いやすい。別のディレクトリで cg-clone ~/hoge とすると、そのリポジトリのクローンができる。そのクローンにcdしてから、cg-pullとすると元リポジトリからの取り出し、cg-updateでワーキングディレクトリへの更新、という具合のようだ。ブランチの管理はcg-branch-ls、cg-branch-addなどを使う。デフォルトのブランチ名は origin のようだ。つまり、cg-update は cg-update origin を省略したもの。ブランチが複数あるときは cg-pull branchname, cg-update branchname という手順となる。うーん、これは便利かも。

=== [mutt]添付ファイルエクスプローラ
添付ファイルをいろいろと操るCUIなソフトが欲しいな。自作するしかないかな。具体的には*.lzhや*.zipの中のエントリーを選んで、acroreadやooffice、xlsview、antiword、vi、lv、lessなどを起動したいという感じ。

=== [linux]scim+anthyでNICOLA
scimをバージョンアップ。エラーはでなくなったようだ。でも設定が(調べてないから)わからない。ところで scim+anthyでNICOLA配列ができる http://ktj.dip.jp/coreblog/154/ らしい。元NICOLA信者の私としては一度試してみたいところではある。日本語ばかりの文章を書く機会でもない限り、NICOLAに戻ることはないだろうけど。やっぱりAZIK+SKKが自分の中では最強だ。

== 20050928

=== [mlterm]ja_JP.UTF-8
mltermをバージョンアップしたら、LANG=ja_JP.UTF-8で立ち上がらなくなった。こんなエラー。仕方ないのでEUC-JPでmuttを動かすように変更。

mlterm: symbol lookup error: mlterm: undefined symbol: fribidi_get_type

=== [game]gnugo 19路 4子
勝てたー。でも「待った」を1回だけ、3手ほど戻しましたが。

=== [linux]cogito
cogitoのWindows版はパッと検索した感じではなさそうだなぁ。

== 20050929

=== [debian]defoma
「Use of uninitialized value in ..」でググッてくるのが何回かあるなぁ。同じ問題で悩んでいるのだろうか。解決したらぜひ教えてほしいなぁ。と、言ってみるテスト。

=== [chinese]夫婦別姓
あー、なるほど中国は夫婦別姓なのか。あの人はあの人の奥さんだとは予想していたけど、やはりそうか。その人と面識はあったけど、チャットだけだと顔が見えないのではっきりと分からなかった。

=== [linux]gqview
設定でズーム品質をハイパーにすると、スキャナで取り込んだ書類が読みやすくなった。

=end
