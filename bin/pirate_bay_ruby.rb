#!/usr/bin/env ruby

require 'commander/import'

require 'pirate_bay_ruby'

HighLine.track_eof = false # Fix for built-in Ruby
Signal.trap("INT") {} # Suppress backtrace when exiting command

program :version, PirateBayRuby::VERSION
program :description, 'A command-line interface for searching the pirate bay'

program :help, 'Author', 'Kevin Johnson <kevinejohn@gmail.com>'
program :help, 'Website', 'https://github.com/kevinejohn'
program :help_formatter, :compact

default_command :help

command :search do |c|
  c.syntax = 'pirate_bay_ruby search "Ubuntu"'
  c.summary = 'Searches the pirate bay'
  c.description = ''

  c.example 'description', 'pirate_bay_ruby search "Mad Men"'

  c.action do |args, options|
    say_error "One or more arguments required" and abort if args.empty?

    @environment = options.environment.downcase.to_sym rescue :development
    say_error "Invalid environment,'#{@environment}' (should be either :development or :production)" and abort unless [:development, :production].include?(@environment)

    if args.count == 1
      PirateBayRuby.search(args[0])
    elsif args.count == 2
      PirateBayRuby.search(args[0], args[1])
    else
      say_error "Invalid number of arguments" and abort 
    end

    say_ok "Done"
  end
end