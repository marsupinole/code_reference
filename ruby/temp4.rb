mike = [[0, 3, 4], [1, 20, 21], [2, 2, 2]]



def what(array)
array.map {|x,y,z| [x, Math.sqrt(y*y + z*z)]}
end

print what(mike)

