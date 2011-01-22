= Linux Tips

== はじめに
この文書は RedHat Linux 7.1 でのセットアップメモです。

== 親指シフト(nicolatter)
nicolatterのRPMをインストールし、デフォルトのcanna, kinput2をFreeWnn, nicolatterに変更しました。

/etc/X11/xinit/xinitrc.d/xinput の XIM を決定する部分に変更が必要でした。$tmplang が ja* のとき、強制的に XML="nicolater" と代入するように変更しました。そして、$XIM の case 文に nicolatter) を追加し、 XIM_PROGRAM=nicolatter と代入するようにしました。

また nicolatter 用の設定ファイルを用意しました。

 $ cd ~
 $ mkdir .nicolatter
 $ cd .nicolatter
 $ cp /usr/doc/nicolatter-1.7.1/rc/* .

~/.nicolatter/global を以下の部分を変更しました。

 conversion-server: wnn
 left-shift-key: Muhenkan
 right-shift-key: Henkan_Mode
 keymap-file: /home/username/.nicolatter/nicola.keymap

これである程度動作するようになりましたが、標準ではctrl-backslashでIMEをON/OFFしていたので、これを"Ctrl+変換"に変更します。~/.nicolatter/global を "kana-key: ctrl-Henkan_Mode" に変更しました。

これだけだと、ktermでのIME ON/OFFがShift+Spaceのままなので、~/.Xdefaultsを変更し、"Ctrl+変換"に変更します。

 KTerm*VT100*translations: #override \
   Ctrl<Key>Henkan_Mode: open-im(XMODIFIERS)

なお、この kterm の設定を行わないと、間違えて Shift+Space を押すと、kterm ごと死んでしまうので要注意です。

ついでなので、kterm 起動時にIMEを立ち上げるようにしましょう。

 KTerm*VT100*openIm: true

以上で大体のセットアップが完了します。

== kterm行間調整
ターミナルでメールやブラウザを扱うとなると、行間を空けて読みやすくしたいものです。~/.Xdefaults を次のように変更。数字は好みで変更しましょう。

 KTerm*VT100*lineSpace: 6

kterm 以外のターミナルも試してみましたが、どうも行間を空ける機能がないのがほとんどのようです。

== kterm壁紙透過(工事中)
ktermもEtermやgnome-terminalのように壁紙を透過させたいので、探してみたところ、kterm-6.2.0-WpBgpImlib という RPM が見つかりました。標準のktermをアンインストールし、これをインストールします。

 $ su
 Password:
 # rpm -e kterm
 # rpm -ivh kterm*.rpm

次に設定を変更します。~/.Xdefaultを次のように変更。

 KTerm.inheriting: true
 KTerm.inheritingShade: -150
 KTerm.inheritingFade: -70
 KTerm*VT100*background: black
 KTerm*VT100*foreground: white
 KTerm*VT100*cursorColor: white
 KTerm*VT100*scrollBar: true

ついでにスクロールバーも表示するようにしました。これで大体OKです。

ただ、Windowを移動する時の描画処理が非常に遅いのと、lynxでのスクロール時にちらつくなどの不具合が発生します。Etermなどではこのような現象は起きませんでした。とりあえず、今は我慢しています。Etermなどで行間の設定があれば、そっちに乗り換えるのだが...

後でわかったのだが再描画はウィンドウマネージャsawfishの設定を変更することで、対策できた。

== sitecopyとBlackJumboDog
Windows用プロキシサーバーのBlackJumboDog経由でWebのアップロードする方法です。~/.sitecopyrc は以下の例のように設定します。

 site ohac
     server 192.168.0.2                    <-- プロキシサーバーのIPアドレス
     port 8021                             <-- プロキシサーバーのFTPポート
     url http://foo.com/~foo/
     username foo@foo.com                  <-- ユーザー名 @ 転送先アドレス
     password ********                     <-- 転送先パスワード
     local ~/www                           <-- ローカルディレクトリ
     remote /www                           <-- 転送先ディレクトリ
     ftp nopasv                            <-- Passiveモードにしない
     exclude *.bak

この設定がわかるまで、非常に時間がかかりました。proxy-server とか proxy-port の設定は不要だったのです。

== USBマウス(一部調査中)
なんか良くわからないが、いろいろやっていて、次の設定でUSBマウスが使えることがわかった。

/etc/modules.conf に以下を追加。

 alias usb-controller-1 input
 alias usb-controller-2 keybdev
 alias usb-controller-3 mousedev
 alias usb-controller-4 hid
 alias usb-controller usb-uhci

あとは、USBマウスを繋げて、再起動するとkudzuというソフトが認識してくれる。~
ただ、ノートPCのタッチパッドと両方を使うにはこれだけでは駄目みたい。またそのうち調査します。

== USBキーボード(一部調査中)
USBマウスと同じ手順で認識まではOKだが、そのままでは変換キーなどがうまく動作しない。

/etc/X11/xkb/keycodes/xfree86 の xkb_keycodes "jp106" の部分のうまく認識しないキーのキーコードを xev で調べ、控えておく。

次に以下のようなファイルを用意しておく。

 keycode 49 = Alt_R
 keycode 129 =
 keycode 131 = underscore
 keycode 132 = Escape
 keycode 134 = Henkan
 keycode 135 = Muhenkan
 add mod1 = Alt_R
 clear mod3
 add mod3 = Henkan

このファイルをxmodmapで処理する。

 $ xmodmap filename

最後にnicolatterをリスタートさせる。

 $ killall -HUP nicolatter

USBキーボードを使うときのみこの作業を行なうとよい。

ちなみに、Escapeキーを131に割り当てているのは、右親指で打鍵可能な、「カタカナひらがな」キーに割り当てたかったためである。また、アンダースコアはシフトなしで入力可能にしている。

キーリピートの調整がわからない。さらなる調査が必要だ。

== GNOMEのデスクトップ(調査中)
GNOMEを使っていると /etc/fstab に追加されたデバイスが勝手にデスクトップにショートカットが作成されてしまいます。私はデスクトップをなるべくシンプルにしておきたいので、これを自動生成しない方法を調査中です。

== 日本語入力キーカスタマイズ(調査中)
== CapsLockをCTRLキーに割り当て(工事中)
/etc/X11/XF86Config-4 を変更。

== vnc(工事中)
変換キーなどがうまく動作しない。

== fetchmail(工事中)
== procmail(工事中)
== mutt(工事中)
== mnews(工事中)
== lynx(工事中)
== vim(工事中)
== cvs(工事中)
== rpmビルド環境(工事中)
