#!/usr/bin/ruby
require 'webrick'
server = WEBrick::HTTPServer.new({
:Port => 10080,
:BindAddress => '127.0.0.1',
:DocumentRoot => '.'})
trap('INT') { server.shutdown }
server.start
