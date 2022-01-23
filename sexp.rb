require 'ripper'
require 'pp'

code = <<STR
10.times do |n|
  puts n
end
STR

puts code
pp Ripper.sexp(code)

# % ruby --dump parsetree sexp.rb                                     (git)-[main]-
###########################################################
## Do NOT use this node dump for any purpose other than  ##
## debug and research.  Compatibility is not guaranteed. ##
###########################################################

# @ NODE_SCOPE (line: 1, location: (1,0)-(11,20))
# +- nd_tbl: :code
# +- nd_args:
# |   (null node)
# +- nd_body:
#     @ NODE_BLOCK (line: 1, location: (1,0)-(11,20))
#     +- nd_head (1):
#     |   @ NODE_FCALL (line: 1, location: (1,0)-(1,16))*
#     |   +- nd_mid: :require
#     |   +- nd_args:
#     |       @ NODE_LIST (line: 1, location: (1,8)-(1,16))
#     |       +- nd_alen: 1
#     |       +- nd_head:
#     |       |   @ NODE_STR (line: 1, location: (1,8)-(1,16))
#     |       |   +- nd_lit: "ripper"
#     |       +- nd_next:
#     |           (null node)
#     +- nd_head (2):
#     |   @ NODE_FCALL (line: 2, location: (2,0)-(2,12))*
#     |   +- nd_mid: :require
#     |   +- nd_args:
#     |       @ NODE_LIST (line: 2, location: (2,8)-(2,12))
#     |       +- nd_alen: 1
#     |       +- nd_head:
#     |       |   @ NODE_STR (line: 2, location: (2,8)-(2,12))
#     |       |   +- nd_lit: "pp"
#     |       +- nd_next:
#     |           (null node)
#     +- nd_head (3):
#     |   @ NODE_LASGN (line: 4, location: (4,0)-(4,12))*
#     |   +- nd_vid: :code
#     |   +- nd_value:
#     |       @ NODE_STR (line: 4, location: (4,7)-(4,12))*
#     |       +- nd_lit: "10.times do |n|\n  puts n\nend\n"
#     +- nd_head (4):
#     |   @ NODE_FCALL (line: 10, location: (10,0)-(10,9))*
#     |   +- nd_mid: :puts
#     |   +- nd_args:
#     |       @ NODE_LIST (line: 10, location: (10,5)-(10,9))
#     |       +- nd_alen: 1
#     |       +- nd_head:
#     |       |   @ NODE_LVAR (line: 10, location: (10,5)-(10,9))
#     |       |   +- nd_vid: :code
#     |       +- nd_next:
#     |           (null node)
#     +- nd_head (5):
#         @ NODE_FCALL (line: 11, location: (11,0)-(11,20))*
#         +- nd_mid: :pp
#         +- nd_args:
#             @ NODE_LIST (line: 11, location: (11,3)-(11,20))
#             +- nd_alen: 1
#             +- nd_head:
#             |   @ NODE_CALL (line: 11, location: (11,3)-(11,20))
#             |   +- nd_mid: :sexp
#             |   +- nd_recv:
#             |   |   @ NODE_CONST (line: 11, location: (11,3)-(11,9))
#             |   |   +- nd_vid: :Ripper
#             |   +- nd_args:
#             |       @ NODE_LIST (line: 11, location: (11,15)-(11,19))
#             |       +- nd_alen: 1
#             |       +- nd_head:
#             |       |   @ NODE_LVAR (line: 11, location: (11,15)-(11,19))
#             |       |   +- nd_vid: :code
#             |       +- nd_next:
#             |           (null node)
#             +- nd_next:
#                 (null node)
