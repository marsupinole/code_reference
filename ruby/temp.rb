question_array_split = [["0", "1", "0"], ["1", "2", "0", "1"], ["2", "3", "0", "1", "2"], ["3", "0"], ["4", "0"], ["5", "2", "1", "2"]]
question_distance_value = [["0"], ["0", "1"], ["0", "1", "2"], [], [], ["1", "2"]]
question_distance_converted = [["0.0"], ["0.0", "1.0"], ["0.0", "1.0", "2.0"], [], [], ["1.0", "2.0"]]


def convert_scores_integers_and_aggragate(array)
z = 0
while z < array.length
array[z].map! {|x| x.to_i}
z += 1
end
print array
end

integer array = convert_scores_integers_and_aggragate(question_distance_value)#=> [[0], [0, 1], [0, 1, 2], [], [], [1, 2]]

def flatten__addQuery_and_sort

#flatten, add the 100, sort it, remove excess based on second column, and map to topic id's

#1.00 1.00 means right triangle so a^2 + b^2 = c^2.  They WILL test you on decimals.  Just change the topic scores and remap

#Your doing it top down, it needs to be bottom up i.e. take the query values first

# checkout this for moving question value back to topic val? h.invert   #=> {0=>"a", 100=>"m", 200=>"d", 300=>"y"}

#place query score into array of scores, sort, and reverse map back to id's