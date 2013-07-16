require "pirate_bay_ruby/version"

require 'nokogiri'
require 'open-uri'

module PirateBayRuby
  #module_function

  def self.search(name, number=0)
	  doc = Nokogiri::HTML(open("http://thepiratebay.sx/search/#{URI.escape(name)}/0/7/0"))
    
    cnt = 1
	  doc.xpath('//*[@id="searchResult"]').search('tr').each do |row|  #//*[@id="searchResult"]/tbody/tr[1]/td[2]/div/a

      name = row.search('a.detLink')
      if name.length == 0
        next
      end

      magnet_link = ""

      row.search('a').each do |a|
        if a["title"] == "Download this torrent using magnet"
          magnet_link = a["href"]
          break
        end
      end

	    #puts "Row: #{row}"
      
      if number == 0
        puts "#{cnt}:\t#{name.text}"
      elsif cnt == number
        # Found download
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
