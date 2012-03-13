def reduce_even_arrays(array)
    y = 0
    while y < array.length
        array[y].map!(&:to_s)
        y += 1
    end

    i = 0
    while i < array.length
        array[i].map!{|x| x.split(' ')}
        i += 1
    end

    v = 0
    while v < array.length
      split_words(array[v])
      v += 1 
    end
  
  array.map!{|x| x.flatten(1)}#=> [[["D", "U", "C", "K"], ["R", "U", "C", "K"]], [["R", "U", "S", "K"], ["R", "U", "S", "E"]]
  
  w = 0
  while w < array.length
    map_letters_to_scores(array[w]) 
    w += 1
  end #=> [[[2, 1, 3, 5], [1, 1, 3, 5]], [[1, 1, 1, 5], [1, 1, 1, 1], [1, 1, 3, 4]]]
 
 c = 0
 while c < array.length
    sum_elements(array[c])
    c += 1
  end #=> [[11, 10], [8, 4, 9]]

array.map!(&:sort)
array.each{|x| x.shift}
array.map!{|x| x.inject{|sum,x| sum + x}}
array.sort!
array_value = array.pop
array_value

end
