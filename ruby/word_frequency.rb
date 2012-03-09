array = ["my account is locked.", "can i have the account password to my account?", "what's my password?"]

array.map! {|x| x.split(' ')} #make each sentence an element

word_freq = Hash.new(0)

i = 0
while i < array.length
array[i].each {|x| word_freq[x] += 1}
i += 1
end

word_freq.each {|m, x| puts "#{m} appears #{x} times"}  #key value pairs

print word_freq.keys  #an array of key words to mess with
