require '../helper'

code = <<STR
  def display_string
    str = "Local Access."
    puts str
  end
STR

explain(code, "Local Access")

code = <<STR
  def display_string
    str = "Dynamic access."
    10.times do
      puts str
    end
  end
STR

explain(code, "Dynamic access")

code = <<STR
  str = "The quick brown fox jumped over the lazy dog. \n"
  /fox/.match(str)

  def seach(str)
    /dog/.match(str)
    puts "Value of $& inside method: #{$&}"
  end

  search(str)
  puts "Value of $& in the top level scope: #{$&}"
STR

explain(code, "scope")
