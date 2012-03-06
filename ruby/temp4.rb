mike = [[0, 3, 4], [1, 20, 21], [2, 2, 2]]

def pythag_theorem(a, b)
	c = (a * a) + (b * b)
	result = Math.sqrt(c)
	result
end

def what(array)
t = 0
while t < array.length
array[t].map! {|x| pythag_theorem(x[0], x[1])}
	t += 1
end
array
end

print what(mike)

