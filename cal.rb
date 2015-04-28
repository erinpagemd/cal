#!/usr/bin/env ruby

require_relative "lib/Month"
require_relative "lib/Year"

def error_message
  print "Date not in acceptable format/range."
end

if ARGV.length == 2
  month = ARGV[0].to_i
  year = ARGV[1].to_i
  if year < 1800 || year > 3000 || month <= 0 || month > 12
    error_message
    exit
  end
  m = Month.new(month, year)
  print m.to_s
elsif ARGV.length == 1
  year = ARGV[0].to_i
  if year < 1800 || year > 3000
    error_message
    exit
  end
  y = Year.new(year)
  puts y.to_s
else
  error_message
end
