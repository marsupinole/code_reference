#methods for both query formats(i.e public methods)

def pythag_theorem(array)
  query_array_with_score = [array[0], array[1], (Math.sqrt(array[2] * array[2] + array[3] * array[3]))]
  distance = query_array_with_score[2]
  distance
end

def crazy_function_question(array)
  array.group_by(&:first).values.sort.map!(&:reverse).flatten(1)
end

def mix_query_array(array)
  array.map! {|w,x,y,z| [w, x.to_i, y.to_i, z.to_i]}
end

def create_distance_scores(array)
  question_array_split = []
  array.each {|x| question_array_split.push(x.split(' '))}
  
  y = 0
  while y < question_array_split.length
    question_array_split[y].map!(&:to_i)
    y += 1
  end
  question_array_split.each {|n| n.slice!(0..1)}

  z = 0
      while z < question_array_split.length
       question_array_split[z].map! {|x| get_single_score(x)}
      z += 1
    end
      question_array_split #=> your distance SCORES
end

def shift_topics(array)
  array.each(&:shift) 
end

def map_distance_coordinates(array)
  array.map! {|x,y| [Math.sqrt(x*x + y*y)]}
end

def slice_questions(array) 
  array.each {|n| n.slice!(0..1)}
end

def combine_distances_and_hash(array)
  y = 0
  while y < array.length
    array[y].map!(&:to_i)
    y += 1
  end
  integer_array = array
  integer_array.map! {|x,y,z| [x, Math.sqrt(y*y + z*z)]}

  flatten_array = integer_array.flatten!
    pancake = Hash[*flatten_array]
    pancake
end

def topic_and_Q_arrays_to_i(array)
  y = 0
  while y < array.length
    array[y].map!(&:to_i)
    y += 1
  end
  array
end

def remake_integers(array)
  split_array = []
  array.each {|x| split_array.push(x.split(' '))}
  integer = topic_and_Q_arrays_to_i(split_array)
  integer
end

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

def mix_query_array(array)
  array.map! {|w,x,y,z| [w, x.to_i, y.to_i, z.to_i]}
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

#mapped coordinates and distance scores don't make it through the loop
def route_query_array(query_array_mixed, mapped_coordinates, topic_score_map, distance_scores)
  i = 0
  while i < query_array_mixed.length
    if query_array_mixed[i][0] == "t"
      query_is_topic_format(query_array_mixed[i], mapped_coordinates, topic_score_map)
    else
      query_is_question_format(query_array_mixed[i], distance_scores)
    end
    i += 1
  end
end
#/publics

def query_is_topic_format(query_array_mixed, mapped_coordinates, topic_score_map)

def sift_Ids(array)
    array.map! {|x| x[1]}
end

def insert_query_scores(coordinants, array) 
      mike = pythag_theorem(array)
      z = 0
      while z < coordinants.length
        coordinants[z].map! {|x| (mike - x).abs }
        z += 1
      end
    coordinants
end

  scores = insert_query_scores(mapped_coordinates, query_array_mixed)

  indexed_scores = add_index_to_each_elem(scores)
  
  final = crazy_function_question(indexed_scores)

  indexes = sift_Ids(final)

  mapped_coordinates.map!(&:shift)
  mapped_coordinates.map! {|x| Array(x)}

  if indexes.length > query_array_mixed[1]
    indexes.slice!(query_array_mixed[1])
    indexes.map! {|x| x.to_i}
    indexes.each {|x| print "#{x}" + ' ' }
    print "\n"
  else
    indexes.map! {|x| x.to_i}
    indexes.each {|x| print "#{x}" + ' ' }
    print "\n"
  end
end

def query_is_question_format(query_array_mixed, distance_scores)

def remove_singulars(array)
  array.delete_if {|x| x.length == 1 }
end

def map_final(array)
  array.map! {|x| x[1]}
end

def insert_query_scores(coordinates, array)  
      mike = pythag_theorem(array)
      coordinates2 = coordinates.dup
      z = 0
      while z < coordinates2.length
        coordinates2[z].map! {|x| (mike - x).abs }
        z += 1
      end
    coordinates2
end

    def retain_lowest_score(array)
        array.each {|x| x.sort!}
        array.map! {|x| x.slice(0)}
        array.map! {|x| Array(x) }
        array
    end
  
    query_minus_distance = insert_query_scores(distance_scores, query_array_mixed)
    
    lowest_score = retain_lowest_score(query_minus_distance)
    
    rank = add_index_to_each_elem(lowest_score) 
    
    rank_sans_empty = remove_singulars(rank)
    
    final = crazy_function_question(rank_sans_empty)

    indexes = map_final(final)

    if indexes.length > query_array_mixed[1]
      indexes.slice!(query_array_mixed[1])
      indexes.map! {|x| x.to_i}
      indexes.each {|x| print "#{x}" + ' ' }
      print "\n"
    else
      indexes.map! {|x| x.to_i}
      indexes.each {|x| print "#{x}" + ' ' }
      print "\n"
    end

    distance_scores = nil
    distance_scores = create_distance_scores($remove_params_topics2)
    $remove_params_topics = nil
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
$remove_params_topics2 = remove_params_topics

topic_array_split = []
topic_array.each {|x| topic_array_split.push(x.split(' '))}

query_array_split = []
query_array.each {|x| query_array_split.push(x.split(' '))}

topic_integer_array = topic_and_Q_arrays_to_i(topic_array_split) #=> [[0, 0, 0], [1, 1, 1], [2, 2, 2]]
remove_indexes = shift_topics(topic_integer_array) #=> [[0, 0], [1, 1], [2, 2]]
mapped_coordinates = map_distance_coordinates(remove_indexes) #=> [[0.0], [1.4142135623730951], [2.8284271247461903]]
topic_integer_array2 = remake_integers(topic_array) #=> silly, [[0, 0, 0], [1, 1, 1], [2, 2, 2]]
topic_score_map = combine_distances_and_hash(topic_integer_array2) #=>{0=>0.0, 1=>1.4142135623730951, 2=>2.8284271247461903}
$global_topic_score = topic_score_map

distance_scores = create_distance_scores(remove_params_topics)

query_array_mixed = mix_query_array(query_array_split) #=> [["t", 2, 0, 0], ["q", 5, 100, 100]]
route_query_array(query_array_mixed, mapped_coordinates, topic_score_map, distance_scores)
#print remove_indexes