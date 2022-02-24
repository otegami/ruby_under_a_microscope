require_relative '../helper'

code = <<STR
  i = 0
  if i < 10
    puts 'small'
  else
    puts 'large'
  end
  puts 'done'
STR

explain(code, 'if')

code = <<STR
  i = 0
  while i < 10
    puts i
    i += 1
    break
  end
STR

explain(code, 'while with break')

code = <<STR
  10.times do |n|
    puts n
    break
  end
  puts 'continue from here'
STR

explain(code, 'times with break')

code = <<STR
  for i in 0..5
    puts i
  end
STR

explain(code, 'For')

code = <<STR
  (0..5).each do |i|
    puts i
  end
STR

explain(code, 'Each')

code = <<STR
  def display_message
    puts "The quick brown fox jumped over the lazy dog."
  end
  display_message
STR

explain(code, 'Display message')

code = <<STR
  def five_argument_types(a, b = 1, *args, c, &d)
    puts "Standard argument \#{a.inspect}"
    puts "Optional argument \#{b.inspect}"
    puts "Splat argument array \#{args.inspect}"
    puts "Post argument \#{c.inspect}"
    puts "Bloack argument \#{d.inspect}"
  end
  
  five_argument_types(1, 2, 3, 4, 5, 6) do
    puts "block"
  end
STR

explain(code, 'Five argument types')

code = <<STR
  class InstanceVariableTest
    attr_accessor :var
  end

  instance = InstanceVariableTest.new
  instance.var = 1
  instance.var
STR

# 新しいスタックフレームを作成しない
explain(code, 'Atter accessor')

code = <<STR
  class Hash
    def key?(val)
      puts "Looking for key \#{val}"
      false
    end
  end

  def add_two(a: 2, b: 3)
    a+b
  end

  puts add_two(a: 1, b: 1)
STR

# 現在の Ruby は内部で Hash を利用していなさそう
explain(code, 'Keyword argument')
