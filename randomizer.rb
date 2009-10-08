#!/usr/bin/ruby

fileclass1 = File.new('class_1.txt', 'r')
fileclass2 = File.new('class_2.txt', 'r')

fileclass1_random = File.new('class_1_random.txt', 'w')
fileclass2_random = File.new('class_2_random.txt', 'w')

file1_hash = []
file2_hash = []

fileclass1.each do |line|
	file1_hash << line
end

fileclass2.each do |line|
	file2_hash << line
end

i = file1_hash.size
i.downto(1) do |x|
	index = rand(x - 1)

	tmp = file1_hash[index]
	file1_hash[index] = file1_hash.last
	file1_hash[file1_hash.size - 1] = tmp
	fileclass1_random.puts(file1_hash.pop)
end

i = file2_hash.size
i.downto(1) do |x|
	index = rand(x - 1)

	tmp = file2_hash[index]
	file2_hash[index] = file2_hash.last
	file2_hash[file2_hash.size - 1] = tmp
	fileclass2_random.puts(file2_hash.pop)
end

fileclass1.close
fileclass2.close
