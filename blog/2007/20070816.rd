# back: ../index.rd
# <<<2007/20070816.rd
# * ((<2007-08-16|URL:2007/20070816.html>))
=begin

== 2007-08-16

=== patch for ttyrec-1.0.6
ttyrec does't work well. So I created this patch. It's kind of ad hoc though.

 diff -u ttyrec-1.0.6/Makefile ttyrec-1.0.6-1/Makefile
 --- ttyrec-1.0.6/Makefile	2002-10-22 19:01:23.000000000 +0900
 +++ ttyrec-1.0.6-1/Makefile	2007-08-16 09:21:49.000000000 +0900
 @@ -10,7 +10,7 @@
  all: $(TARGET)
  
  ttyrec: ttyrec.o io.o
 -	$(CC) $(CFLAGS) -o ttyrec ttyrec.o io.o
 +	$(CC) $(CFLAGS) -lutil -o ttyrec ttyrec.o io.o
  
  ttyplay: ttyplay.o io.o
  	$(CC) $(CFLAGS) -o ttyplay ttyplay.o io.o
 diff -u ttyrec-1.0.6/ttyrec.c ttyrec-1.0.6-1/ttyrec.c
 --- ttyrec-1.0.6/ttyrec.c	2002-10-22 19:01:23.000000000 +0900
 +++ ttyrec-1.0.6-1/ttyrec.c	2007-08-16 09:21:21.000000000 +0900
 @@ -69,8 +69,12 @@
  
  #define _(FOO) FOO
  
 +#define HAVE_openpty 1
  #ifdef HAVE_openpty
 -#include <libutil.h>
 +#include <termios.h>
 +#include <unistd.h>
 +#include <pty.h>
 +#include <utmp.h>
  #endif
  
  #if defined(SVR4) && !defined(CDEL)

=end
# vim:ft=rd:foldmethod=marker
