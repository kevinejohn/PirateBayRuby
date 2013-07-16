require "pirate_bay_ruby/version"

require 'nokogiri'
require 'open-uri'

module PirateBayRuby
  #module_function

  def self.search(name, number=0)
    number = number.to_i

	  doc = Nokogiri::HTML(open("http://thepiratebay.sx/search/#{URI.escape(name)}/0/7/0"))
    
    cnt = 1
	  doc.xpath('//*[@id="searchResult"]').search('tr').each do |row|
      name = row.search('a.detLink')
      next if name.empty? # Skip empty names

      magnet_link = ""
      row.search('a').each do |a|
        if a["title"] == "Download this torrent using magnet"
          magnet_link = a["href"]
          break
        end
      end

      if number == 0
        # Print to screen
        puts "#{cnt}:\t#{name.text}"
      elsif cnt == number
        # Download
        puts "Downloading:   #{name.text}"
        `open #{magnet_link}`
        break
      end
        
      cnt = cnt + 1
	  end

    if cnt == 1
      "Empty search results"
    end
  end
end
