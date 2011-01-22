#!/bin/bash
if ! [ -a prototype.tar.gz ]; then
	if ! [ -a prototype ]; then
		svn co http://dev.rubyonrails.org/svn/rails/spinoffs/prototype
	else
		svn up
	fi
	( cd prototype/trunk ; rake dist )
else
	if ! [ -a prototype ]; then
		tar zxf prototype.tar.gz
	fi
fi
cp -f prototype/trunk/dist/prototype.js .
