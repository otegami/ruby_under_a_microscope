require 'benchmark'

# str = "The quick brown fox"
# 10.times do
#   str2 = "jumps over the lazy dog."
#   puts "#{str} #{str2}"
# end

# ITERATIONS = 1000000
# Benchmark.bm do |bench|
#   bench.report("iterating from 1 to 10, one million times") do
#     ITERATIONS.times do
#       sum = 0
#       i = 1
#       while i <= 10
#         sum += i
#         i += 1
#       end
#     end
#   end
# end

# Benchmark.bm do |bench|
#   bench.report("iterating from 1 to 10, one million times") do
#     ITERATIONS.times do
#       sum = 0
#       (1..10).each do |i|
#         sum += i
#       end
#     end
#   end
# end

# while 利用
# user     system      total        real
# iterating from 1 to 10, one million times  0.315073   0.000620   0.315693 (  0.315766)

# block 利用
# user     system      total        real
# iterating from 1 to 10, one million times  0.321806   0.000556   0.322362 (  0.322419)

# 現在の Ruby では差異はかなり少ない、どのような変更が入ったのだろうか？

# def message_function
#   str = "The quick brown fox"
#   lambda do |animal|
#     puts "#{str} jumps over the lazy #{animal}"
#   end
# end

# function_value = message_function
# function_value.call('dog')

# def add_number
#   sum = 0
#   lambda do |number|
#     sum += number
#   end
# end

# function_value = add_number
# function_value.call(3)

# 戻り値が、lambda or proc ならスタックフレームをヒープにコピーする
# 実行時にはコピー先のヒープ内を参照するためクロージャーになっているのかな？

# def message_function
#   str = "The quick brown fox"
#   func = lambda do |animal|
#     puts "#{str} jumps over the lazy #{animal}"
#   end
#   # ここまでで、ヒープ側に全てコピーされ、参照する EP もコピー先に変わる
#   # そのため、str の値を更新してもコピー先を参照するようになっているので値が変化する
#   str = "The sly brown fox"
#   func
# end

# function_value = message_function
# function_value.call('dog')

i = 0
increment_function = lambda do
  i+=1
  puts "incrementing from #{i-1} to #{i}"
end
decrement_function = lambda do
  i-=1
  puts "decrementing from #{i+1} to #{i}"
end
increment_function.call
decrement_function.call
increment_function.call
increment_function.call
decrement_function.call
