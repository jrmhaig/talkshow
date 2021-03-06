#!/usr/bin/env ruby

require 'talkshow'

ts = Talkshow.new()

ts.start_server

words = %w{Hello from the server Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum}

words.each do |word|

  result = ts.execute( %{notify("#{word}");} )
 
  puts result
end

sleep 3 # Handle some nops

begin
  ts.execute( "nosuchfunction()")
rescue StandardError => e
  puts e
end

puts ts.execute( %{notify("All done", true, true);} )

ts.stop_server
