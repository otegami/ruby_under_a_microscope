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

puts "-" * 50

puts str = "some string value"
puts str.instance_variables
puts str.instance_variable_set("@val", "value one")
puts str.instance_variables
puts str.instance_variable_get("@val")

# 全てのオブジェクトは、クラスポインタとインスタンス変数の配列を含む

# require 'benchmark'

# ITERATIONS = 100000
# GC.disable
# obj = ITERATIONS.times.map { Class.new.new }

# Benchmark.bm do |bench|
#   20.times do |count|
#     bench.report("adding instance variable number #{count + 1}") do
#       ITERATIONS.times do |n|
#         obj[n].instance_variable_set("@var#{count}", "value")
#       end
#     end
#   end
# end

# - RClass
#   - Method table
#   - attribute_names

class Mathematician
  @type = "General"

  def self.type
    @type
  end

  def type
    @type.nil? ? 'nil' : @type
  end
end

puts Mathematician.type
puts Mathematician.new.type

# クラス毎に下記の4つのハッシュテーブルを持つ
# - 属性名テーブル
# - メソッドテーブル
# - クラスインスタンステーブル
# - ハッシュテーブル
# - 定数テーブル
puts ObjectSpace.count_objects[:T_CLASS]
puts class TestClassCount; end
puts ObjectSpace.count_objects[:T_CLASS]
