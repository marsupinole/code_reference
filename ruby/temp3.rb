array = ["AD", "AX", "AY", "BO", "EX", "PI", "RA", "ZA"]

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
  mike = array.map! { |x| x.split(//) } #=> ["A", D"], ["A", X"], [..etc
  
  josh = prevent_duplicates(mike) #=> everything except the 'z, a'

  alan = sort_letters(josh)  #=>[[["A", "H"], ["A", "X"], ["A", "Y"]], ["B", "O"], ["E", "X"], ["P", "I"], ["R", "A"], ["Z", "A"]]
  
  i = 0
  tim = []
  while i < alan.length
   if alan[i].class == Array
      alan[i].flatten!
      alan[i].map! {|x| get_single_score(x)}
      tim[i] = alan[i].inject{|sum,x| sum + x}
  else
  	  alan[i].map! {|x| get_single_score(x)}
      tim[i] = alan[i].inject{|sum,x| sum + x}
  end
    i += 1
  end
answer = tim.sort.pop
answer
end

print find_scores(array)
  #print john.inject{|sum,x| sum + x }
  #print "\n"
  #print alan[0]