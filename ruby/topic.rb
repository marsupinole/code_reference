array = ["t", 2, 0, 0]
topics = [[0, 0, 0], [1, 1, 1], [2, 2, 2]] #topic integer array

def query_is_topic_format(array, topics)

def shift_topics(array)
	array.each(&:shift) #=> [[0, 0], [1, 1], [2, 2]]
end

def crazy_function_topic(array)
	array.group_by(&:first).values.sort.map!(&:reverse).flatten(1)
end

def sift_Ids(array)
    array.map! {|x| x[1]}
end

def map_distance_coordinants(array)
	array.map! {|x,y| [Math.sqrt(x*x + y*y)]}
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

def route_query_array(array, topics, questions, topic_array)
	i = 0
	while i < array.length
		if array[i][0] == "t"
			query_is_topic_format(array[i], topics)
		else
			query_is_question_format(array[i], questions, topic_array)
    end
		i += 1
	end
end

  stub_array = array
  
  distance_coordinants = shift_topics(topics) #=> [[0, 0], [1, 1], [2, 2]]

  mapped_coordinanats = map_distance_coordinants(distance_coordinants) #=> [[0.0], [1.4142135623730951], [2.8284271247461903]]

  scores = insert_query_scores(distance_coordinants, array) #=> cutoff point same a above because it 0.0, 0.0

  indexed_scores = add_index_to_each_elem(scores)
  
  final = crazy_function_topic(indexed_scores)

  indexes = sift_Ids(final)

  if indexes.length > stub_array[1]
    indexes.slice!(stub_array[1])
    print indexes.join
    print "\n"
  else
    print indexes.join
    print "\n"
  end
end

query_is_topic_format(array, topics)