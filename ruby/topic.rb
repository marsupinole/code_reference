array = ["t", 2, 0, 0]
topics = [[0, 0, 0], [1, 1, 1], [2, 2, 2]] #topic integer array

def topic_and_Q_arrays_to_i(array)
  y = 0
  while y < array.length
    array[y].map! {|m| m.to_i}
    y += 1
  end
  array
end

def combine_distances_and_hash(array)
  y = 0
  while y < array.length
    array[y].map! {|m| m.to_i}
    y += 1
  end
  integer_array = array
  integer_array.map! {|x,y,z| [x, Math.sqrt(y*y + z*z)]}

  flatten_array = integer_array.flatten!
    pancake = Hash[*flatten_array]
    pancake
end

def mix_query_array(array)
  array.map! {|w,x,y,z| [w, x.to_i, y.to_i, z.to_i]}
end

def pythag_theorem(array)
	query_array_with_score = [array[0], array[1], (Math.sqrt(array[2] * array[2] + array[3] * array[3]))]
	distance = query_array_with_score[2]
    distance
end

def insert_query_scores(coordinants, array) #you have to pipe in array from the top 
      mike = pythag_theorem(array)
      z = 0
      while z < coordinants.length
        coordinants[z].map! {|x| (mike - x).abs }
        z += 1
      end
    coordinants
end

def add_index_to_each_elem(array)
      y = 0 
      while y < array.length
        low_score = array[y].push(y)
      y += 1
      end
      array.sort!  #this makes it seem wrong but it saves resources
    array
end

def query_is_topic_format(array, topics)
  stub_array = array

  distance_coordinants = topics.each(&:shift)  #=> [[0, 0], [1, 1], [2, 2]]

  distance_coordinants.map! {|x,y| [Math.sqrt(x*x + y*y)]}

  scores = insert_query_scores(distance_coordinants, array)

  indexed_scores = add_index_to_each_elem(scores)

  final = indexed_scores.group_by(&:first).values.sort.map!(&:reverse).flatten(1)
  indexes = final.map! {|x| x[1]}

  if indexes.length > stub_array[1]
    indexes.slice!(stub_array[1])
    print indexes
  else
    print indexes
  end
end

print query_is_topic_format(array, topics)