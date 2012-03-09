#methods for both query formats(i.e public methods)
def topic_and_Q_arrays_to_i(array)
  y = 0
  while y < array.length
    array[y].map! {|m| m.to_i}
    y += 1
  end
  array
end

def mix_query_array(array)
  array.map! {|w,x,y,z| [w, x.to_i, y.to_i, z.to_i]}
end

def route_query_array(array, questions, query_topics)
  i = 0
  while i < array.length
    if array[i][0] == "t"
      query_is_topic_format(array[i], query_topics)
      #puts topics
    else
      query_is_question_format(array[i], questions, query_topics)
      #print array[1]
    end
    i += 1
  end
end
#/publics

def query_is_topic_format(array, query_topics)

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
  array2 = array.map {|x,y| [Math.sqrt(x*x + y*y)]}
  array2
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

  stub_array = array
  
  distance_coordinants = shift_topics(query_topics)

  mapped_coordinanats = map_distance_coordinants(distance_coordinants)

  scores = insert_query_scores(distance_coordinants, array)

  indexed_scores = add_index_to_each_elem(scores)
  
  final = crazy_function_topic(indexed_scores)

  indexes = sift_Ids(final)

  if indexes.length > stub_array[1]
    indexes.slice!(stub_array[1])
    indexes.map! {|x| x.to_i}
    indexes.each {|x| print "#{x}" + ' ' }
    print "\n"
  else
    indexes.map! {|x| x.to_i}
    indexes.each {|x| print "#{x}" + ' ' }
    print "\n"
  end
end

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

  pare_q_array = slice_questions(questions)

    topic_score_map = combine_distances_and_hash(question_topics)
    
    $global_topic_score = topic_score_map

    distance_scores = map_topic_score_question(pare_q_array)

    query_minus_distance = insert_query_scores(distance_scores, array)
    
    lowest_score = retain_lowest_score(query_minus_distance)
    
    rank = add_index_to_each_elem(lowest_score) 
    
    rank_sans_empty = remove_singulars(rank)
    
    final = crazy_function_question(rank_sans_empty)

    indexes = map_final(final)

    if indexes.length > stub_array[1]
      indexes.slice!(stub_array[1])
      indexes.map! {|x| x.to_i}
      indexes.each {|x| print "#{x}" + ' ' }
      print "\n"
    else
      indexes.map! {|x| x.to_i}
      indexes.each {|x| print "#{x}" + ' ' }
      print "\n"
    end
end

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

topic_array_split = []
topic_array.each {|x| topic_array_split.push(x.split(' '))}

question_array_split = []
remove_params_topics.each {|x| question_array_split.push(x.split(' '))}

query_array_split = []
query_array.each {|x| query_array_split.push(x.split(' '))}


topic_integer_array = topic_and_Q_arrays_to_i(topic_array_split)
question_integer_array = topic_and_Q_arrays_to_i(question_array_split)
query_array_mixed = mix_query_array(query_array_split) #=> [["t", 2, 0, 0], ["q", 5, 100, 100]]


route_query_array(query_array_mixed, question_integer_array, topic_integer_array)