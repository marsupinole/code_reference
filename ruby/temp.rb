hen = [["0"], ["0", "1"], ["0", "1", "2"], [], [], ["1", "2"]]

#h = hen.collect {|x| x.to_i + 1 }
u = 0
i = 0
mike = []
while u < hen.length
  while i < hen[u].length
  john = hen[u][i].map! {|x| x.to_i}
  i += 1
end
u += 1
john
end