question_distance_value = [["0"], ["0", "1"], ["0", "1", "2"], [], [], ["1", "2"]]
topic_array_data = [["0", "0.0", "0.0"], ["1", "1.0", "1.0"], ["2", "2.0", "2.0"]]
id_and_distance = [["0", "0.0"], ["1", "1.0"], ["2", "2.0"]]


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

topic_score_map = combine_distances_and_hash(topic_array_data)
$global_topic_score = topic_score_map

def get_single_score(elem)
    elem_value = $global_topic_score[elem]
    elem_value
end

def map_topic_score_question(array)
	i = 0
	while i < array.length
		array[i].map! {|m| m.to_i}
		i += 1
	end
	integer_array = array
  z = 0
  while z < integer_array.length
    integer_array[z].map! {|x| get_single_score(x)}
    z += 1
  end
  print integer_array #=> 00101212
end

map_topic_score_question(question_distance_value)
