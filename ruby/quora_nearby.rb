# 3 6 2

# 0 0.0 0.0
# 1 1.0 1.0
# 2 2.0 2.0

# 0 1 0
# 1 2 0 1
# 2 3 0 1 2
# 3 0
# 4 0
# 5 2 1 2

# t 2 0.0 0.0
# q 5 100.0 100.0

stdin_input = ["3 6 2", "0 0.0 0.0", "1 1.0 1.0", "2 2.0 2.0", "0 1 0", "1 2 0 1", "2 3 0 1 2", "3 0", "4 0", "5 2 1 2", "t 2 0.0 0.0", "q 5 100.0 100.0"]

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
w = 0
topic_array_split = []
while w < topic_array.length
	topic_array_split.push(topic_array[w].split(' '))
	w += 1
end

p = 0
question_array_split = []
while p < remove_params_topics.length
	question_array_split.push(remove_params_topics[p].split(' '))
	p += 1
end

query_array_split = []
query_array.each {|x| query_array_split.push(x.split(' '))}
#/arrayification

#hash map lookup
u = 0
topic_distance_hash = Hash.new
while u < topic_array.length
	topic_distance_hash["#{topic_array_split[u][0]}"] = [topic_array_split[u][1].to_i]
	u += 1
end 


def map_question_to_topicId(int, local_topic_array)
	q = 0
	while q < local_topic_array.length
		if local_topic_array[q][1].to_i == int
			topic_distance_value = local_topic_array[q][1].to_i
			break
		  end
		q += 1
     end
  topic_distance_value
end

def match_question_to_topic(arry)
g = 0
  while g < arry.length
    arry[g].shift(2)
    g += 1
  end
  arry
end

r = 0
question_distance_hash = Hash.new
while r < question_array.length
    id_to_question = "#{question_array_split[r][1]}"  #possible values 1 2 3 0 0 2
  question_distance_hash[id_to_question] = map_question_to_topicId(id_to_question.to_i, topic_array_split)
  r += 1
end 
$mike = question_distance_hash
question_distance_value = match_question_to_topic(question_array_split)

def topicId_to_distance(l)
	#print $mike[l]
end


def convert_to_topic_distance(array_val)
    array_val.map! {|m| topicId_to_distance(m)}
end

question_distance_value.each {|x| convert_to_topic_distance(x)}

print query_array

#take topic_array_split, shift off the zeroth integer, and make Hash with 
#question distance needs topic keys 
#get one array for id and add to another array for score, and then make hash

#puts topic_array_split.length
#print question_distance_hash["2"]
