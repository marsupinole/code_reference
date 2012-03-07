mike = [[[3, 3], [3, 2]], [[7, 5], [7, 2]], [[0.0, 1], [0.0, 0]], [[5, 4]]]

y = 0
while y < mike.length
	if mike[y][0][0] == 0.0
		josh = mike[y][0][0]
		mike.unshift(josh)
	end
	y += 1
	print mike
end
#remove_element_from_a(question_integer_array)
#Each elem in stin is routed by eitther 't' or 'q' and piped into a huge function, the return is piped to standard out

#make hash with question distance scores, reverse the hash and then push the query score, then sort the keys 

#flatten, add the 100, sort it, remove excess based on second column, and map to topic id's

#1.00 1.00 means right triangle so a^2 + b^2 = c^2.  They WILL test you on decimals.  Just change the topic scores and remap

#Your doing it top down, it needs to be bottom up i.e. take the query values first

#checkout this for moving question value back to topic val? h.invert   #=> {0=>"a", 100=>"m", 200=>"d", 300=>"y"}

#place query score into array of scores, sort, and reverse map back to id's