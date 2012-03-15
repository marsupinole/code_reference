array = [[[1.6666666666666667, 1, 30, 50, 11]], [[1.125, 3, 40, 45, 14], [1.6666666666666667, 1, 30, 50, 11], [2.0, 2, 20, 40, 13]], [[1.125, 3, 40, 45, 14], [1.6666666666666667, 1, 30, 50, 11], [2.0, 2, 20, 40, 13]], [[1.6666666666666667, 1, 30, 50, 11], [2.0, 2, 20, 40, 13], [2.25, 4, 20, 45, 18]], [[1.125, 3, 40, 45, 14], [2.0, 2, 20, 40, 13], [2.25, 4, 20, 45, 18]]]

y = 0 
while y < array.length
  array[y].map(&:shift)
  array[y].map(&:pop)
  array[y].map{|x| x.slice!(1)}
  y += 1
end


def final_total(array)
	final_array = []
	array.flatten!
	hash = Hash[*array]
	values = hash.values
	value_total = values.inject{|sum,x| sum + x}
	final_array.push(value_total)
	final_array.push(hash.keys.length)
	final_array.push(hash.keys)
	final_array.flatten!
end

array.map!{|x| final_total(x)}
array.map!{|x| x.join(' ')}
array.each {|x| print "#{x}" + "\n" }


