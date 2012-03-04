a = %w(a b c)
b = a.slice!(-1)
c = a.reverse
d  = []
e = d.push(a) && d.push(b)
f = e.each {|x| x.push(b)}
d.flat_map {|i| i}
