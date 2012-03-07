query_array_mixed = ["q", 5, 100, 100]
query_array_mixed2 = [5, 100, 100]
integer_array = [[0.0], [0.0, 1.4142135623730951], [0.0, 1.4142135623730951, 2.8284271247461903], [], [], [1.4142135623730951, 2.8284271247461903]]
	

	query_array_with_score = [array[0], array[1], (Math.sqrt(array[2] * array[2] + array[3] * array[3]))]
	query_score = query_array_with_score[2]
	
#index the array
u = 0
while u < integer_array.length
	integer_array.map! {|x| x.push(u)}
	u += 1
end

#add query score and find closeness
i = 0
while i < integer_array.length
   integer_array[i].map! {|x| (b - x).abs}
   i += 1
 end

#you have to add index the integer array with empty elements before you remove the empty elements - 
    # - remove them with integer_array_hash.delete_if {|x| x.length == 1}
 #keep only the smallest values for each element and then sort 

