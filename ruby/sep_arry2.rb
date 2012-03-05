def separate_arrays(arry)
  	arry2 = []
  	arry3 = []
  	big_arry = []
    y = 0
    while y < arry.length 
      arry2.push(arry[y][0])
      arry3.push(arry[y][1])         
      y += 1
    end
    first_ladder = arry2.inject(Hash.new(0)) {|hash, val| hash[val] += 1; hash}.entries.max_by {|entry| entry.last}
    front = arry.slice!(0..(first_ladder[1] - 1))
    big_arry.push(front)
    big_arry[0]

end

a = [["a","b"], ["a", "c"], ["a", "o"], ["d", "c"], ["c", "n"]]

print separate_arrays(a)

def letter_frequency(c)
	d = Hash.new(0)

# iterate over the array, counting duplicate entries
a.each do |v|
  b[v] += 1
end

b.each do |k, v|
  puts "#{k} appears #{v} times"
end