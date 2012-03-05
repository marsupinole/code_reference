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
#query_array #is your query array 

# convert objects to arrays
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

q = 0
query_array_split = []
while q < query_array.length
	query_array_split.push(query_array[q].split(' '))
	q += 1
end
#/arrayification

#hash map lookup
u = 0
topic_distance_hash = Hash.new
while u < topic_array.length
	topic_distance_hash["#{topic_array_split[u][0]}"] = [topic_array_split[u][1].to_i]
	u += 1
end 

r = 0
question_distance_hash = Hash.new
while r < question_array.length
    mike = question_array_split[r][1]
	question_distance_hash["#{question_array_split[r][1]}"] = [topic_array_split[1]]
	r += 1
end 

topic_amount_per_question = question_array_split

print question_distance_hash.kind_of?(Hash)
#print question_distance_hash["0"]


