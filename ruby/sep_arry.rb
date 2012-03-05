def separate_arrays(arry)
  	arry_len = arry.length
  	arry2 = []
    #y = 0
    arry.take_while do 
      |y| y[0][1] == y[0+1][1]         
      
    end
    
end

a = [["a","b"], ["a", "c"], ["a", "o"], ["d", "c"], ["c", "n"]]

print separate_arrays(a)

#a = [["mike","b"], ["mike", "c"], ["ryan", "o"], ["tim", "c"], ["ryan", "n"]]
