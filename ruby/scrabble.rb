

scrabble_hash = {"A" => 1, "E" => 1, "I" => 1, "L" => 1, "N" => 1, "O" => 1, "R" => 1, "S" => 1, "T" => 1, "U" => 1, "D" => 2, "G" => 2, "B" => 3, "C" => 3, "M" => 3, "P" => 3, "F" => 4, "H" => 4, "V" => 4, "W" => 4, "Y" => 4, "K" => 5, "J" => 8, "X" => 8, "Q" => 10, "Z" => 10}

def add_word_values(arry)
	x = 0
	sum_arry = arry.map {|a| x = x + a }
	final_sum = sum_arry.pop
	return final_sum
end

def hash_lookup(string_val)
    if string_val == "a" || string_val == "e" || string_val == "i" || string_val == "l" || string_val == "n" || string_val == "o"  || string_val == "r" || string_val == "s" || string_val == "t" || string_val == "u"
      return 1
    elsif string_val == "d" || string_val == "g" 
      return 2
    elsif string_val == "b" || string_val == "c" || string_val == "m" || string_val == "p"
      return 3
     elsif string_val =="f" || string_val == "h" || string_val == "v" || string_val == "w" 
      return 4
     elsif string_val == "k" 
      return 5
     elsif string_val == "j" || string_val == "x" 
      return 8
     else string_val == "q" || string_val == "z" 
      return 10
   
    end
  end


def order_words(arry)
	hash_key = []
	hash_val = []
	hash = Hash.new(0)

	arry.each do |v|
     hash[v] += 1
    end

    hash.each do |elem, num|
      hash_key.push(elem)
      hash_val.push(num)
    end
    hash_key
    hash_val
end


def find_scrabble_score(*args, letters_per_word)
	  word_of_correct_len = []
	  word_values = []

	args.each {|x| x.downcase!}
    i = 0 
      while i < args.length
      	if args[i].length == letters_per_word
      		word_of_correct_len.push(args[i])
      	
      	end
      	i += 1

end
    word_of_correct_len.sort!
    word_of_correct_len.slice!(3..7)

	str_to_array = word_of_correct_len.map! { |x| x.split(//) }
	
    i = 0
    value_arry = []
	while i < str_to_array.length
	letter = str_to_array[i].flatten
	value = letter.each {|x| value_arry.push(hash_lookup(x))}
	i += 1
end
add_word_values(value_arry)
end

puts find_scrabble_score("A", "AD", "APPLE", "AX", "AY", "BAG", "BAT", "BO", "CONCERTO", "EX", "RA", "PI", "ZA", 2)
