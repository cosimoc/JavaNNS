#!/usr/bin/ruby

file = File.new('parsed.txt', 'r')

fileclass1 = File.new('class_1.txt', 'w')
fileclass2 = File.new('class_2.txt', 'w')

file.each do |line|
	entry = line.gsub(' ', '').split(',')

	if entry[8].strip == "2."
		fileclass2.puts(line)
	else
		fileclass1.puts(line)
	end
end
fileclass1.close
fileclass2.close
