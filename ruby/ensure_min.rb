hen = [["0"], ["0", "1"], ["0", "1", "2"], [], [], ["1", "2"]]



def convert(u)
    u.map! {|m| m.to_i + 2}
end

hen.each {|x| convert(x)}

print hen
