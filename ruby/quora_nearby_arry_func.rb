stdin_input = ["3 6 20", "0 200.0 30000.0", "1 500.0 70.0", "2 1009809000.0 100.0", "0 1 0", "1 4 2 0 3 1", "2 3 0 1 2", "3 0", "4 1 0", "5 2 1 2", "t 2 0.0 0.0", "q 5 100.0 100.0"]

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

print topic_array_split
#print question_array_split
#print query_array_split
