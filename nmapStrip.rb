#!/usr/bin/env ruby

if !ARGV[0]
  puts"   NAME"
  puts "nmapStrip.rb [infile] [outfile] \n\n"
  puts "  SUMMARY"
  puts "A quick script to strip nmap scans of down hosts, thus showing you only good ones. \n\n"
  puts "  ARGUMENTS"
  puts "[infile] - The output of the nmap scan you want to strip"
  puts "[outfile] - Where you want to write the new, stripped, file to\n\n"
  exit(1)
end

begin
  file = File.new(ARGV[0], "r")
  outfile = File.new(ARGV[1], "a")
  while (line = file.gets)
    if (line =~ /Host (\d){1,3}.(\d){1,3}.(\d){1,3}.(\d){1,3} appears to be down/) == nil
      outfile.write(line)
    end
  end
  file.close
  outfile.close
rescue Exception => e
  puts "err: #{e}"
end

