array = [[9, 2, 0, 0], [4, 1, 2, 2], [7, 1, 5, 5], [6, 1, 3, 1]]
comments = [[0, 0, 0], [1, 1, 1], [2, 2, 2]] 

def input_is_comment_format(array, comments)

def shift_comments(array)
	array.each(&:shift) 
end

def map_distance_coordinants(array)
	array.map! {|x,y| [Math.sqrt(x*x + y*y)]}
end

  distance_coordinants = shift_comments(comments)

  mapped_coordinanats = map_distance_coordinants(distance_coordinants)

  print mapped_coordinanats
  print comments #=>[[0.0], [1.4142135623730951], [2.8284271247461903]]
end

i = 0
while i < array.length
  input_is_comment_format(array[i], comments)
i += 1
end