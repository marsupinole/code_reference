topic_array_data = [["0", "0.0", "0.0"], ["1", "1.0", "1.0"], ["2", "2.0", "2.0"]]

def pythag_theorem(a, b)
	c = (a * a) + (b * b)
	result = Math.sqrt(c)
	result
end

def combine_distances_and_hash(array)
	y = 0
	while y < array.length
		array[y].map! {|m| m.to_i}
		y += 1
	end
	integer_array = array
	integer_array.map! do |x|
		pythag_theorem(x[1], x[2])
	end

	flatten_array = integer_array.flatten!
    pancake = Hash[*flatten_array]
    pancake
end

print combine_distances_and_hash(topic_array_data)