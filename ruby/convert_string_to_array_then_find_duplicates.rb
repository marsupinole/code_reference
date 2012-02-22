a = ‘aaabbccccdd’
b = a[0..-1].split('').collect!
c = b.to_a
d = Hash.new(0)   #will not work without the zero
c.each do |e|
  d[e] += 1
end
d.each do |f,g|
  puts “#{f} appears #{g} times
end
