#!/usr/bin/ruby

file = File.new('diabetes_learned2..', 'r')

line0=false
line1=false
val = nil
response = 0
right_vals = 0
wrong_vals = 0

file.each do |line|
  if line1 == false and line0 == false and line[0,1] == '#'
    line0 = true
    next
  end

  if line0 == true
    val = line
    line0 = false
    line1 = true
    next
  end
  
  if line1 == true
    if line.to_f > 0.5
      response = 1
    else
      response = 0
    end
    
    if response == val.to_i
      right_vals += 1
    else
      wrong_vals += 1
    end
    line1 = false
  end
end

puts 'Giuste ' + right_vals.to_s
puts 'Sbagliate ' + wrong_vals.to_s
puts 'Totale ' + (right_vals + wrong_vals).to_s
puts 'Accuratezza ' + ((right_vals.to_f / (right_vals.to_f + wrong_vals.to_f)) * 100).to_s
