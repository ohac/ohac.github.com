#!/usr/bin/ruby
require 'net/http'
require 'cgi'
HOSTS = [
  { :host => 'tinyurl.com', :uri => 'api-create.php?url=%s' },
  { :host => 'ln-s.net', :uri => 'home/api.jsp?url=%s' },
]
host = HOSTS[1]
cgi = CGI.new
url = cgi['url']
puts 'Content-Type: text/plain'
puts
cgi.keys.each do |key|
  next if key == 'url'
  url += "&#{key}=#{cgi[key]}"
end
Net::HTTP.version_1_2
Net::HTTP.start(host[:host], 80) { |http|
  res = http.get(host[:uri] % url)
  puts "tinyurl2json_callback('#{res.body}');"
}
