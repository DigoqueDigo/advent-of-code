joltage_sum = 0

while bank = STDIN.gets&.chomp
    joltage = ''
    start_index = 0

    (0...12).reverse_each do |index|
        chunk = bank[start_index...(bank.length - index)]
        char, idx = chunk.chars.each_with_index.max_by { |char, _i| char }
        start_index += idx + 1
        joltage += char
    end

    joltage_sum += joltage.to_i
end

puts "Joltage sum: #{joltage_sum}"