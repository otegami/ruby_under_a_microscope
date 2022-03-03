# 集合関係は メタクラス < 特異クラス

# class Quote; end

# some_quote = Quote.new
# class << some_quote
#   def display
#     puts "The quick brown fox jumped over the lazy dog."
#   end
# end
# some_quote.display

# class Quote
#   def display
#     puts "The quick brown fox jumped over the lazy dog."
#   end
# end

# module AllCaps
#   refine Quote do
#     def display
#       puts "The quick brown fox jumped over the lazy dog.".upcase
#     end

#     Quote.new.display
#   end
#   Quote.new.display
# end

# Quote.new.display
# using AllCaps
# Quote.new.display

# p self
# p Module.nesting

# class Quote
#   p self
#   p Module.nesting

#   class << self
#     p self
#     p Module.nesting

#     def class_method
#       p self
#       p Module.nesting
#     end
#   end
# end
# puts "*" * 50
# Quote.class_method

# a = 2
# b = 3
# str = "puts"
# str += " a"
# str += " +"
# str += " b"
# eval(str)
# str = "puts self"
# eval(str)

# def get_binding
#   a = 2
#   b = 3
#   binding
# end

# eval("puts a+b", get_binding)

# class Quote
#   def initialize
#     @str = "The quick brown fox"
#   end
# end
# str2 = "jumps over the lazy dog."
# obj = Quote.new
# obj.instance_eval do
#   puts "#{@str} #{str2}"
# end

class Quote
  def initialize
    @str = "The quick brown fox"
  end
  # define_method :display do
  #   puts @str
  # end
end

# def create_method_using_a_closure
#   str2 = "jumps over the lazy dog."
#   Quote.send(:define_method, :display) do
#     puts "#{@str} #{str2}"
#   end
# end

def create_method_using_a_closure
  str2 = "jumps over the lazy dog."
  ->{ puts "#{@str} #{str2}" }
end

Quote.send(:define_method, :display, create_method_using_a_closure)
Quote.new.display
