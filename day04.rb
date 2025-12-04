lines = Array.new
accessible_roles = 0
prev_accessible_roles = nil

while line = STDIN.gets&.chomp
    lines.push(line)
end

while prev_accessible_roles != accessible_roles
    prev_accessible_roles = accessible_roles
    lines.each_with_index do |line, y_index|
        line.chars.each_with_index do |char, x_index|
            rolls = 0
            if char == '@'
                adjacent_x = ((x_index-1)..(x_index+1))
                    .select{ |x| x >= 0 and x < line.length }
                
                adjacent_y = ((y_index-1)..(y_index+1))
                    .select{ |y| y >= 0 and y < lines.length }

                adjacent_x.each do |x|
                    adjacent_y.each do |y|
                        if x != x_index or y != y_index and lines[y][x] == '@'
                            rolls += 1
                        end 
                    end
                end
                
                if rolls < 4
                    accessible_roles += 1
                    lines[y_index][x_index] = '.'
                end
            end
        end
    end
end

puts "Accessible roles: #{accessible_roles}"