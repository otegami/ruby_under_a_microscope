require_relative '../helper'

class Mathematician
  attr_accessor :first_name
  attr_accessor :last_name
end

puts math = Mathematician.new
# -> #<Mathematician:0x000000013a22dfb8>
# 16 進数の部分はオブジェクトへの Value ポインタを示す
puts math.last_name = 'otegami'
puts math.inspect
