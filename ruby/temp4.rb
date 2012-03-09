array = ["A", "C", "U", "P", "A", "D", "P", "L", "O", "T"] #1 3 1 3 1 2 3 
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

def check_for_even(array)
  if array.length % 2 == 0 
    array.sort!
    array.shift
    array
  else
    array
  end
end

def check_and_sum(array)
  
  elim_dups = prevent_duplicates(array)

  ensure_odd = check_for_even(elim_dups)  #=>[["B", "E", "O"], ["E", "A", "X"], ["P", "X", "I"], ["R", "E", "A"], ["Z", "S", "A"]]
  
  ensure_odd.map! {|x| get_single_score(x)}
  ensure_odd.inject{|sum,x| sum + x}

  
end

print check_and_sum(array)