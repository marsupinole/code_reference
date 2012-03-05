
mike = [["a","b"], ["a", "b"], ["a", "o"], ["b", "a"], ["c", "a"], ["e", "b"], ["e", "x"], ["e", "w"], ["e", "v"]]



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

def ensure_minimum(a)
  a.flatten!
  minimum = a.inject(Hash.new(0)) {|hash, val| hash[val] += 1; hash}.entries.max_by {|entry| entry.last}
  if minimum[1] == 1
  else
  a.slice!(a.index(minimum[0]))
    ensure_minimum(a)
  end
  a
end

bob = ensure_minimum(mike)
print sort_letters(bob)

