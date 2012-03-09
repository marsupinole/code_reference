array = ["q", 5, 100, 100]
topics = [[0, 1, 0], [1, 2, 0, 1], [2, 3, 0, 1, 2], [3, 0], [4, 0], [5, 2, 1, 2]]
topic_array = [[0, 0.0, 0.0], [1, 1.0, 1.0], [2, 2.0, 2.0]]

def query_is_question_format(array, questions, question_topics)

def slice_questions(array) 
	array.each {|n| n.slice!(0..1)}
end

def remove_singulars(array)
	array.delete_if {|x| x.length == 1 }
end

def crazy_function_question(array)
	array.group_by(&:first).values.sort.map!(&:reverse).flatten(1)
end

def map_final(array)
	array.map! {|x| x[1]}
end

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

    def get_single_score(elem)
      elem_value = $global_topic_score[elem]
      elem_value
    end

    def map_topic_score_question(array)
	  z = 0
      while z < array.length
       array[z].map! {|x| get_single_score(x)}
      z += 1
    end
      array #=> your distance SCORES
    end

    def retain_lowest_score(array)  #this is ugly!!!!
        array.each {|x| x.sort!}
        array.map! {|x| x.slice(0)}
        array.map! {|x| Array(x) }
        array
    end

	  pare_q_array = slice_questions(questions) #=> [[0], [0, 1], [0, 1, 2], [], [], [1, 2]]

    topic_score_map = combine_distances_and_hash(question_topics) #=> {0=>0.0, 1=>1.4142135623730951, 2=>2.8284271247461903}
    
    $global_topic_score = topic_score_map

    distance_scores = map_topic_score_question(pare_q_array)#=>[[0.0], [0.0, 1.4142135623730951], [0.0, 1.4142135623730951, 2.8284271247461903], [], [], [1.4142135623730951, 2.8284271247461903]]

    query_minus_distance = insert_query_scores(distance_scores, array)
    
    lowest_score = retain_lowest_score(query_minus_distance)
    
    rank = add_index_to_each_elem(lowest_score) 
    
    rank_sans_empty = remove_singulars(rank)
    
    final = crazy_function_question(rank_sans_empty)

    indexes = map_final(final)

    if indexes.length > stub_array[1]
      indexes.slice!(stub_array[1])
      indexes.each {|x| print "#{x}" + ' ' }
      #print indexes
      print "\n"
    else
      indexes.each {|x| print "#{x}" + ' ' }
      #print indexes
      print "\n"
    end
end

query_is_question_format(array, topics, topic_array)