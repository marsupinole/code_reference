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

def quora_feed_optimizer(meta, story, reload)
    reload.flatten!
	reload_min_time = reload[0] - 10
	print story.take_while {|x| x[0] > reload_min_time and x[0] < reload[0]} #=> [[11, 50, 30]]
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