# puts ObjectSpace.count_objects
# puts module TestClassCount; end
# puts ObjectSpace.count_objects

# - グローバルメソッドキャッシュ
#   - 下記の情報をキャッシュしておく
#     - メソッド探索の開始時
#     - メソッド探索の終点

# インラインメソッドキャッシュ
#   - YARV 命令とメソッド呼び出しを紐づけて記録する?

# module Professor
#   def lectures; end
# end

# class Mathematician
#   attr_accessor :first_name
#   attr_accessor :last_name
#   include Professor
# end

# fermat = Mathematician.new
# fermat.first_name = 'Pierre'
# fermat.last_name = 'de Fermat'
# p fermat.methods.sort

# module Professor
#   def primary_classroom; end
# end
# # p fermat.methods.sort

# module Employee
#   def hire_date; end
# end

# module Professor
#   include Employee
# end

# p fermat.methods.sort

# class MyClass
#   SOME_CONSTANT = 'Some value...'
# end

# class Subclass < MyClass
#   p SOME_CONSTANT
# end

# module Namespace
#   SOME_CONSTANT = 'namespace'
#   class Subclass
#     p SOME_CONSTANT
#   end
# end

class Superclass
  FIND_ME = 'Found in Supserclass'
end

module ParentLexicalScope
  FIND_ME = 'Found in ParentLexicalScope'

  module ChildLexicalScope
    class Subclass < Superclass
      p FIND_ME
    end
  end
end
