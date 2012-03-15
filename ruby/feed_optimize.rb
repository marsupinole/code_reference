#make two arrays, for each R, find the S's in that time range, add the scores, use permutation 
#script you found and find the maximum score that fits the browser height

#9 10 100
#S 11 50 30
#R 12
#S 13 40 20
#S 14 45 40
#R 15
#R 16
#S 18 45 20
#R 21
#R 22

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
  array.each{|x| browser_height_array.push(x[2])}
  upper_bound = browser_height_array.inject{|sum,x| sum + x}
  inside_bound = trim_bound(array, upper_bound)
  inside_bound
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
    story_array.map!{|x| x.push(x[1].to_f / x[2].to_f)} #=> [[11, 50, 30, 1, 1.6666666666666667], [13, 40, 20, 2, 2.0], [14, 45, 40, 3, 1.125], [18, 45, 20, 4, 2.25]]
    
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

    j = 0
    while j < aggregate2.length
    	aggregate2[j].map!{|x| x.reverse}
    	aggregate2[j].sort!
    	j += 1
    end

    #print aggregate2[3] #=> [[[11, 50, 30, 1, 1.6666666666666667]], [[11, 50, 30, 1, 1.6666666666666667], [13, 40, 20, 2, 2.0], [14, 45, 40, 3, 1.125]], [[11, 50, 30, 1, 1.6666666666666667], [13, 40, 20, 2, 2.0], [14, 45, 40, 3, 1.125]], [], []]
    $browser_height = meta_array[2]

    aggregate2.map!{|x| test_upper_bound(x)}
    print aggregate2.length
    scores = []


    #story_arrayInTime = story_array.take_while {|x| x[0] > reload_min_time and x[0] < reload_array[0]} #=> [[11, 50, 30]]
	#print meta_array
	#shift out the time for this set, index the array, divide scores by browser height - the bigger the better
	# sort and reverse based on this new meta score until browser limit is reached 
end



stdin_input = ["9 10 100", "S 11 50 30", "R 12", "S 13 40 20", "S 14 45 40", "R 15", "R 16", "S 18 45 20", "R 21", "R 22"]

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
