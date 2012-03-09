# Enter your code here. Read input from STDIN. Print output to STDOUT

def add_word_values(arry)
    x = 0
    sum_arry = arry.map {|a| x = x + a }
      if sum_arry.length > 1
      final_sum = sum_arry.pop
      final_sum
  else 
    sum_arry
  end
end

scrabble_hash = {"A" => 1, "E" => 1, "I" => 1, "L" => 1, "N" => 1, "O" => 1, "R" => 1, "S" => 1, "T" => 1, "U" => 1, "D" => 2, "G" => 2, "B" => 3, "C" => 3, "M" => 3, "P" => 3, "F" => 4, "H" => 4, "V" => 4, "W" => 4, "Y" => 4, "K" => 5, "J" => 8, "X" => 8, "Q" => 10, "Z" => 10}
#scrabble_hash.default = 0

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


def prevent_duplicates(a)
  minimum = a.inject(Hash.new(0)) {|hash, val| hash[val] += 1; hash}.entries.max_by {|entry| entry.last}
  if minimum[1] == 1
  else
  a.slice!(a.index(minimum[0]))
    prevent_duplicates(a)
  end
  a
end

def sort_letters(arry)
  b = arry.group_by(&:first).values.map {|e| e.length > 1 ? e : e.flatten}
  x = 0
while x < b.length
  if b[x].length % 2 == 0 
    b.delete_at(b.index(b[x])) 
  end
x += 1
 
end
  b
end


def find_scrabble_score(args)
    number_of_letters = args[0].to_i
    args.shift[0] && args.shift[1]
    word_of_correct_len = []
    word_values = []


    i = 0 
      while i < args.length
        if args[i].length == number_of_letters
          word_of_correct_len.push(args[i])
        
        end
        i += 1
    end

  word_of_correct_len.each {|x| x.upcase!}

  if word_of_correct_len.empty?
    return 0
    break
  end
    sort_words = word_of_correct_len.sort

  str_to_array = sort_words.map! { |x| x.split(//) }
  sorted_letters = sort_letters(prevent_duplicates(str_to_array))
  lead_array = sorted_letters.shift
  
  i = 0
  value_arry = []
  while i < lead_array.length
    if lead_array.length > 1
      letter = lead_array[i].flatten
      value = letter.each {|x| value_arry.push(hash_lookup(x))}
    
    else lead_array == 1
      letter = lead_array[i]
      value = letter.each {|x| value_arry.push(hash_lookup(x))}
    
end
 i += 1
end
 #add_word_values(value_arry)
 print str_to_array
end

#you need to use regular expressions
#flatten is killing you - get rid of it
#move upcase! like you thought you did
#after sorting, you must see if adjacent elements differ by only one letter, if so, you check the other side
#use permutations class iterate based on length of elements


stringify_input = $stdin.map {|x| x.to_s}
strip_newlines = stringify_input.map {|y| y.gsub(/[\n]+/, "")}
print find_scrabble_score(strip_newlines)