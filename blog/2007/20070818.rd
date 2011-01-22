# back: ../index.rd
# <<<2007/20070818.rd
# * ((<2007-08-18|URL:2007/20070818.html>))
=begin

== 2007-08-18

=== ajaxterm UTF-8 patch
This patch is not perfect yet. But I can use some Japanese characters with it.

 #
 --- ajaxterm.py.orig	2007-08-18 03:34:08.000000000 +0900
 +++ ajaxterm.py	2007-08-18 03:34:15.000000000 +0900
 @@ -87,9 +87,9 @@
  			if i==0x0a or (i>32 and i<127) or i>160:
  				self.trhtml+=chr(i)
  			elif i<=32:
 -				self.trhtml+="\xa0"
 +				self.trhtml+=" "
  			else:
 -				self.trhtml+="?"
 +				self.trhtml+=chr(i)
  	def reset(self,s=""):
  		self.scr=array.array('i',[0x000700]*(self.width*self.height))
  		self.st=0
 @@ -342,7 +342,7 @@
  			span+=chr(c)
  			if i%w==w-1:
  				span+='\n'
 -		r='<?xml version="1.0" encoding="ISO-8859-1"?><pre class="term">%s</pre>'%r
 +		r='<?xml version="1.0" encoding="UTF-8"?><pre class="term">%s</pre>'%r
  		if self.last_html==r:
  			return '<?xml version="1.0"?><idem></idem>'
  		else:

=end
# vim:ft=rd:foldmethod=marker
