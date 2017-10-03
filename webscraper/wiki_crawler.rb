require 'open_uri_redirections'
require 'nokogiri'

DATA_DIR = "data-hold/nobel"
Dir.mkdir(DATA_DIR) unless File.exists?(DATA_DIR)

BASE_WIKIPEDIA_URL = "http://en.wikipedia.org"
LIST_URL = "#{BASE_WIKIPEDIA_URL}/wiki/List_of_Nobel_laureates"

page = Nokogiri::HTML(open(LIST_URL, :allow_redirections => :safe))
rows = page.css('div.mw-content-ltr table.wikitable tr')

rows[1..-2].each do |row|
  hrefs = row.css("td a").map {|a| a['href'] if a['href'] =~ /^\/wiki\// }.compact.uniq

  hrefs.each do |href|
    remote_url = BASE_WIKIPEDIA_URL + href
    local_fname = "#{DATA_DIR}/#{File.basename(href)}.html"
  end
end
