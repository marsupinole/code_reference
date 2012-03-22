aggregate2 = [[[50, 1]], [[40, 2], [45, 3], [50, 1]], [[40, 2], [45, 3], [50, 1]], [[45, 4], [45, 3], [50, 1]], [[40, 2], [45, 4], [45, 3]]]

def final_total(array)
	final_array = []
	h = 0
	while h < array.length
		array[h].reverse!
		h += 1
	end
	array.sort!
	array.flatten!
	hash = Hash[*array]
	values = hash.values
	value_total = values.inject{|sum,x| sum + x}
	final_array.push(value_total)
	final_array.push(hash.keys.length)
	final_array.push(hash.keys)
	final_array.flatten!
end

aggregate2.map!{|x| final_total(x)}
   aggregate2.map!{|x| x.join(' ')}
   aggregate2.each {|x| print "#{x}" + "\n" }

