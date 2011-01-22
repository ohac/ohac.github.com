=begin

== 20060703

=== [diary]DELL XPS M1210購入
勢い余って、DELL XPS M1210というノートPCを発注してしまった。これで私もWindows XP user。グッバイWindows 98。(というか使ってなかったけど。)大きさはB5ファイルサイズとあるけど、ほとんどA4サイズらしい。CPUはCore Duo、GPUはバッテリの持ちが心配なのでGeForceではなく内蔵にしておいた。その他のスペックはWebcam(130万画素ぐらいらしい)、Blue Tooth、RAM512MB、HDD80GB、無線LAN(abg)、スーパーマルチドライブ、WXGA、9セルバッテリといった感じ。バッテリ持続時間が7時間ぐらいあればうれしいが、どんなもんでしょうねぇ。早く日本に到着してくれー。

=== [game]ドラゴンクロニクル初挑戦
1プレイ100円になってたので1回だけやってみた。スタート直後にさらに追加の100円が必要だと言われ、しゃーないので100円入れてみた。いまいち面白さが分からなかったけど、1回だけだとそんなものなのかな。ドラゴンカードを入手したが、どうやら次回のプレイではテイマーカードというのも必要らしい。またお金取られるのかよー。

== 20060707

=== [debian]jabber-muc
localhostの部分をFQDNに置き換える。conference.localhostの部分はconference.FQDNに置き換え。決してconference.を消してはいけない。これを消してしまったのでハマった。

=== [diary]Coccinellaでwhiteboard
ホワイトボード機能のあるJabberクライアントをついに発見。しかし、会社のPCでは何故か動かない。querybug tk8.4 をみると関係ありそうなバグ#287360を発見。これを修正したtk8.4パッケージを作成し、インストールするとソースからの実行で無事起動できるようになった。 http://hem.fyristorg.com/matben/

== 20060713

=== [diary]DELL XPS M1210到着
やっと到着。ちょっと動かしてみたところ、むっちゃ速いので驚いた。今までが遅すぎたという話もあるが、それを抜きにしても速く感じた。リソースメータを見るとCPUの欄が2つある! ちゃんとDualで動いてるみたい。

=== [windows][debian]coLinux+Debian
Windows XPが手に入ったので、この中でcoLinuxを動かしてみた。トンネルデバイスの設定に苦労した。家の無線LANが192.168.0.xだったので、固定IPに変えてからDHCPに戻したり、いろいろしてなんとかルーティングできた。最初のイメージがsargeで、sshがなぜかうまく繋がらず、とりあえずtelnetdをインストール。その後、現状のetchに上げて、sshするとすんなり繋がった。うーん、まあいいか。telnetdは削除。vncserverをインストールして、Windowsのtight vnc clientから接続に挑戦。.xsessionにxclockとか書いて繋げてみるがうまくいかず。.xsession-errorsを見るとフォントがどうのこうのと書いてある。xfonts関連をインストールして無事動作した。mltermは動かないけど、ktermなら動いた。querybts mltermで調べるとFixed in NMU bugs -- Normal bugs (1 bug) #298280: mlterm can't work on VNC というのがあった。これやね。ということで昨日はここまで。今日、また続きをやろう。

== 20060714

=== [windows][debian]coLinux+Debian(続き)
sid化した。fluxboxやuim-skk等を入れた。mltermはsid化する前になぜか動くようになっていた。eth0の初期化後にvncserverが立ち上がるように設定してみた。あと、Windows側のvncviewerをpassword込みで設定を保存すると、1クリックでアクセスできるようになった。つまり、coLinuxで1クリック、しばらく待ちvncviewerを1クリックの計2クリックでX Windowが使える状態。

== 20060718

=== [diary]iTunes+Roland UA-30
本当はBluetoothでアンプまでオーディオ出力を飛ばしたかったが、ちょっと予算の都合もあるのでRoland UA-30を経由してアンプに繋ぐことにしてみた。DELLのM1210は結構静かなので十分オーディオ機器として使用可能だ。再生にはiTunesを使用してみた。ついでなのでmixi musicも入れてみた。CDのリッピングにはcd2wav、午後のこ〜だDLL使用で、192kbps付近のVBRなMP3に変換。自宅CDコレクションの1/4ほどを取り込んだ。全部取り込むのにもう少しかかりそう。取り込み完了したらDVD-Rに焼いておこう。それにしてもCDの入れ替えなしで次々と曲を再生できるのは便利。

=== [diary]スピーカーケーブル
猫にかじられたスピーカーケーブルを取り換えた。今度はかじるなよ猫たちよ。DENONのアンプ、サブウーハー、ミニスピーカーでMP3を聞いてみた。うーん、いい音。オーディオマニアに言わせるとまだまだなんやろうけど。やっぱりヘッドホンよりスピーカーがいいな。特に低音の響く感じはヘッドホンではどうしても出せない。でも家の周りがうるさかったりするのが難点。

=== [linux]メモリ節約だらだらメモ
mltermが結構メモリを使っているようなのでktermに乗り換えてみた。いや、違う...mltermもmlterm --im=ximにすればそんなにメモリは使わないようだ。お、krxvtの方が少ないな。これに乗り換えようかな。あと、zshもbashに戻した。gaimがかなりメモリを使っている。これはどうにかならないのかな。plug-inが多すぎるのかな。あとvimも大きい。vim-fullをインストールしたからかも。普通のvimに戻してみるかな。いろいろがんばってみたけど、firefoxはやはり大きいな。とりあえずGoogleツールバーを消してみた。operaも試したが、topで見る限りそんなにメモリ消費に違いはなさそうなのでfirefoxのままにしておく。freshclam を cron.daily で /etc/init.d/clamav-freshclam no-daemon と呼ぶように変更。/etc/rc2.d の symlink を削除。それとavahi-daemonも消してみた。

== 20060728

=== [uim][linux]krxvt vs mlterm
む、krxvt + uim-xim な環境だと半角カナを送るとおかしくなるな。mlterm +uim-xim だと問題は起きない。mlterm に戻そう。半角カナを使うわけではないけど、間違えて入力したときに文字化けするのはなんともいやな感じですし、あとkrxvtがときどきuim-ximとの通信がおかしくなるときがあるので。

=== [diary]Bluetooth
東芝のAU携帯に付いてきたBluetoothレシーバーがあったのでPCから接続できるかやってみた。特に問題なく使うことができた。Bluetoothのヘッドセットが欲しくなった。

=end
