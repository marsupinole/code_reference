# Enter your code here. Read input from STDIN. Print output to STDOUT

def add_word_values(arry)
  x = 0
  sum_arry = arry.map {|a| x = x + a }
  final_sum = sum_arry.pop
  return final_sum
end

def hash_lookup(string_val)
    if string_val == "A" || string_val == "E" || string_val == "I" || string_val == "L" || string_val == "N" || string_val == "O"  || string_val == "R" || string_val == "S" || string_val == "T" || string_val == "U"
      return 1
    elsif string_val == "D" || string_val == "G" 
      return 2
    elsif string_val == "B" || string_val == "C" || string_val == "M" || string_val == "P"
      return 3
     elsif string_val =="F" || string_val == "H" || string_val == "V" || string_val == "W" || string_val == "Y"
      return 4
     elsif string_val == "K" 
      return 5
     elsif string_val == "J" || string_val == "X" 
      return 8
     else string_val == "Q" || string_val == "Z" 
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


def find_scrabble_score(args)
    number_of_letters = args[0].to_i
    args.shift[0] && args.shift[1]
    word_of_correct_len = []
    word_values = []

  args.each {|x| x.upcase!}
    i = 0 
      while i < args.length
        if args[i].length == number_of_letters
          word_of_correct_len.push(args[i])
        
        end
        i += 1

end
    sort_words = word_of_correct_len.sort
    slice_words = sort_words.slice(0..2)

  str_to_array = slice_words.map! { |x| x.split(//) }
  
    i = 0
    value_arry = []
  while i < str_to_array.length
  letter = str_to_array[i].flatten
  value = letter.each {|x| value_arry.push(hash_lookup(x))}
  i += 1
end
add_word_values(value_arry)
end

stringify_input = $stdin.map {|x| x.to_s}
strip_newlines = stringify_input.map {|y| y.gsub(/[\n]+/, "")}
print find_scrabble_score(strip_newlines)