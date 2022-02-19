require 'ripper'

def separate_by word
  puts "===" * 10 + word  + "===" * 10
end

def expalin code, title
  separate_by title

  separate_by "AST"
  pp Ripper.sexp(code)

  separate_by "YARV"
  puts RubyVM::InstructionSequence.compile(code).disasm
end

code = <<STR
  puts 2 + 2
STR

expalin(code, "Simple +")

# Ruby の内部では関数とメソッドを区別している
# - メソッド呼び出しは明確なレシーバーを持ち
# - 関数呼び出しは self の現在の値をレシーバとみなす

code = <<STR
  10.times do |n|
    puts n
  end
STR

expalin(code, "With Block")

code = <<STR
  def add_two(a, b = 5)
    sum = a + B
  end
STR

expalin(code, "With Two Argument")

code = <<STR
  def complex_formula(a, b, *args, c)
    a + b + args.size + c
  end
STR

expalin(code, "Complex Formula")
