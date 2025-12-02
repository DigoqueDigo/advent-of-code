invalid_ids_sum = 0

while ranges = STDIN.gets
    ranges.split(',').each do |range|
        first, last = range.split('-').map(&:to_i)

        (first..last).each() do |current|
            current_s = current.to_s
            current_s_len = current_s.length
            chunk_sizes = (1..(current_s_len / 2))
                .select { |n| current_s_len % n == 0 }

            chunk_sizes.each do |chunk_size|
                if current_s.scan(/.{1,#{chunk_size}}/).uniq.length == 1
                    invalid_ids_sum += current
                    puts current
                    break
                end
            end
        end
    end
end

puts "Invalid ids sum: #{invalid_ids_sum}"
