DEFAULT_DICTIONARY = "mike"

# Data structure that efficiently stores words from a dictionary in a way, that
# it is easy to find all words that differ from a given word only at one
# letter (words that could be the next step in a word chain).
# Example: when adding the word "dog", add_word will register "dog" as step for
# "\0og", "d\0g" and "do\0", later each_possible_step("cat") will yield all words
# registered for "\0at", "c\0t" or "ca\0".
class WordSteps
    def initialize
        @steps = Hash.new { |h, k| h[k] = [] }
        @words = {}
    end

    # yields all words (as strings) that were added with add_word
    def each_word(&block)
        @words.each_key(&block)
    end

    # add all steps for word (a string) to the steps
    def add_word(word)
        sym = word.to_sym
        wdup = word.dup
        for i in 0...word.length
            wdup[i] = 0
            @steps[wdup] << sym
            wdup[i] = word[i]
        end
        @words[word] = sym # for allow_shorter and each_word
    end

    # yields each possible next step for word (a string) as symbol, some
    # possible steps might be yielded multiple times
    # if allow_shorter is true, word[0..-2].to_sym will also be yielded if
    # available
    # if allow_longer is true, all words that match /#{word}./ will be yielded
    def each_possible_step(word, allow_shorter = false, allow_longer = false)
        wdup = word.dup
        for i in 0...word.length
            wdup[i] = 0
            if @steps.has_key?(wdup)
                @steps[wdup].each { |step| yield step }
            end
            wdup[i] = word[i]
        end
        if allow_shorter && @words.has_key?(tmp = word[0..-2])
            yield @words[tmp]
        end
        if allow_longer && @steps.has_key?(tmp = word + "\0")
            @steps[tmp].each { |step| yield step }
        end
    end

    # tries to find a word chain between word1 and word2 (strings) using all
    # available steps
    # returns the chain as array of symbols or nil, if no chain is found
    # shorter/longer determines if shorter or longer words are allowed in the
    # chain
    def build_word_chain(word1, word2, shorter = false, longer = false)
        # build chain with simple breadth first search
        current = [word1.to_sym]
        pre = { current[0] => nil } # will contain the predecessors
        target = word2.to_sym
        catch(:done) do
            until current.empty?
                next_step = []
                current.each do |csym|
                    each_possible_step(csym.to_s, shorter, longer) do |ssym|
                        # have we seen this word before?
                        unless pre.has_key? ssym
                            pre[ssym] = csym
                            throw(:done) if ssym == target
                            next_step << ssym
                        end
                    end
                end
                current = next_step
            end
            return nil # no chain found
        end
        # build the chain (in reverse order)
        chain = [target]
        chain << target while target = pre[target]
        chain.reverse
    end

    # builds and returns a WordSteps instance "containing" all words with
    # length in length_range from the file file_name
    def self.load_from_file(file_name, length_range)
        word_steps = new
        file_name.each do |line|
            # only load words with correct length
            if length_range === (word = line.strip).length
                word_steps.add_word(word.downcase)
            end
        end
        word_steps
    end
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

    word1 = word_of_correct_len[0].strip.downcase
    word2 = word_of_correct_len[5].strip.downcase
    dictionary = $stdin

    shorter = word1.length > word2.length
    longer = word1.length < word2.length
    length_range = if longer
        word1.length..word2.length
    else
        word2.length..word1.length
    end

    word_steps = WordSteps.load_from_file(word_of_correct_len, length_range)
    word_steps.add_word(word2) # if it is not in dictionary

    chain = word_steps.build_word_chain(word1, word2, shorter, longer)

    # print result
    puts chain || "No chain found!"
end

    stringify_input = $stdin.map {|x| x.to_s}
    mike = stringify_input.map {|y| y.gsub(/[\n]+/, "")}
    find_scrabble_score(mike)