require 'open-uri'
require 'nokogiri'

url = "https://newyork.craigslist.org/search/cpg?query=developer&is_paid=all"

document = open(url)
content = document.read
parsed_content = Nokogiri::HTML(content)

parsed_content.css('.content').css('.result-row').each do |row|
  title = row.css('.hdrlnk').inner_text
  link = row.css('.hdrlnk').first.values[0]
  posted_at = row.css('time').first.values[2]
  hood = row.css('.result-info').css('.result-meta').css('.result-hood').first
  neighborhood = hood ? hood.inner_text.strip : ""

  puts "#{title} #{neighborhood}"
  puts "Posted at #{posted_at}"
  puts "#{link}"
  puts '-------------------------------'
end
