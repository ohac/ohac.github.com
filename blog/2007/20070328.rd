# back: ../index.rd
=begin

== 2007-03-28

=== English diary

==== Spam mail and bsfilter
Recently I've been receiving a lot of spam mails.
It's really annoying.

I decided to use spam filter. I chose bsfilter which is written in ruby.
I researched how to use bsfilter with procmail.
Now I've setuped .procmailrc like this.

 # spam filter
 :0 fw
 | bsfilter -a --pipe --insert-flag --insert-probability --mark-spam-subject
 
 :0
 * ^X-Spam-Flag: Yes
 spam/

bsfilter doesn't have initial spam/ham database.
So I had to prepare some spam/ham mails.
I put them into bsfilter database as below.

 bsfilter -s Mail/spam/cur/*
 bsfilter -c Mail/ham/cur/*
 bsfilter -u

Now I get less spams than before.
But I get a few spams.
I've been putting them into db almost everyday.

 bsfilter -Cs Mail/spam/cur/*
 bsfilter -u

I misunderstood about "-a" option.
It means that judgement updates db automatically.
So if you use "-a" option, you have to use "-C" to remove it from clean database.
If you don't use, your spam have remained to your clean mail database.

=end
# vim:ft=rd
