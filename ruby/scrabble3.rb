scrabble_hash = {"A" => 1, "E" => 1, "I" => 1, "L" => 1, "N" => 1, "O" => 1, "R" => 1, "S" => 1, "T" => 1, "U" => 1, "D" => 2, "G" => 2, "B" => 3, "C" => 3, "M" => 3, "P" => 3, "F" => 4, "H" => 4, "V" => 4, "W" => 4, "Y" => 4, "K" => 5, "J" => 8, "X" => 8, "Q" => 10, "Z" => 10}
$global_hash = scrabble_hash

class WordSteps
    def initialize
        @steps = Hash.new { |h, k| h[k] = [] }
        @words = {}
    end

    def each_word(&block)
        @words.each_key(&block)
    end

    def add_word(word)
        sym = word.to_sym
        wdup = word.dup
        for i in 0...word.length
            wdup[i] = 0
            @steps[wdup] << sym
            wdup[i] = word[i]
        end
        @words[word] = sym 
    end

    def each_possible_step(word)
        wdup = word.dup
        for i in 0...word.length
            wdup[i] = 0
            if @steps.has_key?(wdup)
                @steps[wdup].each { |step| yield step }
            end
            wdup[i] = word[i]
        end
        if @words.has_key?(tmp = word[0..-2])
            yield @words[tmp]
        end
        if @steps.has_key?(tmp = word + "\0")
            @steps[tmp].each { |step| yield step }
        end
    end

    def build_word_chain(word1, word2)
        current = [word1.to_sym]
        pre = { current[0] => nil } 
        target = word2.to_sym
        catch(:done) do
            until current.empty?
                next_step = []
                current.each do |csym|
                    each_possible_step(csym.to_s) do |ssym|
                        unless pre.has_key? ssym
                            pre[ssym] = csym
                            throw(:done) if ssym == target
                            next_step << ssym
                        end
                    end
                end
                current = next_step
            end
            return nil 
        end

        chain = [target]
        chain << target while target = pre[target]
        chain.reverse
    end

    def self.load_from_file(file_name)
        word_steps = new
        file_name.each do |line|
            word = line.strip
            word_steps.add_word(word.upcase)
        end
        word_steps
    end
end

def split_words(array2)
  n = 0
  while n < array2.length
    array2[n].map!{|x| x.split(//)}
    n += 1
  end
  array2
end


def get_single_score(elem)
      elem_value = $global_hash[elem]
      elem_value
end


def map_letters_to_scores(array)
    r = 0
    while r < array.length
        array[r].map! {|x| get_single_score(x)}
        r += 1
    end
    array
end

def map_letters_to_scores_shallow(array)
    array.map!{|x| get_single_score(x)}
end

def sum_elements(array)
    i = 0
    while i < array.length
        array[i] = array[i].inject{|sum,x| sum + x}
        i += 1
   end
   array
end

def reduce_even_arrays(array)
    y = 0
    while y < array.length
        array[y].map!(&:to_s)
        y += 1
    end

    i = 0
    while i < array.length
        array[i].map!{|x| x.split(' ')}
        i += 1
    end

    v = 0
    while v < array.length
      split_words(array[v])
      v += 1 
    end
  
  array.map!{|x| x.flatten(1)}#=> [[["D", "U", "C", "K"], ["R", "U", "C", "K"]], [["R", "U", "S", "K"], ["R", "U", "S", "E"]]
  
  w = 0
  while w < array.length
    map_letters_to_scores(array[w]) 
    w += 1
  end #=> [[[2, 1, 3, 5], [1, 1, 3, 5]], [[1, 1, 1, 5], [1, 1, 1, 1], [1, 1, 3, 4]]]
 
 c = 0
 while c < array.length
    sum_elements(array[c])
    c += 1
  end #=> [[11, 10], [8, 4, 9]]

array.map!(&:sort)
array.each{|x| x.shift}
array.map!{|x| x.inject{|sum,x| sum + x}}
array.sort!
array_value = array.pop
array_value

end

def flatten_and_sum(array)
    
    i = 0
    while i < array.length
        array[i].map!(&:to_s)
        i += 1
    end

    i = 0
    while i < array.length
        array[i].map!{|x| x.split(' ')}
        i += 1
    end

   v = 0
    while v < array.length
      split_words(array[v])
      v += 1 
    end
  array.map!{|x| x.flatten!} #=> [["D", "U", "C", "K", "R", "U", "C", "K", "R", "U", "S", "K", "R", "U", "S", "E", "R", "U", "B", "E"], ["D", "U", "C", "K", "R", "U", "C", "K", "R", "U", "S", "K"]] 
  array.map!{|x| map_letters_to_scores_shallow(x)}
  array.map!{|x| x.inject{|sum,x| sum + x}}
  array.sort!
  array_value = array.pop
  array_value

end

def shuffle_and_sum(array)
  array.sort!
  first = array[0]
  #last = array[array.length - 1]
  word_steps = WordSteps.load_from_file(array)
  chains_array = []
  i = 0
  #v = 0
  while i < array.length
    chain = word_steps.build_word_chain(first, array[i])
    if chain
      chains_array.push(chain) #=>DUCKRUCKRUSKRUSERUBEDUCKRUCKRUSKRUSERUBERUBYDUCKRUCKDUCKRUCKRUSKRUSEDUCKRUCKRUSK
    end
    i += 1
  end

  #while v < array.length
    #chain2 = word_steps.build_word_chain(array[v], last)
    #if chain2
      #chains_array.push(chain2) #=>DUCKRUCKRUSKRUSERUBEDUCKRUCKRUSKRUSERUBERUBYDUCKRUCKDUCKRUCKRUSKRUSEDUCKRUCKRUSK
    #end
    #v += 1
  #end

w = 0
even_arrays = []
odds_arrays = []
while w < chains_array.length
    if chains_array[w].length % 2 == 0
        even_arrays.push(chains_array[w])  #=>DUCKRUCKRUSKRUSERUBERUBYDUCKRUCKDUCKRUCKRUSKRUSE
    else
        odds_arrays.push(chains_array[w])  #=>DUCKRUCKRUSKRUSERUBEDUCKRUCKRUSK
    end
    w += 1
end
 values_array = []
 values_array.push(reduce_even_arrays(even_arrays))
 values_array.push(flatten_and_sum(odds_arrays))
 values_array.sort!
 final_value = values_array.pop
 final_value
end


def check_and_sum(array)
  
  elim_dups = prevent_duplicates(array)

  ensure_odd = check_for_even(elim_dups)  #=>[["B", "E", "O"], ["E", "A", "X"], ["P", "X", "I"], ["R", "E", "A"], ["Z", "S", "A"]]
  
  ensure_odd.map! {|x| get_single_score(x)}
  ensure_odd.inject{|sum,x| sum + x}

end

def find_scrabble_score(args)
    number_of_letters = args[0].to_i
    args.shift[0] && args.shift[1]
    word_of_correct_len = []

    i = 0 
      while i < args.length
        if args[i].length == number_of_letters
          word_of_correct_len.push(args[i])
        
        end
        i += 1
    end

  word_of_correct_len.each {|x| x.upcase!}

  if word_of_correct_len.empty?
    return 0
    break
  end
  
  if word_of_correct_len[0].length == 1
    check_and_sum(word_of_correct_len)
  else
    #word_of_correct_len
    shuffle_and_sum(word_of_correct_len)
  end
  end
  
stringify_input = $stdin.map {|x| x.to_s}
strip_newlines = stringify_input.map {|y| y.gsub(/[\n]+/, "")}
print find_scrabble_score(strip_newlines)