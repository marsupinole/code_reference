question_distance_value = [["0"], ["0", "1"], ["0", "1", "2"], [], [], ["1", "2"]]
topic_array_data = [["0", "0.0", "0.0"], ["1", "1.0", "1.0"], ["2", "2.0", "2.0"]]
id_and_distance = [["0", "0.0"], ["1", "1.0"], ["2", "2.0"]]

def find_distance_number(array)
x = 0
distance_score = []
while x < array.length
	distance_score.push(array[x][1])
		x += 1
	end
	distance_score
end


def flatten_and_map_topics(array)
	x = 0
	distance_score = []
	while x < array.length
		array[x].pop
		x += 1
	end
	flatten_array = array.flatten!
    pancake = Hash[*flatten_array]
    pancake
end

topic_score_map = flatten_and_map_topics(topic_array_data)
$global_topic_score = topic_score_map

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
print array #=> 00101212
end

map_topic_score_question(question_distance_value)
