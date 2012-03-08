array = ["q", 5, 100, 100]
topics = [["0", "1", "0"], ["1", "2", "0", "1"], ["2", "3", "0", "1", "2"], ["3", "0"], ["4", "0"], ["5", "2", "1", "2"]]
topic_array = [["0", "0.0", "0.0"], ["1", "1.0", "1.0"], ["2", "2.0", "2.0"]]

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
  query_array_with_score = [array[0], (Math.sqrt(array[1] * array[1] + array[2] * array[2]))]
  distance = query_array_with_score[1]
  distance
end

def insert_query_scores(array)
  array_copy = array
      mike = pythag_theorem(array)
      z = 0
      while z < array_copy.length
        array_copy[z].map! {|x| (mike - x).abs }
        z += 1
      end
    array_copy
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


def query_is_question_format(array, questions, question_topics)
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

	  pare_q_array = questions.each {|n| n.slice!(0..1)}

    topic_score_map = combine_distances_and_hash(question_topics)
    
    $global_topic_score = topic_score_map

    distance_scores = map_topic_score_question(pare_q_array)

    query_minus_distance = insert_query_scores(distance_scores)
    
    lowest_score = retain_lowest_score(query_minus_distance)
    
    rank = add_index_to_each_elem(lowest_score) 
    
    rank_sans_empty = rank.delete_if {|x| x.length == 1 }
    
    final = rank_sans_empty.group_by(&:first).values.sort.map!(&:reverse).flatten(1)
    indexes = final.map! {|x| x[1]}

    if indexes.length > stub_array[1]
      indexes.slice!(stub_array[1])
      print indexes
    else
      print indexes
    end
    #print "\n"
    #print "mike"
end

print query_is_question_format(array, topics, topic_array)