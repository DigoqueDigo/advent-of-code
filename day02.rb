invalid_ids_sum = 0

while ranges = STDIN.gets
    ranges.split(',').each do |range|
        first, last = range.split('-').map(&:to_i)

        while first <= last
            first_s = first.to_s
            first_s_len = first_s.length
            chunk_sizes = (1..(first_s_len / 2)).select { |n| first_s_len % n == 0 }

            chunk_sizes.each do |chunk_size|
                if first_s.scan(/.{1,#{chunk_size}}/).uniq.length == 1
                    invalid_ids_sum += first
                    puts "Invalid id: #{first}"
                    break
                end
            end

            first += 1
        end
    end
end

puts "Invalid ids sum: #{invalid_ids_sum}"
