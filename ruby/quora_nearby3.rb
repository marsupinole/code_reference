stdin_input = ["3 6 2", "0 0.0 0.0", "1 1.0 1.0", "2 2.0 2.0", "0 1 0", "1 2 0 1", "2 3 0 1 2", "3 0", "4 0", "5 2 1 2", "6 0", "t 2 0.0 0.0", "q 5 100.0 100.0"]

params = stdin_input[0]
params_arry = params.split(' ')
topic_amount = params_arry[0].to_i
q_amount = params_arry[1].to_i
query_amount = params_arry[2].to_i

topic_array = []
x = 0
while x < (topic_amount + 1)
  topic_array.push(stdin_input[x])
  x += 1
end

print topic_array