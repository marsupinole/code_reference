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

question_array_split #all your question data
[["0", "1", "0"], ["1", "2", "0", "1"], ["2", "3", "0", "1", "2"], ["3", "0"], ["4", "0"], ["5", "2", "1", "2"]]
question_distance_value #the topic ID's
[["0"], ["0", "1"], ["0", "1", "2"], [], [], ["1", "2"]]
question_topic_quantity


topic_array_data #all your topic data
[["0", "0.0", "0.0"], ["1", "1.0", "1.0"], ["2", "2.0", "2.0"]]
distance_score  #change this with py theorum
["0.0", "1.0", "2.0"]
id_and_distance  #change this after changing above, then map to Id's
[["0", "0.0"], ["1", "1.0"], ["2", "2.0"]]

query_array #raw data
["t 2 0.0 0.0", "q 5 100.0 100.0"]
query_array_split #all your query data 
[["t", "2", "0.0", "0.0"], ["q", "5", "100.0", "100.0"]]
query_array_mixed #combine this with query_array_split
[["t", 2, 0, 0], ["q", 5, 100, 100]]

#If query_array_split[0] == "q"
#question_array_split.pop[1] and [2], convert to integer, map to topic_distance_scores, add in query values 
#  -drop all but lowest result, add index(should be last elem), sort, output based on query_array_split[1] 
#	-OR result.length if query_array_split[1] > result.length 
