array = ["ABA", "BBC", "DDI", "NMI", "ORG"]

class Array
    def swap!(a,b)
         self[a], self[b] = self[b], self[a]
    self
    end
end

scrabble_hash = {"A" => 1, "E" => 1, "I" => 1, "L" => 1, "N" => 1, "O" => 1, "R" => 1, "S" => 1, "T" => 1, "U" => 1, "D" => 2, "G" => 2, "B" => 3, "C" => 3, "M" => 3, "P" => 3, "F" => 4, "H" => 4, "V" => 4, "W" => 4, "Y" => 4, "K" => 5, "J" => 8, "X" => 8, "Q" => 10, "Z" => 10}
$global_hash = scrabble_hash

def get_single_score(elem)
      elem_value = $global_hash[elem]
      elem_value
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
  if b[x].length % 4 == 0 
    b.delete_at(b.index(b[x])) 
  end
x += 1
 
end
  b
end

def shuffle_and_sum(array)
  split_array = array.map! { |x| x.split(//) } #=> ["A", D"], ["A", X"], [..etc
  
  elim_dups = prevent_duplicates(split_array) #=> everything except the 'z, a'

  sort_arry = sort_letters(elim_dups)  #=>[[["A", "H"], ["A", "X"], ["A", "Y"]], ["B", "O"], ["E", "X"], ["P", "I"], ["R", "A"], ["Z", "A"]]
  
  i = 0
  score_array = []
  while i < sort_arry.length
   if sort_arry[i].class == Array
      sort_arry[i].flatten!
      sort_arry[i].map! {|x| get_single_score(x)}
      score_array[i] = sort_arry[i].inject{|sum,x| sum + x}
  else
      sort_arry[i].map! {|x| get_single_score(x)}
      score_array[i] = sort_arry[i].inject{|sum,x| sum + x}
  end
    i += 1
  end
answer = score_array.sort.pop
answer
end

print shuffle_and_sum(array)
  #print john.inject{|sum,x| sum + x }
  #print "\n"
  #print alan[0]