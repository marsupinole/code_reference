mike = [[0, 3, 4], [1, 20, 21], [2, 100, 100]]

query_array_split = [["t", "2", "0.0", "0.0"], ["q", "5", "100.0", "100.0"]]

def pythag_theorem(array)
array.map! {|x,y,z| [x, Math.sqrt((y*y) + (z*z))]}
end

def query_array_mixed(array)
array.map! {|w,x,y,z| [w, x.to_i, y.to_i, z.to_i]}
end

print pythag_theorem(mike)

