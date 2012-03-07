question_array_split = [["0", "1", "0"], ["1", "2", "0", "1"], ["2", "3", "0", "1", "2"], ["3", "0"], ["4", "0"], ["5", "2", "1", "2"]]
question_distance_value = [["0"], ["0", "1"], ["0", "1", "2"], [], [], ["1", "2"]]
question_distance_converted = [["0.0"], ["0.0", "1.0"], ["0.0", "1.0", "2.0"], [], [], ["1.0", "2.0"]]
question_integer_array = [[0, 1, 0], [1, 2, 0, 1], [2, 3, 0, 1, 2], [3, 0], [4, 0], [5, 2, 1, 2]]

def add_index_to_each_elem(array)
	y = 0 
    while y < array.length
    mike = array[y].push(y)
    y += 1
end
array.reverse!
end

def reverse(array)
	array.collect! {|x| x.reverse}
end

pare_q_array = question_integer_array.each {|n| n.slice!(0..1)}
print pare_q_array
#remove_element_from_a(question_integer_array)
#Each elem in stin is routed by eitther 't' or 'q' and piped into a huge function, the return is piped to standard out

#make hash with question distance scores, reverse the hash and then push the query score, then sort the keys 

#flatten, add the 100, sort it, remove excess based on second column, and map to topic id's

#1.00 1.00 means right triangle so a^2 + b^2 = c^2.  They WILL test you on decimals.  Just change the topic scores and remap

#Your doing it top down, it needs to be bottom up i.e. take the query values first

#checkout this for moving question value back to topic val? h.invert   #=> {0=>"a", 100=>"m", 200=>"d", 300=>"y"}

#place query score into array of scores, sort, and reverse map back to id's