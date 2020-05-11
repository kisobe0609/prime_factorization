puts "【素因数分解します】"
puts "整数を入力してください"
input = gets.chomp.to_i
puts "入力値:#{input}"
puts "---------------"

# 素数の配列を作成（2のみ偶数なので別枠で予め配列に追加）
prime_numbers = [2]

# 素数の配列を作成
i = 3
while input >= (i ** 2)
    prime_numbers.each_with_index do |prime_number, j|
        if i % prime_numbers[j] == 0 then
            break
        end
        j += 1
        if j == prime_numbers.length then
            prime_numbers.push(i)
        end
    end
    i += 2
end

# 素因数分解実行
powers = []

prime_numbers.each_with_index do |prime_number, k|
    powers.push(0)
    power = 1
    while (input % (prime_number ** power)) == 0
        powers[k] = power
        power += 1
    end
end

# 素因数の数をカウント
nonzero = 0
for l in 0...powers.length
    if powers[l] != 0
        nonzero += 1
    end
end

# 出力
puts "結果："
puts "#{input} ="

n = 0
prime_numbers.each_with_index do |prime_number, m|
    if powers[m] != 0 then
        print "#{prime_numbers[m]} ^ #{powers[m]}"
        if (n + 1) != nonzero then
            print " * "
            n += 1
        end
    end
end

puts ""
