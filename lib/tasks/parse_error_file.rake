#!/user/bin/env ruby

desc "Fetch error"
task :fetch_error => :environment do

  require 'nokogiri'
  require 'open-uri'

  # Perform a google search
  #doc = Nokogiri::HTML(open('http://google.com/search?q=tenderlove'))

  # Perform a error file search
  url = 'http://localhost:3000/lib/stages/stage_in/UMI0_33992485_ERR.xml'
  
  doc = Nokogiri::HTML(open(url))

  # Print out each link using a CSS selector
#  doc.css('Product').each do |link|
#  puts link.content
  puts = item.at_css(".product").text

end