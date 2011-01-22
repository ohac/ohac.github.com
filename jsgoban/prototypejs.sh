#!/bin/sh
svn co http://svn.rubyonrails.org/rails/spinoffs/prototype/trunk prototype
cd prototype
rake
cd ..
cp prototype/dist/prototype.js .
