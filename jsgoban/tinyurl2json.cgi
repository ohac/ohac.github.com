#!/usr/bin/env ruby
require 'net/http'
require 'cgi'
HOSTS = [
  { :host => 'tinyurl.com', :uri => 'api-create.php', :query => 'url=%s',
    :method => :get },
  { :host => 'ln-s.net', :uri => '/home/api.jsp', :query => 'url=%s',
    :method => :post },
]
host = HOSTS[0]
cgi = CGI.new
url = cgi['url']
exit unless url
exit if url.size < 10
puts 'Content-Type: text/plain'
puts
cgi.keys.each do |key|
  next if key == 'url'
  url += "&#{key}=#{cgi[key]}"
end
Net::HTTP.version_1_2
Net::HTTP.start(host[:host], 80) { |http|
  case host[:method]
  when :get
    res = http.get("#{host[:uri]}?#{host[:query] % url}")
  when :post
    res = http.post(host[:uri], host[:query] % url)
  end
  body = res.body
  body = body[4, body.size].strip if body =~ /^200/
  puts "tinyurl2json_callback('#{body}');"
}
