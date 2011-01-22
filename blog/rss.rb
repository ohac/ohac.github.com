#!/usr/bin/ruby
require "rss/maker"

rss = RSS::Maker.make("2.0") do |maker|
  maker.channel.about = "http://ohac.sytes.net/hg/rss"
  maker.channel.title = "OhaC's Creative Studio"
  maker.channel.description = "Hello RSS"
  maker.channel.link = "http://ohac.sytes.net/hg/"

  maker.items.do_sort = true

  Dir.glob("200?/*.html") do |file|
    item = maker.items.new_item
    item.link = "http://ohac.sytes.net/hg/#{file}"
    item.title = "#{file}"
    #item.date = Time.now
    item.date = File.mtime(file)
  end
end

File.open("rss", "w") {|file|
    file.puts(rss.to_s)
}
