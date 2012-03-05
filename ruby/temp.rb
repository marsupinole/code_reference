r = 0
question_distance_hash = Hash.new
while r < remove_params_topics.length
	question_distance_hash["#{question_array_split[r][0]}"] = [question_array_split[r][1].to_i]
	r += 1
end 


# Enter your code here. Read input from STDIN. Print output to STDOUT

def hash_lookup(string_val)
    if string_val == "a" || string_val == "e" || string_val == "i" || string_val == "l" || string_val == "n" || string_val == "o"  || string_val == "r" || string_val == "s" || string_val == "t" || string_val == "u"
      return 1
    elsif string_val == "d" || string_val == "g" 
      return 2
    elsif string_val == "b" || string_val == "c" || string_val == "m" || string_val == "p"
      return 3
     elsif string_val =="f" || string_val == "h" || string_val == "v" || string_val == "w" || string_val == "y"
      return 4
     elsif string_val == "k" 
      return 5
     elsif string_val == "j" || string_val == "x" 
      return 8
     else string_val == "q" || string_val == "z" 
      return 10
   
    end
  end


  def separate_arrays(arry)
  	arry_len = arry.length
  	arry2 = []
    arry.each do |y|         
    break if arry[y][0] != arry[y+1][0]
    arry2.push(arry[y])
    return y
    arry.slice!(0..y)
   end
  if y < arry_len
  	separate_arrays(arry)
  else
  	return
  end
end


def ensure_minimum(array)
minimum = a.inject(Hash.new(0)) {|hash, val| hash[val] += 1; hash}.entries.max_by {|entry| entry.last}
if minimum[1] == 1
	arry.push(a)
else
	a.slice!(a.index_of(minimum[0]))
    ensure_minimum(a)
end

#clean array containing the arrays each or which you'll find the value of with add_word_values()