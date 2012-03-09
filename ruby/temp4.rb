array = [[9, 2, 0, 0], [4, 1, 2, 2], [7, 1, 5, 5], [6, 1, 3, 1]]
comments = [[0, 0, 0], [1, 1, 1], [2, 2, 2]] 
u = 0
big_array = []
while u < array.length
  big_array.push(comments.dup)
  u += 1
end

def shift_comments(mike)
	mike.each {|x| x.shift} 
end

def map_distance_coordinants(alan)
	array2 = alan.map {|x,y| [Math.sqrt(x*x + y*y)]}
	array2
end

def input_is_comment_format(laj)

  distance_coordinants = shift_comments(laj)

  mapped_coordinanats = map_distance_coordinants(distance_coordinants)

  print mapped_coordinanats
   #=>[[0, 0], [1, 1], [2, 2]]
  #comments = [[0, 0, 0], [1, 1, 1], [2, 2, 2]] 
end

i = 0
while i < array.length
	input_is_comment_format(big_array[i])
  #array[i].map {|x| input_is_comment_format(big_array[i])}
i += 1
end