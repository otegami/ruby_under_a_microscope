require '../helper'

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
