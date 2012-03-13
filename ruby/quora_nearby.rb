#topic_integer_array = topic_and_Q_arrays_to_i(topic_array_split) #=> [[0, 0, 0], [1, 1, 1], [2, 2, 2]]
#remove_indexes = shift_topics(topic_integer_array) #=> [[0, 0], [1, 1], [2, 2]]
#mapped_coordinates = map_distance_coordinates(remove_indexes) #=> [[0.0], [1.4142135623730951], [2.8284271247461903]]
#topic_integer_array2 = remake_integers(topic_array) #=> this is silly
#topic_score_map = combine_distances_and_hash(topic_integer_array2) #=>{0=>0.0, 1=>1.4142135623730951, 2=>2.8284271247461903}
#$global_topic_score = topic_score_map

array = [["0", "0.0", "0.0"], ["1", "1.0", "1.0"], ["2", "2.0", "2.0"]]

def create_topic_scores(array)
  y = 0
  while y < array.length
    array[y].map!(&:to_i)
    y += 1
  end
  
  array.each(&:shift) 

  array.map! {|x,y| [Math.sqrt(x*x + y*y)]}
  
  array_hash = Hash[ *array.collect { |v| [ v, array.index(v) ] }.flatten ].sort.flatten

  $array = array
  
  $array_hash = Hash[ *array_hash ].invert
end

  create_topic_scores(array)

  print $array
  print "\n"
  print $array_hash