r = 0
question_distance_hash = Hash.new
while r < question_array.length
    id_to_question = "#{question_array_split[r][1]}"  #possible values 1 2 3 0 0 2
  question_distance_hash[id_to_question] = map_question_to_topicId(id_to_question.to_i, topic_array_split)
  r += 1
end 