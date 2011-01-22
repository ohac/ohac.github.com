=begin

== 20060308

=== [game]pioneers(gnocatan)
どうやらWindows用のクライアントもあるようだ。やってる人いるのかな。

=== [english]DSえいご漬け日記
AAAを取った次の日、Sを取るが、また次の日AAAに戻る。

=== [debian]quiz(bsdgames)
quizというソフトでテストができそうだ。他にもeducationとかlearning、practiceとかでapt-cache searchするといろいろありそう。全部試すのは時間がかかるだろうけど。ググってみてヒット数が多いやつから試してみるかな。

== 20060310

=== [java][debian][english][chinese]Flashcardでいろいろ暗記
Granule (Debian packageにある)、 jMemorize http://www.riad.de/jmemorize/ 、 Pauker http://pauker.sourceforge.net/ というのを試してみた。なんとなく記憶するための出題スケジューリングについて分かったような気がする。CUIなソフトはなさそうなのは残念。作るしかないかな。辞書ツールと連動できたら便利かも。

== 20060317

=== [debian][english]sufaryとsdic-eijiro
英辞郎をarrayコマンドで検索できるようにした。自作辞書アプリ(CUI)からも使えるようにしてみた。

=== [debian][english]sufary-tcltk
kwicviewコマンドでコーパス検索ができる。コーパスはどこかからダウンロードしてきて、mkaryしておく必要がある。前後の単語でランキング表示するようなスクリプトを書けば便利かも。

=== [debian][english]festival
英文を読み上げてくれるソフト。単語によってはかなり正確に発音してくれる。これも自作辞書アプリから使えるようにした。

== 20060327

=== [music]上原ひろみのFF7
mixi上原ひろみトピより。 http://www.daisukekunita.com/ , http://www.daisukekunita.com/mp3/ff7_128.mp3 家に帰ったら聞いてみよう。

=== [debian][linux]VAIOでkernel 2.6
立ち上げのhotplugあたりがなんか重いので、とりあえずhotplugをuninstallして立ち上げるようにしてみた。これだけだとUSBとかいろいろと初期化されていないので/etc/modulesに必要なmoduleを書いておく。立ち上げは少し速くなったが、やはり重いのは変わらず。2.6系のkernelで何か新しい機能が増えて、それがVAIOのハードと相性が悪いのはないかと思われる。

=== [debian]ndiswrapperでBUFFALOの無線LAN
kernel 2.6に上げたのでndiswrapperに挑戦。いろいろあったが何とかインストールまで完了。ところがNDIS.SYSがないとか表示されてうまく認識しない。ググってみるとどうやら余計な*.sysがインストールされているのが原因らしい。余計な*.sysを/etc/ndiswrapper/hoge/から削除すると、見事に成功。しかし、kernel 2.6で全体的に重い現象は解決せず。

=== [debian][linux]VAIOでkernel 2.6(続き)
VAIOのBIOS設定で「Plug-inに対応しているOSがどうのこうの」というのがあったので、これをOFFにしてみると問題が解決した。うーん、なんなんだろうか。まあとにかく、これで無事kernel 2.4とおさらばできそうである。hotplugも元に戻しておこうかな。

=== [linux]VAIO君の今後の野望
私のVAIOは古いのでUSB1.1しかついていないけど、IDEをUSB2.0に変換するアダプタを購入して、これでDVD-R系ドライブを使おうかと考え中。アダプタは1500円ぐらいで手に入るようだ。DVD-Rドライブは5000円ぐらいかな。ケースをどうするか考えないと。ダンボールで工作するかな。

== 20060329

=== [debian]stellarium - real-time photo-realistic sky generator
面白そうなソフトを発見。kstarよりも綺麗。 http://stellarium.sourceforge.net/ 家のPCで実行すると遅いながらもちゃんと動作した。会社のPCではなぜかエラー終了してしまうな。

=== [debian]stars
starsってのもあるなぁ。

=end
