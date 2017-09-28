require 'open-uri'
require 'nokogiri'

cities = ['newyork']
search_terms = ['python']

cities.each do |city|
  search_terms.each do |search_term|

    url = "https://#{city}.craigslist.org/search/cpg?query=#{search_term}&is_paid=all"

    document = open(url)
    content = document.read
    parsed_content = Nokogiri::HTML(content)

    puts '==========================================='
    puts '_                                         _'
    puts "_         #{city} - #{search_term}        _"
    puts '_                                         _'
    puts '==========================================='

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
  end
end
