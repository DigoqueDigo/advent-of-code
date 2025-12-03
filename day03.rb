
# PART I
# while bank = STDIN.gets&.chomp
#     first = '0'
#     second = '0'

#     bank[0...-1].each_char do |element|
#         if element > first
#             first = element
#             second = '0'
#         elsif element > second
#             second = element
#         end

#     end

#     if bank[-1] > second
#       second = bank[-1]
#     end

#     joltage_sum += (first + second).to_i
# end

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