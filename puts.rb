require 'ripper'

def separate_by word
  "===" * 10 + word + "===" * 10
end

code = <<STR
  puts 2 + 2
STR

puts code
puts separate_by "AST"
pp Ripper.sexp(code)

puts separate_by "YARV"
puts RubyVM::InstructionSequence.compile(code).disasm

# Ruby の内部では関数とメソッドを区別している
# - メソッド呼び出しは明確なレシーバーを持ち
# - 関数呼び出しは self の現在の値をレシーバとみなす

code = <<STR
  10.times do |n|
    puts n
  end
STR

puts code

puts separate_by "AST"
pp Ripper.sexp(code)

puts separate_by "YARV"
puts RubyVM::InstructionSequence.compile(code).disasm
