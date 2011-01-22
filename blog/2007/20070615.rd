# back: ../index.rd
=begin

== 2007-06-15

=== Mercurial links into trac or redMine
Mercurialのソースコード(及びPython)の勉強中。まだリリースには遠い。

 diff -r 29ec36fb50a3 mercurial/hgweb/hgweb_mod.py
 --- a/mercurial/hgweb/hgweb_mod.py	Thu Jun 14 12:58:05 2007 +0900
 +++ b/mercurial/hgweb/hgweb_mod.py	Fri Jun 15 22:09:16 2007 +0900
 @@ -318,6 +318,11 @@ class hgweb(object):
          def diff(**map):
              yield self.diff(p1, n, None)
  
 +        tickets = []
 +        baseurl = "http://hoge/"
 +        tickets.append(self.t("ticketlink", node="12", baseurl=baseurl))
 +        tickets.append(self.t("ticketlink", node="13", baseurl=baseurl))
 +
          yield self.t('changeset',
                       diff=diff,
                       rev=ctx.rev(),
 @@ -328,6 +333,7 @@ class hgweb(object):
                       author=ctx.user(),
                       desc=ctx.description(),
                       date=ctx.date(),
 +                     tickets=tickets,
                       files=files,
                       archives=self.archivelist(hex(n)),
                       tags=self.nodetagsdict(n),
 diff -r 29ec36fb50a3 templates/changeset.tmpl
 --- a/templates/changeset.tmpl	Thu Jun 14 12:58:05 2007 +0900
 +++ b/templates/changeset.tmpl	Fri Jun 15 21:57:20 2007 +0900
 @@ -36,6 +36,10 @@
   <th class="description">description:</th>
   <td class="description">#desc|strip|escape|addbreaks#</td>
  </tr>
 +<tr>
 + <th class="tickets">tickets:</th>
 + <td class="tickets">#tickets#</td>
 +</tr>
  </table>
  
  <div id="changesetDiff">
 diff -r 29ec36fb50a3 templates/map
 --- a/templates/map	Thu Jun 14 12:58:05 2007 +0900
 +++ b/templates/map	Fri Jun 15 22:09:48 2007 +0900
 @@ -54,3 +54,4 @@ error = error.tmpl
  error = error.tmpl
  urlparameter = '#separator##name#=#value|urlescape#'
  hiddenformentry = '<input type="hidden" name="#name#" value="#value|escape#" />'
 +ticketlink = '<a href="#baseurl##node|short#">##node|escape#</a> '

=== redMine links into Mercurial repository
こんなの作ってみました。

 Index: app/helpers/application_helper.rb
 ===================================================================
 --- app/helpers/application_helper.rb	(revision 564)
 +++ app/helpers/application_helper.rb	(working copy)
 @@ -137,6 +137,12 @@
      #   [[link|title]] -> "title":link
      text = text.gsub(/\[\[([^\]\|]+)(\|([^\]\|]+))?\]\]/) {|m| "\"#{$3 || $1}\":" + format_wiki_link.call(Wiki.titleize($1)) }
  
 +    # turn Mercurial links into textile links: 
 +    # example:
 +    #   hg:tip -> "hg:tip":http://foo/hoge/rev/tip
 +    urlbase = "http://foo/hoge/rev/"
 +    text = text.gsub(/hg:([^\s]+)/) { |m| "\"hg:#{$1}\":#{urlbase}" + $1 }
 +
      # turn issue ids into links
      # example:
      #   #52 -> <a href="/issues/show/52">#52</a>

=end
# vim:ft=rd:foldmethod=marker
