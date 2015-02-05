#!/usr/bin/env ruby

require 'pirate_bay_ruby'
Signal.trap("INT") {} # Suppress backtrace when exiting command

if ARGV.empty? or ARGV.length > 2
  puts "Examples:\nSearch:    #{File.basename(__FILE__)} \"Ubuntu\"\nDownload:  #{File.basename(__FILE__)} \"Ubuntu\" 1"
  exit
else
  PirateBayRuby.search(ARGV[0], ARGV[1])
end
