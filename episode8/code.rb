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

def message_function
  str = "The quick brown fox"
  lambda do |animal|
    puts "#{str} jumps over the lazy #{animal}"
  end
end

function_value = message_function
function_value.call('dog')
