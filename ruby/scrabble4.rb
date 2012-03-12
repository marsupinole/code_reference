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

def reduce_even_arrays(array)
    array
end

def flatten_and_sum(array)
    print array
end

array = ["DUCK", "RUBE", "RUBY", "RUCK", "RUSE", "RUSK", "SAME"]

def shuffle_and_sum(array)
  array.sort!
  first = array[0]
  word_steps = WordSteps.load_from_file(array)
  chains_array = []
  i = 0
  while i < array.length
    chain = word_steps.build_word_chain(first, array[i])
    if chain
      chains_array.push(chain) #=>DUCKRUCKRUSKRUSERUBEDUCKRUCKRUSKRUSERUBERUBYDUCKRUCKDUCKRUCKRUSKRUSEDUCKRUCKRUSK
    end
    i += 1
  end

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
 print odds_arrays
end

shuffle_and_sum(array)