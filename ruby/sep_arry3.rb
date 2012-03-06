r = 0
question_distance_hash = Hash.new
while r < question_array.length
    id_to_question = "#{question_array_split[r][1]}"  #possible values 1 2 3 0 0 2
  question_distance_hash[id_to_question] = map_question_to_topicId(id_to_question.to_i, topic_array_split)
  r += 1
end 

hen = [["0"], ["0", "1"], ["0", "1", "2"], [], [], ["1", "2"]]

#h = hen.collect {|x| x.to_i + 1 }
u = 0
i = 0
while u < hen.length
  while i < hen[u].length
  hen[u][i].collect! {|x| john = x.to_i}
end
john
end