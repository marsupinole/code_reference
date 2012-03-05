def letter_frequency(c)
  d = Hash.new(0)
  c.each do |v|
    d[v] += 1
  end

d.each do |k, v|
  
end
end

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
    freq = letter_frequency(arry2)
    front = arry.slice!(0..(freq["a"] - 1))

end

a = [["a","b"], ["d", "c"], ["a", "o"], ["d", "c"], ["c", "n"]]

print separate_arrays(a)
