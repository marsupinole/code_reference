def ensure_minimum(a)
  minimum = a.inject(Hash.new(0)) {|hash, val| hash[val] += 1; hash}.entries.max_by {|entry| entry.last}
  if minimum[1] == 1
  else
	a.slice!(a.index(minimum[0]))
    ensure_minimum(a)
  end
  a
end

arr = [["a","b"], ["c", "n"], ["a", "c"], ["a", "o"], ["d", "c"], ["c", "n"], ["a", "o"]]

print ensure_minimum(arr)