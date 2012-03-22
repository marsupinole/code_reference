def arrays_to_i(array)
  y = 0
  while y < array.length
    array[y].map!(&:to_i)
    y += 1
  end
  array
end

def elim_to_large(array, minimum)
	array2 = []
	j = 0
	while j < array.length
		if array[j][0] >= minimum
			array2.push(array[j])
		end
		j += 1
	end
	array2
end

def trim_bound(array, upper_bound)
  if upper_bound <= $browser_height
  	array
  else
  	array.shift
  	test_upper_bound(array)
  end
end

def test_upper_bound(array)
  browser_height_array = []
  array.each{|x| browser_height_array.push(x[1])}
  upper_bound = browser_height_array.inject{|sum,x| sum + x}
  inside_bound = trim_bound(array, upper_bound)
  inside_bound
end

def final_total(array)
	final_array = []
	h = 0
	while h < array.length
		array[h].reverse!
		h += 1
	end
	array.sort!
	array.flatten!
	hash = Hash[*array]
	values = hash.values
	value_total = values.inject{|sum,x| sum + x}
	final_array.push(value_total)
	final_array.push(hash.keys.length)
	final_array.push(hash.keys)
	final_array.flatten!
end

def quora_feed_optimizer(meta_array, story_array, reload_array)
	minimum_times = []
	aggregate_array = []
    reload_array.flatten! #=> [12, 15, 16, 21, 22]
    $reload_quantity = reload_array.length
    
    i = 0
    while i < reload_array.length
    	minimum_times.push(reload_array[i] - 10)
    	i += 1
    end #=> [2, 5, 6, 11, 12]
    
    story_array.map{|x| x.push(story_array.index(x) + 1)} #=> [[11, 50, 30, 1], [13, 40, 20, 2], [14, 45, 40, 3], [18, 45, 20, 4]]
    
    x = 0
    while x < reload_array.length
    	aggregate_array.push(story_array.take_while{|m| m[0] <= reload_array[x]})
    	x += 1
    end
    
    y = 0
    aggregate2 = []
    while y < aggregate_array.length
    	aggregate2.push(elim_to_large(aggregate_array[y], minimum_times[y]))
    	y += 1
    end

    $browser_height = meta_array[2]

    j = 0
    while j < aggregate2.length
    	aggregate2[j].map!(&:reverse)
    	aggregate2[j].map!(&:reverse)
    	aggregate2[j].map(&:shift)
    	aggregate2[j].sort!
    	j += 1
    end

    $browser_height = meta_array[2]

    aggregate2.map!{|x| test_upper_bound(x)}
    
    y = 0 
    while y < aggregate2.length
    aggregate2[y].map{|x| x.slice!(1)}
    y += 1
    end

   aggregate2.map!{|x| final_total(x)}
   aggregate2.map!{|x| x.join(' ')}
   aggregate2.each {|x| print "#{x}" + "\n" }

end

stringify_input = $stdin.map {|x| x.to_s}
stdin_input = stringify_input.map {|y| y.gsub(/[\n]+/, "")}

meta_array = stdin_input[0].split(' ').map!(&:to_i)

stdin_input.shift

stdin_input.map! {|x| x.split(' ')}

story_array = []
reload_array = []
i = 0
while i < stdin_input.length
	if stdin_input[i][0] == "S"
		story_array.push(stdin_input[i])
	else
		reload_array.push(stdin_input[i])
	end
	i += 1
end
   
story_array.each(&:shift) #=> [["11", "50", "30"], ["13", "40", "20"], ["14", "45", "40"], ["18", "45", "20"]]

reload_array.each(&:shift) #=> [["12"], ["15"], ["16"], ["21"], ["22"]]

arrays_to_i(story_array) and arrays_to_i(reload_array)

quora_feed_optimizer(meta_array, story_array, reload_array)
