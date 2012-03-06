mike = [["0"], ["0", "1"], ["0", "1", "2"], [], [], ["1", "2"]]

josh = {"0" => 3, "1" => 1, "2" => 2, "3" => 1}
$ryan = josh


def convert(y)
	hen = $ryan[y]
	hen
end

z = 0
while z < mike.length
mike[z].map! {|x| convert(x)}
z += 1
end

puts mike
