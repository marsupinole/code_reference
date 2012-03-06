query_array = ["t 2 0.0 0.0", "q 5 100.0 100.0"]
query_array_split = [["t", "2", "0.0", "0.0"], ["q", "5", "100.0", "100.0"]]

def pythag_theorem(a, b)
	c = (a * a) + (b * b)
	result = Math.sqrt(c)
	result
end

def find_topic_score(array)
	array.each do |x|
		num_of_scores_to_compare = x[1]
		map_score_to_Id(pythag_theorem(x[2], x[3]), num_of_scores_to_compare)#=> pipe thes to stdout then newline
	end
end

def find_topic_question_score(array)
	array.each do |x|
		qty_of_scores_to_compare = x[1]
		map_score_to_topics(pythag_theorem(x[2], x[3]), qty_of_scores_to_compare)#=> pipe thes to stdout then newline
	end
end

def split_question_type(array) #=> the main bottom function
	array.each do |x|
		if x[0] == "t"
			find_topic_score(x)
		elsif x[0] == "q"
			find_topic_question_score(x)
		end
	end
end

print split_question_type(query_array_split)



