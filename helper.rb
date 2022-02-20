require 'ripper'

def separate_by word
  puts "===" * 10 + word  + "===" * 10
end

def explain code, title
  separate_by title

  separate_by "AST"
  pp Ripper.sexp(code)

  separate_by "YARV"
  puts RubyVM::InstructionSequence.compile(code).disasm
end
