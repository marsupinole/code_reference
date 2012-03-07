#stdin_input = ["3 6 2", "0 0.0 0.0", "1 1.0 1.0", "2 2.0 2.0", "0 1 0", "1 2 0 1", "2 3 0 1 2", "3 0", "4 0", "5 2 1 2", "t 2 0.0 0.0", "q 5 100.0 100.0"]

stringify_input = $stdin.map {|x| x.to_s}
stdin_input = stringify_input.map {|y| y.gsub(/[\n]+/, "")}

#organize stdin
params = stdin_input[0]
params_arry = params.split(' ')
topic_amount = params_arry[0].to_i
q_amount = params_arry[1].to_i
query_amount = params_arry[2].to_i

topic_array = []
x = 0
while x < (topic_amount + 1)
  topic_array.push(stdin_input[x])
  x += 1
end

topic_array_len = topic_array.length
remove_params = topic_array.slice!(0)

question_array = []
i = 0
while i < (q_amount + topic_amount + 1)
  question_array.push(stdin_input[i])
  i += 1
end

remove_params_topics = question_array.slice!(topic_array_len..question_array.length)
query_array = stdin_input.slice!((topic_array_len + remove_params_topics.length)..-1)

#topic_array is your topic array
#remove_params_topics is your question array
#query_array is your query array 

# convert the three objects to arrays
topic_array_split = []
topic_array.each {|x| topic_array_split.push(x.split(' '))}

question_array_split = []
remove_params_topics.each {|x| question_array_split.push(x.split(' '))}

query_array_split = []
query_array.each {|x| query_array_split.push(x.split(' '))}
#/arrayification

#methods for both query formats(i.e public methods)
def add_index_to_each_elem(array)
	y = 0 
    while y < array.length
    mike = array[y].push(y)
    y += 1
   end
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

topic_integer_array = topic_and_Q_arrays_to_i(topic_array_split)
question_integer_array = topic_and_Q_arrays_to_i(question_array_split)
query_array_mixed = mix_query_array(query_array_split) #=> [["t", 2, 0, 0], ["q", 5, 100, 100]]

def pythag_theorem(array)
	query_array_with_score = [array[0], array[1], (Math.sqrt(array[2] * array[2] + array[3] * array[3]))]
	distance = query_array_with_score[2]
  distance
end

def insert_query_scores(array)
      josh = ["q", 5, 100, 100] #this is passed in as argument in real thing!!!!!
      mike = pythag_theorem(josh)
      z = 0
      while z < array.length
        array[z].map! {|x| (mike - x).abs }
        z += 1
      end
    array
end

def add_index_to_each_elem(array)
      y = 0 
      while y < array.length
        low_score = array[y].push(y)
      y += 1
      end
      array.sort!
    array
end
#/publics

#def query_is_question_format(query_array_mixed)
    
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

	  pare_q_array = question_integer_array.each {|n| n.slice!(0..1)}

    topic_score_map = combine_distances_and_hash(topic_array_split)
    
    $global_topic_score = topic_score_map

    distance_scores = map_topic_score_question(pare_q_array)

    query_minus_distance = insert_query_scores(distance_scores)
    
    lowest_score = retain_lowest_score(query_minus_distance)
    
    rank = add_index_to_each_elem(lowest_score) 
    
    rank_sans_empty = rank.delete_if {|x| x.length == 1 }
    
    #print rank_sans_empty
    final = rank_sans_empty.group_by(&:first).values.reverse.map!(&:reverse).flatten(1)
    print final.map! {|x| x[1]}
    print "\n"
    print "mike"
#group by score, then reverse!, then flatten, then pipe
#o = [[3, 1], [3, 3], [5, 4], [7, 2], [7, 5]]
#make higher numbered id pipe first
#b = o.group_by(&:first).values.reverse.map!(&:reverse).flatten(1) #=> [[3, 3], [3, 1], [7, 5], [7, 2], [5, 4]]






#def query_is_topic_format(query_array_mixed)




