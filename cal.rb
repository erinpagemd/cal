#!/usr/bin/env ruby

require_relative "lib/Month"
require_relative "lib/Year"



if ARGV.length == 2
  month = ARGV[0]
  year = ARGV[1]
  m = Month.new(month, year)
  puts m.to_s
elsif ARGV.length == 1
  year = ARGV[0]
  y = Year.new(year)
  puts y.to_s
else
  puts "Date not in acceptable format/range."
end
