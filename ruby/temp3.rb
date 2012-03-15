array = [[[1.6666666666666667, 1, 30, 50, 11]], [[1.125, 3, 40, 45, 14], [1.6666666666666667, 1, 30, 50, 11], [2.0, 2, 20, 40, 13]], [[1.125, 3, 40, 45, 14], [1.6666666666666667, 1, 30, 50, 11], [2.0, 2, 20, 40, 13]], [[1.6666666666666667, 1, 30, 50, 11], [2.0, 2, 20, 40, 13], [2.25, 4, 20, 45, 18]], [[1.125, 3, 40, 45, 14], [2.0, 2, 20, 40, 13], [2.25, 4, 20, 45, 18]]]

y = 0 
while y < array.length
  array[y].map(&:shift)
  array[y].map(&:pop)
  array[y].map{|x| x.slice!(1)}
  y += 1
end

#print array

#array.map!{|x| x.push(x.length)}

#print array
def final_total(array)
	#hash array
	#final_array.push(values total)
	#final_array.push(keys.length)
	#final_array.push(keys)
end

array.map!{|x| final_total(x)}

#array.map!(&:sort!)


#a.map{|x| x.slice!(1)}