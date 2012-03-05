
a = [["a","b"], ["d", "c"], ["a", "o"], ["d", "g"], ["c", "a"]]

b = a.group_by(&:first).values.map {|e| e.length > 1 ? e : e.flatten}

print b[2]


