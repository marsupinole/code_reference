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
        @words[word] = sym # for allow_shorter and each_word
    end

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

    def build_word_chain(word1, word2, shorter = false, longer = false)
        current = [word1.to_sym]
        pre = { current[0] => nil } 
        target = word2.to_sym
        catch(:done) do
            until current.empty?
                next_step = []
                current.each do |csym|
                    each_possible_step(csym.to_s, shorter, longer) do |ssym|
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

    def self.load_from_file(file_name, length_range)
        word_steps = new
        file_name.each do |line|
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

    shorter = word1.length > word2.length
    longer = word1.length < word2.length
    length_range = if longer
        word1.length..word2.length
    else
        word2.length..word1.length
    end

    word_steps = WordSteps.load_from_file(word_of_correct_len, length_range)
    word_steps.add_word(word2) 

    chain = word_steps.build_word_chain(word1, word2, shorter, longer)

    puts chain || "No chain found!"
end

    stringify_input = $stdin.map {|x| x.to_s}
    mike = stringify_input.map {|y| y.gsub(/[\n]+/, "")}
    find_scrabble_score(mike)