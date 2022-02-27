require 'benchmark'

21.times do |exponent|
  target_key = nil

  size = 2 ** exponent
  hash = {}
  (1..size).each do |n|
    index = rand
    target_key = index if n > size/2 && target_key.nil?
    hash[index] = rand
  end

  GC.disable

  Benchmark.bm do |bench|
    bench.report("retrieving an element from a hash with #{size} elements 10000 times") do
      10000.times do
        val = hash[target_key]
      end
    end
  end

  GC.disable 
end

# ハッシュテーブルの密度を常に一定に保つように、Ruby 側で制御する
# 普段は、定数で密度が 5 以下になるようになっている
100.times do |size|
  hashes = []
  10000.times do
    hash = {}
    (1..size).each do
      hash[rand] = rand
    end
    hashes << hash
  end

  GC.disable

  Benchmark.bm do |bench|
    bench.report("adding element number #{size + 1}") do
      10000.times do |n|
        hashes[n][size] = rand
      end
    end
  end

  GC.enable
end

# ハッシュ関数には素数を利用して計算を行なっている
# 'abc'.hash => 2577755198929737024
# irb を再起動、起動時ごとに利用される seed 値は変更される
# 'abc'.hash => -4013029504646958266

# メモ
# 要素が 6 以下の場合は、ハッシュ関数を用意たバケットを利用せずに配列を利用する
