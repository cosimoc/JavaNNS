#!/usr/bin/ruby

file = File.new('diabetes.all', 'r')

max = Array.new(8)
min = Array.new(8)

file.each do |line|
	entry = line.gsub(' ', '').split(',')
	#puts entry
	entry.pop
	i = 0
	entry.each do |c|
		max[i] = c.to_f if max[i].nil? or c.to_f > max[i]
		min[i] = c.to_f if min[i].nil? or c.to_f < min[i]
		i += 1
	end
end

#puts "MAX"
#puts max

#puts "MIN"
#puts min
file.rewind
file2write = File.new('parsed.txt', 'w')
file.each do |line|
	entry = line.gsub(' ', '').split(',')
	#puts entry
	n = Array.new(9)
	n[8] = entry.pop
	i = 0
	entry.each do |c|
		n[i] = (c.to_f-min[i])/(max[i]-min[i])
		i += 1
	end
	#puts n.to_s
	file2write.puts(n.join(", "))
end
file2write.close
