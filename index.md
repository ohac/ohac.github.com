---
layout: default
title: ohac.github.io
---

# ohac.github.io

<ul>
{% for post in site.posts limit:10 %}
<li>
<a href="{{post.url}}">{{ post.date | date_to_long_string }} : {{ post.title }}</a>
</li>
{% endfor %}
</ul>

* [Mercurial Repositories (bitbucket)](https://bitbucket.org/ohac)
* [Git Repositories (github)](https://github.com/ohac)
* gh-pages
  * [sha1coin](http://ohac.github.io/sha1coin)
  * [sakuracoin](http://ohac.github.io/sakuracoin)
  * [mochaconsole](http://ohac.github.io/mochaconsole)
  * [notmailto](http://ohac.github.io/notmailto)
  * [ditz-ja](http://ohac.github.io/ditz-ja)
* [はてなダイアリー](http://d.hatena.ne.jp/ohac/)
* [blog(old)](blog/index.html)
* [jsgoban](jsgoban/)
* [text with hyperlink converter](txt2link/)
* [Twitter](http://twitter.com/ohac)
* [old_pages](old_pages/front.html)

<a href="https://twitter.com/share" class="twitter-share-button" data-via="ohac">Tweet</a>
<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script>
