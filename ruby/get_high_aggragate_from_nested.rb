question_array_split = [["0", "1", "0"], ["1", "2", "0", "1"], ["2", "3", "0", "1", "2"], ["3", "0"], ["4", "0"], ["5", "2", "1", "2"]]
question_distance_value = [["0"], ["0", "1"], ["0", "1", "2"], [], [], ["1", "2"]]
question_distance_converted = [["0.0"], ["0.0", "1.0"], ["0.0", "1.0", "2.0"], [], [], ["1.0", "2.0"]]

#topic_amount = []
#question_array_split.each {|x| topic_amount.push(x[1])}

#puts topic_amount #=> 123002
def convert_scores_integers_and_aggragate(array)
z = 0
while z < array.length
array[z].map! {|x| x.to_i}
z += 1
end
print array.map! {|y| y.inject(0, &:+)}
#array.map! {|i|  }
end

#def get_low_score

convert_scores_integers_and_aggragate(question_distance_value)