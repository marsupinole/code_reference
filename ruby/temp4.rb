mike = [[0, 3, 4], [1, 20, 21], [2, 100, 100]]

query_array_split = [["t", "2", "0.0", "0.0"], ["q", "5", "100.0", "100.0"], ["q", "3", "4.0", "0.0"], ["t", "7", "4.0", "0.0"]]

def query_is_topic_format(array)
	puts array[1].to_i
end

def query_is_question_format(array)
	puts array[2].to_i
end

def route_query_array(array)
	i = 0
	while i < array.length
		if array[i][0] == "t"
			query_is_topic_format(array[i])
		else
			query_is_question_format(array[i])
		end
		i += 1
	end
end


route_query_array(query_array_split)
