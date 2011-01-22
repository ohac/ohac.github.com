# back: ../index.rd
=begin

== 2007-06-13

=== Setting for Mercurial and Gmail
Like this.

 [email]
 from = My Name <my_account.at.gmail.com>
 to = target_mail_address.at.domain
 method = smtp
 
 [smtp]
 host = smtp.gmail.com
 port = 587
 tls = True
 username = my_account.at.gmail.com
 password = my_password

Now I can use 'hg email' command.

=== My Mercurial repository
I have created repository for Mercurial.

* ((<URL:http://ohac.sytes.net/hgwebdir.cgi/mercurial/>))

You can pull and clone from this repository.

=== Mercurial character encoding setting patch
I have created patch for Mercurial. This patch provides character encoding setting in each repository. After this patch, You can use multi encoding repositories with one mercurial server.

 # HG changeset patch
 # User OHASHI Hideya <ohachige at gmail.com>
 # Date 1181718644 -32400
 # Node ID cc6b6505cf1bd7e7fa5c369e3c25f440524c4e04
 # Parent  050fa240db9cebc0fb6238c09de40fcfb867bb95
 enable to select encoding in hgrc web section
 
 diff -r 050fa240db9c -r cc6b6505cf1b mercurial/hgweb/hgweb_mod.py
 --- a/mercurial/hgweb/hgweb_mod.py      Mon Jun 11 21:09:24 2007 -0500
 +++ b/mercurial/hgweb/hgweb_mod.py      Wed Jun 13 16:10:44 2007 +0900
 @@ -103,6 +103,7 @@ class hgweb(object):
              self.maxshortchanges = int(self.config("web", "maxshortchanges", 60))
              self.maxfiles = int(self.config("web", "maxfiles", 10))
              self.allowpull = self.configbool("web", "allowpull", True)
 +            self.encoding = self.config("web", "encoding", util._encoding)
 
      def archivelist(self, nodeid):
          allowed = self.configlist("web", "allow_archive")
 @@ -655,7 +656,7 @@ class hgweb(object):
      def run_wsgi(self, req):
          def header(**map):
              header_file = cStringIO.StringIO(
 -                ''.join(self.t("header", encoding=util._encoding, **map)))
 +                ''.join(self.t("header", encoding=self.encoding, **map)))
              msg = mimetools.Message(header_file, 0)
              req.header(msg.items())
              yield header_file.read()
 
An example setting is as follows.

 [web]
 encoding = EUC-JP
 #encoding = SHIFT_JIS
 #encoding = UTF-8

You can use this example for $HOME/.hgrc and .hg/hgrc.

=end
# vim:ft=rd:foldmethod=marker
